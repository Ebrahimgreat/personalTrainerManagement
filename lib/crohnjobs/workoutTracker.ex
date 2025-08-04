defmodule Crohnjobs.WorkoutTracker do
 @spec programme(%{:date => any(), :exercises => any(), optional(any()) => any()}) ::
         :ok | {:error, atom()}
 def programme(%{ name: name, date: date, exercises: exercises}) do
  case File.open("workout.txt",[:write, :utf8]) do
    {:ok, file}->
      IO.puts(file, "Workkout Created BY : #{name}")
      IO.puts(file, "Workout Date, #{date}")
    Enum.each(exercises, fn x->Enum.each(x.workout, fn set->IO.puts(file, "Exercise: #{x.name}\n Set: #{set.set}, Weight: #{set.weight}, Reps: #{set.reps}")end)end)
    totalWeight = exercises|> Enum.flat_map(fn x-> x.workout end)|> Enum.map(fn workout-> workout.weight end)|>Enum.sum()
    IO.puts(file, " Workout Volume:  #{totalWeight}")
    File.close(file)
    {:error, reason}->IO.puts("Error opening the file, #{reason}")
  end


 end

end
