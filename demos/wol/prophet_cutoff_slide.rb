8.times do |i|
  c0 = 60
  8.times do     
    s = synth :prophet, note: :e1, cutoff: c0+i*10, cutoff_slide: 0.2
    c1 = rrand(30, 50)
    control s, cutoff: c1
    sleep 0.125
  end
end


