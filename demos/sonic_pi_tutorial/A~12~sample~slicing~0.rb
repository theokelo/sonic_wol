
live_loop :beat_slicer do
  slice_idx = rand_i(8)
  slice_size = 0.125
  s = slice_idx * slice_size
  f = s + slice_size
  sample :loop_amen, start: s, finish: f
  sleep sample_duration :loop_amen, start: s, finish: f
end
