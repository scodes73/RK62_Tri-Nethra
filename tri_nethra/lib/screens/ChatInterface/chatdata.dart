class Chat {
  TypeOfCrime typeOfCrime;

  Chat({this.typeOfCrime});

  Chat.fromJson(Map<String, dynamic> json) {
    typeOfCrime = json['Type of crime'] != null
        ? new TypeOfCrime.fromJson(json['Type of crime'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.typeOfCrime != null) {
      data['Type of crime'] = this.typeOfCrime.toJson();
    }
    return data;
  }
}

class TypeOfCrime {
  StreetCrime streetCrime;
  Death death;
  String drugCrime;
  CyberCrime cyberCrime;
  WhiteCollarCrime whiteCollarCrime;
  String reportAnAccident;

  TypeOfCrime(
      {this.streetCrime,
      this.death,
      this.drugCrime,
      this.cyberCrime,
      this.whiteCollarCrime,
      this.reportAnAccident});

  TypeOfCrime.fromJson(Map<String, dynamic> json) {
    streetCrime = json['Street Crime'] != null
        ? new StreetCrime.fromJson(json['Street Crime'])
        : null;
    death = json['Death'] != null ? new Death.fromJson(json['Death']) : null;
    drugCrime = json['Drug Crime'];
    cyberCrime = json['Cyber Crime'] != null
        ? new CyberCrime.fromJson(json['Cyber Crime'])
        : null;
    whiteCollarCrime = json['White-Collar Crime'] != null
        ? new WhiteCollarCrime.fromJson(json['White-Collar Crime'])
        : null;
    reportAnAccident = json['Report an Accident'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.streetCrime != null) {
      data['Street Crime'] = this.streetCrime.toJson();
    }
    if (this.death != null) {
      data['Death'] = this.death.toJson();
    }
    data['Drug Crime'] = this.drugCrime;
    if (this.cyberCrime != null) {
      data['Cyber Crime'] = this.cyberCrime.toJson();
    }
    if (this.whiteCollarCrime != null) {
      data['White-Collar Crime'] = this.whiteCollarCrime.toJson();
    }
    data['Report an Accident'] = this.reportAnAccident;
    return data;
  }
}

class StreetCrime {
  String burglary;
  AutoTheft autoTheft;
  String rape;
  String robbery;
  String other;

  StreetCrime(
      {this.burglary, this.autoTheft, this.rape, this.robbery, this.other});

  StreetCrime.fromJson(Map<String, dynamic> json) {
    burglary = json['Burglary'];
    autoTheft = json['Auto Theft'] != null
        ? new AutoTheft.fromJson(json['Auto Theft'])
        : null;
    rape = json['Rape'];
    robbery = json['Robbery'];
    other = json['Other'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Burglary'] = this.burglary;
    if (this.autoTheft != null) {
      data['Auto Theft'] = this.autoTheft.toJson();
    }
    data['Rape'] = this.rape;
    data['Robbery'] = this.robbery;
    data['Other'] = this.other;
    return data;
  }
}

class AutoTheft {
  String registrationNumber;

  AutoTheft({this.registrationNumber});

  AutoTheft.fromJson(Map<String, dynamic> json) {
    registrationNumber = json['Registration Number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Registration Number'] = this.registrationNumber;
    return data;
  }
}

class Death {
  String homicide;
  String suicide;
  String other;

  Death({this.homicide, this.suicide, this.other});

  Death.fromJson(Map<String, dynamic> json) {
    homicide = json['Homicide'];
    suicide = json['Suicide'];
    other = json['Other'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Homicide'] = this.homicide;
    data['Suicide'] = this.suicide;
    data['Other'] = this.other;
    return data;
  }
}

class CyberCrime {
  String phishing;
  String identityTheft;
  String spreadOfFakeContentHatred;
  String pornography;
  String other;

  CyberCrime(
      {this.phishing,
      this.identityTheft,
      this.spreadOfFakeContentHatred,
      this.pornography,
      this.other});

  CyberCrime.fromJson(Map<String, dynamic> json) {
    phishing = json['Phishing'];
    identityTheft = json['Identity Theft'];
    spreadOfFakeContentHatred = json['Spread of Fake content/Hatred'];
    pornography = json['Pornography'];
    other = json['Other'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Phishing'] = this.phishing;
    data['Identity Theft'] = this.identityTheft;
    data['Spread of Fake content/Hatred'] = this.spreadOfFakeContentHatred;
    data['Pornography'] = this.pornography;
    data['Other'] = this.other;
    return data;
  }
}

class WhiteCollarCrime {
  String bribe;
  String priceFixing;
  String other;

  WhiteCollarCrime({this.bribe, this.priceFixing, this.other});

  WhiteCollarCrime.fromJson(Map<String, dynamic> json) {
    bribe = json['Bribe'];
    priceFixing = json['Price Fixing'];
    other = json['Other'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Bribe'] = this.bribe;
    data['Price Fixing'] = this.priceFixing;
    data['Other'] = this.other;
    return data;
  }
}
