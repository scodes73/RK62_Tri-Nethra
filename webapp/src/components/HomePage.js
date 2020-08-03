import React, { Component } from "react";

class HomePage extends Component {
  render() {
    return (
      <div
        style={{
          height: "100vh",
          display: "flex",
        }}
      >
        <div
          style={{
            color: "white",
            alignSelf: "center",
          }}
        >
          <span
            style={{ color: "#282828",font: "poppins", fontWeight: "bold", fontSize: "6vw" ,textAlign: "center"}}
          >
            Tri-Nethra
          </span>
          <p style={{ color: "#282828",font: "poppins", fontWeight: "500", fontSize: "2.5vw", textAlign: "center" }}>Crime chat-bot</p>
        </div>
      </div>
    );
  }
}

export default HomePage;
