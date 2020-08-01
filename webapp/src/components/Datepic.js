import React, { Component } from 'react';
import DatePicker from 'react-date-picker';
 
class Datepic extends Component {
  state = {
    date: new Date(),
    disabled: false
  }
 
  onChange = date => this.setState({ date })

  
 
  render() {
    return (
      <div style={{width: "100%", display: "flex", flexDirection: "row", justifyContent: "space-around"}}>
        <DatePicker
          disabled={this.state.disabled}
          onChange={this.onChange}
          value={this.state.date}
        />
        <button className="button1" disabled={this.state.disabled} onClick={() => {
          console.log(this.state.date);
          this.setState({
            disabled: true
          });
          this.props.triggerNextStep({ trigger: "Delay", value: this.state.date });
        }}>set date</button>
      </div>
    );
  }
}

export default Datepic;