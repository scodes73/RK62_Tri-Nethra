import React, { Component } from "react";
const axios = require("axios");

class AIChat extends Component {
  constructor(props) {
    super(props);
    this.state = {
      msg: "",
    };
  }

  async makeReq() {
    var params;
    if(this.props.steps.lang.value === ""){
      params = {
        sessionId: "shaw",
        queryInput: {
          text: {
            text: this.props.previousStep.value,
            languageCode: "en-US",
          },
        },
      };
    }else{
      params = {
        sessionId: "shawHindi",
        queryInput: {
          text: {
            text: this.props.previousStep.value,
            languageCode: "hi-IN",
          },
        },
      };
    }
    
    await axios.post('https://us-central1-webappmedia-2aa4d.cloudfunctions.net/dialogflowGateway', params).then((res)=> {
      console.log("success");
      console.log(res);
    console.log(this.props.steps[this.props.steps.lang.value+"Service"].value);
    this.setState({
      msg: res.data.split("^")[0],
    });

    this.props.triggerNextStep({
      trigger: res.data.split("^")[1] === undefined ? this.props.steps.lang.value+"zero" : this.props.steps.lang.value+"shaw",
      value: res.data.split("^")[1] === undefined ? "" : res.data.split("^"),
    });
    }).catch((err) => {
      console.log("err");
      this.setState({
        msg: this.props.steps.lang.value === ""?"You have given an unusual string,please provide genuine brief about the incident .":"आपने एक असामान्य स्ट्रिंग दी है,कृपया घटना के बारे में संक्षिप्त जानकारी दें।",
      });
      this.props.triggerNextStep({
        trigger: this.props.steps.lang.value+"errZero"
      })
    })
    // let res = await axios.post(
    //   "https://us-central1-crime-17ca7.cloudfunctions.net/dialogflowGateway",
    //   params
    // );
    
  }

  componentWillMount() {
    this.makeReq();
  }

  render() {
    return (
      <div>
        {this.state.msg !== "" ? (
          <span>{this.state.msg}</span>
        ) : (
          <span>...</span>
        )}
      </div>
    );
  }
}

export default AIChat;
