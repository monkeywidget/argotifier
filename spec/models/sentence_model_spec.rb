# frozen_string_literal: true
describe Sentence do
  let(:paragraph) { FactoryGirl.create(:paragraph) }

  describe '#create' do
    it 'creates with a paragraph' do
      Sentence.create!(paragraph: paragraph, paragraph_index: 1)
    end

    #    describe 'with a real Paragraph instance in the database' do
    #
    #       before do
    #         @document = FactoryGirl.create(:document, title:'The Very Sad Tree')
    #         @paragraph2 = Paragraph.create!(document: @document, document_index: 8)
    #         expect(@paragraph2.sentences.count).to eq(0)
    #       end
    #
    #       it 'adds a new Sentence to the Paragraph' do
    #         sentence = Sentence.create!(paragraph: @paragraph2, paragraph_index: 1)
    #         expect(@paragraph2.sentences.count).to eq(1)
    #         expect(@paragraph2.sentences[0]).to eql( sentence )
    #       end
    #
    #       it 'adds a new Sentence to the Paragraph at the proper index' do
    #         sentence2 = Sentence.create!(paragraph: @paragraph2, paragraph_index: 2)
    #         sentence1 = Sentence.create!(paragraph: @paragraph2, paragraph_index: 1)
    #         expect(@paragraph2.sentences.count).to eq(2)
    #         expect(@paragraph2.sentences[0]).to eql( sentence1 )
    #         expect(@paragraph2.sentences[1]).to eql( sentence2 )
    #       end
    #    end
    #
    # it 'saves a template' do
    #   sentence = Sentence.create!(paragraph: @paragraph, paragraph_index: 1)
    #   sentence.tokenize('The QUICK brown Fox jumps over the lazy-dogs!')
    #   expect(sentence.word_template).to eq  ('c C x c x x x x!')
    # end

    it 'requires a paragraph' do
      expect{Sentence.create!(paragraph_index: 1)}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'requires a paragraph order parameter' do
      expect{Sentence.create!(paragraph: paragraph)}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'rejects a paragraph order parameter duplicating another sentence' do
      Sentence.create!(paragraph: paragraph, paragraph_index: 1)
      expect{Sentence.create!(paragraph: paragraph, paragraph_index: 1)}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe '#text=' do
    it 'rejects invalid text' do
      sentence = Sentence.create!(paragraph: paragraph, paragraph_index: 1)
      expect {sentence.text=('')}.to raise_error(ArgumentError)
    end
  #
  #     it 'creates Word objects' do
  #       expect(Word.count).to eq(0)
  #
  #       sentence = Sentence.create!(paragraph: @paragraph, paragraph_index: 1)
  #       sentence.tokenize('The QUICK brown Fox jumps over the lazy-dogs!')
  #
  #       expect(Word.count).to eq(7)   # remember not to count 'the' more than once
  #     end
  #
  #     describe 'with a previously existing Word' do
  #       before do
  #         expect(Word.count).to eq(0)
  #         @word_the = FactoryGirl.create(:word, text: 'the', id: '1')
  #         expect(Word.count).to eq(1)
  #       end
  #
  #       it 'does not create duplicate Words' do
  #
  #         sentence = Sentence.create!(paragraph: @paragraph, paragraph_index: 1)
  #         sentence.tokenize('The QUICK brown Fox jumps over the lazy-dogs!')
  #
  #         expect(Word.count).to eq(7)   # remember not to count 'the' more than once
  #       end
  #
  #       it 'creates Word objects without case' do
  #
  #         sentence = Sentence.create!(paragraph: @paragraph, paragraph_index: 1)
  #         sentence.tokenize('The QUICK brown Fox jumps over the lazy-dogs!')
  #
  #         expect(Word.find_by_text('the')).to eq(@word_the)
  #         expect(sentence.words[0]).to eq(@word_the)
  #         expect(sentence.words[6]).to eq(@word_the)
  #       end
  #     end
  #
  #     it 'records Word capitalizations for each case' do
  #       sentence = Sentence.create!(paragraph: @paragraph, paragraph_index: 1)
  #       sentence.tokenize('The QUICK brown Fox jumps over the lazy-dogs!')
  #       expect(sentence.word_template).to eq  ('c C x c x x x x!')
  #     end
  #
  #     it 'handles escaped weirdness gracefully'
  #     # 'Beware the Jabberwock, my son!\nThe jaws that bite, the claws that catch! Beware the Jubjub bird,\n' \
  #        'and shun The frumious Bandersnatch!'
  #
  end
  #
  #   describe 'translation rendering' do
  #
  #     before do
  #
  #       @word_the = FactoryGirl.create(:word, text: 'the', id: '1')
  #       @word_quick = FactoryGirl.create(:word, text: 'quick', id: '2')
  #       @word_brown = FactoryGirl.create(:word, text: 'brown', id: '3')
  #       @word_fox = FactoryGirl.create(:word, text: 'fox', id: '4')
  #       @word_jumps = FactoryGirl.create(:word, text: 'jumps', id: '5')
  #       @word_over = FactoryGirl.create(:word, text: 'over', id: '6')
  #       @word_lazydogs = FactoryGirl.create(:word, text: 'lazy-dogs', id: '7')
  #
  #       @sentence = FactoryGirl.create(:sentence, id: '1',
  #           word_template: 'c C x c x x x x!',
  #           paragraph: @paragraph, paragraph_index: 1)
  #
  #       @sentence_word_the1 = FactoryGirl.create(:sentenceword, word: @word_the, id: '1',
  #           sentence: @sentence, sentence_index: 1)
  #       @sentence_word_quick = FactoryGirl.create(:sentenceword, word: @word_quick, id: '2',
  #           sentence: @sentence, sentence_index: 2)
  #       @sentence_word_brown = FactoryGirl.create(:sentenceword, word: @word_brown, id: '3',
  #           sentence: @sentence, sentence_index: 3)
  #       @sentence_word_fox = FactoryGirl.create(:sentenceword, word: @word_fox, id: '5',
  #           sentence: @sentence, sentence_index: 4)
  #       @sentence_word_jumps = FactoryGirl.create(:sentenceword, word: @word_jumps, id: '4',
  #           sentence: @sentence, sentence_index: 5)
  #       @sentence_word_over = FactoryGirl.create(:sentenceword, word: @word_over, id: '6',
  #           sentence: @sentence, sentence_index: 6)
  #       @sentence_word_the2 = FactoryGirl.create(:sentenceword, word: @word_the, id: '7',
  #           sentence: @sentence, sentence_index: 7)
  #       @sentence_word_lazydogs = FactoryGirl.create(:sentenceword, word: @word_lazydogs, id: '8',
  #           sentence: @sentence, sentence_index: 8)
  #     end
  #
  #     describe '#original' do
  #       describe 'untranslated Words' do
  #
  #         it 'returns text of original Words' do
  #           expect(@sentence.original).to eq('The QUICK brown Fox jumps over the lazy-dogs!')
  #         end
  #
  #       end
  #
  #       describe 'translated Words' do
  #
  #         before do
  #           @translation_the = FactoryGirl.create(:translated_word, word: @word_the, translation: 'foo')
  #           @translation_the = FactoryGirl.create(:translated_word, word: @word_quick, translation: 'bar')
  #         end
  #
  #         it 'returns text of original Words' do
  #           expect(@sentence.original).to eq('The QUICK brown Fox jumps over the lazy-dogs!')
  #         end
  #
  #       end
  #
  #     end # #original
  #
  #     describe '#translation' do
  #
  #       describe 'untranslated Words' do
  #
  #         it 'returns text of component Words, in order, capitalized, with punctuation' do
  #           expect(@sentence.translation).to eq('The QUICK brown Fox jumps over the lazy-dogs!')
  #         end
  #
  #       end
  #
  #       describe 'translated Words' do
  #
  #         before do
  #           @translation_the = FactoryGirl.create(:translated_word, word: @word_the, translation: 'foo')
  #           @translation_the = FactoryGirl.create(:translated_word, word: @word_quick, translation: 'bar')
  #         end
  #
  #         it 'returns text of component Words, in order, capitalized, with punctuation' do
  #           expect(@sentence.translation).to eq('Foo BAR brown Fox jumps over foo lazy-dogs!')
  #         end
  #
  #       end
  #     end  #   #translation
  #   end
end
