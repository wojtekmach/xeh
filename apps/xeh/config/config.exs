use Mix.Config

case Mix.env do
  :dev ->
    config :xeh, :xeh_client, XehClient
    config :logger, level: :info

  :test ->
    config :xeh, :xeh_client, Xeh.FakeClient
    config :logger, level: :debug

  :prod ->
    config :xeh, :xeh_client, XehClient
    config :logger, level: :info
end
