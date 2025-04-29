// Example script for submitting weather data using the Stacks.js library

const { StacksTestnet } = require('@stacks/network');
const { makeSTXTokenTransfer, broadcastTransaction } = require('@stacks/transactions');
const { bufferCV, stringAsciiCV, intCV, standardPrincipalCV } = require('@stacks/transactions');

// Replace with your private key
const privateKey = 'your_private_key_here';

// Network configuration
const network = new StacksTestnet();

// Contract details
const contractAddress = 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM';
const contractName = 'weather-submit';
const functionName = 'submit-weather';

// Weather data to submit
const location = Buffer.from('New York City', 'ascii');
const temperature = 72; // in degrees
const condition = 'Sunny with clouds';

// Create Clarity values for the function arguments
const locationCV = bufferCV(location);
const temperatureCV = intCV(temperature);
const conditionCV = stringAsciiCV(condition);

// Create the transaction options
const txOptions = {
  contractAddress,
  contractName,
  functionName,
  functionArgs: [locationCV, temperatureCV, conditionCV],
  senderKey: privateKey,
  validateWithAbi: true,
  network,
  anchorMode: 1, // AnchorMode.ANY
};

// Submit the transaction
async function submitWeatherData() {
  try {
    const transaction = await makeContractCall(txOptions);
    const broadcastResponse = await broadcastTransaction(transaction, network);
    
    console.log('Transaction submitted!');
    console.log('Transaction ID:', broadcastResponse.txid);
    console.log('View transaction in explorer:', `https://explorer.stacks.co/txid/${broadcastResponse.txid}?chain=testnet`);
  } catch (error) {
    console.error('Error submitting weather data:', error);
  }
}

submitWeatherData();
