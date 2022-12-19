defmodule KidsMathWeb.HomeLive do
  use KidsMathWeb, :live_view

  require Logger

  import KidsMathWeb.Components.{Question, Answer}

  @impl true
  def mount(_params, _session, socket) do
    {
      :ok,
      socket
      |> create_addends()
    }
  end

  defp create_addends(socket) do
    addends = %{left: 4, right: 3}

    socket
    |> assign(:addends, addends)
  end
end
