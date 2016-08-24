# /etc/doc/tutorial/07.1-Controlling-Running-Synths.md
# /etc/doc/tutorial/A.10-controlling-your-sound.md

=begin
live_loop :test_0 do
  s = synth :prophet, note: :e1, sustain: 4
  4.times do |i|
    c=rrand(70, 130)
    control s, cutoff: c
    sleep 1
  end
end
=end

live_loop :test_1 do 
  s = synth :prophet, note: :e1, sustain: 4
  c = 70
  32.times do |i|
    control s, cutoff: c+i*2
    sleep 0.125
  end
end

