require 'test_helper' #needed for all tests

class RecipeTest < ActiveSupport::TestCase
#@ = instance variable without @ = local variable 
def setup
  @chef = Chef.create(chefname: "bob", email: "bob@example.com")
  @recipe = @chef.recipes.build(name:"chicken parmy parm", summary: "Best chicky parm ever", description: "heat oil, add chicken, onion add tomato sauce, add parmy cook forever")
end
  
  test "recipe should be valid" do
    assert @recipe.valid? #look up assertions at rubyonrails.org Run tests with rake test command 
end

  test "Recipes must have chef_id" do
  @recipe.chef_id = nil
  assert_not@recipe.valid?
  end
  
  test "name should be present" do
  @recipe.name = " "
  assert_not @recipe.valid? #assert_not = false or nil result in this case, ex. assigning an empty string as here, testing for a false result
  end
  
  test "name length should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "name length should not be too short" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?
end

  test "summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
   end
  
  test "summary length should not be too short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end
  
  test "description must be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
    end
  
  test "description should not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
    end
  
  test "description should not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
    end
  
  

end