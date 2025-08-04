defmodule C do
  use GenStage
  def start_link(_opts) do
    GenStage.start_link(C, :ok)
  end
  def init(:ok) do
  {:consumer, :the_state_doesn_not_matter}
  end
  @spec handle_events(any(), any(), any()) :: {:noreply, [], any()}
  def handle_events(events, _from, state) do
    Process.sleep(1000)
    IO.inspect(events)
    {:noreply, [], state}
  end
end
