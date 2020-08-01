import React, { Component } from "react";

class InputComp extends Component {
  constructor(props) {
    super(props);
    this.state = {
      address: "",
      status: "",
      statusColor: "",
      disbled: false
    };
  }

  render() {
    return (
      <div style={{ width: "100%", display: "flex", justifyContent: "center" }}>
        <div style={{ display: "flex", flexDirection: "column" }}>
          <textarea
            rows={5}
            style={{ padding: "5px", maxLines: "5" }}
            onChange={(e) => this.setState({ address: e.target.value })}
          />
          <div style={{height: "10px"}}/>
          <button
            disabled={this.state.disabled}
            className="button1"
            onClick={() => {
              if (this.state.address === "") {
                this.setState({
                  status: "Value cannot be empty",
                  statusColor: "red",
                });
              } else {
                this.setState({
                  disabled: true,
                  status: ""
                });
                this.props.triggerNextStep({
                  trigger: "update",
                  value: this.state.address,
                });
              }
            }}
          >
            Set address
          </button>
          {this.state.status !== "" ? (
            <span style={{ color: this.state.statusColor }}>
              {this.state.status}
            </span>
          ) : null}
        </div>
      </div>
    );
  }
}

export default InputComp;
