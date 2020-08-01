import React, { Component } from "react";
import { Map, GoogleApiWrapper, Marker } from "google-maps-react";

const mapStyles = {
  width: "auto",
  height: "auto",
};

class Demo1 extends Component {
  constructor() {
    super();
    this.state = {
      lat: 17.5177728,
      lon: 78.430208,
      marks: []
    };
  }
  onClick(coord, props) {
    const { latLng } = coord;
    var ms = this.state.marks;
    ms.push(
      {
        lat: latLng.lat(),
        lng: latLng.lng()
      }
    )
    this.setState({
      marks: ms
    })
    props.handleData(ms);
  }

  onMarkerClick(lat, lon){
    console.log("setting lat:"+lat+" and lon:"+lon);
  }

  removeM(ind, props){
    var ms = this.state.marks;
    ms.splice(ind, 1);
    this.setState({
      marks: ms
    })
    props.handleData(ms);
  }

  render() {
    return (
      <div>
        <Map
          google={this.props.google}
          zoom={14}
          style={mapStyles}
          initialCenter={{
            lat: this.state.lat,
            lng: this.state.lon,
          }}
          onClick={(t, map, coord) => this.onClick(coord, this.props)}
        >
          {(this.state.marks).map((mark, index) => <Marker key={index} onClick={() => this.removeM(index, this.props)} position={mark} />)}
          {/* <Marker position={{lat: this.state.lat, lng: this.state.lon}} title="select this position" onClick={() => this.onMarkerClick(this.state.lat, this.state.lon)} name="select this" /> */}
        </Map>
      </div>
    );
  }
}

export default GoogleApiWrapper({
  apiKey: "AIzaSyBdAZx-h1-hJ2ryzfWvrczACDzxBxiNxKM",
})(Demo1);
