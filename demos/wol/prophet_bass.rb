live_loop :bass do
  use_random_seed 13
  32.times do    
    n = (rand < 0.8) ? :e1 : :e2
    a = (rand < 0.8) ? 0.75 : 1.5
    s = synth :prophet, note: n, amp: a, cutoff: rrand(70, 90), cutoff_slide: 0.2 if rand < 0.9
    control s, cutoff: rrand(30, 50)
    sleep 0.125
  end
end

