defmodule B do
  use GenStage
  def start_link(multipler ) do
    GenStage.start_link(B, multipler)
  end
  def init(multiplier) do
    {:producer_consumer, multiplier}
  end
  def handle_events(events, _from , multiplier) do
    events = Enum.map(events, & &1 *multiplier)
    {:noreply, events, multiplier}
  end

end
