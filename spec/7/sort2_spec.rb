require 'spec_helper'
require File.join(File.dirname(__FILE__), '/../../7/sort2')

describe "shiftlarger" do
  it do
    expect(shiftlarger([2, 3, nil, 4], 2, 1)).to eq 0
    expect(shiftlarger([1, 2, 3, nil, 4], 3, 1)).to eq 1
    expect(shiftlarger([1, 2, 3, nil], 3, 4)).to eq 3
  end
end

describe 'insertionsort' do
  it do
    expect(insertionsort([4, 3, 2, 1])).to eq [1, 2, 3, 4]
    expect(insertionsort([4, 3, 1, 2])).to eq [1, 2, 3, 4]
    expect(insertionsort([1, 2, 3, 4])).to eq [1, 2, 3, 4]
    expect(insertionsort([1, 3, 2, 4])).to eq [1, 2, 3, 4]
  end
end