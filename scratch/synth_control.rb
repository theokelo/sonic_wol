# /etc/doc/tutorial/07.1-Controlling-Running-Synths.md
# /demos/sonic_pi/tutorial/A-10~controlling~your~sounds~0.rb

sn=synth :prophet , sustain: 5
notes=(scale :e3, :minor_pentatonic, num_octaves: 1)
notes.size.times do |i|
  control sn, note: notes[i]
  sleep 0.5
end
