void main(List<String> arguments) {
String firstName = "Sindri";
String lastName = "Vidisson";
print("Hi $firstName $lastName");
//Hér prentar hún út Sindri Vidisson
String fullName = firstName + " " + lastName;
print("Hi $fullName");
int namelenght = fullName.length;
print(namelenght);
//replaceALL er notað til þess að taka í burtu fyrri hlutan ss "-"
String SSN = "081092-2309";
String fixSSN =SSN.replaceAll("-", " ");
int ssnLenght = SSN.length;
print(ssnLenght);
String message = "Hello World";
String fixMessage = message.replaceAll("World", "NTW");
print(fixMessage);


String birthDate = SSN.substring(0,6);
print(birthDate);


String email ="Sindriv8@gmail.com";
print(email.toLowerCase());
}