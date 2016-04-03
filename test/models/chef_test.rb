require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "jon", email: "john@example.com")
  end
  
  test "chef should be valid" do
    assert@chef.valid?
    end

  test "chefname should be present" do
    @chef.chefname = " "
    assert_not@chef.valid?
  end
  
  test "chefname should not be too long" do
    @chef.chefname = "a" * 41
    assert_not@chef.valid?
  end
  
  test "chefname should not be too short" do
    @chef.chefname = "aa"
    assert_not@chef.valid?
  end
  
  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end
  
  test "email length should be within bounds" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
    end

  test "email address should be unique" do
  dup_chef = @chef.dup
  dup_chef.email = @chef.email.upcase
  @chef.save
  assert_not dup_chef.valid?
  end
  
  test "email validiation should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@ee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm] #%w splits elements into an array
    valid_addresses.each do |va| # each iterates through each thing in our array testing them all for valdidiy each is then assigned to the our object, va in this instance. 
      @chef.email = va #saves each thing in the array as our chef email instance object
      assert @chef.valid?, '#{va.inspect} should be valid' #this method should display each as it iterates through and tests 
    end
  end
  
  
  test "email valididation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_ee.org user.name@example. ee@i_am_.com foo@ee+aar.com]
    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{ia.inspect} should be invalid'
    end
  end

end
