import React, { Component } from "react";
import Select from "react-select";
import options from "./platforms";
class Example extends Component {
  constructor(props) {
    super(props);
    this.state = {
      selected: null,
      disabled: false
    };
  }
  render() {
    const opts = options.map((l) => ({ label: l.label, value: l.value }));
    return (
      <div style={{ width: "100%" }}>
        <Select
          isDisabled={this.state.disabled}
          options={opts}
          onChange={(val) => {
            this.setState({ selected: val });
          }}
        />
        <div
          style={{ width: "100%", display: "flex", justifyContent: "center", margin: "10px" }}
        >
          <button
            disabled={this.state.disabled}
            className="button1"
            onClick={() => {
              this.setState({
                  disabled: true
              })
              this.props.triggerNextStep({
                trigger: "Location",
                value: {
                  platform: this.state.selected,
                },
              });
            }}
          >
            Save
          </button>
        </div>
      </div>
    );
  }
}

export default Example;
