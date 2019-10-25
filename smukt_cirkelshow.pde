ArrayList cirkler = new ArrayList();

ExpandingCirkel ec1 = new ExpandingCirkel(100,100,true);

void setup(){
  size(500,500);
 
}
void draw(){
  background(255);
  
  ec1.display();
  ec1.update();
  
  for(int i=0;i<cirkler.size(); i++) {
    ExpandingCirkel ec = (ExpandingCirkel) cirkler.get(i);
        println("hej");

    ec.update();
    ec.display();
    if(ec.tandt <=0) { cirkler.remove(i);} // fjerner transparante usnylige cirkler
  }
}
class ExpandingCirkel {
  int x,y;
  float diameter;
  color g;
  boolean ertandt;
  int tandt;
 
 ExpandingCirkel(int x, int y, boolean ertandt) {
    this.x = x;//(lærte denne funktion af min ven der går på programmeringsefterskole
    this.y = y;// this refere til objekter som kan blive skiftet i en slags context.
    this.ertandt = ertandt;
    g = color(random(255),random(255),random(255));
    tandt = 255;
  
}
  void update(){
    diameter++;
    if(ertandt && diameter >= 20 && tandt > 0) {  tandt--; }
}
void display(){
  fill(g,tandt);
  ellipse(x,y,diameter,diameter);
  
}
  


}
  
  
  
void mousePressed(){

  println("mouse pressed");
  
  
   cirkler.add(new ExpandingCirkel(mouseX,mouseY,true));
  //} else { cirkler.add(new ExpandingCirkel(mouseX,mouseY,true)); }
}
