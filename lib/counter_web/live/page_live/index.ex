defmodule CounterWeb.PageLive.Index do
  use Phoenix.LiveView

  def mount(_session, socket) do
    {:ok, assign(socket, count: 0)}
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
end
