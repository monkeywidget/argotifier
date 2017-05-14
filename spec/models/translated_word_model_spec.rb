# frozen_string_literal: true
require 'spec_helper'

describe TranslatedWord do
  let(:foo_word) { FactoryGirl.create(:word, text: 'foo', id: '1') }

  describe '#create' do
    it 'saves a basic translation mapping' do
      simple_trans = TranslatedWord.create!(translation: 'bar', word: foo_word)
      expect(simple_trans.translation).to eq('bar')
      expect(simple_trans.word.text).to eq('foo')
    end

    it 'raises on empty translation' do
      expect { TranslatedWord.create!(translation: '', word: foo_word) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'raises on nil translation' do
      expect { TranslatedWord.create!(translation: nil, word: foo_word) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'raises on missing translation parameter' do
      expect { TranslatedWord.create!(word: foo_word) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'raises on missing translation parameter' do
      expect { TranslatedWord.create!(translation: 'bob') }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'rejects non-Word word' do
      expect { TranslatedWord.create!(translation: 'foo', word: '')}.to raise_error(ActiveRecord::AssociationTypeMismatch)
    end

    it 'rejects nonexistent word' do
      expect { TranslatedWord.create!(translation: 'foo', word: 'fnord')}.to raise_error(ActiveRecord::AssociationTypeMismatch)
    end

    it 'rejects nil word' do
      expect { TranslatedWord.create!(translation: 'foo', word: nil)}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is uniquely associated with an existing word' do
      TranslatedWord.create!(translation: 'bar', word: foo_word)
      expect { TranslatedWord.create!(translation: 'garply', word: foo_word) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
