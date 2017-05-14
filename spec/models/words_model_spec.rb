# frozen_string_literal: true
describe Word, type: :model do
  describe :create do
    it 'rejects no create args' do
      expect { Word.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'rejects null text' do
      expect { Word.create!(text: '') }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'saves basic text' do
      word_text = 'foo1'
      expect(Word.create!(text: word_text).text).to eq(word_text)
    end

    it 'rejects duplicate text' do
      word_text = 'foo2'
      Word.create!(text: word_text)
      expect { Word.create!(text: word_text) }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end

    describe '#find_or_create_by' do
      it 'does not create words with duplicate text' do
        word_text = 'foo3'
        expect(Word.count).to eq(0)

        foo_word = Word.create!(text: word_text)
        expect(Word.find_or_create_by!(text: word_text)).to eq(foo_word)
        expect(Word.count).to eq(1)
        expect(Word.find_or_create_by!(text: word_text)).to eq(foo_word)
        expect(Word.count).to eq(1)
      end

      it 'creates words with nonmatching find/create' do
        word_text = 'foo4'
        word_text_different = 'foo5'

        expect(Word.count).to eq(0)
        first_word = Word.create!(text: word_text)
        expect(Word.count).to eq(1)
        expect(Word.find_or_create_by!(text: word_text_different)).to_not eq(first_word)
        expect(Word.count).to eq(2)
      end
    end

  context 'with a created word' do
    let (:foo_word) { FactoryGirl.create(:word, text: 'foo', id: '1') }

    describe '#in_argot' do
      let(:baz_word) { FactoryGirl.create(:word, text: 'baz', id: '2') }

      it 'prints equivalent argot if there is a matching TranslatedWord' do
        trans = TranslatedWord.create!(translation: 'bar', word: foo_word)
        expect(foo_word.in_argot).to eq('bar')
      end

      it 'prints itself if there is no matching TranslatedWord' do
        expect(baz_word.in_argot).to eq('baz')
      end
    end

    describe '#render' do
      it 'rejects a call with an invalid template option' do
        expect{foo_word.render('A')}.to raise_error(ArgumentError)
      end

      it 'renders word with all-lowercase' do
        expect(foo_word.render('x')).to eq('foo')
      end

      it 'renders word with initially-uppercased' do
        expect(foo_word.render('c')).to eq('Foo')
      end

      it 'renders word with all-uppercased' do
        expect(foo_word.render('C')).to eq('FOO')
      end
    end
  end
end

describe WordTemplate, type: :model do
  let(:lower_case_word) { FactoryGirl.create(:word, text: 'fOo', id: '1') }
  let(:capitalized_word) { FactoryGirl.create(:word, text: 'Bar', id: '2') }
  let(:all_caps_word) { FactoryGirl.create(:word, text: 'BAZ', id: '3') }
  let(:camel_case_word) { FactoryGirl.create(:word, text: 'variableName', id: '4') }
  let(:hyphenated_capitalized_word) { FactoryGirl.create(:word, text: 'Rimsky-Korsakov', id: '5') }
  let(:hyphenated_uc_word) { FactoryGirl.create(:word, text: 'BATZ-MARU', id: '6') }
  let(:hyphenated_lc_word) { FactoryGirl.create(:word, text: 'jiggly-puff', id: '7') }
  let(:hyphenated_mixed_word) { FactoryGirl.create(:word, text: 'Sar-U-man', id: '8') }

  # 'GARPL4Y'

  describe '#initialize' do
    it 'returns a WordTemplate' do
      expect(WordTemplate.new('x')).to be_a WordTemplate
    end

    it 'raises on a invalid template' do
      expect { WordTemplate.new('xc') }.to raise_error ArgumentError
    end
  end

  describe '#for' do
    it 'converts a all-lowercased word to template x' do
      expect(WordTemplate.for(lower_case_word.text).template).to eq('x')
    end

    it 'converts an initially-uppercased word to template c' do
      expect(WordTemplate.for(capitalized_word.text).template).to eq('c')
    end

    it 'converts a all-uppercased word to template C' do
      expect(WordTemplate.for(all_caps_word.text).template).to eq('C')
    end

    it 'converts a mixed-cased, non-initially capitalized word to template x' do
      expect(WordTemplate.for(camel_case_word.text).template).to eq('x')
    end

    it 'converts any hyphenated word, regardless of case, to template x' do
      [hyphenated_capitalized_word,
        hyphenated_uc_word,
        hyphenated_lc_word,
        hyphenated_mixed_word].each { |test_word| expect(WordTemplate.for(test_word.text).template).to eq('x') }
      end
    end

    # remaining tests in Word
    describe '#render' do
      it 'raises on an empty parameter' do
        expect { WordTemplate.new('c').render('') }.to raise_error ArgumentError
        expect { WordTemplate.new('c').render(nil) }.to raise_error ArgumentError
      end
    end
  end
