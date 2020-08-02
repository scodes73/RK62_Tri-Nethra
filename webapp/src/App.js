import React, { Component } from "react";
import "./App.css";
import Main from "./components/MainComponent";
import Party from "./components/ParticlesReact";
import HomePage from "./components/HomePage";
class App extends Component {
  render() {
    return (
      <div
        style={{ backgroundColor: "white", height: "100vh", width: "100vw", overflow: "hidden" }}
      >
        <Main />
        <Party />
        <div style={{ position: "absolute", top: "0", left: "0" }}>
          <HomePage />
        </div>
      </div>
    );
  }
}

export default App;
