$(function () {
    getData();
    var normalRowStyle = "vertical-align: middle;padding-right:5px !important;padding-left:5px !important;text-align:center;";
    
    let bnbPrice0 = 0, maticPrice0 = 0; avaxPrice0 = 0;
    const abi = [{
        "inputs": [
            {
                "internalType": "uint256",
                "name": "amountIn",
                "type": "uint256"
            },
            {
                "internalType": "address[]",
                "name": "path",
                "type": "address[]"
            }
        ],
        "name": "getAmountsOut",
        "outputs": [
            {
                "internalType": "uint256[]",
                "name": "amounts",
                "type": "uint256[]"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    }];
    const Web3Instance = new Web3('https://api.avax.network/ext/bc/C/rpc');
    const TradejoeRounterContract = new Web3Instance.eth.Contract(abi, '0x60aE616a2155Ee3d9A68541Ba4544862310933d4');
    console.log('Contract: ', TradejoeRounterContract);
    const fromWei = (wei, unit = "ether") => parseFloat(Web3.utils.fromWei(wei, unit)).toFixed(3);
    const toWei = (amount, unit = "ether") => Web3.utils.toWei(amount, unit);

    const getTVL = async (contractAddress, chainID, tokenKind) => {
        try {
            if (chainID.includes('bscscan.com')) {
                if (tokenKind == 'BUSD') {
                    let res = await axios.get(`https://api.bscscan.com/api?module=account&action=tokenbalance&contractaddress=0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56&address=${contractAddress}&tag=latest&apikey=YGKJFMK5FW1H9T9GR9VTGIT2UC5PXUTDTB`);
                    var formatter = new Intl.NumberFormat('en-US', {
                        style: 'currency',
                        currency: 'USD',
                    });
                    
                    return formatter.format(fromWei(res.data.result));
                } else if (tokenKind == 'USDT') {
                    let res = await axios.get(`https://api.bscscan.com/api?module=account&action=tokenbalance&contractaddress=0x55d398326f99059fF775485246999027B3197955&address=${contractAddress}&tag=latest&apikey=YGKJFMK5FW1H9T9GR9VTGIT2UC5PXUTDTB`);
                    var formatter = new Intl.NumberFormat('en-US', {
                        style: 'currency',
                        currency: 'USD',
                    });
                    
                    return formatter.format(fromWei(res.data.result));
                } else if (tokenKind == 'BNB') {
                    var bnbPrice = 0;
                    if (bnbPrice0 == 0) {
                        let res = await axios.get(`https://api.bscscan.com/api?module=stats&action=bnbprice`);
                        bnbPrice = res.data.result.ethusd;
                        bnbPrice0 = bnbPrice;
                    } else {
                        bnbPrice = bnbPrice0;
                    }
                    let res2 = await axios.get(`https://api.bscscan.com/api?module=account&action=balance&address=${contractAddress}&tag=latest&apikey=YGKJFMK5FW1H9T9GR9VTGIT2UC5PXUTDTB`);
                    var formatter = new Intl.NumberFormat('en-US', {
                        style: 'currency',
                        currency: 'USD',
                    });
    
                    var bnbAmount = fromWei(res2.data.result);
                    return formatter.format(bnbPrice * bnbAmount);
                } else {
                    return 0;
                }
            } else if (chainID.includes('polygonscan.com')) {
               if (tokenKind == 'USDT') {
                    let res = await axios.get(`https://api.polygonscan.com/api?module=account&action=tokenbalance&contractaddress=0xc2132D05D31c914a87C6611C10748AEb04B58e8F&address=${contractAddress}&tag=latest&apikey=ECEWNKQPU3NC3JHRWDJEQZJKNB2PM98XZC`);
                    var formatter = new Intl.NumberFormat('en-US', {
                        style: 'currency',
                        currency: 'USD',
                    });
                    console.log("USDT: ", res.data.result);
                    return formatter.format(res.data.result / 1000000);
                } else if (tokenKind == 'MATIC') {
                    var maticPrice = 0;
                    if (maticPrice0 == 0) {
                        let res = await axios.get(`https://api.polygonscan.com/api?module=stats&action=maticprice&apikey=ECEWNKQPU3NC3JHRWDJEQZJKNB2PM98XZC`);
                        maticPrice = res.data.result.maticusd;
                        maticPrice0 = maticPrice;
                    } else {
                        maticPrice = maticPrice0;
                    }
                    let res2 = await axios.get(`https://api.polygonscan.com/api?module=account&action=balance&address=${contractAddress}&tag=latest&apikey=ECEWNKQPU3NC3JHRWDJEQZJKNB2PM98XZC`);
                    var formatter = new Intl.NumberFormat('en-US', {
                        style: 'currency',
                        currency: 'USD',
                    });
    
                    var maticAmount = res2.data.result / 1000000000000000000;
                    console.log("MATIC amount of ", contractAddress, ": ", res2.data.result / 1000000000000000000);
                    console.log("MATIC Price: ", maticPrice);
                    return formatter.format(maticPrice * maticAmount);
                } else {
                    return 0;
                }
            }  else if (chainID.includes('snowtrace.io')) {
                if (tokenKind == 'AVAX') {
                     var avaxPrice = 0;
                     console.log("AVAX ====>");
                     if (avaxPrice0 == 0) {
                        //  let res = await axios.get(`https://api.snowtrace.io/api?module=stats&action=avaxprice&apikey=ZVI4N9MEVBXDANDD4NPSXQI2NZEC9SYESU`);
                        const prices = await TradejoeRounterContract.methods.getAmountsOut(toWei('1'), ["0xb31f66aa3c1e785363f0875a1b74e27b85fd66c7","0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E"]).call();
                        avaxPrice = prices[1]/1000000;

                        avaxPrice0 = avaxPrice;
                     } else {
                         avaxPrice = avaxPrice0;
                     }
                     let res2 = await axios.get(`https://api.snowtrace.io/api?module=account&action=balance&address=${contractAddress}&tag=latest&apikey=ZVI4N9MEVBXDANDD4NPSXQI2NZEC9SYESU`);
                     var formatter = new Intl.NumberFormat('en-US', {
                         style: 'currency',
                         currency: 'USD',
                     });
                    
                     var avaxAmount = fromWei(res2.data.result);
                     console.log("Avax Amount = ", avaxAmount, " : ", avaxPrice * avaxAmount);
                     return formatter.format(avaxPrice * avaxAmount);
                 } else {
                     return 0;
                 }
            } else {
                return 0;
            }
            
        } catch (e) {
            console.log(e);
            return 0;
        }
    }

    async function getData() {
        const result = await axios.get("/admin/dapps/get");
        const res = result.data;
        if (res) {
            $("#dappsTbody").html("");
            if (res.length == 0) {
                $("#dappsTbody").html('<tr><th scope="col" colspan=15 style="text-align:center;vertical-align:middle;">No Data</th></tr>');
            }
            for (var i = 0; i < res.length; i++) {
                var rowLevelStyle = "";
                var color = "color: #ffffff";
                var buyBtnBG = "";
                switch (res[i]['level']) {
                    case 1:
                        rowLevelStyle = "background: #00004e; color: yellow;";
                        color = "color: yellow;";
                        buyBtnBG = "bg-warning";
                    case 2:
                        if (res[i + 1]) {
                            if (res[i + 1]['level'] != res[i]['level']) {
                                rowLevelStyle += "border-bottom: solid 10px white !important;color: yellow; ";
                            }
                        }
                        color = "color: yellow;";
                        break;
                    case 3:
                        break;
                    default:
                        break;
                }

                var contractAddress = res[i]['contract'];
                var chainID = contractAddress.slice(8, contractAddress.length - 51);
                console.log("chainID ===> ", chainID);

                contractAddress = contractAddress.slice(contractAddress.length-42);
                
                var tokenKind = res[i]['coin_token'];

                var contractTVL = await getTVL(contractAddress, chainID, tokenKind);

                var row = "";
                var tg = '<a href="' + res[i]['tg_group'] + '" target="_blank"><span class="badge badge-pill badge-primary">telegram</span></a>';
                var discode = '<a href="' + res[i]['discode_link'] + '" target="_blank"><span class="badge badge-pill badge-primary">discord</span></a>';
                var twitter = '<a href="' + res[i]['twitter_link'] + '" target="_blank"><span class="badge badge-pill badge-primary">twitter</span></a>';
                var audit = '<a href="' + res[i]['audit'] + '" target="_blank"><span class="badge badge-pill badge-primary">audit</span></a>';
                var contract = '<a href="' + res[i]['contract'] + '" target="_blank"><span class="badge badge-pill badge-primary">contract</span></a>';
                var defiBadge = '<a href="' + res[i]['kyc'] + '" target="_blank"><span class="badge badge-pill badge-primary">defi badge</span></a>';
                row += "<tr style='" + rowLevelStyle + "' rid='" + res[i]['id'] + "'>";
                row += '<td style="' + normalRowStyle + '"><img src="' + res[i]['logo_url'] + '" alt="" height="50" data-xblocker="passed" style="visibility: visible;"></td>';
                row += '<th style="' + normalRowStyle + '" scope="row"><a target="_blank" href="' + res[i]['mining_group_url'] + '" style="' + color + '">' + res[i]['mining_group'] + '</a></th>';
                row += '<td style="' + normalRowStyle + '">' + (res[i]['kyc'] ? defiBadge : "") + '</td>';
                row += '<td style="' + normalRowStyle + '">' + (res[i]['tg_group'] ? tg : "") + '</td>';
                row += '<td style="' + normalRowStyle + '">' + (res[i]['discode_link'] ? discode : "") + '</td>';
                row += '<td style="' + normalRowStyle + '">' + (res[i]['twitter_link'] ? twitter : "") + '</td>';
                row += '<td style="' + normalRowStyle + '">' + (res[i]['coin_token'] ? res[i]['coin_token'] : "") + '</td>';
                row += '<td style="' + normalRowStyle + '">' + (res[i]['contract'] ? contract : "") + '</td>';
                row += '<td style="' + normalRowStyle + '">' + (res[i]['audit'] ? audit : "") + '</td>';
                row += '<td style="' + normalRowStyle + '">' + (res[i]['fees'] ? res[i]['fees'] : "") + '</td>';
                row += '<td style="' + normalRowStyle + '">' + (res[i]['ages'] ? moment(res[i]['ages'], "").fromNow(true) : "") + '</td>';
                row += '<td style="' + normalRowStyle + '">' + (res[i]['daily'] ? res[i]['daily'] : "") + '</td>';
                row += '<td style="' + normalRowStyle + '">' + (contractTVL) + '</td>';
                // row += '<td style="' + normalRowStyle + '">' + (res[i]['tvl_24h'] ? res[i]['tvl_24h'] : "") + '</td>';
                // row += '<td style="' + normalRowStyle + '"><a href="'+res[i]['mining_group_url']+'" target="_blank"><button type="button" class="btn btn-light px-3 ' + buyBtnBG + '">Buy</button></a></td>';
                row += "</tr>";
                $("#dappsTbody").append(row);
            }
        }
    }
});

