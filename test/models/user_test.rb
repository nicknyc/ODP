require 'test_helper'

class UserTest < ActiveSupport::TestCase
   def setup
     @user = User.new(first_name: "Teerapat",last_name: "Sattagowit",sex: 'F',
     national_id: "1234567891011",email: "mheeza@gmail.com",password: "vugsHflfgzfH0L7d",
     password_confirmation: "vugsHflfgzfH0L7d",phone_number: "0811111111")
   end

   test "user is valid" do
     assert @user.valid?
   end

   test "invalid without name" do
     @user.first_name = nil
     assert_not @user.valid?
   end

   test "invalid without last_name" do
     @user.last_name = nil
     assert_not @user.valid?
   end

   test "invalid name with number" do
     @user.first_name = "iPhone7"
     assert_not @user.valid?
   end

   test "invalid last_name with number" do
     @user.last_name = "GalaxyS7"
     assert_not @user.valid?
   end

   test "invalid sex other than M or F" do
     @user.sex = 'M'
     assert @user.valid?

     @user.sex = 'F'
     assert @user.valid?

     @user.sex = 'B'
     assert_not @user.valid?
   end

   test "invalid without sex" do
     @user.sex = nil
     assert_not @user.valid?
   end

   test "invalid national_id with char" do
     @user.national_id = "123456789aabb"
     assert_not @user.valid?
   end

   test "invalid without national_id" do
     @user.national_id = nil
     assert_not @user.valid?
   end

   test "invalid email without @" do
     @user.email = "lungmheezaa5555"
     assert_not @user.valid?
   end

   test "invalid without email" do
     @user.email = nil
     assert_not @user.valid?
   end

   test "invalid password less than 6 char" do
     @user.password = "1234"
     @user.password_confirmation = "1234"
     assert_not @user.valid?
   end

   test "invalid password_confirmation" do
     @user.password_confirmation = "8;p5vdsvdsyd"
     assert_not @user.valid?
   end

   test "invalid without phone_number" do
     @user.phone_number = nil
     assert_not @user.valid?
   end

   test "invalid phone_number with char" do
     @user.phone_number = "081111xxxx"
     assert_not @user.valid?
   end
end
