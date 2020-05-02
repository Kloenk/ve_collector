defmodule VeCollector.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {VeCollector.VE.ClearText, []},
      {VeCollector.VE.ClearText.Store, []}
      # {VeCollector.Serial, []},
      # Starts a worker by calling: VeCollector.Worker.start_link(arg)
      # {VeCollector.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: VeCollector.Supervisor]
    Supervisor.start_link(children, opts)
  end
end