defmodule DemoWeb.PageController do
  use DemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def toggle(conn, _params) do
    Phoenix.LiveView.Controller.live_render(
      conn,
      DemoWeb.ToggleLive,
      session: %{"toggle" => conn.cookies["toggle"]}
    )
  end
end
