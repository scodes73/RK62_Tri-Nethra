import React, { Component } from 'react';
import Select from "react-dropdown-select";
import options from './platforms'
import { Button } from 'reactstrap';
class Example extends Component{
    constructor(props){
        super(props);
        this.state={
            selected: null,
        }
    }
    render(){
        const opts = options.map((l) => ({label: l.label, value: l.value}));
        return (
        <div>
                <Select options={opts} onChange={
                    (val) => {
                        this.setState({selected: val});
                        }
                    }  style={{paddingLeft: '120px',
                                paddingRight: '30px',
                                paddingBottom: '10px',
                                marginBottom: '10px'}}/>
                <Button style={{marginLeft: '8vw'}} onClick={() => {
                    this.props.triggerNextStep({
                        trigger: "Location",
                        value: {
                            platform: this.state.selected,
                        },
                    });
                }}>  
                Save
            </Button>
        </div>
        );
    }
}

export default Example;