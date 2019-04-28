import web3 from '../web3';
import VitaeFactory from './build/VitaeFactory.json';

const instance = new web3.eth.Contract(
	JSON.parse(VitaeFactory.interface),
	'0xF3DE7BA6869dbEB907F6aFcD6E43F21fd44E8248'
);

export default instance;