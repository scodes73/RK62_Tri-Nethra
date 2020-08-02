import React, { Component} from 'react';
import { CardBody, Card, Button } from 'reactstrap';

class Cards extends Component {
    constructor(props){
        super(props);
        this.state={
            cat: '',
            name: '',
        }
    }
    componentDidMount(){
        console.log(this.props.steps);
        this.setState({cat: this.props.steps.Category.value});
        try{
            if(this.props.steps.Category_2.value)
            this.setState({name: this.props.steps.Category_2.value});
        }catch{
            this.setState({name: this.props.steps.Category_1.value});
        }
    }
    render(){
        return (
            <div className="container">
                <div className="row">
                    <Card body inverse color="info">
                        <CardBody>
                            <div>
                                <img src="home.png" width='40px' height='40px' alt="logo"></img> Go to <a href="https://www.cybercrime.gov.in">www.cybercrime.gov.in</a> and click on "Report Anonymously" under {this.state.cat} related Crime<br></br>
                            </div>
                        </CardBody>
                    </Card>
                </div>
                <div className='row'>
                    <Card body inverse color="success">
                        <CardBody>
                            <div>
                            <p style={{paddingLeft: '10px'}}>Click on "File a Complaint" then click "I Accept".</p><br></br>
                                Please select {this.state.name} "Publishing or Transmitting in Electronic Form" under Category
                            </div>
                        </CardBody>
                    </Card>
                </div>
                <div className="row">
                    <Card body inverse color="warning">
                        <CardBody>
                            <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>For any assistance in reporting complaint dial 155260 (9 AM to 6 PM)<br></br>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>Such contents can also be reported at concerned social media platform(click)<br></br>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>Safety Tips on Sexual Obscenity Content(click)
                            </div>
                            <Button style={{marginLeft: '40px'}} onClick={
                                () => {
                                    this.props.triggerNextStep({trigger: 'Greetings'})
                                }
                            }> Go to Services </Button>
                        </CardBody>
                    </Card>
                </div>
            </div>
        );
    }
}

export default Cards;