const listABI = [
	{
		"constant": false,
		"inputs": [
			{
				"internalType": "string",
				"name": "_lock",
				"type": "string"
			}
		],
		"name": "postData",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"internalType": "uint256",
				"name": "index",
				"type": "uint256"
			}
		],
		"name": "getData",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getPostCount",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "posts",
		"outputs": [
			{
				"internalType": "string",
				"name": "lock",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	}
]
const listAddress = '0xc990b975e4d13db7ee76709c50772692c957e9ae';

if (typeof web3 !== 'undefined') {
    console.log('Metamask가 설치되어 있습니다.')
	ethereum.enable();
	
    let listContract = web3.eth.contract(listABI);
    let listContractInstance = listContract.at(listAddress);

	// 5. class btn-search 가 클릭 되면 이라는 이벤트 리스너 설정
    $('.btn-search').click(async function () {
		const accounts = await ethereum.enable();
		let account = accounts[0]

		// 6. id choices__inner 의 값을 가져오기
        let value = $('#choices__inner').val();


        listContractInstance.postData.sendTransaction(value, {from: account}, function (err, res) {
                if (err) {
                    console.log(err);
                } else {
					console.log(res)
                }
                alert('업로드가 성공했습니다.');
            });
        
    })    
} else {
    $(function () {
        alert('Metamask 설치하세요');
        window.location.href = 'https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=ko'
	})
}