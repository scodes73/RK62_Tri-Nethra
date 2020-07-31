import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';

class Qt {
  String q;
  String a;
  Qt({this.q, this.a});
}

class CAScreen extends StatefulWidget {
  CAScreen() : super();

  final String title = "Carousel Demo";

  @override
  CAScreenState createState() => CAScreenState();
}

class CAScreenState extends State<CAScreen> {
  List<Qt> qtl = [
    Qt(
        q: "1.CHILD PORNOGRAPHY/ CHILD SEXUALLY ABUSIVE MATERIAL (CSAM)",
        a: "Child sexually abusive material (CSAM) refers to material containing sexual image in any form, of a child who is abused or sexually exploited. Section 67 (B) of IT Act states that “it is punishable for publishing or transmitting of material depicting children in sexually explicit act, etc. in electronic form."),
    Qt(
        q: "2.CYBER BULLYING",
        a: "A form of harassment or bullying inflicted through the use of electronic or communication devices such as computer, mobile phone, laptop, etc."),
    Qt(
        q: "3.CYBER STALKING",
        a: "Cyber stalking is the use of electronic communication by a person to follow a person, or attempts to contact a person to foster personal interaction repeatedly despite a clear indication of disinterest by such person; or monitors the internet, email or any other form of electronic communication commits the offence of stalking."),
    Qt(
        q: "4.CYBER GROOMING",
        a: "Cyber Grooming is when a person builds an online relationship with a young person and tricks or pressures him/ her into doing sexual act."),
    Qt(
        q: "5.ONLINE JOB FRAUD",
        a: "Online Job Fraud is an attempt to defraud people who are in need of employment by giving them a false hope/ promise of better employment with higher wages."),
    Qt(
        q: "6.ONLINE SEXTORTION",
        a: "Online Sextortion occurs when someone threatens to distribute private and sensitive material using an electronic medium if he/ she doesn’t provide images of a sexual nature, sexual favours, or money."),
    Qt(
        q: "7.VISHING",
        a: "Vishing is an attempt where fraudsters try to seek personal information like Customer ID, Net Banking password, ATM PIN, OTP, Card expiry date, CVV etc. through a phone call."),
    Qt(
        q: "8. SEXTING",
        a: "Sexting is an act of sending sexually explicit digital images, videos, text messages, or emails, usually by cell phone."),
    Qt(
        q: "9. SMISHING",
        a: "Smishing is a type of fraud that uses mobile phone text messages to lure victims into calling back on a fraudulent phone number, visiting fraudulent websites or downloading malicious content via phone or web."),
    Qt(
        q: "10. SIM SWAP SCAM",
        a: "SIM Swap Scam occurs when fraudsters manage to get a new SIM card issued against a registered mobile number fraudulently through the mobile service provider. With the help of this new SIM card, they get One Time Password (OTP) and alerts, required for making financial transactions through victim's bank account. Getting a new SIM card against a registered mobile number fraudulently is known as SIM Swap."),
    Qt(
        q: "11. DEBIT/CREDIT CARD FRAUD",
        a: "Credit card (or debit card) fraud involves an unauthorized use of another's credit or debit card information for the purpose of purchases or withdrawing funds from it."),
    Qt(
        q: "12. IMPERSONATION AND IDENTITY THEFT",
        a: "Impersonation and identity theft is an act of fraudulently or dishonestly making use of the electronic signature, password or any other unique identification feature of any other person."),
    Qt(
        q: "13. PHISHING",
        a: "Phishing is a type of fraud that involves stealing personal information such as Customer ID, IPIN, Credit/Debit Card number, Card expiry date, CVV number, etc. through emails that appear to be from a legitimate source."),
    Qt(
        q: "14. SPAMMING",
        a: "Spamming occurs when someone receives an unsolicited commercial messages sent via email, SMS, MMS and any other similar electronic messaging media. They may try to persuade recepient to buy a product or service, or visit a website where he can make purchases; or they may attempt to trick him/ her into divulging bank account or credit card details."),
    Qt(
        q: "15. RANSOMWARE",
        a: "Ransomware is a type of computer malware that encrypts the files, storage media on communication devices like desktops, Laptops, Mobile phones etc., holding data/information as a hostage. The victim is asked to pay the demanded ransom to get his device decrypts."),
    Qt(
        q: "16. VIRUS, WORMS & TROJANS",
        a: "Computer Virus is a program written to enter to your computer and damage/alter your files/data and replicate themselves.Worms are malicious programs that make copies of themselves again and again on the local drive, network shares, etc.A Trojan horse is not a virus. It is a destructive program that looks as a genuine application. Unlike viruses, Trojan horses do not replicate themselves but they can be just as destructive. Trojans open a backdoor entry to your computer which gives malicious users/programs access to your system, allowing confidential and personal information to be theft."),
    Qt(
        q: "17. DATA BREACH",
        a: "A data breach is an incident in which information is accessed without authorization."),
    Qt(
        q: "18. DENIAL OF SERVICES /DISTRIBUTED DOS",
        a: "Denial of Services (DoS) attack is an attack intended for denying access to computer resource without permission of the owner or any other person who is in-charge of a computer, computer system or computer network.A Distributed Denial of Service (DDoS) attack is an attempt to make an online service unavailable by overwhelming it with traffic from multiple sources."),
    Qt(
        q: "19. WEBSITE DEFACEMENT",
        a: "Website Defacement is an attack intended to change visual appearance of a website and/ or make it dysfunctional. The attacker may post indecent, hostile and obscene images, messages, videos, etc."),
    Qt(
        q: "20. CYBER-SQUATTING",
        a: "Cyber-Squatting is an act of registering, trafficking in, or using a domain name with an intent to profit from the goodwill of a trademark belonging to someone else."),
    Qt(
        q: "21. PHARMING",
        a: "Pharming is cyber-attack aiming to redirect a website's traffic to another, bogus website."),
    Qt(
        q: "22. CRYPTOJACKING",
        a: "Cryptojacking is the unauthorized use of computing resources to mine cryptocurrencies."),
    Qt(
        q: "23. ONLINE DRUG TRAFFICKING",
        a: "Online Drug Trafficking is a crime of selling, transporting, or illegally importing unlawful controlled substances, such as heroin, cocaine, marijuana, or other illegal drugs using electronic means."),
    Qt(
        q: "24.ESPIONAGE",
        a: "Espionage is the act or practice of obtaining data and information without the permission and knowledge of the owner."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.orange[900],
                  Colors.orange[500],
                  Colors.orange[400]
                ])),
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: AppBar().preferredSize.height / 1.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_left,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            // al.removeLast();
                            // print(al);
                            print("Popping from CA page");
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Crime Awareness  ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30,
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'In general cybercrime may be defined as “Any unlawful act where computer or communication device or computer network is used to commit or facilitate the commission of crime”.\nBelow is a list to facitilate better reporting of complaints.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  new Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: qtl.length,
                      physics: BouncingScrollPhysics(),
                      // reverse: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: OrPop(
                            popcolor: Colors.white,
                            child: ExpansionTile(
                              title: Text(
                                "${qtl[index].q}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${qtl[index].a}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
