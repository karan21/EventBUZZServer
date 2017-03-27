require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  fixtures :events

   def test_book

      event = Event.new :name => events(:one).name, 
         :date => events(:one).date,
         :description => events(:one).description,
         :time => events(:one).time,
         :capacity => events(:one).capacity,
         :venue => events(:one).venue,
         :duration => events(:one).duration,
         :city => events(:one).city,
         :image => events(:one).image

      assert event.save

      event_copy = Event.find(event.id)

      assert_equal event.name, event_copy.name

      event.name = "Modified Event Name"

      assert event.save
      assert event.destroy
   end
end
