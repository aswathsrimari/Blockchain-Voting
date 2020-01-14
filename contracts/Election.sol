pragma solidity ^0.5.12;

contract Election{
    //model candidate
    //state variables dont have underscore
    //local variables prefixed with underscore
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }


    //store accounts that have voted
    mapping(address => bool) public voters;
    

    //uint= unsigned integer 
    mapping(uint => Candidate) public candidates; //candidates function generated to fetch candidate
    //uint =key Candidate = value //adding candidate changes the state of the contract
    uint public candidatesCount; //cannot find number of candidates nor iterate over mapping
    
    //voted event
    
   //constructor
    constructor () public {   //constructor will run when there is a deploy
        addCandidate("Candidate 1"); 
        addCandidate("Candidate 2");
    }
    
    
    function addCandidate (string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
    }

    function vote (uint _candidateId) public {
        //record that voter has voted
        //msg.sender   //function receives meta data as another argument (msg)
        //sender calling this function will send gas and gas is used only for require() and for 
        //other statements gas is refunded to the sender

        //require that they havent voted before
        require(!voters[msg.sender]);   //if condition = true  then following code will be evaluated

        //require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        //record that voter has voted
        voters[msg.sender] = true;   //key is address and value is true
        
        //update candidate vote count
        candidates[_candidateId].voteCount++;

        

    }

}