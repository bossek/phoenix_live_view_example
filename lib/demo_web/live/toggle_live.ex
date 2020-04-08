defmodule DemoWeb.ToggleLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <button phx-click="toggle">Toggle</button>
    <span id="toggle" phx-hook="Toggle" toggle="<%= @toggle %>"><%= @toggle %></span>
    """
  end

  def mount(_params, session, socket) do
    {:ok, assign(socket, toggle: session["toggle"] || "list")}
  end

  def handle_event("toggle", _params, socket) do
    toggle = if socket.assigns.toggle == "list", do: "table", else: "list"
    {:noreply, assign(socket, toggle: toggle)}
  end
end

