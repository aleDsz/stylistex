defmodule StylexerTest do
  use ExUnit.Case

  describe "if we read the token so" do
    test "escaped strings should be parsed" do
      assert [{:escaped_token, 1, 'abc'}] === Stylexer.consume!("abc")
    end

    test "digits should be parsed" do
      assert [{:digit_token, 1, '123'}] === Stylexer.consume!("123")
    end

    test "hex digits should be parsed" do
      assert [{:hex_token, 1, '#bbaa13'}] === Stylexer.consume!("#bbaa13")
      assert [{:hex_token, 1, '#Bbaa13'}] === Stylexer.consume!("#Bbaa13")
    end

    test "multline commentaries should be parsed" do
      comment = """
      /*
       * test
       */
      """

      assert [{:commentary_token, 1, '/*\n * test\n */'}, {:whitespace_token, 3, '\n'}] ===
               Stylexer.consume!(comment)
    end

    test "inline commentaries should be parsed" do
      comment = "/* test */"
      assert [{:commentary_token, 1, '/* test */'}] === Stylexer.consume!(comment)
    end

    test "multiline css definition should be parsed" do
      css = """
      body {
        background: #ffaa12;
      }
      """

      assert [
               {:escaped_token, 1, 'body'},
               {:whitespace_token, 1, ' '},
               {:left_curly_token, 1, '{'},
               {:whitespace_token, 1, '\n'},
               {:whitespace_token, 2, ' '},
               {:whitespace_token, 2, ' '},
               {:escaped_token, 2, 'background'},
               {:colon_token, 2, ':'},
               {:whitespace_token, 2, ' '},
               {:hex_token, 2, '#ffaa12'},
               {:semicolon_token, 2, ';'},
               {:whitespace_token, 2, '\n'},
               {:right_curly_token, 3, '}'},
               {:whitespace_token, 3, '\n'}
             ] === Stylexer.consume!(css)
    end

    test "inline css definition should be parsed" do
      css = "body { background: #ffaa12; }"

      assert [
               {:escaped_token, 1, 'body'},
               {:whitespace_token, 1, ' '},
               {:left_curly_token, 1, '{'},
               {:whitespace_token, 1, ' '},
               {:escaped_token, 1, 'background'},
               {:colon_token, 1, ':'},
               {:whitespace_token, 1, ' '},
               {:hex_token, 1, '#ffaa12'},
               {:semicolon_token, 1, ';'},
               {:whitespace_token, 1, ' '},
               {:right_curly_token, 1, '}'}
             ] === Stylexer.consume!(css)
    end

    test "function token should be parsed" do
      css = "url(http://localhost/img.jpg)"

      assert [{:function_token, 1, 'url(http://localhost/img.jpg)'}] ===
               Stylexer.consume!(css)
    end
  end
end
