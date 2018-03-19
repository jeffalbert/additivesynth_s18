SinOsc a => Gain g => Envelope r => dac; //other options are TriOsc, SqrOsc, SawOsc, and PulseOsc
SinOsc b => g;
SinOsc c => g;
SinOsc d => g;
SinOsc e => g;

.3 => g.gain;

1000::ms => dur beat;

[ 64, 64, 67, 67, 69, 69, 67, 65, 65, 64, 64, 62, 62, 60] @=> int notes[];
[ .5, .5, .5, .5, .5, .5, 1., .5, .5, .5, .5, .5, .5, 2.  ] @=> float rhythm[];

 0 => int i;

while( i < notes.cap() )
{

Std.mtof(notes[i]) => float f;

f => a.freq;    //Change the numbers on lines 22 through 25 to change overtones. Decimals are ok.
f * 2 => b.freq;
f * 3 => c.freq;
f * 7 => d.freq;
f * 11 => e.freq;

r.keyOn();

(rhythm[i]::beat) - 50::ms => now;

r.keyOff();

50::ms => now;

<<< i >>>;

i++;

}