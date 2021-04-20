// Niviecoin ICO

// Version of complier

progma solidity ^0.4.11;

contract niviecoin_ico {
    
    // Introducing the maximum number of Niviecoin avaliable for sale
    
    uint public max_niviecoin = 1000000;
    
    // Introducing USD to Niviecoin conversion private
    
    uint public usd_to_nivecoin = 1000;
    
    // Introducing the total number of Niviecoin bought by investors
    
    uint public total_niviecoin_bought = 0;
    
    // Mapping from the investor address to its equity in Niviecoin and USD
    
    mapping(address => uint) equity_niviecoin;
    mapping(address => uint) equity_usd;
    
    // Checking if an investor can buy Niviecoin
    
    modifier can_buy_niviecoin(uint usd_invested) {
        
        require (usd_invested * usd_to_nivecoin + total_niviecoin_bought <= max_niviecoin);
        _;
        
    }
    
    // Gettinng the equity in Niviecoin of an investor
    
    function equity_in_niviecoin(address investor) external constant returns (uint) {
    
        return equity_niviecoin[investor];
    
    }
    
    // Gettinng the equity in USD of an investor
    
    function equity_in_usd(address investor) external constant returns (uint) {
    
        return equity_usd[investor];
    
    }
    
    // Buy Niviecoin
    
    function buy_niviecoin(address investor, uint usd_invested) external
    
    can_buy_niviecoin(usd_invested) {
        
        uint niviecoin_bought = usd_invested * usd_to_nivecoin;
        
        equity_niviecoin[investor] += niviecoin_bought;
        
        equity_usd[investor] += niviecoin_bought = equity_niviecoin[investor] / usd_to_nivecoin;
        
        total_niviecoin_bought += niviecoin_bought;

    }
    
    // Selling Niviecoin
    
    function sell_niviecoin(address investor, uint niviecoin_sold) external {
        
        equity_niviecoin[investor] -= niviecoin_sold;
        
        equity_usd[investor] += niviecoin_bought = equity_niviecoin[investor] / usd_to_nivecoin;
        
        total_niviecoin_bought -= niviecoin_sold;

    }
    
}
