=begin
- best way to experiment is on-the-fly, with an existing loop
- jimsey advice; play a single note; it's how you play it that counts
- seed randomisation is a great pattern generator
=end

live_loop :bass do 
  use_random_seed 13
  8.times do 
    c = rrand(70, 130)
    n = if rand < 0.5 then :c1 else :c2 end    
    r = if rand < 0.5 then 0.1 else 0.05 end
    synth :tb303, note: n, cutoff: c, release: r if rand < 0.7
    sleep 0.125
  end
end

live_loop :beat do 
  sample :bd_haus, amp: 0.25
  sleep 0.5
end
