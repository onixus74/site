defmodule Site.Lessons.Lesson do
  use Ecto.Schema
  import Ecto.Changeset


  schema "lesson" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(lesson, attrs) do
    lesson
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
