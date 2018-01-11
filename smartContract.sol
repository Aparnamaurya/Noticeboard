pragma solidity ^0.4.0;

    // smart contract to add multiple authors by the admin, who can add news article
    
contract NoticeContract {

    // publicee variable notice which can only be amended by the admin
    
    string notice = "Hello World";
   
   // address of the admin: initialise once in constructor
    
    address issuer;
    // structure to store the information about the news article and its author
    struct news{
        string author;
        string news_article;
    }
    
    mapping(address => news) news_items;
    
    address[] authors;
    
    function add_author(address address_,string name) public ifIssuer {
        var inp = news_items[address_];
        news_items[address_].author=name;
        
                authors.push(address_)-1;
    }
    
    function getAuthors() view public returns(address[]){
       
        return (authors);
    }
    
    function get_news(address author_) view public returns(string,string) {
        news temp= news_items[author_];
        return (temp.author,temp.news_article);
    }
    
    function add_news(string add_news) {
    news_items[msg.sender].news_article = add_news;
    }
    
    function NoticeContract() {
        issuer = msg.sender;
    }
    
    modifier ifIssuer() {
        if(issuer != msg.sender) {
            revert();
        } else {
            _;
        }
    }
    
    function getNotice() constant returns(string) {
        return notice;
    }
    
    function setNotice(string newNotice) ifIssuer returns(string) {
        notice = newNotice;
        return notice;
    }
}

