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

    test "multline commentaries should be parsed" do
      comment =
        """
        /*
         * test
         */
        """
      
      assert {:ok, [{:commentary_token, 1, '/*\n * test\n */'}]} === Tokenizer.consume(comment)
    end

    test "inline commentaries should be parsed" do
      comment = "/* test */"
      assert {:ok, [{:commentary_token, 1, '/* test */'}]} === Tokenizer.consume(comment)
    end

    test "multiline css definition should be parsed" do
      css = 
        """
        body {
          background: #ffaa12;
        }
        """
      
      assert {:ok, [
        {:escaped_token, 1, 'body'},
        {:left_curly_token, 1, '{'},
        {:escaped_token, 2, 'background'},
        {:colon_token, 2, ':'},
        {:hash_token, 2, '#'},
        {:escaped_token, 2, 'ffaa'},
        {:digit_token, 2, '12'},
        {:semicolon_token, 2, ';'},
        {:right_curly_token, 3, '}'}
      ]} === Tokenizer.consume(css)
    end

    test "inline css definition should be parsed" do
      css = "body { background: #ffaa12; }"
      
      assert {:ok, [
        {:escaped_token, 1, 'body'},
        {:left_curly_token, 1, '{'},
        {:escaped_token, 1, 'background'},
        {:colon_token, 1, ':'},
        {:hash_token, 1, '#'},
        {:escaped_token, 1, 'ffaa'},
        {:digit_token, 1, '12'},
        {:semicolon_token, 1, ';'},
        {:right_curly_token, 1, '}'}
      ]} === Tokenizer.consume(css)
    end

    test "function token should be parsed" do
      css = "url(http://localhost/img.jpg)"
      
      assert {:ok, [{:function_token, 1, 'url(http://localhost/img.jpg)'}]} === Tokenizer.consume(css)
    end
  end
end
