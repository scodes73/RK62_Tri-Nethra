import React, { Component } from "react";
import { firebase } from "./firebase";

class SearchStatus extends Component {
  constructor(props) {
    super(props);
    this.state = {
      docId: "",
      data: null,
      status: "",
      statusColor: "black",
    };
  }

  searchResult(id) {
    if (id !== "") {
      this.setState({
        status: "Fetching please wait ...",
        statusColor: "black",
        data: null,
      });
      const db = firebase.firestore();
      db.collection("Issues")
        .doc(id)
        .get()
        .then((doc) => {
          const data = doc.data();
          this.setState({
            data: {
              status: data.Status,
              remarks: data.Remarks,
            },
          });
          this.setState({
            status: "Data fetched successfully!",
            statusColor: "green",
          });
        })
        .catch((err) => {
          this.setState({
            status: "Check your id and try again",
            statusColor: "red",
            data: null,
          });
          console.log(err);
        });
    } else {
      this.setState({
        data: null,
        status: "Id cannot be empty!",
        statusColor: "red",
      });
    }
  }

  render() {
    return (
      <div>
        <div
          style={{
            width: "100%",
            display: "flex",
            flexDirection: "row",
            justifyContent: "space-around",
          }}
        >
          <input
            onChange={(val) => this.setState({ docId: val.target.value.trim() })}
          ></input>
          <div style={{ width: "10px" }} />
          <button
            className="button1"
            onClick={() => this.searchResult(this.state.docId)}
          >
            Search
          </button>
        </div>

        {this.state.status !== "" ? (
          <div
            style={{
              display: "flex",
              width: "100%",
              justifyContent: "center",
              margin: "10px",
              color: this.state.statusColor,
            }}
          >
            <span>{this.state.status}</span>
          </div>
        ) : null}

        {this.state.data !== null ? (
          <div
            style={{
              display: "flex",
              width: "100%",
              justifyContent: "center",
              margin: "10px",
            }}
          >
            <span>
              <p>
                Status: <strong>{this.state.data.status}</strong>
              </p>
              <p>
                Remarks: <strong>{this.state.data.remarks}</strong>
              </p>
            </span>
          </div>
        ) : null}
      </div>
    );
  }
}

export default SearchStatus;
