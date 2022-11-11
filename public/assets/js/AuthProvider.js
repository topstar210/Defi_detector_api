const providerOptions = {
    walletconnect: {
        package: WalletConnectProvider, // required
        options: {
            rpc: {
                56: "https://bsc-dataseed.binance.org/",
                97: "https://data-seed-prebsc-1-s1.binance.org:8545/",
            },
            network: "binance",
        },
    },
};

$(document).ready(() => {
    $("#walletconnect").click(function() {
        console.log("hello");

        // if (address) {
        //     return;
        // }

        // try {
        //     let web3 = new Web3(Web3.givenProvider);

        //     const provider = await web3Modal.connect();
        //     web3 = new Web3(provider);
        //     subscribeProvider(provider);

        //     const accounts = await web3.eth.getAccounts();
        //     const chain = await web3.eth.getChainId();
        //     setAddress(accounts[0]);
        //     setChainId(chain);
        // } catch (err) { 
        //     console.error(err);
        // }
    })
}) 