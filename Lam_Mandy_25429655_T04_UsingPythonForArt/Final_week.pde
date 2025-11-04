// Define colors, white = white, pink = pink, dust = lighter blue, peri = darker blue, pale = light pink
int color_white = color(255, 255, 255);
int color_pink = color(226, 147, 177);
int color_dust = color(198, 205, 247);
int color_peri = color(114, 148, 212);
int color_pale = color(255, 235, 231);
int color_black = color(48, 3, 39);

// Define the size of each box
int box_size = 60;

//Defining the names for the animation
int frame_shift = 0;
int prev_frame_shift = 0;
//The pause between the shift of the boxes
int shift_pause = 1000;

//Draws a single box
void drawColorBox(int draw_box_color, int left, int top, int width, int height) {
  //Fills the box with each respective colour
  fill(draw_box_color);
  //Colouring the strokes the same colour
  stroke(draw_box_color);
  //The measurements and location
  rect(left, top, width, height);
}


//Draws the lines of boxes, drawColorBoxLine stores all the variables in the brackets in it
void drawColorBoxLine(int[] colors_arr, int box_width, int box_height, int start_y, int color_shift) {
  // Cuts off the box line to reduce lag, especially combined with the resizing canvas function
  //Uses the for loop to loop drawing each box
  int boxes_to_draw = ceil((float)width / (float)box_size);
  
  //Uses the for loop to loop drawing each box, it sees that i is less then boxes_to_draw and adds one, which tells it to change the colour
  for (int i = 0; i <= boxes_to_draw; i++) {
        //specifically the modulo selects one of the three colours by putting them in a list, 0. Pink, 1. Dust, 2. Peri
    int color_id = (i + color_shift) % colors_arr.length;
    int draw_x = i * box_size;
    drawColorBox(colors_arr[color_id], draw_x, start_y, box_width, box_height);
  }
}

//Setup
void setup() {
  //Original size of the canvas
  size(1280, 480);
  //Colour of the background
  background(color_white);
  //Making all the stroke weights the same
  strokeWeight(2);
  //The original stroke colour
  stroke(color_white);
  //Loading the fonts
  PFont font;
  //Defining the font to specifically be Futura Bold
  font = loadFont("Futura-Bold-48.vlw");
  //Setting the futura font
  textFont (font, 60);
  //Setting the framerate
  frameRate (5);
  
  size(800, 400);
  stroke(color_black);
  
  PFont.list();
  
  //Sets the canvas to be resizable by the users
  surface.setResizable(true);
}

void draw() {
  // Draws the two box lines across the screen, one at the top and one at the bottom
  // Optimises by cutting off at the end
  background (color_white);
  
  //If the previous frame shift is less then the pause then it will add one which allows for the background to look like it is moving
    if (millis() - prev_frame_shift > shift_pause) {
      frame_shift++;
      prev_frame_shift = millis();
  }
  int[] colors_to_draw = {color_pink, color_dust, color_peri};
  drawColorBoxLine(colors_to_draw, box_size, box_size, 0, frame_shift);
  drawColorBoxLine(colors_to_draw, box_size, (height - box_size*4)/2, box_size, frame_shift+1);
  drawColorBoxLine(colors_to_draw, box_size, box_size, (height - box_size*2)/2, frame_shift + 2);
  drawColorBoxLine(colors_to_draw, box_size, box_size, ((height - box_size*2)/2)+box_size, frame_shift + 3);
  drawColorBoxLine(colors_to_draw, box_size, (height - box_size*4)/2, (height/2)+box_size, frame_shift + 4);
  drawColorBoxLine(colors_to_draw, box_size, box_size, height - box_size, frame_shift + 5);
  frame_shift++;
  
  //It will create a line where the mouse is on the canvas
  strokeWeight(15);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

//Setup for the ability for text to appear when certain buttons are pressed until the frame refreshes
void keyPressed () {
  //When the UP button is pressed, then the text "The Wrong Unit" will appear
if (keyCode == UP) {
  //Setting the colour
  stroke(color_black);
  fill(color_black);
  //The message that will appear
  String message_1 = "The Wrong Unit";
  //Makes it so the message will only slowly appear when you hold down the DOWN button because the message length increases
  int message_shown = int(frameCount / 5.0) % (message_1.length() + 1);
  text(message_1.substring(0, message_shown), 350, 180);
  //However, if DOWN button is pressed, then the text "All Systems Red" will appear 
  } 
  else if (keyCode == DOWN) {
  //Setting the colour
  stroke(color_black);
  fill(color_black);
  //Defining the messages that will appear
  String message_2 = "All Systems Red";
  //Makes it so the message will only slowly appear when you hold down the DOWN button because the message length increases
  int message_shown = int(frameCount / 5.0) % (message_2.length() + 1);
  text(message_2.substring(0, message_shown), 350, 180);
  //All other keys will say "Do Androids Dream of Electric Sheep?"
  } 
  else {
  //Setting the colour
  stroke(color_black);
  fill(color_black);
  //The message shown
    //Defining the messages that will appear
  String message_3= "Do Androids Dream of Electric Sheep?";
  //Makes it so the message will only slowly appear when you hold a key because the message length increases
  int message_shown = int(frameCount / 5.0) % (message_3.length() + 1);
  text(message_3.substring(0, message_shown), 5, 180);
  }
}


    
