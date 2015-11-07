require 'test_helper'

class AdminCanDoAdminThingsTest < ActionDispatch::IntegrationTest
  test "admin can add new news items" do
    skip
    # As an admin,
    # When I am on my dashboard,
    # and I click 'add a new item',
    # And I'm redirected to a form,
    # And I enter a title, content, and maybe an image url,
    # I expect to be redirected to the main dashboard page with a message that the item has been created.
  end

  test "admin can edit news items" do
    skip
    # As an admin,
    # When I am on my dashboard,
    # and I click 'edit item',
    # And I fill out the form,
    # I expect to be redirected to the main dashboard page with a message that the item has been updated.
  end

  test "admin can delete news items" do
    skip
    # As an admin,
    # When I am on my dashboard,
    # and I click 'delete item',
    # I expect to be redirected to the main dashboard page with a message that the item has been deleted.
  end
end
