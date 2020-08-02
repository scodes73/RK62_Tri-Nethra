import React, {Component} from 'react';
import { Modal, ModalHeader, Button, ModalBody, Card, CardBody, CardSubtitle, CardTitle } from 'reactstrap';

class Safe extends Component{
    constructor(props){
        super(props);
        this.toggleModal1=this.toggleModal1.bind(this);
        this.toggleModal2=this.toggleModal2.bind(this);
        this.toggleModal3=this.toggleModal3.bind(this);
        this.toggleModal4=this.toggleModal4.bind(this);
        this.toggleModal5=this.toggleModal5.bind(this);
        this.toggleModal6=this.toggleModal6.bind(this);
        this.toggleModal7=this.toggleModal7.bind(this);
        this.state={
            isModalOpen1: false,
            isModalOpen2: false,
            isModalOpen3: false,
            isModalOpen4: false,
            isModalOpen5: false,
            isModalOpen6: false,
            isModalOpen7: false,
        }
    }
    toggleModal1() {
        this.setState({
            isModalOpen1: !this.state.isModalOpen1
        });
    }
    toggleModal2() {
        this.setState({
            isModalOpen2: !this.state.isModalOpen2
        });
    }
    toggleModal3() {
        this.setState({
            isModalOpen3: !this.state.isModalOpen3
        });
    }
    toggleModal4() {
        this.setState({
            isModalOpen4: !this.state.isModalOpen4
        });
    }
    toggleModal5() {
        this.setState({
            isModalOpen5: !this.state.isModalOpen5
        });
    }
    toggleModal6() {
        this.setState({
            isModalOpen6: !this.state.isModalOpen6
        });
    }
    toggleModal7() {
        this.setState({
            isModalOpen7: !this.state.isModalOpen7
        });
    }
    componentWillMount(){
        this.props.triggerNextStep({trigger: 'end_greet'})
    }
    render(){
        return(
            <React.Fragment>
                <Card body inverse color="white">
                        <CardTitle style={{color: 'black'}}>Safety Tips</CardTitle>
                        <CardBody style={{color: 'white'}}>
                            <Button className="bg-primary btn-block" onClick={this.toggleModal1} style={{marginBottom: '20px'}}>  Online Fraud/Scam </Button>
                            <Button className="bg-primary btn-block" onClick={this.toggleModal2} style={{marginBottom: '20px'}}> Social Media Safety </Button>
                            <Button className="bg-primary btn-block" onClick={this.toggleModal3} style={{marginBottom: '20px'}}> Online Bullying </Button>
                            <Button className="bg-primary btn-block" onClick={this.toggleModal4} style={{marginBottom: '20px'}}> Financial Fraud </Button>
                            <Button className="bg-primary btn-block" onClick={this.toggleModal5} style={{marginBottom: '20px'}}> Employment Fraud </Button>
                            <Button className="bg-primary btn-block" onClick={this.toggleModal6} style={{marginBottom: '20px'}}> Matrimonial Fraud </Button>
                            <Button className="bg-primary btn-block" onClick={this.toggleModal7} style={{marginBottom: '20px'}}> Mobile Hacking </Button>
                        </CardBody>
                    </Card>
                    <Modal isOpen={this.state.isModalOpen1} toggle={this.toggleModal1} className="modal-lg modal-content rounded-3" style={{borderRadius: '10px'}}>
                        <ModalHeader toggle={this.toggleModal1} style={{background: '#EF6C00'}}>Safety Tips</ModalHeader>
                        <ModalBody>
                    <Card body inverse color="primary">
                        <CardTitle style={{color: 'white'}}>Online Fraud/Scam</CardTitle>
                        <CardSubtitle style={{color: 'white',paddingLeft: '60px',paddingTop: '20px'}}>Internet fraud is a type of cybercrime fraud or deception which makes use of the Internet and could involve hiding of information or providing incorrect information for the purpose of tricking victims out of money, property, and inheritance.</CardSubtitle>
                        <CardBody style={{color: 'white'}}>
                            <div>
                            <i class="fa fa-hand-o-right" aria-hidden="true"></i> Never disclose your ATM or phone banking PIN, OTP, CVV number, etc. to anyone or respond to unknown emails or calls asking for such details. Sharing these may lead to unauthorized transactions
                            </div>
                            <div>
                            <i class="fa fa-hand-o-right" aria-hidden="true"></i> Do not click on any links within the email. These can contain viruses or take you to websites containing inappropriate material
                            </div>
                            <div>
                            <i class="fa fa-hand-o-right" aria-hidden="true"></i> Always check the web address of the web page you are visiting and ensure it is the correct address. Typographical mistakes may take you to a different site which may be malicious
                            </div>
                            <div>
                            <i class="fa fa-hand-o-right" aria-hidden="true"></i> While logging in or initiating an online transaction on any website, look out for secure "https" in the address of the website displayed on the address bar of browser. “https” indicates a secure connection and may help prevent "Man in the Middle Attack"
                            </div>
                            <div>
                            <i class="fa fa-hand-o-right" aria-hidden="true"></i> Always check your credit card and bank statements to make sure that the correct amount has been debited for your transactions. Timely reporting of fraudulent transactions may help you protect against losses
                            </div>
                            <div>
                            <i class="fa fa-hand-o-right" aria-hidden="true"></i> Always remember to log off from the website after completing an online transaction with your credit/ debit card and close the browser to protect against hacking attacks. It is a good practice to delete the browser cookies for enhanced protection
                            </div>
                            <div>
                            <i class="fa fa-hand-o-right" aria-hidden="true"></i> Never click links sent by any unidentified source for making online transactions. Even if you trust the source, check the web
                            </div>
                            </CardBody>
                        </Card>
                    </ModalBody>
                </Modal>
                <Modal isOpen={this.state.isModalOpen2} toggle={this.toggleModal2} className="modal-lg modal-content rounded-3">
                    <ModalHeader toggle={this.toggleModal2} style={{background: '#EF6C00'}}>Safety Tips</ModalHeader>
                    <ModalBody>
                        <Card body inverse color="success">
                            <CardTitle style={{color: 'white'}}>Social Media Safety</CardTitle>
                            <CardSubtitle style={{color: 'white',paddingLeft: '60px',paddingTop: '20px'}}>Said risks include threats of criminal activity, such as, stalking, bullying, identity theft, and hacking. Also, users may fall prey to impersonators who can cause damage to their reputation and standing with the very people they are trying to network with.</CardSubtitle>
                            <CardBody style={{color: 'white'}}>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> It is advisable to not post personal information like your full name, address, phone number, or any kind of financial or personal information on social media platforms. Such details may be misused by criminals and may cause you damage
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>  It is advisable to turn on location setting only for Apps you trust and for the duration you actually need to use location feature. Sharing your location on social media helps criminals to track your presence/absence to cause you harm
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>  Choose privacy setting on your social media applications appropriately to protect your privacy
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>  Do not use video chat services with unidentified persons. They might encourage you to do things that you would not normally do, such as expose yourself and record your physical circumstances
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Never respond and react to unsolicited or abusive posts
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Be careful while posting contents on social media. The contents must not be offensive, anti-religious, anti-national, and communal and terror- related. You may face legal action or you can be socially despised or trolled
                                </div>
                            </CardBody>
                        </Card>
                    </ModalBody>
                </Modal>
                <Modal isOpen={this.state.isModalOpen3} toggle={this.toggleModal3} className="modal-lg modal-content rounded-3">
                    <ModalHeader toggle={this.toggleModal3} style={{background: '#EF6C00'}}>Safety Tips</ModalHeader>
                    <ModalBody>
                        <Card body inverse color="info">
                            <CardTitle style={{color: 'white'}}>Online Bullying</CardTitle>
                            <CardSubtitle style={{color: 'white',paddingLeft: '60px',paddingTop: '20px'}}> Cyberbullying is when someone, typically a teenager, bullies or harasses others on the internet and in other digital spaces, particularly on social media sites. Harmful bullying behavior can include posting rumors, threats, sexual remarks, a victims' personal information, or pejorative labels (i.e. hate speech).</CardSubtitle>
                            <CardBody style={{color: 'white'}}>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Report Abuse - Most social networks allow you to report offensive and abusive material. After taking a screenshot, you should report it to the service provider
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>  Block - The easiest way to stop someone bothering you online is to block the person
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>  Never respond and react to unsolicited or abusive posts
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>  Choose privacy setting on your social media applications appropriately to protect your privacy
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>  If you are a victim of cyberstalking, report such incident to National Cyber Crime Reporting Portal/ Police. Also, save all communications with the stalker as evidence
                                </div>
                            </CardBody>
                        </Card>
                    </ModalBody>
                </Modal>
                <Modal isOpen={this.state.isModalOpen4} toggle={this.toggleModal4} className="modal-lg modal-content rounded-3">
                    <ModalHeader toggle={this.toggleModal4} style={{background: '#EF6C00'}}>Safety Tips</ModalHeader>
                    <ModalBody>
                        <Card body inverse color="warning">
                            <CardTitle style={{color: 'white'}}>Financial Fraud</CardTitle>
                            <CardSubtitle style={{color: 'white',paddingLeft: '60px',paddingTop: '20px'}}>Financial fraud happens when someone deprives you of your money, capital, or otherwise harms your financial health through deceptive, misleading, or other illegal practices.</CardSubtitle>
                            <CardBody style={{color: 'white'}}>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Always ensure that credit or debit card swipes are done in your presence to avoid skimming of your card information
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Never disclose your ATM or phone banking PIN, OTP, CVV number, etc. to anyone or respond to unknown emails or calls asking for such details. Sharing these may lead to unauthorized transactions
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Always remember to log off from the website after completing an online transaction with your credit/ debit card and close the browser to protect against hacking attacks. It is a good practice to delete the browser cookies for enhanced protection
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Periodically change the password of your online/internet banking accounts
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Keep your bank's customer care number handy so that you can report any suspicious transactions on your account immediately
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Register your phone number/email ID with your banker or stock broker and subscribe to mobile notifications. These notifications will alert you quickly for any suspicious transaction
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Immediately check SMS or email statements sent by depository after every transaction in Demat account. Check holding statement issued by broker every month
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Avoid keeping excess money in broking account; transfer money from savings account only at the time of purchase
                                </div>
                            </CardBody>
                        </Card>
                    </ModalBody>
                </Modal>
                <Modal isOpen={this.state.isModalOpen5} toggle={this.toggleModal5} className="modal-lg modal-content rounded-3">
                    <ModalHeader toggle={this.toggleModal5} style={{background: '#EF6C00'}}>Safety Tips</ModalHeader>
                    <ModalBody>
                        <Card body inverse color="danger">
                            <CardTitle style={{color: 'white'}}>Employment Fraud</CardTitle>
                            <CardSubtitle style={{color: 'white',paddingLeft: '60px',paddingTop: '20px'}}>Employment fraud is an attempt to defraud people who are seeking employment by giving them false hope of better employment, often with more favorable hours, better job duties, or higher wages.</CardSubtitle>
                            <CardBody style={{color: 'white'}}>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Beware of the emails, which offer jobs in exchange for money, such e-mails are spam
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>  Always look for the spelling errors in the e-mail address and job descriptions. If an email has spelling, grammatical and punctuation errors, it could be a scam
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>  Verify the address of the website before Logging into websites of Job Offer. Beware of phishing websites. Never respond to Job Offers received from unidentified sources through SMS or emails
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>  Always check the organization's website for Job offers and related details. All government websites end with [dot]gov[dot]in or [dot]nic[dot]in as part of their website address (e.g. mha.gov.in)
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> It is advisable to search and apply for jobs posted on prominent job portals. Be careful about the jobs posted on social media advertisements and search engine results labeled as sponsored links
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Beware of the unsolicited and fake callers representing employer organization. Never share your credentials or respond to such calls.
                                </div>
                            </CardBody>
                        </Card>
                    </ModalBody>
                </Modal>
                <Modal isOpen={this.state.isModalOpen6} toggle={this.toggleModal6} className="modal-lg modal-content rounded-3">
                    <ModalHeader toggle={this.toggleModal6} style={{background: '#EF6C00'}}>Safety Tips</ModalHeader>
                    <ModalBody>
                        <Card body inverse color="dark">
                            <CardTitle style={{color: 'white'}}>Matrimonial Fraud</CardTitle>
                            <CardSubtitle style={{color: 'white',paddingLeft: '60px',paddingTop: '20px'}}> After posting an impressive online profile on a matrimonial site, posing as prospective bridegroom, fraudsters befriend women. They use voice-changing apps to pose as the parents of the bridegroom when talking to the women they are trying to con.</CardSubtitle>
                            <CardBody style={{color: 'white'}}>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> It is advisable to meet the prospective match in a public place as you don’t know what kind of person he or she might be. Also, keep your family and friends informed about the meeting
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>  Always be careful while dealing with 'NRI' profiles on matrimonial websites. Commit to marriage only after ascertaining the credentials of match through face-to-face meetings, especially with the prospective match's parents/ relatives and validating any documents related to their address and employment abroad
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>  Be cautious, the moment someone asks you for money citing some reason or the other. Do not transfer funds or offer financial help to the prospective match and avoid further communication with him/her
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>  Conduct an end-to-end background check of the prospective match to avoid matrimonial frauds. Try to contact the family, friends, relatives, neighbors or associates of a prospective match to know more about him/her
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>  Never respond to the Matrimonial offers posted on social media platforms. This may land you in trouble
                                </div>
                            </CardBody>
                        </Card>
                    </ModalBody>
                </Modal>
                <Modal isOpen={this.state.isModalOpen7} toggle={this.toggleModal7} className="modal-lg modal-content rounded-3">
                    <ModalHeader toggle={this.toggleModal7} style={{background: '#EF6C00'}}>Safety Tips</ModalHeader>
                    <ModalBody>
                        <Card body inverse color="light">
                        <CardTitle style={{color: 'black'}}>Mobile Hacking</CardTitle>
                            <CardSubtitle style={{color: 'black',paddingLeft: '60px',paddingTop: '20px'}}>Phone hacking is the practice of manipulating or gaining unauthorized access to mobile phones, such as by intercepting telephone calls or accessing voicemail messages. When the unauthorized access is to the phone user's conversation, it is more commonly referred to as phone tapping.</CardSubtitle>
                            <CardBody style={{color: 'black'}}>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Do not leave your phone unattended in public places and refrain from sharing your phone password/pattern lock with anybody
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Always enable a password on the home screen to restrict unauthorized access to your mobile phone. Configure your device to automatically lock beyond certain duration
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Passwords should not be stored in a readable format or plain text in computers, notebook, or pasted on the monitor. Use password lockers and store in safe place
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Many mobile apps ask for permissions to access data and functions regardless of the necessity for the functioning of the app. Identify the nature of the app, assess the necessity of permissions asked while installing the app and avoid giving unwanted permissions
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Avoid using third-party extensions, plug-ins or add-ons for your web browser as it may secretly track your activity and steal your personal details
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Public Wi-Fi at Airports, Railway Stations, Bus Stops, etc. may be used only for normal internet surfing. It is advisable to avoid making online transactions or accessing personal information while using public/free Wi-Fi
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Install good antivirus on your mobile phone
                                </div>
                                <div>
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i> Avoid browsing unverified links received on social media
                                </div>
                            </CardBody>
                        </Card>
                    </ModalBody>
                </Modal>
            </React.Fragment>
        );
    }
}

export default Safe;