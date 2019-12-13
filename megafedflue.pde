ArrayList<Flue> flueListe = new ArrayList<Flue>();//laver en liste over variabler.
float c=20;
float d=5;
void setup(){//laver et setup der kører 1 gang
  size(500,500);//laver et vindue der har størrelsen på 500 * 500 pixels, bredde og længde.
}

void draw(){//kører 60 gange i sekundet.
  for(int i=0; i<flueListe.size(); i++){//laver et for-loop, i sammearbejde med arraylisten over variabler.
    Flue f = flueListe.get(i);
    f.tegnFlue();//her gør den muligt til void tegnflue længere nede
    f.flyt();// samme som tegnFlue.
  }
}

void keyPressed(){
  flueListe.add(new Flue());//hver gang du trykket laver den en ny flue.
  if(keyPressed){
    if(key=='e'){
      c=60;
      d=40;
    }
  }
}

void mousePressed(){
  flueListe.add(new Flue(mouseX, mouseY));//laver en ny flue ud fra mus-pixel y og x værdi i koordinatsystemet.
}

/////////////////////////////////////////////////////////
class Flue{// laver klassen flue.
  
  float positionX,positionY;//kommaværdier for X og Y position.
  float distanceFlyttet;//distancen for fluen den har bevæget sig.
  float vinkel = 0; //vinkel når man placere fluen
 
  
  Flue(){
    positionX  = random(0,height);//tilfældig mellem 0 og højden. på fluen.
    positionY  = random(0,width);// gør det tilfældigt mellem 0 og bredden.
    vinkel     = random(0,2*PI);//vinkel er tilfældig.
  }
  
  Flue(float a, float b){
    positionX = a;
    positionY = b;
    vinkel    = random(0,2*PI);
  }
  
  void flyt(){
    distanceFlyttet = distanceFlyttet + 0.5;// her hvor fluen bevæger sig.
  }

  void tegnFlue(){//her tegner den selve fluen, med en matrix da de er en transformerene flue,
    pushMatrix();
      translate(positionX,positionY);
      rotate(vinkel);
      translate(distanceFlyttet,0);
      scale(1,1);//ny addet scale som gør det 10% større.
        ellipse(0,0,c,8);//tegner fluens krop (alle ellipse)
        ellipse(0,0-d,c-5,d+5);
        ellipse(0,0+d,c-5,d+5);
        ellipse(0+6,0,c-12,d+3);
    popMatrix(); // bruges da flere fluer bevæger sig i sammenhæng med et koordinatsystem.
  } 
}
//////////////////////////////////////////////////////
