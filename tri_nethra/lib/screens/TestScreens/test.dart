//This screen holds all the testing data
void main() {
  Map c = {
    "Type of Crime": {
      "Street Crime": {
        "Burglary": "Location Block",
        "Auto Theft": " Theft Location Block",
        "Rape": "Location Block",
        "Robbery": "Location Block",
        "Other": "Default Block"
      },
      "Death": {
        "Homicide": "Location Block",
        "Suicide": "Location Block",
        "Other": "Default Block"
      },
      "Drug Crime": "Default Block",
      "Cyber Crime": {
        "Phishing": "Default Block",
        "Identity Theft": "Default Block",
        "Spread of Fake content/Hatred": "Default Block",
        "Pornography": "Default Block",
        "Other": "Default Block"
      },
      "White-Collar Crime": {
        "Bribe": "Location Block",
        "Price Fixing": "Location Block",
        "Other": "Default Block"
      },
      "Report an Accident": "Location Block"
    }
  };
  print(c["Type of Crime"].length);
  //print(c.keys);
  var t;
  int i = 3;
  t = c["Type of Crime"];
  print(t);
  while (t.length != 0) {
    var l = new List();
    for (var i in t.keys) {
      print(i);
      l.add(i);
      print(l);
    }
    print(l.length);
    print("enter Choice:");
    int n = i;
    i -= 1;
    t = t[l[n]];
    if (t is String) {
      print('finish');
      break;
    }
  }
}
