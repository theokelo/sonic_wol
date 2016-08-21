
notes = (ring 57, 62, 55, 59, 64)

live_loop :arp do
  use_synth :dpulse
  play notes.tick, release: 0.2
  sleep 0.125
end
