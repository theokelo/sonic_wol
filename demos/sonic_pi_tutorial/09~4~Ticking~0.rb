
counter = 0
live_loop :arp do
  play (scale :e3, :minor_pentatonic)[counter], release: 0.1
  counter += 1
  sleep 0.125
end
