live_loop :bass do
  use_random_seed 13
  8.times do     
    n = (rand < 0.9) ? :e1 : :e2
    a = (rand < 0.8) ? 1 : 1.2
    s = synth :prophet, note: n, amp: a, cutoff: rrand(70, 90), cutoff_slide: 0.2 if rand < 0.9
    control s, cutoff: rrand(30, 60)
    sleep 0.125
  end
end

live_loop :beat do 
  sample :bd_haus, amp: 0.1
  sleep 0.5
end

