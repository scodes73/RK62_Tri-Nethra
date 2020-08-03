import React, { Component } from "react";
import ChatBot from "react-simple-chatbot";
import { ThemeProvider } from "styled-components";
import STEPS from "./optionComponent";
import avatar from '../police.svg'

const theme = {
  background: "#f5f8fb",
  font: "poppins",
  fontWeight: "bold",
  headerBgColor: "#EF6C00",
  headerFontColor: "#fff",
  headerFontSize: "16px",
  botBubbleColor: "#EF6C00",
  botFontColor: "#fff",
  userBubbleColor: "#fff",
  userFontColor: "#4a4a4a",
};
const config = {
  width: "40vw",
  height: "90vh",
  floating: true,
  botDelay: 1000,
  userDelay: 500,
  headerTitle: "Tri-Nethra"
};

class Main extends Component {

  render() {
    return (
      <ThemeProvider theme={theme}>
        <ChatBot
          recognitionEnable={true}
          customStyle={{backgroundColor: "white", margin: "20px", borderRadius: "20px 20px 20px 0px",  border: "2px solid #EF6C00"}}
          botAvatar={avatar}
          bubbleStyle={{
            fontWeight: "600"
          }}
          bubbleOptionStyle={{
            fontWeight: "700",
            background: "#f5f8fb",
            color: "#EF6C00",
            border: "1.5px solid #EF6C00",
          }}
          steps={STEPS}
          {...config}
        />
      </ThemeProvider>
    );
  }
}

export default Main;
