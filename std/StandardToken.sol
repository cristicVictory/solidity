pragma solidity ^0.4.0;

import "./Token.sol";

contract StandardToken is Token {
	uint256 i_totalSupply;
	mapping (address => uint256) i_balanceOf;
	mapping (address =>
		mapping (address => uint256)) i_allowance;

	function StandardToken(address _initialOwner, uint256 _supply) {
		i_totalSupply = _supply;
		i_balanceOf[_initialOwner] = _supply;
	}

	function transfer(address _to, uint256 _value) returns (bool success) {
		if (i_balanceOf[msg.sender] >= _value && i_balanceOf[_to] + _value >= i_balanceOf[_to]) {
			i_balanceOf[msg.sender] -= _value;
			i_balanceOf[_to] += _value;
			Transfer(msg.sender, _to, _value);
			return true;
		} else {
			return false;
		}
	}

	function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
		if (i_allowance[_from][msg.sender] >= _value && i_balanceOf[_to] + _value >= i_balanceOf[_to]) {
			i_allowance[_from][msg.sender] -= _value;
			i_balanceOf[_to] += _value;
			Transfer(_from, _to, _value);
			return true;
		} else {
			return false;
		}
	}

	function approve(address _spender, uint256 _value) returns (bool success) {
		i_allowance[msg.sender][_spender] = _value;
		Approval(msg.sender, _spender, _value);
		return true;
	}

	function allowance(address _owner, address _spender) constant returns (uint256) {
		return i_allowance[_owner][_spender];
	}

	function balanceOf(address _owner) constant returns (uint256) {
		return i_balanceOf[_owner];
	}

	function totalSupply() constant returns (uint256) {
		return i_totalSupply;
	}
}
