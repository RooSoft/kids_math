defmodule KidsMathWeb.Components.Question do
  use Phoenix.Component

  def question(assigns) do
    ~H"""
    <span class="text-9xl">
      <%= @addends.left %> + <%= @addends.right %> =
      <span class={
        case elem(@attempt, 0) do
          :right -> "text-green-500"
          :wrong -> "text-red-500"
          _ -> "text-white"
        end
      }>
        <%= elem(@attempt, 1) %>
      </span>
      <span>
        <%= case elem(@attempt, 0) do
          :right -> "🎉"
          :wrong -> "😢"
          _ -> ""
        end %>
      </span>
    </span>
    """
  end
end
