defmodule Crohnjobs.WorkoutFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Crohnjobs.Workout` context.
  """

  @doc """
  Generate a exercise.
  """
  def exercise_fixture(attrs \\ %{}) do
    {:ok, exercise} =
      attrs
      |> Enum.into(%{
        equipment: "some equipment",
        name: "some name",
        type: "some type"
      })
      |> Crohnjobs.Workout.create_exercise()

    exercise
  end
end
