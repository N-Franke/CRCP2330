//assember

PrintWriter outputFile;
 void setup(){
   //create  a new file in the sketch directory
   outputFile = createWriter("output.txt");
 }
 
 void draw(){
   read();
 }


//read an array of characters/string variable, ignore whitespace
void read(){
String[] input = loadStrings("Test.txt"); //file goes here
 for(int i=0; i<input.length; i++){
   char[] set = new char[input[i].length()];
   set=convert(input[i]);
   opCode(instruction(set), set);
   complete(combine(instruction(set), set));
 }
}

//breaks each line of strings into a char array
char[] convert(String perLine){
 char[] line = new char[perLine.length()];
 for(int i=0; i<perLine.length(); i++){
   line[i]=perLine.charAt(i);
   }
// println(line);
 return line;
}

//determine A or C instruction
boolean instruction(char[] words){
    boolean aInstruction;
    if(words[0] == '@'){
      aInstruction = true; //A-Instruction or  variable
    }
    else if(words[0]== '('){
      aInstruction = true; //Label
    }
    else{
      aInstruction = false; //C-Instruction
    }
    return aInstruction;
}  

//determines an A or an M to compute
String mnemonic(boolean truth, char[] words){
  String output;
  for(int i =0; i <words.length; i++){
    if( (truth == false) && (words[i] == 'A')){
      output = "0";
    }
    else if((truth ==false) && (words[i] == 'M')){
      output = "1";
    }
  }
  return output;
}

void opCode(boolean truth, char[] words){
  String output;
  int translation;
   //A-Instructions
  if(truth == true){
    //(symbol)
    for(int i=1; i<words.length; i++){
      String variables = words[i];
      if(words[0]== '('){
        //address of label goes here 
        //to be returned in  binary
      } 
    }
    //predefined variable
    if(variables == "R0"){
      translation = 0;
    }
    if(variables == "R1"){
      translation = 1;
    }
    if(variables == "R2"){
      translation = 2;
    }
    if(variables == "R3"){
      translation = 3;
    }
    if(variables == "R4"){
      translation =4;
    }
    if(variables == "R5"){
      translation =5;
    }
    if(variables == "R6"){
      translation =6;
    }
    if(variables == "R7"){
      translation =7;
    }
    if(variables  == "R8"){
      translation =8;
    }
    if(variables == "R9"){
      translation =9;
    }
    if(variables == "R10"){
      translation =10;
    }
    if(variables =="R11"){
      translation =11;
    }
    if(variables =="R12"){
      translation =12;
    }
    if(variables =="R13"){
      translation = 13;
    }
    if(variables =="R14"){
      translation = 14;
    }
    if(variables =="R15"){
      translation = 15;
    }
    if(variables == "SCREEN"){
      translation = 16384;
    }
    if(varibales == "KBD"){
      translation = 24576;
    }
    if(variables =="SP"){
      translation = 0;
    }
    if(variables =="LCL"){
      translation =1;
    }
    if(variables =="ARG"){
      translation =2;
    }
    if(variables =="THIS"){
      translation = 3;
    }
    if(variables =="THAT"){
      translation = 4;
    }
    else {
     // int[] valHolder = new int[]
      //translation = valHolder + 16;
      //put the new variable in an array to hold a place and value
      //this value can be updated later on in the program
      //must start at value 16 and go up
      //if it appears for the first time, create a new value
      //otherwise use the old value
       output=binary(translation);
      }
  }
    //else if (decimal constant)
    else{
    //start at 1, because @=0
    for (int i=1; i < words.length; i++){
    int sum = 0;
    sum = int(words[i]) + sum;
    output=binary(sum);  //converts integer to binary
   // println(output);
      }
    }
 
//C-Instructions
  if(truth == false){
    //dest = comp ; jump
    //use table to figure out the binary
  for(int i =0; i<words.length; i++){
    if(words[i] == '='){
      String dest;
      String comp;
      for(int j=0; j<i; j++){
        dest = dest + words[j];
      }
      tableDest(dest);  //dest function
      for(int k=i+1; k<(words.length-I); k++){
        comp = comp + words[k];
      }
      tableComp(comp);  //comp function
    }
    if(words[i] == ';'){
      String jump;
      String comp;
      for(int j=i+1; j<(words.length -i); j++){
        jump = jump + words[j];
      }
      tableJump(jump);
      for(int k=0; k<i; k++){
        comp = comp + words[k];
        }
      tableComp(comp);
      }
    }
    output = tableComp() + tableDest() + tableJump();
  }
  
} //end of function

//Computation Bit passes in a string
String tableComp(String comp){
  String input;
  String output;
  //compare that string to possibilities presented
  //output the binary number as an integer
  //comp.equals(0) == true
  if(comp == "0"){
   output="101010";
   return output;
  }
  if(comp== "1"){
   output = "111111";
   return output;
  }
  if(comp== "-1"){
   output = "111010";
   return output;
  }
  if(comp== "D"){
   output="001100";
   return output;
  }
  if(comp=="A" || comp== "M"){
    output="110000";
    return output;
  }
  if(comp=="!D"){
    output="001101";
    return output;
  }
  if(comp=="!A" || comp=="!M"){
    output="110001";
    return output;
  }
  if(comp=="-D"){
    output="001111";
    return output;
  }
  if(comp=="-A" || comp=="-M"){
    output="110011";
    return output;
  }
  if(comp=="D+1"){
    output="011111";
    return output;
  }
  if(comp=="A+1" || comp=="M+1"){
    output="110111";
    return output;
  }
  if(comp=="D-1"){
    output="001110";
    return output;
  }
  if(comp=="A-1" || comp=="M-1"){
    output="110010";
    return output;
  }
  if(comp=="D+A" || comp=="D+M"){
    output="000010";
    return output;
  }
  if(comp=="D-A" || comp=="D-M"){
    output="010011";
    return output;
  }
  if(comp=="A-D" || comp=="M-D"){
    output="000111";
    return output;
  }
  if(comp=="D&A" || comp=="D&M"){
    output="000000";
    return output;
  }
  if(comp=="D|A" || comp=="(D|M)"){
    output="010101";
    return output;
  }
}

//Destination Bit passes in a string, to create a string
String tableDest(String dest){
  String output;
  if(dest == "M"){
    output="001";
  }
  if(dest =="D"){
    output="010";
  }
  if(dest =="MD"){
    output="011";
  }
  if(dest=="A"){
    output="100";
  }
  if(dest== "AM"){
    output="101";
  }
  if(dest== "AD"){
    output="110";
  }
  if(dest== "AMD"){
    output="111";
  }
  else{
    output="000";
  }
  return output;
}

//Jump Bit passes in a string, produces a string
String tableJump(String jump){
  String output;
  if(jump =="JGT"){
    output="001";
  }
  if(jump =="JEQ"){
    output="010";
  }
  if(jump =="JGE"){
    output="011";
  }
  if(jump =="JLT"){
    output="100";
  }
  if(jump =="JNE"){
    output="101";
  }
  if(jump =="JLE"){
    output="110";
  }
  if(jump =="JMP"){
    output="111";
  }
  else{
    output="000";
  }
 return output;
}


//combine the codes into a single machine language command
//combine the translted binary into one number
String combine(boolean truth, char[] words){
  String output;
  //A instruction
  //combine a 0 with a 15 bit string from opCode()
  if(truth ==true){
   output= "0" + opCode(truth, words);
   //will return a 16 bit binary a-instruction
  }
  
  //C instruction
  //combine 111 with the strings produced from tables
  if(truth ==false){
    //opCode();
    output= "111" + mnemonic(truth, words) + opCode(truth, words);
  }
  return output;
}

//output this machine language command
//print out this combined binary number
//depends on file format
void complete(String result){
  outputFile.println(result);
  outputFile.flush();  //writes remaining data to file
  outputFile.close();  //finished file
  exit();  //stops the program
}
