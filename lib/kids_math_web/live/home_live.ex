defmodule KidsMathWeb.HomeLive do
  use KidsMathWeb, :live_view

  require Logger

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
