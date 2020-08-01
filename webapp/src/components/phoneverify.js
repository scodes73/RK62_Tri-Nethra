import React, { Component } from "react";
import { firebase } from "./firebase";

class PhoneVerify extends Component {
  state = {
    number: "",
    isDisabled: false,
    isCodeAvailable: false,
    OTP: "",
    isStatus: false,
    status: "",
    statusColor: "",
    buttonTxt: "Send OTP"
  };

  componentDidMount() {
    window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier(
      "recaptcha-container",
      {
        size: "invisible",
      }
    );
  }

  onChange = (number) => this.setState({ number });

  onOtpChange = (OTP) => this.setState({ OTP });

  PhoneNumberVerify(number) {
    if(number !== ""){
    this.setState({
      isCodeAvailable: false,
      buttonTxt: "Resend OTP",
      isStatus: true,
      status: "Please wait ...",
      statusColor: "black"
    })
    firebase.auth().settings.appVerificationDisabledForTesting = true;
    const appVerifier = window.recaptchaVerifier;
    firebase
      .auth()
      .signInWithPhoneNumber("+91" + number, appVerifier)
      .then((confirmationResult) => {
        console.log("success", confirmationResult);
        this.setState({
          isCodeAvailable: true,
          isStatus: true,
          status: "Code sent to given Mobile number",
          statusColor: "black"
        });
        window.confirmationResult = confirmationResult;
      })
      .catch((error) => {
        this.setState({
          isStatus: true,
          status: "Provided Mobile number is Invalid",
          statusColor: "red"
        });
        console.log("err", error);
      });
    }else{
      this.setState({
        isCodeAvailable: false,
        buttonTxt: "Send OTP",
        isStatus: true,
        status: "Cannot be empty!",
        statusColor: "red"
      })
    }
  }

  OTPverify(code, props) {
    // var credential = firebase.auth.PhoneAuthProvider.credential(this.state.verificationId, code)
    // firebase.auth().signInWithCredential(credential)
    //   .then((user) => {
    //     console.log(user);
    //   })
    //   .catch((err) => {
    //     console.log(err);
    //   });
    this.setState({
      isStatus: true,
      status: "Verifying OTP ...",
      statusColor: "black",
      isCodeAvailable: false,
      isDisabled: true
    })
    console.log(code);
    window.confirmationResult
      .confirm(code)
      .then((result) => {
        var user = result.user;
        console.log(user);
        this.setState({
          isStatus: true,
          status: "Mobile number verified",
          statusColor: "green",
        })
        props.triggerNextStep({
          trigger: "Name",
          value: {
            phonenumber: user.phoneNumber,
            uid: user.uid,
          },
        });
      })
      .catch((error) => {
        this.setState({
          isStatus: true,
          status: "Provided OTP is incorrect",
          statusColor: "red",
          isDisabled: false
        });
        console.log(error);
      });
  }
  render() {
    return (
      <div>
        <div
          style={{
            width: "100%",
            display: "flex",
            flexDirection: "row",
            justifyContent: "space-around",
          }}
        >
          <input
            disabled={this.state.isDisabled}
            id="Phone Number"
            type="text"
            onChange={(e) => this.onChange(e.target.value)}
          ></input>
          <div style={{width: "10px"}}/>
          <button
            disabled={this.state.isDisabled}
            id="recaptcha-container"
            className="button1"
            onClick={() => this.PhoneNumberVerify(this.state.number)}
          >
            {this.state.buttonTxt}
          </button>
        </div>
        <div style={{ height: "10px" }} />
        {this.state.isCodeAvailable ? (
          <div
            style={{
              width: "100%",
              display: "flex",
              flexDirection: "row",
              justifyContent: "space-around",
            }}
          >
            <input
              disabled={this.state.isDisabled}
              id="Code"
              type="text"
              onChange={(e) => this.onOtpChange(e.target.value)}
            ></input>
            <div style={{width: "10px"}}/>
            <button
              disabled={this.state.isDisabled}
              className="button1"
              onClick={() => this.OTPverify(this.state.OTP, this.props)}
            >
              Verify OTP
            </button>
          </div>
        ) : null}
        {
          this.state.status?(
            <div style={{display: "flex", justifyContent: "center", width: "100%", marginTop: "10px"}}>
          <div style={{color: this.state.statusColor}} >{this.state.status}</div>
          </div>
          )
        :null
        }
      </div>
    );
  }
}

export default PhoneVerify;
