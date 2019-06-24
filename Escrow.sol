pragma solidity ^0.4.0;

contract Charity{


    address ch_id; //id of organisation
    bool ch_goal_completed; //check if goal is completed


//struct donor_info{
    //address donor; //id of donor
    //uint amount;  //amount donated
//}
//ch_org public organisation;

modifier check_goal{
    require(ch_goal_completed);
    _;
}
function constructor_donation(address recipient) public{
    
   // donation.donor=msg.sender;
    //donation.amount=msg.value;
    ch_id=recipient;
}

function getEth(uint amount) payable public {
        require(msg.value == amount);
        
}

function sendEth() public check_goal{
    ch_id.transfer(address(this).balance);
}

}