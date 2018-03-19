SinOsc a => Gain g => dac;
SinOsc b => g;
SinOsc c => g;
SinOsc d => g;
SinOsc e => g;

.3 => g.gain;

[ 60, 60, 67, 67, 69, 69, 67, 72] @=> int notes[];

 0 => int i;

while( i < 8)
{

Std.mtof(notes[i]) => float f;

f => a.freq;
f * 2 => b.freq;
f * 8 => c.freq;
f * 4 => d.freq;
f * 6 => e.freq;

500::ms => now;

<<< i >>>;

i++;

}