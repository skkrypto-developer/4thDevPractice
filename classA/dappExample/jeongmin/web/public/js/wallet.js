if (typeof web3 !== 'undefined') {
	ethereum.enable();

	async function getAccount() {
		// 7. getAccount
		const myAccount = web3.eth.accounts[0]; 
		// 8. id myAddress 에 account 기입
		$('#myAddress').text(myAccount);	
	}
	
	// 9. web3 이용, 지갑의 현재 잔액 보이기
	async function getBalance(){
		const myAccount = web3.eth.accounts[0]; 
		web3.eth.getBalance(myAccount, function(err, result){
			$('#balance').text(result);
		});
	}

	// 10. id send 버튼이 클릭되면
	$('#send').on('click', async function () {
		const myAccount = web3.eth.accounts[0]; 

		const sendAddress = $('#sendAddress').val();
		const ethValue = $('#value').val(); 

		web3.eth.sendTransaction({
			from: myAccount,
			to: sendAddress,
			value: ethValue
		}, function(err, transactionHash) {
			console.log(transactionHash);
		});
		
    });

	getAccount();
	getBalance();
} else {
    $(function () {
        alert('Metamask 설치하세요');
        window.location.href = 'https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=ko'
	})
}