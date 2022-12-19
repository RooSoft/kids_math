defmodule KidsMathWeb.Components.Question do
  use Phoenix.Component

  def question(assigns) do
    ~H"""
    <span class="text-9xl">
      <%= @addends.left %> + <%= @addends.right %> =
    </span>
    """
  end
end
