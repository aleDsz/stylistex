defmodule StylistEx.MixProject do
  use Mix.Project

  @version "0.1.0-alpha"

  def project do
    [
      app: :stylistex,
      version: @version,
      elixir: "~> 1.7",
      description: "A CSS parser for Elixir",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application,
    do: [extra_applications: [:logger]]

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:jason, "~> 1.2"}
    ]
  end

  defp docs do
    [
      main: "StylistEx",
      source_ref: "v#{@version}",
      source_url: "https://github.com/aledsz/stylistex"
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/aledsz/stylistex"}
    }
  end
end
