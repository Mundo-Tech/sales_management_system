defmodule SalesManagementSystemWeb.PageController do
  use SalesManagementSystemWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
