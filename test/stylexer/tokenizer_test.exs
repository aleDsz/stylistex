defmodule Stylexer.TokenizerTest do
  use ExUnit.Case

  alias Stylexer.Tokenizer

  describe "if we read the token so" do
    test "escaped strings should be parsed" do
      assert {:ok, [{:escaped_token, 1, 'abc'}]} === Tokenizer.consume("abc")
    end

    test "digits should be parsed" do
      assert {:ok, [{:digit_token, 1, '123'}]} === Tokenizer.consume("123")
    end

    test "hex digits should be parsed" do
      assert {:ok, [
        {:hash_token, 1, '#'},
        {:escaped_token, 1, 'bbaa'},
        {:digit_token, 1, '13'}
      ]} === Tokenizer.consume("#bbaa13")

      assert {:ok, [
        {:hash_token, 1, '#'},
        {:escaped_token, 1, 'Bbaa'},
        {:digit_token, 1, '13'}
      ]} === Tokenizer.consume("#Bbaa13")
    end
  end
end
