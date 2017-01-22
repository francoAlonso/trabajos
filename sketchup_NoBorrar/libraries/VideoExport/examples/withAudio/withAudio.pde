import com.hamoid.*;

VideoExport videoExport;

// Press 'q' to finish saving the movie and exit.

// In some systems, if you close your sketch by pressing ESC, 
// by closing the window, or by pressing STOP, the resulting 
// movie might be corrupted. If that happens to you, use
// videoExport.endMovie() like you see in this example. 

// In some systems pressing ESC produces correct movies
// and .endMovie() is not necessary.

float movieFPS = 30;
float soundDuration = 10.03; // in seconds

void setup() {
  size(600, 600);

  videoExport = new VideoExport(this);
  videoExport.setFrameRate(movieFPS);
  videoExport.setAudioFileName("test-sound.mp3");
  videoExport.startMovie();  
}
void draw() {
  background(#888888);
  rect(frameCount * frameCount % width, 0, 40, height);

  videoExport.saveFrame();
  
  // End when we have exported enough frames 
  // to match the sound duration.
  if(frameCount > round(movieFPS * soundDuration)) {
    videoExport.endMovie();
    exit();
  }  
}

/*
   Note: if you want to visualize sound and want to
   match the sound precisely, you should not do it
   on real time. It will get out of sync. Instead:
   1. Analize the sound in one Processing sketch. 
      Output a text file with the FFT and amplitude data.
   2. Produce the movie in a second sketch. This sketch
      loads the text file produced in the first step
      and outputs the right amount of frames to match
      the sound duration.
   By doing it like this it does not matter how fast
   or slow your second program is.
   I'll provide an example on the next library upgrade.
*/