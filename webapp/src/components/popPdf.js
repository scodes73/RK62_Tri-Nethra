import React, { Component } from "react";
import { Document, Page } from "react-pdf/dist/entry.webpack";
import jobF from "../components/jobFraud.pdf"
import MatrimonialF  from "./matrimonialFraud.pdf"
import securityA from "../components/securityAwareness.pdf"
import socialAwareness from "../components/socialMedia.pdf"

const list = []
class Pdf extends Component {

 SimpleList = () => (
   <div>
      {list.map(item => (
        <Page pageNumber={item} width={450}>{item}</Page>
      ))}
      </div>
  );

  onDocumentLoadSuccess = ({ numPages }) => {
    for(var i =1;i <= numPages; i++){
      list.push(i);
    }
  };


  render() {

    return (
      <div>
        <nav>
          <div
            style={{
              width: "100%",
              display: "flex",
              justifyContent: "space-around",
            }}
          >
          </div>
        </nav>

        <div>
          <Document file={MatrimonialF} onLoadSuccess={this.onDocumentLoadSuccess}>
            <this.SimpleList/>
          </Document>
        </div>
      </div>
    );
  }
}

class Popup extends Component {
  render() {
    return (
      <div className="popup">
        <div className="popup_inner">
          <div
            style={{
              backgroundColor: "transparent",
              width: "100%",
            }}
          >
            <button
                className="button1"
                onClick={() => {
                  this.props.closePopup();
                }}
              >
                close
              </button>

            <Pdf />
          </div>
        </div>
      </div>
    );
  }
}
class PopMain extends Component {
  constructor(props) {
    super(props);
    this.state = {
      showPopup: false,
      disabled: false,
    };
  }
  togglePopup() {
    this.setState({
      showPopup: !this.state.showPopup,
    });
  }
  render() {
    return (
      <div>
        <div className="app">
          <button
            className="button1"
            disabled={this.state.disabled}
            onClick={this.togglePopup.bind(this)}
          >
            Show Map
          </button>
          {this.state.showPopup ? (
            <Popup closePopup={this.togglePopup.bind(this)} />
          ) : null}
        </div>
      </div>
    );
  }
}

export default PopMain;
