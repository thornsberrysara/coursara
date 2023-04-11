defmodule Coursara.CategoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Coursara.Categories` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Coursara.Categories.create_category()

    category
  end
end
