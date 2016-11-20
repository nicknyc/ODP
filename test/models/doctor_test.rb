require 'test_helper'

class DoctorTest < ActiveSupport::TestCase
   test "complete data should be valid" do
     @doctor = doctors(:complete)
     assert @doctor.valid?
   end

   test "no_proficiency data shouldn't be valid" do
     @doctor = doctors(:no_proficiency)
     assert_not @doctor.valid?
   end

   test "no_create_at data shouldn't be valid" do
     @doctor = doctors(:no_create_at)
     assert_not @doctor.valid?
   end

   test "no_update_at data shouldn't be valid" do
     @doctor = doctors(:no_update_at)
     assert_not @doctor.valid?
   end
end
