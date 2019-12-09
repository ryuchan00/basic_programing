require 'spec_helper'
require File.join(File.dirname(__FILE__), '/../../8/measure_time')

describe 'pirandom' do
  it do
    puts pirandom(10_000)
    puts pirandom(100_000)
    puts pirandom(1_000_000)
  end
end

describe 'sekibun' do
  it do
    puts sekibun(10000)
  end
end

describe 'sekibun2' do
  it do
    puts sekibun2(10000)
  end
end


describe 'sekibun3' do
  it do
    puts sekibun3(100000)
  end
end
