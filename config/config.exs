use Mix.Config

if Mix.env() in [:dev, :test] do
  config :mix_test_watch,
    clear: true
end
