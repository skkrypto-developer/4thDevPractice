
pragma solidity 0.5.12;

contract MyContract {
    uint[] ages; 
    
    function learnDataLocation(uint[] memory newAges) public returns (uint a) {
        ages = newAges; 
        uint16 age = 44; 
        uint[] storage studentAges = ages; 
        
        studentAges[0] = age; 
        
        return studentAges[0]; 
    }
}