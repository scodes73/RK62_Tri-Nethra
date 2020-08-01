import React, { Component } from "react";
import Select from "react-select";
import "../App.css";
import slst from "./StateDistrict";

class Sdrop extends Component {
  constructor() {
    super();
    this.state = {
      state: null,
      dist: null,
      status: null,
      disabled: false,
      distDisable: true,
      isStatus: false,
      distlst: [],
      PsRegion: "",
    };
  }

  render() {
    const opts = slst.map((l) => ({ label: l.state, value: l.state }));
    return (
      <div style={{ width: "100%" }}>
        <div
          style={{
            width: "100%",
            display: "flex",
            justifyContent: "center",
            marginTop: "10px",
            marginBottom: "5px",
          }}
        >
          <label>Select state</label>
        </div>
        <Select
          isDisabled={this.state.disabled}
          onChange={(val) => {
            this.setState({ state: val.value, dist: null, distDisable: false });
            var ind = -1;
            console.log(val.value);
            slst.forEach((f, i) => {
              if (f.state === val.value) {
                ind = i;
                console.log(i);
              }
            });
            if (ind !== -1) {
              var d = slst[ind].districts;
              this.setState({
                distlst: d.map((l) => ({ label: l, value: l })),
              });
            }
          }}
          options={opts}
        />
        <div style={{ height: "10px" }} />
        <div
          style={{
            width: "100%",
            display: "flex",
            justifyContent: "center",
            marginTop: "10px",
            marginBottom: "5px",
          }}
        >
          <label>Select district</label>
        </div>
        <Select
          isDisabled={this.state.disabled || this.state.distDisable}
          onChange={(val) => {
            this.setState({ dist: val.value });
          }}
          options={this.state.distlst}
        >
          Select state
        </Select>
        <div style={{ height: "10px" }} />
        <div
          style={{
            width: "100%",
            display: "flex",
            justifyContent: "center",
            marginTop: "10px",
            marginBottom: "5px",
          }}
        >
          <label>Enter PS Region</label>
        </div>
        <div style={{ width: "100%" , display: "flex", justifyContent: "center"}}>
          <input
            id="new"
            disabled={this.state.disabled}
            onChange={(e) =>
              this.setState({
                PsRegion: e.target.value,
              })
            }
            style={{ alignSelf: "center", width: "75%",padding: "10px 5px" }}
          />
        </div>
        <div
          style={{
            marginTop: "20px",
            display: "flex",
            justifyContent: "center",
          }}
        >
          <button
            disabled={this.state.disabled}
            className="button1"
            onClick={() => {
              if (this.state.state === null || this.state.dist === null || this.state.PsRegion === "") {
                this.setState({
                  status: "Select a valid information!",
                  isStatus: true,
                });
              } else {
                this.setState({
                  disabled: true,
                  status: null,
                  isStatus: false,
                });
                this.props.triggerNextStep({
                  trigger: "explanation",
                  value: {
                    state: this.state.state,
                    district: this.state.dist,
                    psregion: this.state.PsRegion,
                  },
                });
              }
            }}
          >
            Set value
          </button>
        </div>
        {this.state.isStatus ? (
          <div style={{ margin: "10px" }}>{this.state.status}</div>
        ) : null}{" "}
      </div>
    );
  }
}

export default Sdrop;
