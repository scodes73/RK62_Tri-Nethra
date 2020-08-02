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
    const params = {
      sessionId: "shaw",
      queryInput: {
        text: {
          text: this.props.previousStep.value,
          languageCode: "en-US",
        },
      },
    };
    let res = await axios.post('https://us-central1-webappmedia-2aa4d.cloudfunctions.net/dialogflowGateway', params);
    // let res = await axios.post(
    //   "https://us-central1-crime-17ca7.cloudfunctions.net/dialogflowGateway",
    //   params
    // );
    console.log(res);
    console.log(this.props.steps);
    this.setState({
      msg: res.data.split("^")[0],
    });
    this.props.triggerNextStep({
      trigger: res.data.split("^")[1] === undefined ? "zero" : "shaw",
      value: res.data.split("^")[1] === undefined ? "" : res.data.split("^"),
    });
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
