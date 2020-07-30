import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/ChatInterface/Datepkr.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';

class STD extends StatefulWidget {
  final List<String> al;
  STD({this.al});
  @override
  _STDState createState() => _STDState(al: al);
}

class _STDState extends State<STD> {
  List<String> al;
  _STDState({this.al});
  List<DropdownMenuItem<String>> ddl;
  List<String> states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chandigarh (UT)',
    'Chhattisgarh',
    'Dadra and Nagar Haveli (UT)',
    'Daman and Diu (UT)',
    'Delhi (NCT)',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu and Kashmir',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Lakshadweep (UT)',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Puducherry (UT)',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttarakhand',
    'Uttar Pradesh',
    'West Bengal'
  ];

  Map<String, List<String>> v = {
    "Andhra Pradesh": [
      'Anantapur',
      'Chittoor',
      'East Godavari',
      'Guntur',
      'Krishna',
      'Kurnool',
      'Nellore',
      'Prakasam',
      'Srikakulam',
      'Visakhapatnam',
      'Vizianagaram',
      'West Godavari',
      'YSR Kadapa'
    ],
    "Arunachal Pradesh": [
      'Tawang',
      'West Kameng',
      'East Kameng',
      'Papum Pare',
      'Kurung Kumey',
      'Kra Daadi',
      'Lower Subansiri',
      'Upper Subansiri',
      'West Siang',
      'East Siang',
      'Siang',
      'Upper Siang',
      'Lower Siang',
      'Lower Dibang Valley',
      'Dibang Valley',
      'Anjaw',
      'Lohit',
      'Namsai',
      'Changlang',
      'Tirap',
      'Longding'
    ],
    "Assam": [
      'Baksa',
      'Barpeta',
      'Biswanath',
      'Bongaigaon',
      'Cachar',
      'Charaideo',
      'Chirang',
      'Darrang',
      'Dhemaji',
      'Dhubri',
      'Dibrugarh',
      'Goalpara',
      'Golaghat',
      'Hailakandi',
      'Hojai',
      'Jorhat',
      'Kamrup Metropolitan',
      'Kamrup',
      'Karbi Anglong',
      'Karimganj',
      'Kokrajhar',
      'Lakhimpur',
      'Majuli',
      'Morigaon',
      'Nagaon',
      'Nalbari',
      'Dima Hasao',
      'Sivasagar',
      'Sonitpur',
      'South Salmara-Mankachar',
      'Tinsukia',
      'Udalguri',
      'West Karbi Anglong'
    ],
    "Bihar": [
      'Araria',
      'Arwal',
      'Aurangabad',
      'Banka',
      'Begusarai',
      'Bhagalpur',
      'Bhojpur',
      'Buxar',
      'Darbhanga',
      'East Champaran (Motihari)',
      'Gaya',
      'Gopalganj',
      'Jamui',
      'Jehanabad',
      'Kaimur (Bhabua)',
      'Katihar',
      'Khagaria',
      'Kishanganj',
      'Lakhisarai',
      'Madhepura',
      'Madhubani',
      'Munger (Monghyr)',
      'Muzaffarpur',
      'Nalanda',
      'Nawada',
      'Patna',
      'Purnia (Purnea)',
      'Rohtas',
      'Saharsa',
      'Samastipur',
      'Saran',
      'Sheikhpura',
      'Sheohar',
      'Sitamarhi',
      'Siwan',
      'Supaul',
      'Vaishali',
      'West Champaran'
    ],
    "Chandigarh (UT)": ['Chandigarh'],
    "Chhattisgarh": [
      'Balod',
      'Baloda Bazar',
      'Balrampur',
      'Bastar',
      'Bemetara',
      'Bijapur',
      'Bilaspur',
      'Dantewada (South Bastar)',
      'Dhamtari',
      'Durg',
      'Gariyaband',
      'Janjgir-Champa',
      'Jashpur',
      'Kabirdham (Kawardha)',
      'Kanker (North Bastar)',
      'Kondagaon',
      'Korba',
      'Korea (Koriya)',
      'Mahasamund',
      'Mungeli',
      'Narayanpur',
      'Raigarh',
      'Raipur',
      'Rajnandgaon',
      'Sukma',
      'Surajpur  ',
      'Surguja'
    ],
    "Dadra and Nagar Haveli (UT)": ['Dadra & Nagar Haveli'],
    "Daman and Diu (UT)": ['Daman', 'Diu'],
    "Delhi (NCT)": [
      'Central Delhi',
      'East Delhi',
      'New Delhi',
      'North Delhi',
      'North East  Delhi',
      'North West  Delhi',
      'Shahdara',
      'South Delhi',
      'South East Delhi',
      'South West  Delhi',
      'West Delhi'
    ],
    "Goa": ['North Goa', 'South Goa'],
    "Gujarat": [
      'Ahmedabad',
      'Amreli',
      'Anand',
      'Aravalli',
      'Banaskantha (Palanpur)',
      'Bharuch',
      'Bhavnagar',
      'Botad',
      'Chhota Udepur',
      'Dahod',
      'Dangs (Ahwa)',
      'Devbhoomi Dwarka',
      'Gandhinagar',
      'Gir Somnath',
      'Jamnagar',
      'Junagadh',
      'Kachchh',
      'Kheda (Nadiad)',
      'Mahisagar',
      'Mehsana',
      'Morbi',
      'Narmada (Rajpipla)',
      'Navsari',
      'Panchmahal (Godhra)',
      'Patan',
      'Porbandar',
      'Rajkot',
      'Sabarkantha (Himmatnagar)',
      'Surat',
      'Surendranagar',
      'Tapi (Vyara)',
      'Vadodara',
      'Valsad'
    ],
    "Haryana": [
      'Ambala',
      'Bhiwani',
      'Charkhi Dadri',
      'Faridabad',
      'Fatehabad',
      'Gurgaon',
      'Hisar',
      'Jhajjar',
      'Jind',
      'Kaithal',
      'Karnal',
      'Kurukshetra',
      'Mahendragarh',
      'Mewat',
      'Palwal',
      'Panchkula',
      'Panipat',
      'Rewari',
      'Rohtak',
      'Sirsa',
      'Sonipat',
      'Yamunanagar'
    ],
    "Himachal Pradesh": [
      'Bilaspur',
      'Chamba',
      'Hamirpur',
      'Kangra',
      'Kinnaur',
      'Kullu',
      'Lahaul &amp; Spiti',
      'Mandi',
      'Shimla',
      'Sirmaur (Sirmour)',
      'Solan',
      'Una'
    ],
    "Jammu and Kashmir": [
      'Anantnag',
      'Bandipore',
      'Baramulla',
      'Budgam',
      'Doda',
      'Ganderbal',
      'Jammu',
      'Kargil',
      'Kathua',
      'Kishtwar',
      'Kulgam',
      'Kupwara',
      'Leh',
      'Poonch',
      'Pulwama',
      'Rajouri',
      'Ramban',
      'Reasi',
      'Samba',
      'Shopian',
      'Srinagar',
      'Udhampur'
    ],
    "Jharkhand": [
      'Bokaro',
      'Chatra',
      'Deoghar',
      'Dhanbad',
      'Dumka',
      'East Singhbhum',
      'Garhwa',
      'Giridih',
      'Godda',
      'Gumla',
      'Hazaribag',
      'Jamtara',
      'Khunti',
      'Koderma',
      'Latehar',
      'Lohardaga',
      'Pakur',
      'Palamu',
      'Ramgarh',
      'Ranchi',
      'Sahibganj',
      'Seraikela-Kharsawan',
      'Simdega',
      'West Singhbhum'
    ],
    "Karnataka": [
      'Bagalkot',
      'Ballari (Bellary)',
      'Belagavi (Belgaum)',
      'Bengaluru (Bangalore) Rural',
      'Bengaluru (Bangalore) Urban',
      'Bidar',
      'Chamarajanagar',
      'Chikballapur',
      'Chikkamagaluru (Chikmagalur)',
      'Chitradurga',
      'Dakshina Kannada',
      'Davangere',
      'Dharwad',
      'Gadag',
      'Hassan',
      'Haveri',
      'Kalaburagi (Gulbarga)',
      'Kodagu',
      'Kolar',
      'Koppal',
      'Mandya',
      'Mysuru (Mysore)',
      'Raichur',
      'Ramanagara',
      'Shivamogga (Shimoga)',
      'Tumakuru (Tumkur)',
      'Udupi',
      'Uttara Kannada (Karwar)',
      'Vijayapura (Bijapur)',
      'Yadgir'
    ],
    "Kerala": [
      'Alappuzha',
      'Ernakulam',
      'Idukki',
      'Kannur',
      'Kasaragod',
      'Kollam',
      'Kottayam',
      'Kozhikode',
      'Malappuram',
      'Palakkad',
      'Pathanamthitta',
      'Thiruvananthapuram',
      'Thrissur',
      'Wayanad'
    ],
    "Lakshadweep (UT)": [
      'Agatti',
      'Amini',
      'Androth',
      'Bithra',
      'Chethlath',
      'Kavaratti',
      'Kadmath',
      'Kalpeni',
      'Kilthan',
      'Minicoy'
    ],
    "Madhya Pradesh": [
      'Agar Malwa',
      'Alirajpur',
      'Anuppur',
      'Ashoknagar',
      'Balaghat',
      'Barwani',
      'Betul',
      'Bhind',
      'Bhopal',
      'Burhanpur',
      'Chhatarpur',
      'Chhindwara',
      'Damoh',
      'Datia',
      'Dewas',
      'Dhar',
      'Dindori',
      'Guna',
      'Gwalior',
      'Harda',
      'Hoshangabad',
      'Indore',
      'Jabalpur',
      'Jhabua',
      'Katni',
      'Khandwa',
      'Khargone',
      'Mandla',
      'Mandsaur',
      'Morena',
      'Narsinghpur',
      'Neemuch',
      'Panna',
      'Raisen',
      'Rajgarh',
      'Ratlam',
      'Rewa',
      'Sagar',
      'Satna',
      'Sehore',
      'Seoni',
      'Shahdol',
      'Shajapur',
      'Sheopur',
      'Shivpuri',
      'Sidhi',
      'Singrauli',
      'Tikamgarh',
      'Ujjain',
      'Umaria',
      'Vidisha'
    ],
    "Maharashtra": [
      'Ahmednagar',
      'Akola',
      'Amravati',
      'Aurangabad',
      'Beed',
      'Bhandara',
      'Buldhana',
      'Chandrapur',
      'Dhule',
      'Gadchiroli',
      'Gondia',
      'Hingoli',
      'Jalgaon',
      'Jalna',
      'Kolhapur',
      'Latur',
      'Mumbai City',
      'Mumbai Suburban',
      'Nagpur',
      'Nanded',
      'Nandurbar',
      'Nashik',
      'Osmanabad',
      'Palghar',
      'Parbhani',
      'Pune',
      'Raigad',
      'Ratnagiri',
      'Sangli',
      'Satara',
      'Sindhudurg',
      'Solapur',
      'Thane',
      'Wardha',
      'Washim',
      'Yavatmal'
    ],
    "Manipur": [
      'Bishnupur',
      'Chandel',
      'Churachandpur',
      'Imphal East',
      'Imphal West',
      'Jiribam',
      'Kakching',
      'Kamjong',
      'Kangpokpi',
      'Noney',
      'Pherzawl',
      'Senapati',
      'Tamenglong',
      'Tengnoupal',
      'Thoubal',
      'Ukhrul'
    ],
    "Meghalaya": [
      'East Garo Hills',
      'East Jaintia Hills',
      'East Khasi Hills',
      'North Garo Hills',
      'Ri Bhoi',
      'South Garo Hills',
      'South West Garo Hills ',
      'South West Khasi Hills',
      'West Garo Hills',
      'West Jaintia Hills',
      'West Khasi Hills'
    ],
    "Mizoram": [
      'Aizawl',
      'Champhai',
      'Kolasib',
      'Lawngtlai',
      'Lunglei',
      'Mamit',
      'Saiha',
      'Serchhip'
    ],
    "Nagaland": [
      'Dimapur',
      'Kiphire',
      'Kohima',
      'Longleng',
      'Mokokchung',
      'Mon',
      'Peren',
      'Phek',
      'Tuensang',
      'Wokha',
      'Zunheboto'
    ],
    "Odisha": [
      'Angul',
      'Balangir',
      'Balasore',
      'Bargarh',
      'Bhadrak',
      'Boudh',
      'Cuttack',
      'Deogarh',
      'Dhenkanal',
      'Gajapati',
      'Ganjam',
      'Jagatsinghapur',
      'Jajpur',
      'Jharsuguda',
      'Kalahandi',
      'Kandhamal',
      'Kendrapara',
      'Kendujhar (Keonjhar)',
      'Khordha',
      'Koraput',
      'Malkangiri',
      'Mayurbhanj',
      'Nabarangpur',
      'Nayagarh',
      'Nuapada',
      'Puri',
      'Rayagada',
      'Sambalpur',
      'Sonepur',
      'Sundargarh'
    ],
    "Puducherry (UT)": ['Karaikal', 'Mahe', 'Pondicherry', 'Yanam'],
    "Punjab": [
      'Amritsar',
      'Barnala',
      'Bathinda',
      'Faridkot',
      'Fatehgarh Sahib',
      'Fazilka',
      'Ferozepur',
      'Gurdaspur',
      'Hoshiarpur',
      'Jalandhar',
      'Kapurthala',
      'Ludhiana',
      'Mansa',
      'Moga',
      'Muktsar',
      'Nawanshahr (Shahid Bhagat Singh Nagar)',
      'Pathankot',
      'Patiala',
      'Rupnagar',
      'Sahibzada Ajit Singh Nagar (Mohali)',
      'Sangrur',
      'Tarn Taran'
    ],
    "Rajasthan": [
      'Ajmer',
      'Alwar',
      'Banswara',
      'Baran',
      'Barmer',
      'Bharatpur',
      'Bhilwara',
      'Bikaner',
      'Bundi',
      'Chittorgarh',
      'Churu',
      'Dausa',
      'Dholpur',
      'Dungarpur',
      'Hanumangarh',
      'Jaipur',
      'Jaisalmer',
      'Jalore',
      'Jhalawar',
      'Jhunjhunu',
      'Jodhpur',
      'Karauli',
      'Kota',
      'Nagaur',
      'Pali',
      'Pratapgarh',
      'Rajsamand',
      'Sawai Madhopur',
      'Sikar',
      'Sirohi',
      'Sri Ganganagar',
      'Tonk',
      'Udaipur'
    ],
    "Sikkim": ['East Sikkim', 'North Sikkim', 'South Sikkim', 'West Sikkim'],
    "Tamil Nadu": [
      'Ariyalur',
      'Chennai',
      'Coimbatore',
      'Cuddalore',
      'Dharmapuri',
      'Dindigul',
      'Erode',
      'Kanchipuram',
      'Kanyakumari',
      'Karur',
      'Krishnagiri',
      'Madurai',
      'Nagapattinam',
      'Namakkal',
      'Nilgiris',
      'Perambalur',
      'Pudukkottai',
      'Ramanathapuram',
      'Salem',
      'Sivaganga',
      'Thanjavur',
      'Theni',
      'Thoothukudi (Tuticorin)',
      'Tiruchirappalli',
      'Tirunelveli',
      'Tiruppur',
      'Tiruvallur',
      'Tiruvannamalai',
      'Tiruvarur',
      'Vellore',
      'Viluppuram',
      'Virudhunagar'
    ],
    "Telangana": [
      'Adilabad',
      'Bhadradri Kothagudem',
      'Hyderabad',
      'Jagtial',
      'Jangaon',
      'Jayashankar Bhoopalpally',
      'Jogulamba Gadwal',
      'Kamareddy',
      'Karimnagar',
      'Khammam',
      'Komaram Bheem Asifabad',
      'Mahabubabad',
      'Mahabubnagar',
      'Mancherial',
      'Medak',
      'Medchal',
      'Nagarkurnool',
      'Nalgonda',
      'Nirmal',
      'Nizamabad',
      'Peddapalli',
      'Rajanna Sircilla',
      'Rangareddy',
      'Sangareddy',
      'Siddipet',
      'Suryapet',
      'Vikarabad',
      'Wanaparthy',
      'Warangal (Rural)',
      'Warangal (Urban)',
      'Yadadri Bhuvanagiri'
    ],
    "Tripura": [
      'Dhalai',
      'Gomati',
      'Khowai',
      'North Tripura',
      'Sepahijala',
      'South Tripura',
      'Unakoti',
      'West Tripura'
    ],
    "Uttarakhand": [
      'Almora',
      'Bageshwar',
      'Chamoli',
      'Champawat',
      'Dehradun',
      'Haridwar',
      'Nainital',
      'Pauri Garhwal',
      'Pithoragarh',
      'Rudraprayag',
      'Tehri Garhwal',
      'Udham Singh Nagar',
      'Uttarkashi'
    ],
    "Uttar Pradesh": [
      'Agra',
      'Aligarh',
      'Allahabad',
      'Ambedkar Nagar',
      'Amethi (Chatrapati Sahuji Mahraj Nagar)',
      'Amroha (J.P. Nagar)',
      'Auraiya',
      'Azamgarh',
      'Baghpat',
      'Bahraich',
      'Ballia',
      'Balrampur',
      'Banda',
      'Barabanki',
      'Bareilly',
      'Basti',
      'Bhadohi',
      'Bijnor',
      'Budaun',
      'Bulandshahr',
      'Chandauli',
      'Chitrakoot',
      'Deoria',
      'Etah',
      'Etawah',
      'Faizabad',
      'Farrukhabad',
      'Fatehpur',
      'Firozabad',
      'Gautam Buddha Nagar',
      'Ghaziabad',
      'Ghazipur',
      'Gonda',
      'Gorakhpur',
      'Hamirpur',
      'Hapur (Panchsheel Nagar)',
      'Hardoi',
      'Hathras',
      'Jalaun',
      'Jaunpur',
      'Jhansi',
      'Kannauj',
      'Kanpur Dehat',
      'Kanpur Nagar',
      'Kanshiram Nagar (Kasganj)',
      'Kaushambi',
      'Kushinagar (Padrauna)',
      'Lakhimpur - Kheri',
      'Lalitpur',
      'Lucknow',
      'Maharajganj',
      'Mahoba',
      'Mainpuri',
      'Mathura',
      'Mau',
      'Meerut',
      'Mirzapur',
      'Moradabad',
      'Muzaffarnagar',
      'Pilibhit',
      'Pratapgarh',
      'RaeBareli',
      'Rampur',
      'Saharanpur',
      'Sambhal (Bhim Nagar)',
      'Sant Kabir Nagar',
      'Shahjahanpur',
      'Shamali (Prabuddh Nagar)',
      'Shravasti',
      'Siddharth Nagar',
      'Sitapur',
      'Sonbhadra',
      'Sultanpur',
      'Unnao',
      'Varanasi'
    ],
    "West Bengal": [
      'Alipurduar',
      'Bankura',
      'Birbhum',
      'Burdwan (Bardhaman)',
      'Cooch Behar',
      'Dakshin Dinajpur (South Dinajpur)',
      'Darjeeling',
      'Hooghly',
      'Howrah',
      'Jalpaiguri',
      'Kalimpong',
      'Kolkata',
      'Malda',
      'Murshidabad',
      'Nadia',
      'North 24 Parganas',
      'Paschim Medinipur (West Medinipur)',
      'Purba Medinipur (East Medinipur)',
      'Purulia',
      'South 24 Parganas',
      'Uttar Dinajpur (North Dinajpur)'
    ]
  };

  var selState, selDist;

  List<DropdownMenuItem<String>> fillStates() {
    List<DropdownMenuItem<String>> aa = List<DropdownMenuItem<String>>();

    states.forEach(
      (element) {
        aa.add(
          DropdownMenuItem<String>(
            child: Text(element),
            value: element,
          ),
        );
      },
    );
    return aa;
  }

  printL() {
    v['$selState'].forEach((element) => print(element));
  }

  List<DropdownMenuItem<String>> fillDists() {
    List<DropdownMenuItem<String>> aa = List<DropdownMenuItem<String>>();
    if (selState != null) {
      v['$selState'].forEach((element) {
        aa.add(
          DropdownMenuItem<String>(
            child: Text(element),
            value: element,
          ),
        );
      });
    }

    return aa;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                      'Would you like to discard this issue?(Your Data will be held CONFIDENTIAL)'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text('No')),
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context, true);

                          print(al);
                        },
                        child: Text('Yes')),
                  ],
                ));
      },
      child: Scaffold(
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
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: AppBar().preferredSize.height),
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
                              print(al);
                              print("Popping from ST page");
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: OrPop(
                        popcolor: Colors.white,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Wrap(
                              children: [
                                Text(
                                  'Incident Location Details'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 58.0, left: 28, right: 28),
                      child: OrPop(
                        popcolor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 10, left: 50, right: 50),
                          child: DropdownButton(
                            underline: Text(''),
                            dropdownColor: Colors.white,
                            items: fillStates(),
                            hint: Text(
                              'Select A State',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            value: selState,
                            onChanged: (newValue) {
                              setState(() {
                                selState = newValue;
                                selDist = null;
                              });
                              ddl = fillDists();
                              print(selState);
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 28.0, right: 28, left: 28),
                      child: OrPop(
                        popcolor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 10, left: 50, right: 50),
                          child: DropdownButton(
                            underline: Text(''),
                            dropdownColor: Colors.white,
                            items: ddl,
                            hint: Text(
                              'Select District*',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            value: selDist,
                            onChanged: (newValue) {
                              setState(() {
                                selDist = newValue;
                              });
                              print(selDist);
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 28.0, right: 28, top: 8, bottom: 28),
                      child: OrPop(
                        popcolor: Colors.white,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(),
                          child: TextFormField(
                            // controller: _confirmPasswordController,
                            decoration: InputDecoration(
                                hintText: "Police Station Region",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          if (selDist == null || selState == null) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'please select both state and district')));
                          } else {
                            al.add(selState + "/" + selDist);
                            print(al);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return DTPK(
                                al: al,
                              );
                            }));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('Next',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              Icon(
                                Icons.keyboard_arrow_right,
                                size: 30,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
