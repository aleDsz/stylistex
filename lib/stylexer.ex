defmodule Stylexer do
  @moduledoc """
  A
  """
  
  defdelegate consume(expression), to: Stylexer.Tokenizer
end
