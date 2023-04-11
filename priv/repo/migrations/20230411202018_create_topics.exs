defmodule Coursara.Repo.Migrations.CreateTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :name, :string
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:topics, [:category_id])
  end
end
