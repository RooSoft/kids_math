defmodule KidsMathWeb.HomeLive do
  use KidsMathWeb, :live_view

  require Logger

  import KidsMathWeb.Components.{Question, Answer}

  @max_addend 9
  @max_answer @max_addend + @max_addend

  @impl true
  def mount(_params, _session, socket) do
    {
      :ok,
      socket
      |> create_addends()
      |> add_empty_attempt()
      |> add_answer()
      |> add_wrong_answers()
      |> shuffle_answers()
    }
  end

  @impl true
  def handle_event(
        "new_attempt",
        %{"attempt" => value},
        %{assigns: %{addends: %{left: left, right: right}}} = socket
      ) do
    {attempt, _remaining} = Integer.parse(value)

    attempt =
      case(left + right) do
        ^attempt -> {:right, attempt}
        _ -> {:wrong, attempt}
      end

    {
      :noreply,
      socket
      |> assign(:attempt, attempt)
    }
  end

  defp create_addends(socket) do
    addends = %{left: random_number(@max_addend), right: random_number(@max_addend)}

    socket
    |> assign(:addends, addends)
  end

  defp add_empty_attempt(socket) do
    socket
    |> assign(:attempt, {:ok, ""})
  end

  defp add_answer(%{assigns: %{addends: %{left: left, right: right}}} = socket) do
    answer = left + right

    socket
    |> assign(:answer, answer)
  end

  defp add_wrong_answers(%{assigns: %{answer: answer}} = socket) do
    first = random_wrong_answer(answer, @max_addend, @max_answer)
    second = random_wrong_answer(answer, @max_addend, @max_answer)

    # retry if answers are the same
    case first do
      ^second ->
        add_wrong_answers(socket)

      _ ->
        socket
        |> assign(wrong_answers: [first, second])
    end
  end

  defp shuffle_answers(%{assigns: %{answer: answer, wrong_answers: wrong_answers}} = socket) do
    attempts =
      (wrong_answers ++ [answer])
      |> Enum.shuffle()

    first = Enum.at(attempts, 0)
    second = Enum.at(attempts, 1)
    third = Enum.at(attempts, 2)

    socket
    |> assign(attempt1: first)
    |> assign(attempt2: second)
    |> assign(attempt3: third)
  end

  defp random_number(n) do
    :rand.uniform(n)
  end

  defp random_wrong_answer(answer, max_number, max_answer) do
    find_random_wrong_answer(answer, max_number, max_answer, random_number(@max_addend))
  end

  defp find_random_wrong_answer(answer, max_addend, max_answer, answer) do
    find_random_wrong_answer(answer, max_addend, max_answer, random_number(max_addend))
  end

  defp find_random_wrong_answer(_answer, _max_number, _max_answer, wrong_answer) do
    wrong_answer
  end
end
