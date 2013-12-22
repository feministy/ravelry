require_relative '../spec_helper'
require_relative '../../lib/ravelry/patterns'

describe Ravelry::Patterns do

  context '#initialize' do
    it 'should fetch @pattern if given @id' do
      pattern = initialize_paid
      expect(pattern.pattern).to be
    end

    it 'should not fetch pattern if given no @id' do
      pattern = initialize_empty
      expect(pattern.pattern).to be_nil
    end
  end

  context '#fetch_and_parse' do
    before do
      @api = initialize_paid
    end

    it 'should succeed' do
      expect(@api).to be
    end

    it 'should return a pattern' do
      expect(@api.pattern).to be
    end

    it 'should return a hash' do
      expect(@api.pattern).to be_kind_of(Hash)
    end
  end

  context 'pattern attributes' do
    before do
      @api = initialize_empty
      @api.stub(:pattern).and_return(paid_pattern_stub)
      @data = paid_pattern_stub
    end

    it 'comments_count' do
      expect(@api.comments_count).to eq(4)
    end

    it 'comments_count (Integer)' do
      expect(@api.comments_count).to be_kind_of(Integer)
    end

    it 'craft_name' do
      expect(@api.craft_name).to eq(@data[:craft][:name])
    end 

    it 'craft_permalink' do
      expect(@api.craft_permalink).to eq(@data[:craft][:permalink])
    end

    it 'currency' do
      expect(@api.currency).to eq(@data[:currency])
    end

    it 'currency_symbol' do
      expect(@api.currency_symbol).to eq(@data[:currency_symbol])
    end

    it 'difficulty_average_float (Float)' do
      expect(@api.difficulty_average_float).to be_kind_of(Float)
    end

    it 'difficulty_average_float' do
      expect(@api.difficulty_average_float).to eq(@data[:difficulty_average])
    end

    it 'difficulty_average_integer (Integer)' do
      expect(@api.difficulty_average_integer).to be_kind_of(Integer)
    end

    it 'difficulty_average_integer' do
      expect(@api.difficulty_average_integer).to eq(@data[:difficulty_average].round(0))
    end

    it 'difficulty_count (Integer)' do
      expect(@api.difficulty_count).to be_kind_of(Integer)
    end

    it 'difficulty_count' do
      expect(@api.difficulty_count).to eq(@data[:difficulty_count])
    end

    it 'downloadable?' do
      # testing data is true
      expect(@api.downloadable?).to be_true
    end

    it 'favorites_count (Integer)' do
      expect(@api.favorites_count).to be_kind_of(Integer)
    end

    it 'favorites_count' do
      expect(@api.favorites_count).to eq(@data[:favorites_count])
    end

    it 'free?' do
      # testing data is false
      expect(@api.free?).to be_false
    end

    it 'gauge' do
      expect(@api.gauge).to eq(@data[:gauge])
    end 
  end
end