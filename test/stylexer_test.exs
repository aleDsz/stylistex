defmodule StylexerTest do
  use ExUnit.Case

  describe "if we read the token so" do
    test "escaped strings should be parsed" do
      assert {:ok, [{:escaped_token, 1, 'abc'}]} === Stylexer.consume("abc")
    end

    test "digits should be parsed" do
      assert {:ok, [{:digit_token, 1, '123'}]} === Stylexer.consume("123")
    end

    test "hex digits should be parsed" do
      assert {:ok, [{:hex_token, 1, '#bbaa13'}]} === Stylexer.consume("#bbaa13")

      assert {:ok, [{:hex_token, 1, '#Bbaa13'}]} === Stylexer.consume("#Bbaa13")
    end

    test "multline commentaries should be parsed" do
      comment = """
      /*
       * test
       */
      """

      assert {:ok, [{:commentary_token, 1, '/*\n * test\n */'}]} === Stylexer.consume(comment)
    end

    test "inline commentaries should be parsed" do
      comment = "/* test */"
      assert {:ok, [{:commentary_token, 1, '/* test */'}]} === Stylexer.consume(comment)
    end

    test "multiline css definition should be parsed" do
      css = """
      body {
        background: #ffaa12;
      }
      """

      assert {:ok,
              [
                {:escaped_token, 1, 'body'},
                {:left_curly_token, 1, '{'},
                {:escaped_token, 2, 'background'},
                {:colon_token, 2, ':'},
                {:hex_token, 2, '#ffaa12'},
                {:semicolon_token, 2, ';'},
                {:right_curly_token, 3, '}'}
              ]} === Stylexer.consume(css)
    end

    test "inline css definition should be parsed" do
      css = "body { background: #ffaa12; }"

      assert {:ok,
              [
                {:escaped_token, 1, 'body'},
                {:left_curly_token, 1, '{'},
                {:escaped_token, 1, 'background'},
                {:colon_token, 1, ':'},
                {:hex_token, 1, '#ffaa12'},
                {:semicolon_token, 1, ';'},
                {:right_curly_token, 1, '}'}
              ]} === Stylexer.consume(css)
    end

    test "function token should be parsed" do
      css = "url(http://localhost/img.jpg)"

      assert {:ok, [{:function_token, 1, 'url(http://localhost/img.jpg)'}]} ===
               Stylexer.consume(css)
    end
  end
end
