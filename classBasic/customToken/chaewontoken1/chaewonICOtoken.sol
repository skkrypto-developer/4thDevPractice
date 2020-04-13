pragma solidity >=0.4.0 <0.6.0;

import "./ownable.sol";

contract cw1121Token is Ownable {
     string public name = "chaewon1121"; // Token의 이름 
     string public symbol = "cw1121"; // Token 이름의 줄임
     uint public totalcw1121 = 10000 ; // Token의 총 발행 량
     uint public balancecw1121 = 10000 ; // ICO기간 중 Token의 재고량
     uint public cw1121Price = 10 ** 17; // ETH대비 Token의 가격 1eth = 10 token
     uint public salesStatus; // Token ICO기간 중 Token의 판매 량
     
     uint public startTime; // Token ICO기간의 시작시간
     uint public deadline; // Token ICO기간의 마감 시간
     mapping (address => uint) public balanceOf; // 특정 Address이 가진 Token의 수

constructor (uint _salesMinutes) public{// Token의 CA를 배포할 때 ICO를 몇 분 동안 진행할지 입력

          startTime = now; // ICO시작 시간은 현재시간
          deadline = startTime + _salesMinutes * 1 minutes; // 마감시간 계산

     }
     
     modifier meetDeadline() {// ICO의 마감시간이 되었는지 체크하는 함수
          require(now < deadline);
          _; 
}

function () payable external meetDeadline  {// ETH를 송금 받으면, 자동으로 보낸 사람의 Token잔고를 올려주는 함수 
          uint amountcw1121 = msg.value / cw1121Price; // Token의 Price에 맞게 개수를 조절 1ETH = 10 TOKEN
          require(balancecw1121 >= amountcw1121 ); // Token의 잔고가 충분한지 검사
          balanceOf[msg.sender]+= amountcw1121; // Ether를 송금한 사람의 Token잔고 증가
          salesStatus+=amountcw1121; // 현재 Token 총 판매량 증가
          balancecw1121 -= amountcw1121; // 현재 Token의 남은 재고량 차감
     } 
     // ETH가 아닌 Token을 송금할 경우 Log로 저장하는 함수
     event Transfer(address indexed _from, address indexed _to, uint _value,    uint _time);
function transferFrom(address _from, address _to, uint256 _value)public{
require(balanceOf[_from] >= _value); // 보내는 사람의 잔고 확인, 없으면 롤백
balanceOf[_from] -= _value; // 보내는 사람의 잔고를 _value만큼 차감
balanceOf[_to] += _value; // 받는 사람의 잔고를 _value만큼 증가
emit Transfer(_from, _to, _value, now); // Transfer라는 event 함수 호출
   } 
   
        function withdraw(uint _amount) onlyOwner public{// onlyOwner modifier를 이용해 토큰의 CA에 대한 소유권이 있는 EOA만 누적된 ETH 출금
          require(now > deadline); // ICO기간이 지나고 나서 가능
          msg.sender.transfer(_amount); // CA 소유권이 있는 EOA에 TOKEN 송금
     }

 
function refunds() public  {// ICO의 마감시간 이전 ETH를 투자한 사람들에게 환불해주는 함수
          balancecw1121 += balanceOf[msg.sender]; // TOKEN의 재고량 검사
          uint ethValue = balanceOf[msg.sender] * cw1121Price; // 환불할 ETH의 개수 계산
          balanceOf[msg.sender] = 0; // 환불 요청한 EOA의 TOKEN 잔고 0으로 초기화
          msg.sender.transfer(ethValue); // ETH 환불처리
     }
 
}