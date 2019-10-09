defmodule CounterWeb.PageLive.Index do
  use Phoenix.LiveView

  def mount(_session, socket) do
    {:ok, assign(socket, count: 0, items: [])}
  end

  def render(assigns) do
    CounterWeb.PageView.render("index.html", assigns)
  end

  def handle_event("increment", _, socket) do
    {:noreply, assign(socket, count: socket.assigns[:count] + 1)}
  end

  def handle_event("decrement", _, socket) do
    {:noreply, assign(socket, count: socket.assigns[:count] - 1)}
  end

  def handle_event("reset", _, socket) do
    {:noreply, assign(socket, count: 0)}
  end

  def handle_event("activateSearch", _, socket) do
    {:noreply, assign(socket, count: 0, items: ["Apples", "Oranges", "Strawberries"])}
  end

  def handle_event("deactivateSearch", _, socket) do
    {:noreply, assign(socket, items: [])}
  end

  def handle_event("filterSearch", %{"value" => value}, socket) do
    items = ["Apples", "Oranges", "Strawberries"]
    itemsFiltered = Enum.filter(items, fn(item) -> String.starts_with?((String.downcase item), (String.downcase value)) end)
    {:noreply, assign(socket, items: itemsFiltered)}
  end
end
