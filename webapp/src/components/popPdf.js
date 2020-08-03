import React, { Component } from "react";
import { Document, Page } from "react-pdf/dist/entry.webpack";

const list = []
class Pdf extends Component {
 SimpleList = () => (
   <div>
      {list.map(item => (
        <Page pageNumber={item} key={item} width={450}>{item}</Page>
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
        <div>
        <Document file={this.props.Pdfsrc} onLoadSuccess={this.onDocumentLoadSuccess}>
            <this.SimpleList/>
          </Document>
          {/* {
            this.props.Pdfsrc === "t"?<Document file={MatrimonialF} onLoadSuccess={this.onDocumentLoadSuccess}>
            <this.SimpleList/>
          </Document>:null
          }
          {
            this.props.Pdfsrc === ""?<Document file={MatrimonialF} onLoadSuccess={this.onDocumentLoadSuccess}>
            <this.SimpleList/>
          </Document>:null
          }
          {
            this.props.Pdfsrc === ""?<Document file={MatrimonialF} onLoadSuccess={this.onDocumentLoadSuccess}>
            <this.SimpleList/>
          </Document>:null
          }
          {
            this.props.Pdfsrc === ""?<Document file={MatrimonialF} onLoadSuccess={this.onDocumentLoadSuccess}>
            <this.SimpleList/>
          </Document>:null
          }
          {
            this.props.Pdfsrc === ""?<Document file={MatrimonialF} onLoadSuccess={this.onDocumentLoadSuccess}>
            <this.SimpleList/>
          </Document>:null
          } */}
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

            <Pdf Pdfsrc={this.props.Pdfsrc}/>
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
            style={{width:"100%", margin:"10px"}}
            className="button1"
            disabled={this.state.disabled}
            onClick={this.togglePopup.bind(this)}
          >
            {this.props.Bntxt}
          </button>
          {this.state.showPopup ? (
            <Popup Pdfsrc={this.props.Pdfsrc} closePopup={this.togglePopup.bind(this)} />
          ) : null}
        </div>
      </div>
    );
  }
}

export default PopMain;
