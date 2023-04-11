defmodule CoursaraWeb.PageController do
  use CoursaraWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
