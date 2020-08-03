import React , { Component } from 'react';
 class Check extends Component {
     componentWillMount(){
         console.log(this.props.steps[this.props.steps.lang.value+"Category"].value);
         this.props.steps[this.props.steps.lang.value+"Category"].value === 'Child Sex Abuse/Rape/Obstacenity' ? this.props.triggerNextStep({ trigger: this.props.steps.lang.value+"Categoty_CRSO" }) : this.props.triggerNextStep({ trigger: this.props.steps.lang.value+"Cyber_type"});
     }
     render(){
         return(
             <div style={{
                fontSize: "15px",
              }}> 
                <p>Your Details will be confidential.
                </p>  
             </div>
         )
     }
 }
 
 export default Check;