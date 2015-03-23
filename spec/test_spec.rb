require 'rubygems'
require 'active_support/all'
require 'timecop'

describe Timecop do
  it 'freezes time' do
    Timecop.freeze("2015-03-01")
    expect(Time.now).to eq(Time.parse("2015-03-01"))

    Timecop.freeze(1.month.from_now)
    expect(Time.now).to eq(Time.parse("2015-04-01"))
  end
end