
live_loop :random_beat do
  sample :drum_snare_hard if dice == 1
  sleep 0.125
end
