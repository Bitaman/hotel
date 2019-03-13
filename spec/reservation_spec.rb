require_relative "spec_helper"

describe "Reservation class" do
  before do
    start_date = Date.new(2018, 3, 5)
    end_date = start_date + 3
    id = 8
    room_id = 10
    @reservation = Reservation.new(id, room_id, start_date, end_date)
  end
  describe "initialize" do
    it "is an instance of reservation" do
      expect(@reservation).must_be_kind_of Reservation
    end
    it "raise an ArgumentError if end_date is before start_date" do
      start_date = Date.new(2018, 5, 20)
      end_date = start_date - 3
      id = 8
      room_id = 10
      expect {
        Reservation.new(id, room_id, start_date, end_date)
      }.must_raise ArgumentError
    end
  end
  it "has an array of dates that include in that reservation" do
    expect(@reservation.dates).must_be_kind_of Array
  end
  it "makes an array of dates for each reservation" do
    expect(@reservation.dates.length).must_equal 3
  end
  it "calculate the cost of reservation" do
    expect(@reservation.cost).must_equal 400
  end
end
