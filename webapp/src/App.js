import React, { Component } from "react";
import "./App.css";
import Main from "./components/MainComponent";
import Party from "./components/ParticlesReact";
class App extends Component {
  render() {
    return (
      <div style={{backgroundColor: "#282828", height: "100vh", width: "100vw"}}>
        <Main />
        <Party/>
      </div>
    );
  }
}

export default App;
