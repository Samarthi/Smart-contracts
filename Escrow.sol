pragma solidity ^0.4.0;

import "browser/token.sol";
import "browser/Claims.sol";

contract Charity is MyFirstToken{
    
    mapping (address=>mapping(bytes32=>uint)) public due; 
    
    function donate(uint _amount,address _recipient,bytes32 _key) public returns (bool){
        ClaimsRegistry a;
        if  (a.isApproved(_recipient,_recipient,_key)){
            return transfer(_recipient,_amount);
        }
        
            if (_amount > 0 && _amount <= balanceOf(msg.sender)) {
            __balanceOf[msg.sender] -= _amount;
            due[_recipient][_key]+=_amount;
            return true;
        }
        return false;
    }
    
    function ClearDues(address _recipient,bytes32 _key) public {
        __balanceOf[_recipient]+=due[_recipient][_key];
        due[_recipient][_key]=0;
    }
        
    
}