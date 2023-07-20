# frozen_string_literal: true

require_relative 'test_helper'

require_relative '../lib/stack'

# set of test for class Stack
class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new
    @stack.push! 'ruby'
    @stack.push! 'php'
    @stack.push! 'java'
  end

  def test_add_elem__return_false
    assert { @stack.empty? == false }
  end

  def test_del_elem__return_true
    stk_start_state = @stack.size
    @stack.pop!
    stk_new_state = @stack.size
    assert { stk_start_state > stk_new_state }
  end

  def test_clear_stack__return_true
    @stack.clear!
    assert { @stack.empty? == true }
  end

  def test_stack_emptiness__return_false
    assert { @stack.empty? == false }
  end

  def test_stack_emptiness__return_true
    stack = Stack.new
    assert { stack.empty? == true }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
