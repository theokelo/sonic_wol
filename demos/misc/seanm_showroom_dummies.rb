# http://www.sean.co.uk/books/raspberry-pi-for-dummies/sonic-pi.shtm

# Showroom Dummies (extended version)
# Music example from Raspberry Pi For Dummies, 2nd Edition

in_thread do
  drum_rate = sample_duration :loop_industrial
  drum_rate = drum_rate * 2
  loop_number = 0
  loop do
    loop_number = loop_number + 1
    puts "Loop number " + loop_number.to_s
    cue :guit_e_begin if loop_number > 4 and loop_number % 2 == 1
    cue :melody_begin if loop_number > 8 and (loop_number - 9) % 16 == 0
    cue :slide_begin if loop_number > 18 and (loop_number - 19) % 4 == 0
    cue :bass_begin if loop_number == 25
    cue :loop_start
    sample :loop_industrial, rate: 0.5
    sleep drum_rate
  end
end

in_thread do
  loop do
    sync :guit_e_begin
    with_fx :distortion do
      sample :guit_e_fifths
    end
  end
end

in_thread do
  loop do
    sync :melody_begin
    note_pitches = [67, 62, 64, 64, 67, 62, 64, 67, 62]
    note_pitches.each do |note|
      use_synth :saw
      with_fx :wobble do
        sync :loop_start
        play note
        play note - 12
      end
    end
  end
end

in_thread do
  loop do
    sync :slide_begin
    with_fx :echo do
      sample :guit_e_slide
    end
  end
end

in_thread do
  sync :bass_begin
  drums = 1
  loop do
    bass_pitches = [55, 55, 47, 47, 50, 50, 52, 50]
    drums = -1 * drums
    bass_pitches.each do |bassnote|
      sync :loop_start
      use_synth :tb303
      with_fx :slicer do
        play bassnote
      end
      if drums == 1
        sample :loop_amen
      end
    end
  end
end
