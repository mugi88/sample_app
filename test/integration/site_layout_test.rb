require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  require 'test_helper'

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 0
    assert_select "a[href=?]", help_path, count: 0
    assert_select "a[href=?]", about_path, count: 0
    assert_select "a[href=?]", contact_path, count: 0
    get contact_path
    assert_select "title", full_title("Contact")
  end
end