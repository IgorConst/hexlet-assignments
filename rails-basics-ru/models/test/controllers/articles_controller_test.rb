# frozen_string_literal: true

require 'test_helper'

class ArticlesTest < ActionDispatch::IntegrationTest
  #setup do
  #  @article = articles(:one)
  #end

  test 'should get index' do
    get articles_path

    assert_response :success
  end

  test 'should show article' do
    get article_path @article

    assert_response :success
  end
end
