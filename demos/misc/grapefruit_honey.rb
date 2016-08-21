# https://raw.githubusercontent.com/lectronice/live-coding/master/grapefruit-honey.rb

# Grapefruit Honey (v.0.2)

# Procedural dub techno soundtrack for drinking light beer during the summer, by lectronice.
# Live coded while brewing a grapefruit honey flavored beer, refined in a sunny garden.
# Shared under a Creative Commons Attribution-ShareAlike 4.0 International license (CC BY-SA 4.0).
# http://creativecommons.org/licenses/by-sa/4.0/
# http://twitter.com/lectronice

$v = 0 # initialize a variable for varying various stuff
$l = 1 # 1 loop = 64 variations
$d = 3 # track duration, in loops

live_loop :beat do
  
  $s = choose([1, 2, 3, 4]) # choose the duration of release and sleep values across the whole track
  puts "///// release/sleep", $s
  sleep $s
  
  $v += 1
  if $v > 64
    $l += 1
    $v = 0
  end
  puts "///// loop ", $l, "/ variation", $v
  
  puts "/////", vt, "seconds"
  if vt > 60 then puts "/////", vt/60, "minutes" end
  
end

live_loop :beer do
  if $l <= $d
    with_fx :reverb do
      with_fx :echo,
        phase: choose([0.25, 0.5, 0.75]),
      mix: rrand(0.6, 1) do
        with_fx :wobble,
          smooth: rrand(0, 0.5),
          probability: 0.5,
          prob_pos: 0.5,
        mix: rrand(0.5, 1) do
          use_synth :fm
          play_pattern_timed [
            (chord choose([:c3, :g3]), :major),
            (chord choose([:d3, :f3]), :major),
            (chord choose([:e3, :e3]), :major),
            (chord choose([:f3, :d3]), :major),
            (chord :c4, :major),
          :r],
            choose([[$s  , $s/2, $s+$s/2, $s],
                    [$s/2, $s*2, $s/2   , $s],
                    [$s*2, $s*2]]),
            release:
            choose([$s   , $s  , $s*2   , $s*4]),
            pan: rrand(-0.4, 0.4),
            cutoff: rrand(80, 100),
            depth: rrand(1, 2)
        end
      end
    end
  else
    sleep 8
  end
end

live_loop :bass do
  if $v >= 16 and $l <= $d
    with_fx :slicer,
      phase: choose([0.25, 0.5, 0.75]),
    mix: rrand(0.3, 0.5) do
      with_fx :echo,
        phase: choose([0.25, 0.5, 0.75, 1]),
      mix: choose([0, 0.25, 0.5]) do
        use_synth :fm
        if one_in(2)
          play_pattern_timed [
          :e2, :f2, :g2, :e2, :f2, :r],[
          1  , 1  , 2.5, 0.5, 1  , 2]
        else
          play_pattern_timed [
          :e2, :f2, :g2, :e2, :g2, :f2],[
          1  , 1  , 2.5, 0.5, 1.5, 0.5]
        end
      end
    end
  else
    sleep 8
  end
end

live_loop :drums do
  if $v >= 4 and $l <= $d
    with_fx :echo,
      phase: choose([0.25, 0.5]),
    mix: choose([0, 0, 0, 0.25]) do
      sample :bd_fat,
        amp: 2
      sleep 1
      sample :bd_fat
      sleep 1
      sample :bd_fat,
        amp: 2
      sleep 1
      if one_in(4)
        sleep $s
      else
        sample :bd_fat
        sleep 0.75
        sample :bd_fat
        sleep 0.25
      end
    end
  end
  sleep 8
end


live_loop :cymbals do
  if $v >= 8 and $l <= $d
    if one_in(8)
      sleep $s
    else
      if one_in(3)
        4.times do
          with_fx :echo,
            phase: choose([0.25, 0.5, 0.75]),
          mix: choose([0, 0.25, 0.5]) do
            sleep 0.5
            sample :drum_cymbal_closed,
              attack: choose([0.03, 0.05, 0.1]),
              release: 0.1,
              pan: rrand(-0.4, 0.4),
              amp: rrand(0.5, 1.5)
            sleep 0.5
          end
        end
      else
        4.times do
          with_fx :echo,
            phase: choose([0.25, 0.5, 0.75]),
          mix: choose([0, 0.25, 0.5]) do
            sleep 1.5
            sample :drum_cymbal_closed,
              attack: choose([0.03, 0.05, 0.1]),
              pan: rrand(-0.4, 0.4),
              amp: rrand(0.5, 1.5)
            sleep 1.5
          end
        end
      end
    end
  else
    sleep 8
  end
end

live_loop :snare do
  if $v >= 32 and $l <= $d
    with_fx :echo,
      phase: choose([0.25, 0.5, 0.75]),
      decay: $s,
    mix: choose([0.25, 0.5, 1]) do
      if one_in(4)
        sample :elec_lo_snare,
          amp: rrand(0.1, 0.4),
          pan: rrand(-0.2, 0.2)
        if one_in(2)
          sleep $s/2
          sample :elec_lo_snare,
            amp: rrand(0.1, 0.4),
            pan: rrand(-0.2, 0.2)
        end
      end
      sleep 8
    end
  else
    sleep 8
  end
end
