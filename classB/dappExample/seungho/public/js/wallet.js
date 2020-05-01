if (typeof web3 !== 'undefined') {
    console.log('Metamask가 설치되어 있습니다.')
	ethereum.enable();

	async function getAccount() {
		// 7. getAccount
		const accounts = await ethereum.enable();
		const account  = accounts[0];

		// 8. id myAddress 에 account 기입
		const showAccount = document.querySelector('#myAddress');
		showAccount.innerHTML = account;
	}
	
	getAccount()

	// 9. web3 이용, 지갑의 현재 잔액 보이기
	web3.eth.getBalance('0xe54d5586b27cca944ff6d8fb12ac7d6db4b2cfc1', function(req, res) {
		const showBalance = document.querySelector('#balance');
		showBalance.innerHTML = res.c[0];
	})
	
	// 10. id send 버튼이 클릭되면
	// 11. id sendAddress 의 값을 가져오고
	// 12. id value 의 값을 가져와서
	// 13. web3 를 이용해서 전송하기
	$("#send").on('click', async function () {
		let sendAddress = $('#sendAddress').val();
		let value = $('#value').val();

		web3.eth.sendTransaction({
			from: '0xe54d5586b27cca944ff6d8fb12ac7d6db4b2cfc1',
			to: sendAddress,
			value: value
		}, function(err, hash) {
			if (err) {
				console.log(err)
			} else {
				console.log(hash)
			}
		});
	});
	

} else {
    $(function () {
        alert('Metamask 설치하세요');
        window.location.href = 'https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=ko'
	})
}