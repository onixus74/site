defmodule Site.Repo.Migrations.CreateLesson do
  use Ecto.Migration

  def change do
    create table(:lesson) do
      add :name, :string

      timestamps()
    end

  end
end
