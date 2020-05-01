if (typeof web3 !== 'undefined') {
    console.log('Metamask가 설치되어 있습니다.')
	ethereum.enable();

	async function getAccount() {
		// 7. getAccount
		// 8. id myAddress 에 account 기입
	}
	
	getAccount()

	// 9. web3 이용, 지갑의 현재 잔액 보이기
	
    // 10. id send 버튼이 클릭되면
	// 11. id sendAddress 의 값을 가져오고
	// 12. id value 의 값을 가져와서
	// 13. web3 를 이용해서 전송하기

} else {
    $(function () {
        alert('Metamask 설치하세요');
        window.location.href = 'https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=ko'
	})
}