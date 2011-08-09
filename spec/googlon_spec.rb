# decoding: ISO8859-1

require 'rspec'
require 'googlon'

describe 'Googlon' do
  before :each do
    @words_a = TEXT_A.split(/[ \n\r]/).delete_if{|x| x.empty?}
    @words_b = TEXT_B.split(/[ \n\r]/).delete_if{|x| x.empty?}
  end

  context 'Primeiramente, as letras Googlon s�o classificadas em dois grupos:' do
    it 'm, p, c, w e f sao chamadas "letras tipo foo"' do
      FOO.should =~ ['m', 'p', 'c', 'w', 'f']
    end

    it 'enquanto que as demais s�o conhecidas como "letras tipo bar"' do
      FOO.each do |char|
        BAR.include?(char).should be_false
      end
    end
  end

  context 'Os linguistas descobriram que as preposi��es em Googlon s�o as 
  palavras de 4 letras que terminam numa letra tipo foo, mas onde n�o ocorre a letra h.' do
    it 'Portanto, � f�cil ver que existem 21 preposi��es no Texto A.' do
      count_prepositions(@words_a).should == 21
    end

    it 'E no Texto B, quantas preposi��es existem?' do
      puts ''
      puts "Existem #{count_prepositions(@words_b)} preposi��es em B"
    end

  end

  context 'Um outro fato interessante descoberto pelos linguistas � que, no 
  Googlon, os verbos sempre s�o palavras de 6 ou mais letras que terminam numa 
  letra tipo bar. Al�m disso, se um verbo come�a com uma letra tipo bar, o 
  verbo est� em primeira pessoa.' do
    it 'Assim, lendo o Texto A, � poss�vel identificar 227 verbos no texto' do
      count_verbs(@words_a).should == 227
    end

    it 'dos quais 167 est�o em primeira pessoa' do
      count_first_person_verbs(@words_a).should == 167
    end

    it 'J� no Texto B, quantos s�o os verbos?' do
     puts ''
     puts "Existem #{count_verbs(@words_b)} verbos em B"
     puts "Existem #{count_first_person_verbs(@words_b)} verbos em primeira pessoa em B"
    end
  end
  
end
