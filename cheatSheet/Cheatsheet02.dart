import 'dart:io';

void main(List<String> arguments) {
 /* int personAge = 20;
  int driverLicenseAge = 17;
  bool doesPersonHaveDriversLicense = false;
  print(personAge);
  if(personAge >= driverLicenseAge && doesPersonHaveDriversLicense == true) {
    print("Þú mátt Keyra");
  } else if(personAge >=driverLicenseAge && doesPersonHaveDriversLicense == false) {
    print("Þú mátt hringja í ökukennarar aog byrja að læra að keyra");

  } else {
    print("Takt þú strætó.");
  }
  if(5>7) {
    print("This is true");
  }*/
  int i = 0;
  bool authenticated = false;
  while(!authenticated){
        i = i + 1;
    print(i);
        String myPassword = "MasterOfTheWorld123!";
        String userName = "Admin";
        print("Enter your username");
        String loginUser = stdin.readLineSync().toString();
        print("Enter your Password");
        String loginPassword =stdin.readLineSync().toString();

        if (loginUser.toLowerCase() == userName.toLowerCase() && loginPassword == myPassword) {
          print("you are in. Welcome to the jungle");
        } else {
          print("User or password or incorrect");
          print("please try again");

              }


}

}