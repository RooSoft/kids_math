defmodule KidsMathWeb.Components.Question do
  use Phoenix.Component

  def question(assigns) do
    ~H"""
    <span class="text-9xl">
      5 + 4 =
    </span>
    """
  end
end
