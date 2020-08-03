import React, { Component } from "react";
import Select from "react-select";
import "../App.css";
import slst from "./StateDistrict";
//import PS_In from "./psComponent";

class Sdrop extends Component {
  constructor(props) {
    super(props);
    this.state = {
      state: "",
      dist: "",
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
    //const ps_in = PS_In.map((l) => ({ label: l.id, value: l.value }));
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
          <label>{this.props.steps.lang.value === ""?"Select state(Optional)":"राज्य चुनें(ऐच्छिक)"}</label>
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
          <label>{this.props.steps.lang.value === ""?"Select district(Optional)":"जिले का चयन करें(ऐच्छिक)"}</label>
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
          <label>{this.props.steps.lang.value === ""?"Enter PS Region/Pin Code(Optional)":"PS क्षेत्र दर्ज करें/पिन कोड(ऐच्छिक)"}</label>
        </div>
        <div
          style={{
            width: "100%",
            display: "flex",
            justifyContent: "center",
          }}
        ></div>
        {/* <Select
          isDisabled={this.state.disabled || this.state.distDisable}
          onChange={(val) => {
            this.setState({ PsRegion: val.value });
          }}
          options={ps_in}
        /> */}
        <input
          id="new"
          disabled={this.state.disabled}
          onChange={(e) =>
            this.setState({
              PsRegion: e.target.value,
            })
          }
          style={{ alignSelf: "center", width: "100%", padding: "10px 5px" }}
        />
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
                this.setState({
                  disabled: true,
                  status: null,
                  isStatus: false,
                });
                this.props.triggerNextStep({
                  trigger: this.props.steps.lang.value+"explanation",
                  value: {
                    state: this.state.state,
                    district: this.state.dist,
                    psregion: this.state.PsRegion,
                  },
                });
              
            }}
          >
            {this.props.steps.lang.value === ""?"Set value":"मूल्य ते करना"}
          </button>
        </div>
        {this.state.isStatus ? (
          <div style={{ margin: "10px" }}> {this.state.status}</div>
        ) : null}{" "}
      </div>
    );
  }
}

export default Sdrop;
