defmodule Coursara.Categories.Category do
  use Ecto.Schema
  import Ecto.Changeset

  @values [:math, :science, :english, :history, :art, :music, :foreign_language, :other]

  schema "categories" do
    field :name, Ecto.Enum,
      values: @values
    has_many :topics, Coursara.Topics.Topic

    timestamps()
  end

  def list_values, do: @values

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
