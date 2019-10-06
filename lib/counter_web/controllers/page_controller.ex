defmodule CounterWeb.PageController do
  use CounterWeb, :controller

  def index(conn, _params) do
    Phoenix.LiveView.Controller.live_render(conn, CounterWeb.PageLive.Index, session: %{})
  end
end
