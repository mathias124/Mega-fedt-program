int Counter=0; int antalKort=52; int money=150;
int Tab = 100;//en del af penge systemett.
//Her antager vi vores start counter på 0 da man starter på 0 værdi i blackjack:
int TraekVaerdi; int BrugerVaerdi=0; int Dealer=0; int kortb=0;
int blackjack=21;//lavede blackjack til int så hvis man ramte 21 kunne jeg sammeligne med == i stedet for new string.
int kortf=(int)random(1,11); int kortv=(int)random(1,11); 
String [] kuloer =new String[4];//her laves der en string værdi på 4 fordi der er 4 kulører.
String []vaerdi = new String[13];// her laves en stringværdi på 13 fordi der er 13 mulige kort.
StringList Kort = new StringList();
StringList KortVaerdi = new StringList();
boolean nyt_trak=false;//har lavet en boolean så jeg kunne i sammenhæng med if gøre det hele nemmere.
boolean Afslut=false;//Denne boolean er med til at sige om spillet er afsluttet eller ej.
boolean nyt_spil=false;// Det burde starte et nyt spil?.(ik færdig)


import controlP5.*;
//du skal importere denne smarte (knap-værdi link i bunden til kilde) Du går ind i tools og søg efter controlP5 og install og så kør programmet.
ControlP5 cp5;// vi skrive dette for at sætte op en variabel

void setup() {
//her under sætter jeg up fire arraylister til de forskellige kulører og værdier.
  kuloer[0]="Hjerter";
  kuloer[1]="Ruder";
  kuloer[2]="Spar";
  kuloer[3]="Kloer";

  vaerdi[0]="Es";
  vaerdi[10]="Bonde";
  vaerdi[11]="Dame";
  vaerdi[12]="Konge";

  size(600, 600);//sætter et vindue op
background(71,113,72);//specifik poker-blackjack farve der sætter stemningen.
  rectMode(CENTER);// her siger den at den kæmpe hvide firkant er i midten. Dette er en meget brugbar funktion, istedet for at gætte sig frem.rectMode(CENTER);
  fill(255);
  rect(width/2, height/2, 300, 400, 6);
  fill(0);
  textSize(20);
  text("Hvad mon det næste kort er?",width/2-140,height/2+25);
  textSize(28);
  fill(135,206,235);
 text("Velkommen til blackjack!",140,60);// Fortæller en startbesked inden spillet går igang.
  cp5 = new ControlP5(this); 

  cp5.addButton("Giv_Kort")
    .setPosition(5, 512)
    .setSize(183, 75)
    ;
  cp5.addButton("Forbliver")
    .setPosition(200, 512)
    .setSize(183, 75)
    ;
   cp5.addButton("Penge")
   .setPosition(405,512)
   .setSize(183,75)
   ;
}
void draw() {
  // her er vores tegnefunktion der kører 60 gange i sekundet.
  kortb=kortf+kortv;
   if (BrugerVaerdi > blackjack) {// her popper den op med en tekst hvis du ikke rammer blackjack. (dette vises vi du rammer over 21)
    fill(255, 0, 0);
    textSize(22);
    text("Du kom over 21 :(", 150,240);
    noLoop();
    money=money-Tab;
    
  } else if(BrugerVaerdi==blackjack){// dette vises hvis du er heldig og rammer blackjack, dit heldige assens :). 
      fill(0,0,128);
      textSize(22);
      text("Du har vundet i blackjack!",150,240);// det er en slags pop-op tekst hvis du rammer 21.
      money=money+100;//den hedder money fordi at den ikke skal komplexe med knappen "penge"
  } else if (BrugerVaerdi<kortb){
    money=money+10;
  }
  for (int i = 0; i < 9; i++) {//det gælder for (kortværdi 2 til 9) som er en for loop. Der ikke kører længere end 9.
    vaerdi[i+1] = str(i+2);// her converteres en værdi af data typer, til string.  fx Str(3) vil returnere en stringværdi af "3".
  }

  while ( Counter < 52) {// controlere en del af repititionerne, og exekvere commands kun imens dens ekspression er true.
    for (int i = 0; i < 4; i++) {//brugte dette smart for int da der var 4 kulører.
      for (int j = 0; j < 13; j++) {//brugte dette med kulor loppet da der er 13 kort.
        Kort.append(kuloer[i]+" "+vaerdi[j]);// her angiver jeg det kommende korts "værdi"
        if (vaerdi[j]=="Bonde"||vaerdi[j]=="Dame"||vaerdi[j]=="Konge") {//her announcer jeg hvis jeg får en bonde,dronning,konge eller 10 bliver værdien 10.
          KortVaerdi.append("10");
        } else if (vaerdi[j]=="Es") {
          KortVaerdi.append("11");//tilføjere i arrayet med et "element".
        } else 
        KortVaerdi.append(vaerdi[j]);
        Counter++;
       
      }
    }
  }

  if (nyt_trak) {//hvis du trækker et kort bliver dette sat igang.
    background(0,99,65);
    rectMode(CENTER);
    fill(255);
    stroke(204,102,0);// har lavet en slags shade til kortet hvis godt kigget efter i udkantet af kortet.
    rect(150, 300, 280, 400, 6);
    rect(450,300,280,400,6);
    text("Spillet er sat igang!",150,40); //viser tekst når spillet er sat igang.

    
      int traek=int(random(0, antalKort));// her har jeg lavet et int der tager det random kort ud af dækket - den antal værdi der allerede er ude.
      antalKort--;

      textAlign(CENTER);
      fill(0);
      stroke(204,102,0);
      text(Kort.get(traek), 150,200);//fortæller teksten, af hvilket kort du har, trukket. 

      int TrukketVaerdi = Integer.parseInt(KortVaerdi.get(traek));//Parse int returnere intergeren af den specifikket trukketværdi.
      if (TrukketVaerdi == 11 ) {//(dette kode er i sammenhæng med es'et.
        if (BrugerVaerdi + TrukketVaerdi > 21) {//hvor at den siger es bliver 1 hvis der ikke er plads til 11.
          BrugerVaerdi++;
        }
      } else if (TrukketVaerdi != 11 || TrukketVaerdi != 1) {
        BrugerVaerdi = BrugerVaerdi + TrukketVaerdi;
       
        
      }
      text("Dealer har lige nu;"+kortb,450,160);
      text("Du har lige nu: "+BrugerVaerdi, 150, 160);//viser den værdi du har i øjeblikket.
      text("Dine penge:"+money,150,340);
      Kort.remove(traek);
      KortVaerdi.remove(traek);
      nyt_trak=false;// i sammenhæng med boolean fra de første linjer
  }
    }  
void Giv_Kort() {// sammenhæng med controlP5 (knappen Giv_kort)
  if (antalKort > 0) {
    nyt_trak=true;
  }
}
void Forbliver() {// sammenhæng med ControlP5 (knappen Forbliver)//
 if(Afslut=true){
 nyt_spil=true;
}
}
//(Havde problemere med mit "moneysystem"
//void Penge(){// Her er min uvellykkede Penge display. Dog kunne jeg ikke få det helt til at virke.
  //if(BrugerVaerdi==blackjack) {//(fx er der en glith der giver nogen gange 1000 til værdien og kan ikke finde årsagen.
    //money=money+500;// her skulle den fordoble værdien af penge, hvis du fik blackjack.
  //} else if (BrugerVaerdi>blackjack){
    //money=money - 200;// her skulle den trakker 100 fra hvis du kom over.
  //} else if (BrugerVaerdi<21){
    //money=money+50;
  //}
//}

    //void nyt_spil(){
  //ved godt at mit spil ikke minder så meget om  blackjack, men mere at bare nå blackjack.
 
//her er en min kilde/information til hvordan jeg lavede ControlP5 (hvis du er intereseret(ikke nødvendig)
//https://www.youtube.com/watch?v=jfM-LAp-tKE
