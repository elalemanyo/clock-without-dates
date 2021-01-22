# frozen_string_literal: true

# Clock returns a string with the given hours and minutes
class Clock
  attr_accessor :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  def to_s
    seconds = ((hour * 60) + minute) * 60
    Time.at(seconds).utc.strftime("%H:%M")
  end

  def + (clock)
    hour = self.hour + clock.hour
    minute = self.minute + clock.minute
    Clock.new(hour: hour, minute: minute)
  end

  def - (clock)
    hour = self.hour - clock.hour
    minute = self.minute - clock.minute
    Clock.new(hour: hour, minute: minute)
  end

  def == (clock)
    clock1 = Clock.new(hour: self.hour, minute: self.minute)
    clock2 = Clock.new(hour: clock.hour, minute: clock.minute)
    clock1.to_s == clock2.to_s
  end
end
