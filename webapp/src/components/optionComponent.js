import React, { Component } from "react";
import Upload from "./imageComponent";
import Popmain from "./popmain";
import Sdrop from "./searchdrop";
import Datepic from "./Datepic";
import PhoneVerify from "./phoneverify";
import { firebase } from "./firebase";
import { CopyToClipboard } from "react-copy-to-clipboard";
import TrackComp from "./searchStatus";
import AddressInput from "./inputAddressComponent";
import Cards from "./cardComponent";
import Example from "./platformComponent";
import AIChat from "./AIChat";
import Safe from "../SafetyComponents/safeComponent";
const axios = require('axios')

class Review extends Component {
  constructor(props) {
    super(props);
    this.state = {
      status: "",
      docId: this.props.steps.lang.value === ""?"Loading please wait ...":"लोड हो रहा है कृपया प्रतीक्षा करें",
      cl: [],
      attachments: [],
      location: [],
      doneBy: [],
      stateDist: []
    };
  }

  componentWillMount() {
    const { steps } = this.props;
    console.log(steps);
    if (steps[this.props.steps.lang.value+"Service"].value !== this.props.steps.lang.value+"ChatAI") {
      if ("") console.log("Yes it is present");
      this.state.cl.push("" + steps[this.props.steps.lang.value+"Select_date.value"] + "");
      this.state.cl.push(steps[this.props.steps.lang.value+"desc"].value);
      var i;
      for (i = 0; i < steps[this.props.steps.lang.value+"ch_plat"].value.platform.length; i++) {
        this.state.cl.push(steps[this.props.steps.lang.value+"ch_plat"].value.platform[i].value);
      }
      this.state.stateDist.push(steps[this.props.steps.lang.value+"incident_menu"].value.state);
      this.state.stateDist.push(steps[this.props.steps.lang.value+"incident_menu"].value.district);
      this.state.stateDist.push(steps[this.props.steps.lang.value+"incident_menu"].value.psregion);
      try {
        for (i = 0; i < steps[this.props.steps.lang.value+"Upload"].value.length; i++)
          this.state.attachments.push(steps[this.props.steps.lang.value+"Upload"].value[i]);
      } catch (error) {}
      try {
        for (i = 0; i < steps[this.props.steps.lang.value+"Loc_Details"].value.length; i++)
          this.state.location.push(
            steps[this.props.steps.lang.value+"Loc_Details"].value[i].lat +
              "/" +
              steps[this.props.steps.lang.value+"Loc_Details"].value[i].lng
          );
      } catch {}
      try {
        this.state.location.push(steps[this.props.steps.lang.value+"Loc_Input"].value);
      } catch {}
      try {
        this.state.doneBy.push(steps[this.props.steps.lang.value+"Complaint_type"].value);
      } catch (error) {
        this.state.doneBy.push(this.props.steps.lang.value+"Personal");
      }
      if (this.state.doneBy[0] === this.props.steps.lang.value+"Personal") {
        this.state.doneBy.push(steps[this.props.steps.lang.value+"otp"].value.phonenumber);
        this.state.doneBy.push(steps[this.props.steps.lang.value+"otp"].value.uid);
        this.state.doneBy.push(steps[this.props.steps.lang.value+"name"].value);
        this.state.doneBy.push(steps[this.props.steps.lang.value+"email"].value);
        this.state.doneBy.push(steps[this.props.steps.lang.value+"POF"].value);
        this.state.doneBy.push(steps[this.props.steps.lang.value+"number_pof"].value);
      }
      this.state.cl.push(steps[this.props.steps.lang.value+"Category"].value);
      if (
        this.state.cl[this.state.cl.length - 1] ===
        this.props.steps.lang.value+"Child Sex Abuse/Rape/Obstacenity"
      )
        this.state.cl.push(steps[this.props.steps.lang.value+"Category_1"].value);
      else if (this.state.cl[this.state.cl.length - 1] === "Cyber Crime") {
        this.state.cl.push(steps[this.props.steps.lang.value+"Category_2"].value);
        if (steps[this.props.steps.lang.value+"Category_2"].value === "Loss of Money") {
          if (this.props.steps.lang.value+"Banking" in steps) {
            this.state.cl.push("Banking/E-Wallet/Demat");
            this.state.cl.push(steps[this.props.steps.lang.value+"Banking"].value);
          } else if (this.props.steps.lang.value+"Online" in steps) {
            this.state.cl.push(
              this.props.steps.lang.value+"Job/Matrimonial,E-commerce,Fradulent SMS/Media Content/call"
            );
            this.state.cl.push(steps[this.props.steps.lang.value+"Online"].value);
          } else if (this.props.steps.lang.value+"Email_Fraud" in steps) {
            this.state.cl.push(this.props.steps.lang.value+"Email Fraud");
            this.state.cl.push(steps[this.props.steps.lang.value+"Email_Fraud"].value);
          }
        } else if (steps[this.props.steps.lang.value+"Category_2"].value === this.props.steps.lang.value+"Online Harassment") {
          this.state.cl.push(steps[this.props.steps.lang.value+"Online_Harassment"].value);
        } else if (steps[this.props.steps.lang.value+"Category_2"].value === this.props.steps.lang.value+"Hacking") {
          if (this.props.steps.lang.value+"Profile_Hacking" in steps) {
            this.state.cl.push(this.props.steps.lang.value+"Profile Hacking");
            this.state.cl.push(steps[this.props.steps.lang.value+"Profile_Hacking"].value);
          } else if (this.props.steps.lang.value+"Computer" in steps) {
            this.state.cl.push(this.props.steps.lang.value+"Computer Hacking");
            this.state.cl.push(steps[this.props.steps.lang.value+"Computer"].value);
          }
        } else {
          this.state.cl.push(steps[this.props.steps.lang.value+"Other"].value);
        }
      }
    } else {
      this.state.cl.push("" + steps[this.props.steps.lang.value+"Select_date"].value + "");
      this.state.cl.push(steps[this.props.steps.lang.value+"desc"].value);
      this.state.stateDist.push(steps[this.props.steps.lang.value+"incident_menu"].value.state);
      this.state.stateDist.push(steps[this.props.steps.lang.value+"incident_menu"].value.district);
      this.state.stateDist.push(steps[this.props.steps.lang.value+"incident_menu"].value.psregion);
      try {
        for (i = 0; i < steps[this.props.steps.lang.value+"Upload"].value.length; i++)
          this.state.attachments.push(steps[this.props.steps.lang.value+"Upload"].value[i]);
      } catch (error) {}
      try {
        for (i = 0; i < steps[this.props.steps.lang.value+"Loc_Details"].value.length; i++)
          this.state.location.push(
            steps[this.props.steps.lang.value+"Loc_Details"].value[i].lat +
              "/" +
              steps[this.props.steps.lang.value+"Loc_Details"].value[i].lng
          );
      } catch {}
      try {
        this.state.location.push(steps[this.props.steps.lang.value+"Loc_Input"].value);
      } catch {}
      try {
        this.state.doneBy.push(steps[this.props.steps.lang.value+"Complaint_type"].value);
      } catch (error) {
        this.state.doneBy.push(this.props.steps.lang.value+"Personal");
      }
      if (this.state.doneBy[0] === this.props.steps.lang.value+"Personal") {
        this.state.doneBy.push(steps[this.props.steps.lang.value+"otp"].value.phonenumber);
        this.state.doneBy.push(steps[this.props.steps.lang.value+"otp"].value.uid);
        this.state.doneBy.push(steps[this.props.steps.lang.value+"name"].value);
        this.state.doneBy.push(steps[this.props.steps.lang.value+"email"].value);
        this.state.doneBy.push(steps[this.props.steps.lang.value+"POF"].value);
        this.state.doneBy.push(steps[this.props.steps.lang.value+"number_pof"].value);
      }
      for (i = 0; i < steps[this.props.steps.lang.value+"zero1"].value.length; i++)
          this.state.cl.push(steps[this.props.steps.lang.value+"zero1"].value[i]);
    }

    axios.get('https://api.ipify.org/?format=json').then((res)=>{
      console.log(res.data.ip);
      console.log({
        Attachments: this.state.attachments,
        created: "" + Date().toString() + "",
        Description: this.state.cl,
        DoneBy: this.state.doneBy,
        Location: this.state.location,
        Place: this.state.stateDist,
        Status: "Pending",
        Remarks: "None",
        deviceDetails: [res.data.ip]
      });
      const db = firebase.firestore();
      db.collection("Issues")
        .add({
          Attachments: this.state.attachments,
          created: "" + Date().toString() + "",
          Description: this.state.cl,
          DoneBy: this.state.doneBy,
          Location: this.state.location,
          Place: this.state.stateDist,
          Status: "Pending",
          Remarks: "None",
          deviceDetails: [res.data.ip]
        })
        .then((data) => {
          console.log(data.id);
          this.setState({
            docId: data.id,
          });
        })
        .catch((err) => console.log(err));
    }).catch((err)=>{
      console.log(err)
      console.log({
        Attachments: this.state.attachments,
        created: "" + Date().toString() + "",
        Description: this.state.cl,
        DoneBy: this.state.doneBy,
        Location: this.state.location,
        Place: this.state.stateDist,
        Status: "Pending",
        Remarks: "None",
        deviceDetails: "Cannot read Ip address"
      });
      const db = firebase.firestore();
      db.collection("Issues")
        .add({
          Attachments: this.state.attachments,
          created: "" + Date().toString() + "",
          Description: this.state.cl,
          DoneBy: this.state.doneBy,
          Location: this.state.location,
          Place: this.state.stateDist,
          Status: "Pending",
          Remarks: "None",
          deviceDetails: ["Blocked by browser"]
        })
        .then((data) => {
          console.log(data.id);
          this.setState({
            docId: data.id,
          });
        })
        .catch((err) => console.log(err));
    })
    
  }
  render() {
    return (
      <div>
        <div
          style={{ width: "100%", display: "flex", justifyContent: "center" }}
        >
          <div>
            <p>{this.props.steps.lang.value === ""?"Your Data is Saved Successfully":"आपका डेटा सफलतापूर्वक सहेजा गया है"}</p>
            <p>{this.props.steps.lang.value === ""?"Your Document id is: ":"आपका दस्तावेज़ आईडी आईडी"}</p>
            <strong
              style={{
                margin: "5px",
                color: "green",
                border: "1px dashed black",
                padding: "5px",
                borderRadius: "5px",
              }}
            >
              {this.state.docId}
            </strong>
          </div>
        </div>
        <div style={{ height: "10px" }} />
        <div
          style={{ display: "flex", width: "100%", justifyContent: "center" }}
        >
          {this.state.docId !== "Loading please wait ..."|| this.state.docId !== "लोड हो रहा है कृपया प्रतीक्षा करें"? (
            <CopyToClipboard
              text={this.state.docId}
              onCopy={() => this.setState({ status: this.props.steps.lang.value === ""?"Copied!":"की नकल की" })}
            >
              <button
                className="button1"
                onClick={() => {
                  this.props.triggerNextStep({ trigger: this.props.steps.lang.value+"end_greet" });
                }}
              >
                {this.props.steps.lang.value === ""?"Copy id to clipboard":"क्लिपबोर्ड पर कॉपी करें"}
              </button>
            </CopyToClipboard>
          ) : null}
        </div>
        <div
          style={{
            display: "flex",
            width: "100%",
            justifyContent: "center",
            margin: "10px",
          }}
        >
          {this.state.status !== "" ? (
            <span style={{ color: "green", fontWeight: "bold" }}>
              {this.state.status}
            </span>
          ) : null}
        </div>
      </div>
    );
  }
}

const STEPS = [
  {
    id: "language",
    message: "Please select a Language/ कृपया भाषा चुनें",
    trigger: "lang"
  },
  {
    id:"lang",
    options: [
      {
        value:"",
        label: "English",
        trigger:"Greetings"
      },
      {
        value:"hin-",
        label:"हिन्दी",
        trigger:"hin-Greetings"
      }
    ]
  },

  //F:hindi

  {
    id: "hin-Greetings",
    message: "हैलो, मैं त्रिकोणीय-नेथ्रा - साइबरबॉट हूं।",
    //component: <PopPdf/>,
    trigger: "hin-2",
  },
  {
    id: "hin-2",
    message: "मेरा काम आपके साइबर अनुभव को सुरक्षित और सुरक्षित बनाना है।",
    trigger: "hin-3",
  },
  {
    id: "hin-3",
    message: "मैं आपके लिए ये कर सकता हूं:",
    trigger: "hin-3.1",
  },
  {
    id: "hin-3.1",
    message:" 1 है। अपनी मर्जी से शिकायत दर्ज करें या अपनी इच्छानुसार आधिकारिक पोर्टल पर भेजें। ",
    trigger: "hin-3.2",
  },
  {
    id: "hin-3.2",
    message:
      " २। हमारे डेटाबेस से अपनी शिकायत की वर्तमान स्थिति प्राप्त करें",
    trigger: "hin-3.3",
  },
  {
    id: "hin-3.3",
    message:
      "३। आपको कई अपराध जागरूकता युक्तियों के बारे में बताएं, जिनका आप अनुसरण करना चाहते हैं ताकि आप भविष्य में मेरा कम उपयोग करें",
    trigger: "hin-serv",
  },
  {
    id: "hin-serv",
    message: "सेवा का प्रकार चुनें:",
    trigger: "hin-Service",
  },
  {
    id: "hin-Service",
    options: [
      // {
      //   value: "hin-Report",
      //   label: "एक शिकायत की रिपोर्ट करें",
      //   trigger: "hin-Report",
      // },
      {
        value: "hin-Safety",
        label: "अपराध जागरूकता",
        trigger: "hin-Safe",
      },
      {
        value: "hin-Track",
        label: "एक शिकायत को ट्रैक करें",
        trigger: "hin-TrackComplaint",
      },
      {
        value: "hin-ChatAI",
        label: "एक शिकायत की रिपोर्ट करें",
        trigger: "hin-AIChat",
      },
    ],
  },
  {
    id: "hin-TrackComplaint",
    component: <TrackComp />,
    end: true,
  },
  {
    id: "hin-Report",
    message: "नीचे सूची से श्रेणी का चयन करें:",
    trigger: "hin-Category",
  },
  /* 
  {
    id: "hin-On-Chat",
    message: "अपराध का प्रकार चुनें:"
    trigger: "hin-Category",
  }, */
  {
    id: "hin-Category",
    options: [
      {
        value: "hin-Child Sex Abuse/Rape/Obstacenity",
        label: "बाल यौन शोषण / बलात्कार / बाधा",
        trigger: "hin-Categoty_CRSO",
      },
      {
        value: "hin-Cyber Crime",
        label: "साइबर अपराध",
        trigger: "hin-Cyber_type",
      },
    ],
  },
  {
    id: "hin-Categoty_CRSO",
    message: "Non_cyber में अपराध का प्रकार चुनें:",
    trigger: "hin-Category_1",
  },
  {
    id: "hin-Category_1",
    options: [
      {
        value: "hin-Child Pornography",
        label: "बाल पोर्नोग्राफी",
        trigger: "hin-Register-Types",
      },
      {
        value: "hin-Rape/Gang Rape",
        label: "बलात्कार / गैंग रेप",
        trigger: "hin-Register-Types",
      },
      {
        value: "hin-Sexual Obscenity",
        label: "यौन अश्लीलता",
        trigger: "hin-Register-Types",
      },
      {
        value: "hin-Sexually Explicit",
        label: "यौन रूप से स्पष्ट",
        trigger: "hin-Register-Types",
      },
    ],
  },
  {
    id: "hin-Register-Types",
    message: "आप चाहते हैं कि सेवाओं का चयन करें:",
    trigger: "hin-reg_op",
  },
  {
    id: "hin-reg_op",
    options: [
      {
        value: "hin-Here",
        label: "ऑन-चैट रजिस्टर शिकायत",
        trigger: "hin-comp",
      },
      {
        value: "hin-Information",
        label: "जानकारी",
        trigger: "hin-Modal_1",
      },
    ],
  },
  {
    id: "hin-comp",
    message: "कैसे पंजीकरण करना चाहते हैं का चयन करें:",
    trigger: "hin-Complaint_type",
  },
  {
    id: "hin-Complaint_type",
    options: [
      {
        value: "hin-Anonymous",
        label: "गुमनाम",
        trigger: "hin-Date_module",
      },
      {
        value: "hin-Personal",
        label: "निजी",
        trigger: "hin-Authentication",
      },
    ],
  },
  {
    id: "hin-Cyber_type",
    message: "साइबर अपराध के प्रकार का चयन करें:",
    trigger: "hin-Category_2",
  },
  {
    id: "hin-Category_2",
    options: [
      {
        value: "hin-Loss of Money",
        label: "पैसे का नुकसान",
        trigger: "hin-Cat-21",
      },
      {
        value: "hin-Online Harassment",
        label: "ऑनलाइन उत्पीड़न",
        trigger: "hin-Cat-22",
      },
      {
        value: "hin-Hacking",
        label: "हैकिंग",
        trigger: "hin-Cat-23",
      },
      {
        value: "hin-Other online Crime",
        label: "अन्य ऑनलाइन अपराध",
        trigger: "hin-Cat-24",
      },
    ],
  },
  {
    id: "hin-Cat-21",
    message: "पैसे के नुकसान में श्रेणी का चयन करें",
    trigger: "hin-Loss_money",
  },
  {
    id: "hin-Loss_money",
    options: [
      {
        value: "hin-Banking/E-Wallet/Demat",
        label: "बैंकिंग / ई बटुआ / डीमैट",
        trigger: "hin-Cat-210",
      },
      {
        value: "hin-Job/Matrimonial,E-commerce,Fradulent SMS/Media Content/call",
        label: "जॉब / मैट्रिमोनियल, ई-कॉमर्स, फ्राडुलेंट एसएमएस / मीडिया कंटेंट / कॉल",
        trigger: "hin-Cat-211",
      },
      {
        value: "hin-Email Fraud",
        label: "ईमेल धोखाधड़ी",
        trigger: "hin-Cat-212",
      },
    ],
  },
  {
    id: "hin-Cat-210",
    message: "बैंकिंग में खोए पैसे का चयन करें:",
    trigger: "hin-Banking",
  },
  {
    id: "hin-Banking",
    options: [
      {
        value: "hin-Misuse of Credit/Debit Card/ATM Fraud",
        label: "क्रेडिट / डेबिट कार्ड / एटीएम धोखाधड़ी का दुरुपयोग",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-Unauthorized Access Through Internet Banking",
        label: "इंटरनेट बैंकिंग के माध्यम से अनधिकृत पहुँच",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-Cryptocurrency/Bitcoin",
        label: "Cryptocurrency/Bitcoin",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-E-Wallet Fraud,Demat/Mutual Fund",
        label: "ई-वॉलेट फ्रॉड, डीमैट / म्यूचुअल फंड",
        trigger: "hin-reg_type",
      },
    ],
  },
  {
    id: "hin-Cat-211",
    message: "ऑनलाइन में खोए पैसे का चयन करें:",
    trigger: "hin-Online",
  },
  {
    id: "hin-Online",
    options: [
      {
        value: "hin-online Job Fraud",
        label: "ऑनलाइन नौकरी धोखाधड़ी",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-Online Matrimonial Fraud",
        label: "ऑनलाइन वैवाहिक धोखाधड़ी",
        trigger: "hin-reg_type",
      },
    ],
  },
  {
    id: "hin-Cat-212",
    message: "ईमेल फ्रॉड में खोए पैसे का चयन करें",
    trigger: "hin-Email_Fraud",
  },
  {
    id: "hin-Email_Fraud",
    options: [
      {
        value: "hin-Spoof Email",
        label: "स्पूफ ईमेल",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-Business Email",
        label: "बिजनेस ईमेल",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-Compromise",
        label: "समझौता",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-Email Hacking",
        label: "ईमेल हैकिंग",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-Threatening Email",
        label: "धमकी देने वाला ईमेल",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-Phishing Email",
        label: "फिशिंग ईमेल",
        trigger: "hin-reg_type",
      },
    ],
  },
  {
    id: "hin-Cat-22",
    message: "ऑनलाइन उत्पीड़न में चयन प्रकार:",
    trigger: "hin-Online_Harassment",
  },
  {
    id: "hin-Online_Harassment",
    options: [
      {
        value: "hin-Receving Offensive Messages",
        label: "आक्रामक संदेश प्राप्त करना",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-Online Bulying/Stalking",
        label: "ऑनलाइन बोरिंग / स्टैकिंग ",
        trigger: "hin-reg_type",
      },
    ],
  },
  {
    id: "hin-Cat-23",
    message: "हैकिंग के प्रकार का चयन करें:",
    trigger: "hin-Hacking",
  },
  {
    id: "hin-Hacking",
    options: [
      {
        value: "hin-Profile Hacking",
        label: "प्रोफ़ाइल हैकिंग",
        trigger: "hin-Cat-230",
      },
      {
        value: "hin-Computer Hacking",
        label: "कंप्यूटर हैकिंग",
        trigger: "hin-Cat-231",
      },
    ],
  },
  {
    id: "hin-Cat-230",
    message: "प्रोफाइल में हैकिंग के प्रकार का चयन करें:",
    trigger: "hin-Profile_Hacking",
  },
  {
    id: "hin-Profile_Hacking",
    options: [
      {
        value: "hin-Identity Theft",
        label: "चोरी की पहचान",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-Fake Profile",
        label: "नकली प्रोफ़ाइल",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-Cheating by Impersonation",
        label: "प्रतिरूपण द्वारा धोखा",
        trigger: "hin-reg_type",
      },
    ],
  },
  {
    id: "hin-Cat-231",
    message: "कंप्यूटर में हैकिंग के प्रकार का चयन करें",
    trigger: "hin-Computer",
  },
  {
    id: "hin-Computer",
    options: [
      {
        value: "hin-Damage to computer",
        label: "कंप्यूटर को नुकसान",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-Data Breach",
        label: "डेटा भंग",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-Altered Computer program",
        label: "परिवर्तित कंप्यूटर प्रोग्राम",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-ransomware",
        label: "रैंसमवेयर",
        trigger: "hin-reg_type",
      },
    ],
  },
  {
    id: "hin-Cat-24",
    message: "अन्य ऑनलाइन अपराध चुनें:",
    trigger: "hin-Other",
  },
  {
    id: "hin-Other",
    options: [
      {
        value: "hin-Online Anti National/Communal Hatred/Terror Activity",
        label: "ऑनलाइन एंटी नेशनल / सांप्रदायिक घृणा / आतंक गतिविधि",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-online prostitution/Human Trafficking",
        label: "ऑनलाइन वेश्यावृत्ति / मानव तस्करी",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-online Gambling",
        label: "ऑनलाइन जुआ",
        trigger: "hin-reg_type",
      },
      {
        value: "hin-other",
        label: "अन्य",
        trigger: "hin-reg_type",
      },
    ],
  },
  {
    id: "hin-reg_type",
    message: "इच्छित सेवा का चयन करें:",
    trigger: "hin-process",
  },
  {
    id: "hin-process",
    options: [
      {
        label: "ऑन-चैट रजिस्टर शिकायत",
        value: "hin-oc",
        trigger: "hin-comp",
      },
      {
        label: "जानकारी",
        value: "hin-in",
        trigger: "hin-Modal_1",
      },
    ],
  },

  /* Authentication Module */

  {
    id: "hin-Authentication",
    message: "अपना मोबाइल नंबर दर्ज करें?",
    trigger: "hin-otp",
  },
  {
    id: "hin-otp",
    component: <PhoneVerify />,
    waitAction: true,
  },

  {
    id: "hin-Name",
    message: "तुम्हारा नाम क्या हे?",
    trigger: "hin-name",
  },
  {
    id: "hin-name",
    user: true,
    trigger: "hin-email-id",
  },
  {
    id: "hin-email-id",
    message: "ईमेल दर्ज करें:",
    trigger: "hin-email",
  },
  {
    id: "hin-email",
    user: true,
    trigger: "hin-Official_doc",
  },
  {
    id: "hin-Official_doc",
    message: "पहचान के प्रमाण का चयन करें",
    trigger: "hin-POF",
  },
  {
    id: "hin-POF",
    options: [
      {
        value: "hin-Aadhar",
        label: "आधार संख्या",
        trigger: "hin-pof_input",
      },
      {
        value: "hin-PAN Card",
        label: "पैन कार्ड",
        trigger: "hin-pof_input",
      },
      {
        value: "hin-Voter",
        label: "वोटर आईडी",
        trigger: "hin-pof_input",
      },
    ],
  },
  {
    id: "hin-pof_input",
    message: "{LastValue} नंबर दर्ज करें!",
    trigger: "hin-number_pof",
  },
  {
    id: "hin-number_pof",
    user: true,
    trigger: "hin-Date_module",
  },

  /* Authentication Module Ends */

  /* Date Module Begins  */
  {
    id: "hin-Date_module",
    message:"हुई तिथि का चयन करें?",
    trigger: "hin-Select_date",
  },
  {
    id: "hin-Select_date",
    component: <Datepic />,
    waitAction: true,
  },
  {
    id: "hin-incident_area",
    message: "राज्य और जिले का चयन करें:",
    trigger: "hin-incident_menu",
  },
  {
    id: "hin-incident_menu",
    component: <Sdrop />,
    waitAction: true,
  },
  {
    id: "hin-explanation",
    message: "अपने शब्दों में घटना की व्याख्या करें",
    trigger: "hin-desc",
  },
  {
    id: "hin-desc",
    user: true,
    trigger: "hin-Location",
  },
  {
    id: "hin-plat",
    message: "ऑनलाइन में यू कहें तो प्लेटफॉर्म चुनें:",
    trigger: "hin-ch_plat",
  },
  {
    id: "hin-ch_plat",
    component: <Example />,
    waitAction: true,
  },
  {
    id: "hin-Location",
    message: "क्या आप स्थान विवरण देना चाहते हैं:",
    trigger: "hin-Loc",
  },
  {
    id: "hin-Loc",
    options: [
      {
        value: "hin-Yes",
        label: "हाँ",
        trigger: "hin-mapOrCustom",
      },
      {
        value: "hin-No",
        label: "नहीं",
        trigger: "hin-update",
      },
    ],
  },
  {
    id: "hin-mapOrCustom",
    message: "एक विधि का चयन करें",
    trigger: "hin-mapOrCustomOptions",
  },
  {
    id: "hin-mapOrCustomOptions",
    options: [
      {
        value: "hin-Select location on map",
        label: "मानचित्र पर स्थान चुनें",
        trigger: "hin-Loc_Details",
      },
      {
        value: "hin-Enter address manually",
        label: "पता मैन्युअल रूप से दर्ज करें",
        trigger: "hin-Loc_Input",
      },
    ],
  },
  {
    id: "hin-Loc_Details",
    component: <Popmain />,
    waitAction: true,
  },
  {
    id: "hin-Loc_Input",
    component: <AddressInput />,
    waitAction: true,
  },
  {
    id: "hin-update",
    message: "क्या आप कोई अनुलग्नक जोड़ना चाहते हैं",
    trigger: "hin-Attachments",
  },
  {
    id: "hin-Attachments",
    options: [
      {
        value: "hin-Yes",
        label: "हाँ",
        trigger: "hin-Upload",
      },
      {
        value: "hin-No",
        label: "नहीं",
        trigger: "hin-Reference",
      },
    ],
  },
  {
    id: "hin-Upload",
    component: <Upload />,
    waitAction: true,
  },
  {
    id: "hin-Reference",
    component: <Review />,
    waitAction: true,
  },
  {
    id: "hin-end_greet",
    message:
      "चिंता न करें और हमारे कानून प्रवर्तन प्रणाली में विश्वास रखें। आप कभी भी न्याय से वंचित नहीं रहेंगे। क्या आप चाहते हैं कि मैं किसी अन्य कार्यक्षमता को आगे बढ़ाऊं?",
    trigger: "hin-loop",
  },
  {
    id: "hin-loop",
    options: [
      {
        value: "hin-y",
        label: "हाँ",
        trigger: "hin-Greetings",
      },
      {
        value: "hin-n",
        label: "नहीं",
        trigger: "hin-final_end",
      },
    ],
  },
  {
    id: "hin-final_end",
    message:
      "मुझे इस्तेमाल करने के लिए धन्यवाद। मैं हमेशा आपकी सेवा के लिए बस एक क्लिक दूर उपलब्ध हूं। अलविदा",
    end: true,
  },
  /* Card Component */
  {
    id: "hin-Modal_1",
    component: <Cards />,
    waitAction: true,
  },

  /* Modal */
  {
    id: "hin-Safe",
    component: <Safe />,
    waitAction: true,
  },
  {
    id: "hin-AIChat",
    message: "कुछ शब्दों में अपनी स्थिति का वर्णन करें",
    trigger: "hin-zero",
  },
  {
    id: "hin-zero",
    user: true,
    trigger: "hin-zero1",
  },
  {
    id: "hin-zero1",
    component: <AIChat />,
    asMessage: true,
    waitAction: true,
  },
  {
    id: "hin-shaw",
    message: "क्या आप इस पर शिकायत दर्ज करना चाहते हैं?",
    trigger: "hin-shaw_options",
  },
  {
    id: "hin-shaw_options",
    options: [
      {
        label: "हाँ",
        value: "hin-Yes",
        trigger: "hin-comp",
      },
      {
        label: "चैट जारी रखें",
        value: "hin-continue with chat",
        trigger: "hin-shaw1",
      },
    ],
  },
  {
    id: "hin-shaw1",
    message: "हम अपनी चैट जारी रख सकते हैं",
    trigger: "hin-zero",
  },
  {
    id:"hin-errZero",
    message:"कृपया 2-3 पंक्तियों में समान जानकारी प्रदान करें(आप बाद में पूरा विवरण बाद में जोड़ सकते हैं)",
    trigger:"hin-zero"
  },


  //f:english

  {
    id: "Greetings",
    message: "Hello there , I am Tri-Nethra - The CyberBot.",
    //component: <PopPdf/>,
    trigger: "2",
  },
  {
    id: "2",
    message: "My job is to make your cyber experience safe and secure.",
    trigger: "3",
  },
  {
    id: "3",
    message: " I can do these for you :",
    trigger: "3.1",
  },
  {
    id: "3.1",
    message:
      " 1 . Register a complaint by myself or redirect to the official portal as you wish. ",
    trigger: "3.2",
  },
  {
    id: "3.2",
    message:
      " 2 . Fetch you the current status of your complaint from our database",
    trigger: "3.3",
  },
  {
    id: "3.3",
    message:
      " 3 . Enlighten you with several crime awareness tips that you might want to follow so that you would use me less in future :)",
    trigger: "serv",
  },
  {
    id: "serv",
    message: "Select the Type of Service:",
    trigger: "Service",
  },
  {
    id: "Service",
    options: [
      // {
      //   value: "Report",
      //   label: "Report a Complaint",
      //   trigger: "Report",
      // },
      {
        value: "Safety",
        label: "Crime Awareness",
        trigger: "Safe",
      },
      {
        value: "Track",
        label: "Track a Complaint",
        trigger: "TrackComplaint",
      },
      {
        value: "ChatAI",
        label: "Report a Complaint",
        trigger: "AIChat",
      },
    ],
  },
  {
    id: "TrackComplaint",
    component: <TrackComp />,
    end: true,
  },
  {
    id: "Report",
    message: "Select the Type Of Category from the Below List: ",
    trigger: "Category",
  },
  /* 
  {
    id: "On-Chat",
    message: "Select Type of Crime:",
    trigger: "Category",
  }, */
  {
    id: "Category",
    options: [
      {
        value: "Child Sex Abuse/Rape/Obstacenity",
        label: "Child Sex Abuse/Rape/Obstacenity",
        trigger: "Categoty_CRSO",
      },
      {
        value: "Cyber Crime",
        label: "Cyber Crime",
        trigger: "Cyber_type",
      },
    ],
  },
  {
    id: "Categoty_CRSO",
    message: "Select type of Crime in Non_cyber: ",
    trigger: "Category_1",
  },
  {
    id: "Category_1",
    options: [
      {
        value: "Child Pornography",
        label: "Child Pornography",
        trigger: "Register-Types",
      },
      {
        value: "Rape/Gang Rape",
        label: "Rape/Gang Rape",
        trigger: "Register-Types",
      },
      {
        value: "Sexual Obscenity",
        label: "Sexual Obscenity",
        trigger: "Register-Types",
      },
      {
        value: "Sexually Explicit",
        label: "Sexually Explicit",
        trigger: "Register-Types",
      },
    ],
  },
  {
    id: "Register-Types",
    message: "Select the Services u want: ",
    trigger: "reg_op",
  },
  {
    id: "reg_op",
    options: [
      {
        value: "Here",
        label: "On-Chat Register Complaint",
        trigger: "comp",
      },
      {
        value: "Information",
        label: "Information",
        trigger: "Modal_1",
      },
    ],
  },
  {
    id: "comp",
    message: "Select How u want to Register:",
    trigger: "Complaint_type",
  },
  {
    id: "Complaint_type",
    options: [
      {
        value: "Anonymous",
        label: "Anonymous",
        trigger: "Date_module",
      },
      {
        value: "Personal",
        label: "Personal",
        trigger: "Authentication",
      },
    ],
  },
  {
    id: "Cyber_type",
    message: "Select the type of Cyber Crime:",
    trigger: "Category_2",
  },
  {
    id: "Category_2",
    options: [
      {
        value: "Loss of Money",
        label: "Loss of Money",
        trigger: "Cat-21",
      },
      {
        value: "Online Harassment",
        label: "Online Harassment",
        trigger: "Cat-22",
      },
      {
        value: "Hacking",
        label: "Hacking",
        trigger: "Cat-23",
      },
      {
        value: "Other online Crime",
        label: "Other online Crime",
        trigger: "Cat-24",
      },
    ],
  },
  {
    id: "Cat-21",
    message: "Select Category in Loss of Money",
    trigger: "Loss_money",
  },
  {
    id: "Loss_money",
    options: [
      {
        value: "Banking/E-Wallet/Demat",
        label: "Banking/E-Wallet/Demat",
        trigger: "Cat-210",
      },
      {
        value: "Job/Matrimonial,E-commerce,Fradulent SMS/Media Content/call",
        label: "Job/Matrimonial,E-commerce,Fradulent SMS/Media Content/call",
        trigger: "Cat-211",
      },
      {
        value: "Email Fraud",
        label: "Email Fraud",
        trigger: "Cat-212",
      },
    ],
  },
  {
    id: "Cat-210",
    message: "Select how money lost in Banking:",
    trigger: "Banking",
  },
  {
    id: "Banking",
    options: [
      {
        value: "Misuse of Credit/Debit Card/ATM Fraud",
        label: "Misuse of Credit/Debit Card/ATM Fraud",
        trigger: "reg_type",
      },
      {
        value: "Unauthorized Access Through Internet Banking",
        label: "Unauthorized Access Through Internet Banking",
        trigger: "reg_type",
      },
      {
        value: "Cryptocurrency/Bitcoin",
        label: "Cryptocurrency/Bitcoin",
        trigger: "reg_type",
      },
      {
        value: "E-Wallet Fraud,Demat/Mutual Fund",
        label: "E-Wallet Fraud,Demat/Mutual Fund",
        trigger: "reg_type",
      },
    ],
  },
  {
    id: "Cat-211",
    message: "Select how money lost in Online:",
    trigger: "Online",
  },
  {
    id: "Online",
    options: [
      {
        value: "online Job Fraud",
        label: "online Job Fraud",
        trigger: "reg_type",
      },
      {
        value: "Online Matrimonial Fraud",
        label: "Online Matrimonial Fraud",
        trigger: "reg_type",
      },
    ],
  },
  {
    id: "Cat-212",
    message: "Select how money lost in Email Fraud:",
    trigger: "Email_Fraud",
  },
  {
    id: "Email_Fraud",
    options: [
      {
        value: "Spoof Email",
        label: "Spoof Email",
        trigger: "reg_type",
      },
      {
        value: "Business Email",
        label: "Business Email",
        trigger: "reg_type",
      },
      {
        value: "Compromise",
        label: "Compromise",
        trigger: "reg_type",
      },
      {
        value: "Email Hacking",
        label: "Email Hacking",
        trigger: "reg_type",
      },
      {
        value: "Threatening Email",
        label: "Threatening Email",
        trigger: "reg_type",
      },
      {
        value: "Phishing Email",
        label: "Phishing Email",
        trigger: "reg_type",
      },
    ],
  },
  {
    id: "Cat-22",
    message: "Select Type in Online Harassment:",
    trigger: "Online_Harassment",
  },
  {
    id: "Online_Harassment",
    options: [
      {
        value: "Receving Offensive Messages",
        label: "Receving Offensive Messages",
        trigger: "reg_type",
      },
      {
        value: "Online Bulying/Stalking",
        label: "Online Bulying/Stalking",
        trigger: "reg_type",
      },
    ],
  },
  {
    id: "Cat-23",
    message: "Select type of Hacking:",
    trigger: "Hacking",
  },
  {
    id: "Hacking",
    options: [
      {
        value: "Profile Hacking",
        label: "Profile Hacking",
        trigger: "Cat-230",
      },
      {
        value: "Computer Hacking",
        label: "Computer Hacking",
        trigger: "Cat-231",
      },
    ],
  },
  {
    id: "Cat-230",
    message: "Select type of Hacking in Profile:",
    trigger: "Profile_Hacking",
  },
  {
    id: "Profile_Hacking",
    options: [
      {
        value: "Identity Theft",
        label: "Identity Theft",
        trigger: "reg_type",
      },
      {
        value: "Fake Profile",
        label: "Fake Profile",
        trigger: "reg_type",
      },
      {
        value: "Cheating by Impersonation",
        label: "Cheating by Impersonation",
        trigger: "reg_type",
      },
    ],
  },
  {
    id: "Cat-231",
    message: "Select type of Hacking in Computer",
    trigger: "Computer",
  },
  {
    id: "Computer",
    options: [
      {
        value: "Damage to computer",
        label: "Damage to computer",
        trigger: "reg_type",
      },
      {
        value: "Data Breach",
        label: "Data Breach",
        trigger: "reg_type",
      },
      {
        value: "Altered Computer program",
        label: "Altered Computer program",
        trigger: "reg_type",
      },
      {
        value: "ransomware",
        label: "ransomware",
        trigger: "reg_type",
      },
    ],
  },
  {
    id: "Cat-24",
    message: "Select other Online Crime:",
    trigger: "Other",
  },
  {
    id: "Other",
    options: [
      {
        value: "Online Anti National/Communal Hatred/Terror Activity",
        label: "Online Anti National/Communal Hatred/Terror Activityr",
        trigger: "reg_type",
      },
      {
        value: "online prostitution/Human Trafficking",
        label: "online prostitution/Human Trafficking",
        trigger: "reg_type",
      },
      {
        value: "online Gambling",
        label: "online Gambling",
        trigger: "reg_type",
      },
      {
        value: "other",
        label: "other",
        trigger: "reg_type",
      },
    ],
  },
  {
    id: "reg_type",
    message: "select the Service You want :",
    trigger: "process",
  },
  {
    id: "process",
    options: [
      {
        label: "On-Chat Register Complaint",
        value: "oc",
        trigger: "comp",
      },
      {
        label: "Information",
        value: "in",
        trigger: "Modal_1",
      },
    ],
  },

  /* Authentication Module */

  {
    id: "Authentication",
    message: "Enter Your Mobile Number?",
    trigger: "otp",
  },
  {
    id: "otp",
    component: <PhoneVerify />,
    waitAction: true,
  },

  {
    id: "Name",
    message: "What is your name?",
    trigger: "name",
  },
  {
    id: "name",
    user: true,
    trigger: "email-id",
  },
  {
    id: "email-id",
    message: "Enter Email:",
    trigger: "email",
  },
  {
    id: "email",
    user: true,
    trigger: "Official_doc",
  },
  {
    id: "Official_doc",
    message: "Select the Proof of Identity",
    trigger: "POF",
  },
  {
    id: "POF",
    options: [
      {
        value: "Aadhar",
        label: "Aadhar Number",
        trigger: "pof_input",
      },
      {
        value: "PAN Card",
        label: "PAD Card",
        trigger: "pof_input",
      },
      {
        value: "Voter",
        label: "Voter ID",
        trigger: "pof_input",
      },
    ],
  },
  {
    id: "pof_input",
    message: "Enter {previousValue} number!",
    trigger: "number_pof",
  },
  {
    id: "number_pof",
    user: true,
    trigger: "Date_module",
  },

  /* Authentication Module Ends */

  /* Date Module Begins  */
  {
    id: "Date_module",
    message: "Select the Date when incident has taken place?",
    trigger: "Select_date",
  },
  {
    id: "Select_date",
    component: <Datepic />,
    waitAction: true,
  },
  {
    id: "incident_area",
    message: "Select State and District:",
    trigger: "incident_menu",
  },
  {
    id: "incident_menu",
    component: <Sdrop />,
    waitAction: true,
  },
  {
    id: "explanation",
    message: "Explain the Incident in your own Words",
    trigger: "desc",
  },
  {
    id: "desc",
    user: true,
    trigger: "Location",
  },
  {
    id: "plat",
    message: "Choose Platform if u say in Online:",
    trigger: "ch_plat",
  },
  {
    id: "ch_plat",
    component: <Example />,
    waitAction: true,
  },
  {
    id: "Location",
    message: "Do you want to give Location Details: ",
    trigger: "Loc",
  },
  {
    id: "Loc",
    options: [
      {
        value: "Yes",
        label: "Yes",
        trigger: "mapOrCustom",
      },
      {
        value: "No",
        label: "No",
        trigger: "update",
      },
    ],
  },
  {
    id: "mapOrCustom",
    message: "Select a method",
    trigger: "mapOrCustomOptions",
  },
  {
    id: "mapOrCustomOptions",
    options: [
      {
        value: "Select location on map",
        label: "Select location on map",
        trigger: "Loc_Details",
      },
      {
        value: "Enter address manually",
        label: "Enter address manually",
        trigger: "Loc_Input",
      },
    ],
  },
  {
    id: "Loc_Details",
    component: <Popmain />,
    waitAction: true,
  },
  {
    id: "Loc_Input",
    component: <AddressInput />,
    waitAction: true,
  },
  {
    id: "update",
    message: "Do you want to add any attachments",
    trigger: "Attachments",
  },
  {
    id: "Attachments",
    options: [
      {
        value: "Yes",
        label: "Yes",
        trigger: "Upload",
      },
      {
        value: "No",
        label: "No",
        trigger: "Reference",
      },
    ],
  },
  {
    id: "Upload",
    component: <Upload />,
    waitAction: true,
  },
  {
    id: "Reference",
    component: <Review />,
    waitAction: true,
  },
  {
    id: "end_greet",
    message:
      "Do not worry and have faith in our law enforcement system. You will never be deprived of justice. Do you want me to carry out any other functionality? ",
    trigger: "loop",
  },
  {
    id: "loop",
    options: [
      {
        value: "y",
        label: "Yes",
        trigger: "Greetings",
      },
      {
        value: "n",
        label: "No",
        trigger: "final_end",
      },
    ],
  },
  {
    id: "final_end",
    message:
      "Thank You for using me. I am always available just a click away for your service . Bye",
    end: true,
  },
  /* Card Component */
  {
    id: "Modal_1",
    component: <Cards />,
    waitAction: true,
  },

  /* Modal */
  {
    id: "Safe",
    component: <Safe />,
    waitAction: true,
  },
  {
    id: "AIChat",
    message: "Describe your situation in few words",
    trigger: "zero",
  },
  {
    id: "zero",
    user: true,
    trigger: "zero1",
  },
  {
    id: "zero1",
    component: <AIChat />,
    asMessage: true,
    waitAction: true,
  },
  {
    id: "shaw",
    message: "Do you want to register complaint on this ?",
    trigger: "shaw_options",
  },
  {
    id: "shaw_options",
    options: [
      {
        label: "Yes",
        value: "Yes",
        trigger: "comp",
      },
      {
        label: "Continue with chat",
        value: "continue with chat",
        trigger: "shaw1",
      },
    ],
  },
  {
    id: "shaw1",
    message: "We can continue our chat",
    trigger: "zero",
  },
  {
    id:"errZero",
    message:"Please provide the same information in 2-3 lines(You can later add whole description later)",
    trigger:"zero"
  },


    //f:telugu


  {
    id: "tel-Greetings",
    message: "హలో, నేను ట్రై-నేత్రా - సైబర్ బాట్.",
    //component: <PopPdf/>,
    trigger: "tel-2",
  },
  {
    id: "tel-2",
    message: "మీ సైబర్ అనుభవాన్ని సురక్షితంగా మరియు సురక్షితంగా చేయడమే నా పని.",
    trigger: "tel-3",
  },
  {
    id: "tel-3",
    message: "నేను మీ కోసం వీటిని చేయగలను:",
    trigger: "tel-3.1",
  },
  {
    id: "tel-3.1",
    message:
      "1. నా ద్వారా ఫిర్యాదును నమోదు చేయండి లేదా మీరు కోరుకున్నట్లు అధికారిక పోర్టల్‌కు మళ్ళించండి.",
    trigger: "tel-3.2",
  },
  {
    id: "tel-3.2",
    message:
      "2. మీ డేటాబేస్ నుండి మీ ఫిర్యాదు యొక్క ప్రస్తుత స్థితిని మీకు తెలియజేయండి",
    trigger: "tel-3.3",
  },
  {
    id: "tel-3.3",
    message:
      "3. భవిష్యత్తులో మీరు నన్ను తక్కువగా ఉపయోగించుకునేలా మీరు అనుసరించాలనుకునే అనేక నేర అవగాహన చిట్కాలతో మీకు జ్ఞానోదయం చేయండి :)",
    trigger: "tel-serv",
  },
  {
    id: "tel-serv",
    message: "సేవా రకాన్ని ఎంచుకోండి:",
    trigger: "tel-Service",
  },
  {
    id: "tel-Service",
    options: [
      // {
      //   value: "Report",
      //   label: "ఫిర్యాదును నివేదించండి",
      //   trigger: "tel-Report",
      // },
      {
        value: "Safety",
        label: "నేర అవగాహన",
        trigger: "tel-Safe",
      },
      {
        value: "Track",
        label: "ఫిర్యాదును ట్రాక్ చేయండి",
        trigger: "tel-TrackComplaint",
      },
      {
        value: "ChatAI",
        label: "ఫిర్యాదును నివేదించండి",
        trigger: "tel-AIChat",
      },
    ],
  },
  {
    id: "tel-TrackComplaint",
    component: <TrackComp />,
    end: true,
  },
  {
    id: "tel-Report",
    message: "దిగువ జాబితా నుండి వర్గం యొక్క రకాన్ని ఎంచుకోండి:",
    trigger: "tel-Category",
  },
  /* 
  {
    id: "tel-On-Chat",
    message: "నేర రకాన్ని ఎంచుకోండి:",
    trigger: "tel-Category",
  }, */
  {
    id: "tel-Category",
    options: [
      {
        value: "Child Sex Abuse/Rape/Obstacenity",
        label: "పిల్లల లైంగిక వేధింపు / అత్యాచారం / అబ్స్టాసినిటీ",
        trigger: "tel-Categoty_CRSO",
      },
      {
        value: "Cyber Crime",
        label: "సైబర్ క్రైమ్",
        trigger: "tel-Cyber_type",
      },
    ],
  },
  {
    id: "tel-Categoty_CRSO",
    message: "నాన్_సైబర్‌లో క్రైమ్ రకాన్ని ఎంచుకోండి:",
    trigger: "tel-Category_1",
  },
  {
    id: "tel-Category_1",
    options: [
      {
        value: "Child Pornography",
        label: "పిల్లల అశ్లీలత",
        trigger: "tel-Register-Types",
      },
      {
        value: "Rape/Gang Rape",
        label: "అత్యాచారం / గ్యాంగ్ రేప్",
        trigger: "tel-Register-Types",
      },
      {
        value: "Sexual Obscenity",
        label: "లైంగిక అశ్లీలత",
        trigger: "tel-Register-Types",
      },
      {
        value: "Sexually Explicit",
        label: "లైంగికంగా స్పష్టంగా",
        trigger: "tel-Register-Types",
      },
    ],
  },
  {
    id: "tel-Register-Types",
    message: "మీకు కావలసిన సేవలను ఎంచుకోండి:",
    trigger: "tel-reg_op",
  },
  {
    id: "tel-reg_op",
    options: [
      {
        value: "Here",
        label: "ఆన్-చాట్ రిజిస్టర్ ఫిర్యాదు",
        trigger: "tel-comp",
      },
      {
        value: "Information",
        label: "సమాచారం",
        trigger: "tel-Modal_1",
      },
    ],
  },
  {
    id: "tel-comp",
    message: "మీరు ఎలా నమోదు చేయాలనుకుంటున్నారో ఎంచుకోండి:",
    trigger: "tel-Complaint_type",
  },
  {
    id: "tel-Complaint_type",
    options: [
      {
        value: "Anonymous",
        label: "అనామక",
        trigger: "tel-Date_module",
      },
      {
        value: "Personal",
        label: "వ్యక్తిగత",
        trigger: "tel-Authentication",
      },
    ],
  },
  {
    id: "tel-Cyber_type",
    message: "సైబర్ క్రైమ్ రకాన్ని ఎంచుకోండి:",
    trigger: "tel-Category_2",
  },
  {
    id: "tel-Category_2",
    options: [
      {
        value: "Loss of Money",
        label: "డబ్బు నష్టం",
        trigger: "tel-Cat-21",
      },
      {
        value: "Online Harassment",
        label: "ఆన్‌లైన్ వేధింపు",
        trigger: "tel-Cat-22",
      },
      {
        value: "Hacking",
        label: "హ్యాకింగ్",
        trigger: "tel-Cat-23",
      },
      {
        value: "Other online Crime",
        label: "ఇతర ఆన్‌లైన్ క్రైమ్",
        trigger: "tel-Cat-24",
      },
    ],
  },
  {
    id: "tel-Cat-21",
    message: "డబ్బు నష్టంలో వర్గాన్ని ఎంచుకోండి",
    trigger: "tel-Loss_money",
  },
  {
    id: "tel-Loss_money",
    options: [
      {
        value: "Banking/E-Wallet/Demat",
        label: "బ్యాంకింగ్ / ఇ-వాలెట్ / డిమాట్",
        trigger: "tel-Cat-210",
      },
      {
        value: "Job/Matrimonial,E-commerce,Fradulent SMS/Media Content/call",
        label: "జాబ్ / మ్యాట్రిమోనియల్, ఇ-కామర్స్, మోసపూరిత ఎస్ఎంఎస్ / మీడియా కంటెంట్ / కాల్",
        trigger: "tel-Cat-211",
      },
      {
        value: "Email Fraud",
        label: "ఇమెయిల్ మోసం",
        trigger: "tel-Cat-212",
      },
    ],
  },
  {
    id: "tel-Cat-210",
    message: "బ్యాంకింగ్‌లో డబ్బు ఎలా పోయిందో ఎంచుకోండి:",
    trigger: "tel-Banking",
  },
  {
    id: "tel-Banking",
    options: [
      {
        value: "Misuse of Credit/Debit Card/ATM Fraud",
        label: "క్రెడిట్ / డెబిట్ కార్డ్ / ఎటిఎం మోసం దుర్వినియోగం",
        trigger: "tel-reg_type",
      },
      {
        value: "Unauthorized Access Through Internet Banking",
        label: "ఇంటర్నెట్ బ్యాంకింగ్ ద్వారా అనధికార ప్రాప్యత",
        trigger: "tel-reg_type",
      },
      {
        value: "Cryptocurrency/Bitcoin",
        label: "ఇ-వాలెట్ Cryptocurrency / వికీపీడియా",
        trigger: "tel-reg_type",
      },
      {
        value: "E-Wallet Fraud,Demat/Mutual Fund",
        label: "ఇ-వాలెట్ మోసం, డీమాట్ / మ్యూచువల్ ఫండ్",
        trigger: "tel-reg_type",
      },
    ],
  },
  {
    id: "tel-Cat-211",
    message: "ఆన్‌లైన్‌లో డబ్బు ఎలా పోయిందో ఎంచుకోండి:",
    trigger: "tel-Online",
  },
  {
    id: "tel-Online",
    options: [
      {
        value: "online Job Fraud",
        label: "ఆన్‌లైన్ ఉద్యోగ మోసం",
        trigger: "tel-reg_type",
      },
      {
        value: "Online Matrimonial Fraud",
        label: "ఆన్‌లైన్ మ్యాట్రిమోనియల్ మోసం",
        trigger: "tel-reg_type",
      },
    ],
  },
  {
    id: "tel-Cat-212",
    message: "ఇమెయిల్ మోసంలో డబ్బు ఎలా పోయిందో ఎంచుకోండి:",
    trigger: "tel-Email_Fraud",
  },
  {
    id: "tel-Email_Fraud",
    options: [
      {
        value: "Spoof Email",
        label: "స్పూఫ్ ఇమెయిల్",
        trigger: "tel-reg_type",
      },
      {
        value: "Business Email",
        label: "వ్యాపార ఇమెయిల్",
        trigger: "tel-reg_type",
      },
      {
        value: "Compromise",
        label: "రాజీ",
        trigger: "tel-reg_type",
      },
      {
        value: "Email Hacking",
        label: "ఇమెయిల్ హ్యాకింగ్",
        trigger: "tel-reg_type",
      },
      {
        value: "Threatening Email",
        label: "బెదిరించే ఇమెయిల్",
        trigger: "tel-reg_type",
      },
      {
        value: "Phishing Email",
        label: "ఫిషింగ్ ఇమెయిల్",
        trigger: "tel-reg_type",
      },
    ],
  },
  {
    id: "tel-Cat-22",
    message: "ఆన్‌లైన్ వేధింపులో రకాన్ని ఎంచుకోండి:",
    trigger: "tel-Online_Harassment",
  },
  {
    id: "tel-Online_Harassment",
    options: [
      {
        value: "Receving Offensive Messages",
        label: "ప్రమాదకర సందేశాలను స్వీకరిస్తోంది",
        trigger: "tel-reg_type",
      },
      {
        value: "Online Bulying/Stalking",
        label: "ఆన్‌లైన్ కొనుగోలు / స్టాకింగ్",
        trigger: "tel-reg_type",
      },
    ],
  },
  {
    id: "tel-Cat-23",
    message: "హ్యాకింగ్ రకాన్ని ఎంచుకోండి:",
    trigger: "tel-Hacking",
  },
  {
    id: "tel-Hacking",
    options: [
      {
        value: "Profile Hacking",
        label: "ప్రొఫైల్ హ్యాకింగ్",
        trigger: "tel-Cat-230",
      },
      {
        value: "Computer Hacking",
        label: "కంప్యూటర్ హ్యాకింగ్",
        trigger: "tel-Cat-231",
      },
    ],
  },
  {
    id: "tel-Cat-230",
    message: "ప్రొఫైల్‌లో హ్యాకింగ్ రకాన్ని ఎంచుకోండి:",
    trigger: "tel-Profile_Hacking",
  },
  {
    id: "tel-Profile_Hacking",
    options: [
      {
        value: "Identity Theft",
        label: "గుర్తింపు దొంగతనం",
        trigger: "tel-reg_type",
      },
      {
        value: "Fake Profile",
        label: "నకిలీ ప్రొఫైల్",
        trigger: "tel-reg_type",
      },
      {
        value: "Cheating by Impersonation",
        label: "వంచన ద్వారా మోసం",
        trigger: "tel-reg_type",
      },
    ],
  },
  {
    id: "tel-Cat-231",
    message: "కంప్యూటర్‌లో హ్యాకింగ్ రకాన్ని ఎంచుకోండి",
    trigger: "tel-Computer",
  },
  {
    id: "tel-Computer",
    options: [
      {
        value: "Damage to computer",
        label: "కంప్యూటర్‌కు నష్టం",
        trigger: "tel-reg_type",
      },
      {
        value: "Data Breach",
        label: "డేటా ఉల్లంఘన",
        trigger: "tel-reg_type",
      },
      {
        value: "Altered Computer program",
        label: "మార్చబడిన కంప్యూటర్ ప్రోగ్రామ్",
        trigger: "tel-reg_type",
      },
      {
        value: "ransomware",
        label: "ransomware",
        trigger: "tel-reg_type",
      },
    ],
  },
  {
    id: "tel-Cat-24",
    message: "ఇతర ఆన్‌లైన్ నేరాలను ఎంచుకోండి:",
    trigger: "tel-Other",
  },
  {
    id: "tel-Other",
    options: [
      {
        value: "Online Anti National/Communal Hatred/Terror Activity",
        label: "ఆన్‌లైన్ యాంటీ నేషనల్ / కమ్యూనల్ ద్వేషం / టెర్రర్ యాక్టివిటీ",
        trigger: "tel-reg_type",
      },
      {
        value: "online prostitution/Human Trafficking",
        label: "ఆన్‌లైన్ వ్యభిచారం / మానవ అక్రమ రవాణా",
        trigger: "tel-reg_type",
      },
      {
        value: "online Gambling",
        label: "ఆన్‌లైన్ జూదం",
        trigger: "tel-reg_type",
      },
      {
        value: "other",
        label: "ఇతర",
        trigger: "tel-reg_type",
      },
    ],
  },
  {
    id: "tel-reg_type",
    message: "మీకు కావలసిన సేవను ఎంచుకోండి:",
    trigger: "tel-process",
  },
  {
    id: "tel-process",
    options: [
      {
        label: "ఆన్-చాట్ రిజిస్టర్ ఫిర్యాదు",
        value: "oc",
        trigger: "tel-comp",
      },
      {
        label: "సమాచారం",
        value: "in",
        trigger: "tel-Modal_1",
      },
    ],
  },

  /* Authentication Module */

  {
    id: "tel-Authentication",
    message: "మీ మొబైల్ నెంబర్ ను ఎంటర్ చేయండి?",
    trigger: "tel-otp",
  },
  {
    id: "tel-otp",
    component: <PhoneVerify />,
    waitAction: true,
  },

  {
    id: "tel-Name",
    message: "నీ పేరు ఏమిటి?",
    trigger: "tel-name",
  },
  {
    id: "tel-name",
    user: true,
    trigger: "tel-email-id",
  },
  {
    id: "tel-email-id",
    message: "ఇమెయిల్ నమోదు చేయండి:",
    trigger: "tel-email",
  },
  {
    id: "tel-email",
    user: true,
    trigger: "tel-Official_doc",
  },
  {
    id: "tel-Official_doc",
    message: "గుర్తింపు రుజువు ఎంచుకోండి",
    trigger: "tel-POF",
  },
  {
    id: "tel-POF",
    options: [
      {
        value: "Aadhar",
        label: "ఆధార్ సంఖ్య",
        trigger: "tel-pof_input",
      },
      {
        value: "PAN Card",
        label: "పాన్ కార్డ్",
        trigger: "tel-pof_input",
      },
      {
        value: "Voter",
        label: "ఓటరు ID",
        trigger: "tel-pof_input",
      },
    ],
  },
  {
    id: "tel-pof_input",
    message: "{మునుపటి విలువ} సంఖ్యను నమోదు చేయండి!",
    trigger: "tel-number_pof",
  },
  {
    id: "tel-number_pof",
    user: true,
    trigger: "tel-Date_module",
  },

  /* Authentication Module Ends */

  /* Date Module Begins  */
  {
    id: "tel-Date_module",
    message: "జరిగిన తేదీని ఎంచుకోండి?:",
    trigger: "tel-Select_date",
  },
  {
    id: "tel-Select_date",
    component: <Datepic />,
    waitAction: true,
  },
  {
    id: "tel-incident_area",
    message: "రాష్ట్ర మరియు జిల్లాను ఎంచుకోండి:",
    trigger: "tel-incident_menu",
  },
  {
    id: "tel-incident_menu",
    component: <Sdrop />,
    waitAction: true,
  },
  {
    id: "tel-explanation",
    message: "సంఘటనను మీ స్వంత మాటలలో వివరించండి",
    trigger: "tel-desc",
  },
  {
    id: "tel-desc",
    user: true,
    trigger: "tel-Location",
  },
  {
    id: "tel-plat",
    message: "మీరు ఆన్‌లైన్‌లో చెబితే ప్లాట్‌ఫారమ్‌ను ఎంచుకోండి:",
    trigger: "tel-ch_plat",
  },
  {
    id: "tel-ch_plat",
    component: <Example />,
    waitAction: true,
  },
  {
    id: "tel-Location",
    message: "మీరు స్థాన వివరాలు ఇవ్వాలనుకుంటున్నారా: ",
    trigger: "tel-Loc",
  },
  {
    id: "tel-Loc",
    options: [
      {
        value: "Yes",
        label: "అవును",
        trigger: "tel-mapOrCustom",
      },
      {
        value: "No",
        label: "వొ ద్దు",
        trigger: "tel-update",
      },
    ],
  },
  {
    id: "tel-mapOrCustom",
    message: "ఒక పద్ధతిని ఎంచుకోండి",
    trigger: "tel-mapOrCustomOptions",
  },
  {
    id: "tel-mapOrCustomOptions",
    options: [
      {
        value: "Select location on map",
        label: "మ్యాప్‌లో స్థానాన్ని ఎంచుకోండి",
        trigger: "tel-Loc_Details",
      },
      {
        value: "Enter address manually",
        label: "చిరునామాను మాన్యువల్‌గా నమోదు చేయండి",
        trigger: "tel-Loc_Input",
      },
    ],
  },
  {
    id: "tel-Loc_Details",
    component: <Popmain />,
    waitAction: true,
  },
  {
    id: "tel-Loc_Input",
    component: <AddressInput />,
    waitAction: true,
  },
  {
    id: "tel-update",
    message: "మీరు ఏదైనా జోడింపులను జోడించాలనుకుంటున్నారా",
    trigger: "tel-Attachments",
  },
  {
    id: "tel-Attachments",
    options: [
      {
        value: "Yes",
        label: "అవును",
        trigger: "tel-Upload",
      },
      {
        value: "No",
        label: "వొ ద్దు",
        trigger: "tel-Reference",
      },
    ],
  },
  {
    id: "tel-Upload",
    component: <Upload />,
    waitAction: true,
  },
  {
    id: "tel-Reference",
    component: <Review />,
    waitAction: true,
  },
  {
    id: "tel-end_greet",
    message:
      "చింతించకండి మరియు మా చట్ట అమలు వ్యవస్థపై నమ్మకం ఉంచండి. మీరు ఎప్పటికీ న్యాయం కోల్పోరు. నేను ఏదైనా ఇతర కార్యాచరణను చేయాలనుకుంటున్నారా?",
    trigger: "tel-loop",
  },
  {
    id: "tel-loop",
    options: [
      {
        value: "y",
        label: "అవును",
        trigger: "tel-Greetings",
      },
      {
        value: "n",
        label: "వొ ద్దు",
        trigger: "tel-final_end",
      },
    ],
  },
  {
    id: "tel-final_end",
    message:
      "నన్ను ఉపయోగించినందుకు ధన్యవాదాలు. మీ సేవ కోసం ఒక క్లిక్ దూరంలో నేను ఎల్లప్పుడూ అందుబాటులో ఉంటాను. బై",
    end: true,
  },
  /* Card Component */
  {
    id: "tel-Modal_1",
    component: <Cards />,
    waitAction: true,
  },

  /* Modal */
  {
    id: "tel-Safe",
    component: <Safe />,
    waitAction: true,
  },
  {
    id: "tel-AIChat",
    message: "హలో నేను AI చాట్ బాట్, మీరు నాతో మాట్లాడవచ్చు :)",
    trigger: "tel-zero",
  },
  {
    id: "tel-zero",
    user: true,
    trigger: "tel-zero1",
  },
  {
    id: "tel-zero1",
    component: <AIChat />,
    asMessage: true,
    waitAction: true,
  },
  {
    id: "tel-shaw",
    message: "దీనిపై మీరు ఫిర్యాదు నమోదు చేయాలనుకుంటున్నారా?",
    trigger: "tel-shaw_options",
  },
  {
    id: "tel-shaw_options",
    options: [
      {
        label: "అవును",
        value: "Yes",
        trigger: "tel-comp",
      },
      {
        label: "చాట్‌తో కొనసాగించండి",
        value: "continue with chat",
        trigger: "tel-shaw1",
      },
    ],
  },
  {
    id: "tel-shaw1",
    message: "మేము మా చాట్ కొనసాగించవచ్చు",
    trigger: "tel-zero",
  },
];

export default STEPS;
