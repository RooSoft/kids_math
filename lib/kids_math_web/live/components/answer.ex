defmodule KidsMathWeb.Components.Answer do
  use Phoenix.Component

  def answer(assigns) do
    ~H"""
    <button
      type="button"
      phx-click="yo"
      phx-value-answer={@value}
      class="text-9xl text-gray-900 bg-white border border-gray-300 focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-200 font-medium rounded-lg px-5 py-2.5 mr-2 mb-2 dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600 dark:focus:ring-gray-700"
    >
      <%= @value %>
    </button>
    """
  end
end
