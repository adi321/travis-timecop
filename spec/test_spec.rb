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

  it 'freezes time2' do
    today = Date.today
    puts today
    today_plus_1_month = today + 1.month
    
    Timecop.freeze(Date.today + 1.month)  do
      puts Date.today
      expect(Date.today).to eq(today_plus_1_month)
    end
  end
end
