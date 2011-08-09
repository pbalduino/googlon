# decoding: ISO8859-1

require 'rspec'
require 'googlon'

describe 'Googlon' do
  before :all do
    @words_a = TEXT_A.split(/[ \n\r]/).delete_if{|x| x.empty?}
    @words_b = TEXT_B.split(/[ \n\r]/).delete_if{|x| x.empty?}
  end

  context 'Primeiramente, as letras Googlon são classificadas em dois grupos:' do
    it 'm, p, c, w e f sao chamadas "letras tipo foo"' do
      FOO.should =~ ['m', 'p', 'c', 'w', 'f']
    end

    it 'enquanto que as demais são conhecidas como "letras tipo bar"' do
      FOO.each do |char|
        BAR.include?(char).should be_false
      end
    end
  end

  context 'Os linguistas descobriram que as preposições em Googlon são as 
  palavras de 4 letras que terminam numa letra tipo foo, mas onde não ocorre a letra h.' do
    it 'Portanto, é fácil ver que existem 21 preposições no Texto A.' do
      count_prepositions(@words_a).should == 21
    end

    it 'E no Texto B, quantas preposições existem?' do
      puts "Existem #{count_prepositions(@words_b)} preposições em B"
    end

  end
  
end
