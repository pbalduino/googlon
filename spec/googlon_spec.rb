# decoding: UTF-8

require 'rspec'
require 'googlon'

describe 'Googlon' do
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
  
end
