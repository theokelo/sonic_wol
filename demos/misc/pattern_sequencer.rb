# https://github.com/overtone/overtone/blob/master/src/overtone/examples/getting_started/pragpub-article.clj

def split_pat(pat)
  buf=""
  pat.each_char do |char|
    buf << "," if buf.size > 0 && buf[-1]!='['
    tok = /\[|\]|\d/.match(char) ? char : "\"#{char}\""
    buf << tok
  end  
  eval "[#{buf}]"
end

def flatten_pat(pat)
  def flatten(pat, output, factor)
    pat.each do |item|
      if item.kind_of?(Array)
        flatten(item, output, factor*item.size)
      else
        output << [item, 1/factor.to_f]
      end
    end
  end
  output=[]
  flatten(pat, output, 1)
  output
end

def map_seq(key, tokens, args, sz, epoch)
  n=(sz/epoch.to_f).to_i  
  r, t = (1..n).collect{nil}, 0
  tokens.each do |tok, f|
    i=(t/epoch.to_f).to_i
    if [0, "-"].include?(tok)
    elsif tok==1 || !args.include?(tok.to_sym)
      r[i]=[key, {}]
    else
      r[i]=[key, args[tok.to_sym]]
    end
    t+=f 
  end
  r
end

def parse_seq(key, pat, args={})
  tokens=split_pat(pat)
  sz=tokens.size
  ftokens=flatten_pat(tokens)
  epoch=ftokens.collect{|t|t[-1]}.min
  r=map_seq(key, ftokens, args, sz, epoch)
  [r, epoch]
end
  
def merge_seqs(seqs)
  sz=seqs.collect{|seq, t|seq.size*t}.max
  tmin=seqs.collect{|seq, t|t}.min
  r=(1..(sz/tmin.to_f).to_i).collect{[]}
  seqs.each do |seq, t|
    f=t/tmin.to_f
    seq.each_with_index do |beat, i|
      j=(i*f).to_i
      r[j] << beat if beat
    end
  end
  [r, tmin]
end

def parse_dsl(inputs, args={})
  seqs=inputs.collect{|key, pat|parse_seq(key, pat, args)}
  merge_seqs(seqs)
end

require 'yaml'

Inputs=YAML.load <<-EOF
# :drum_tom_hi_hard:   "-----1-----1---------1-----1----"
:drum_cymbal_open:   "-----------1---------------1----"
:drum_cymbal_hard:   "1---1--1----1---1---11-1----1---"
:drum_cymbal_closed: "---1-----11---11---1-----11---11"
:drum_snare_hard:    "----1-------1-------1-------1---"
:bd_haus:            "1----1-1---1-[1111]--1----1-1---1--1-"
EOF

Args={:a => {:amp => 0.5}}

BPM=480

live_loop :hello do
  seq, epoch = parse_dsl(Inputs, Args)
  t=60/BPM.to_f
  seq.each do |beats|
    beats.each{|inst, args|sample inst, args}
    sleep(epoch*t)
  end
end
