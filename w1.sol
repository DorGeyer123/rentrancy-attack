pragma solidity 0.7.6;


interface customer{
    function receive2() external payable;


}
contract EtherRentrancy {


    
    uint x;
    mapping (address => uint256) public balances;
    
    
    address public owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function deposit() public payable{
        balances[msg.sender] += msg.value;
    }
    
    
    function withdraw(uint _amount) public {
        require (balances[msg.sender] >= _amount, "Insufficient funds");
        customer(msg.sender).receive2{value: _amount}();
        

        
        
        
        
        /*(bool sent, ) = msg.sender.call{value: _amount}("");
        require(sent, "Failed to send funds");*/
        
        balances[msg.sender] -= _amount;
    }
    
    function geteBalance() public view returns(uint256){
        return address(this).balance;
        
    }
    
}