require "test_helper"

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bulletins_index_url
    assert_response :success
  end

  test "should get show" do
    # get bulletins_show_url - rails не генерит такой путь при использовании resources
    get bulletin_path(1)
    assert_response :success
  end
end
