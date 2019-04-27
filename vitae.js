import web3 from '../web3';
import Vitae from './build/Vitae.json';

export default (address) => {
	return new web3.eth.Contract(
		JSON.parse(Campaign.interface), 
		address
	);
};