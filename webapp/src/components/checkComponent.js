import React , { Component } from 'react';
 class Check extends Component {
     componentWillMount(){
         console.log(this.props.steps.Category.value);
         this.props.steps.Category.value === 'Child Sex Abuse/Rape/Obstacenity' ? this.props.triggerNextStep({ trigger: "Categoty_CRSO" }) : this.props.triggerNextStep({ trigger: "Cyber_type"});
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