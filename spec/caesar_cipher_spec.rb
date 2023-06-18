# Frozen_string_literal: true

require './lib/caesar_cipher'

describe '#caesar_cipher' do
  context 'when all characters are lowercase' do
    context 'when the string consists of one word' do
      it 'right shift of 5' do
        expect(caesar_cipher('what', 5)).to eql('bmfy')
      end

      it 'wrap from z to a' do
        expect(caesar_cipher('zip', 3)).to eql('cls')
      end

      it 'works with punctuation' do
        expect(caesar_cipher('what?!', 5)).to eql('bmfy?!')
      end
    end

    context 'when the string consists of several words' do
      it 'right shift of 5' do
        expect(caesar_cipher('What a string', 5)).to eql('Bmfy f xywnsl')
      end

      it 'wrap from z to a' do
        expect(caesar_cipher('zip zip', 3)).to eql('cls cls')
      end

      it 'works with punctuation' do
        expect(caesar_cipher('What a string!', 5)).to eql('Bmfy f xywnsl!')
      end
    end
  end

  context 'when mixed case characters' do
    it 'keeps the same case' do
      expect(caesar_cipher('Is Kojima A Genius Or Not?', 3)).to eql('Lv Nrmlpd D Jhqlxv Ru Qrw?')
    end
  end
end
