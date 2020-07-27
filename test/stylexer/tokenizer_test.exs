defmodule Stylexer.TokenizerTest do
  use ExUnit.Case

  alias Stylexer.Tokenizer

  describe "if we read the token so" do
    test "escaped strings should be parsed" do
      assert {:ok, [
        {:escaped_token, 1, 'a'},
        {:escaped_token, 1, 'b'},
        {:escaped_token, 1, 'c'}
      ]} === Tokenizer.consume("abc") 
    end

    test "digits should be parsed" do
      assert {:ok, [{:digit_token, 1, '123'}]} === Tokenizer.consume("123") 
    end
  end
end
