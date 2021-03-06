defmodule Stylexer do
  @moduledoc """
  A
  """

  @typedoc """
  Token definition when consuming CSS with Lexer
  """
  @type token :: list({atom(), pos_integer(), char()})

  @doc """
  Consume the stream with UTF-8 encoding
  """
  @spec consume(expression :: binary() | charlist()) :: {:ok, token()} | {:error, term()}
  def consume(expression) do
    expression =
      expression
      |> get_expr()

    case :lexer.string(expression) do
      {:ok, response, _} ->
        {:ok, response}

      {:error, reason, _} ->
        {:error, reason}
    end
  end

  defp get_expr(expression) when is_list(expression), do: expression
  defp get_expr(expression) when is_binary(expression), do: to_charlist(expression)
end
