defmodule TeleportWebsocketsWeb.PageController do
  use TeleportWebsocketsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
