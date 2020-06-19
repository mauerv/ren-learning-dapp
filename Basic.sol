pragma solidity >=0.5.0

interface IERC20 {
	function balanceOf(address account) external view returns (uint256);
}

interface IGateway {
	function mint(bytes32 _pHash, uint256 _amount, bytes32 _nHash, bytes calldata _sig) external returns (uint256); 
	function burn(bytes calldata _to, uint256 _amount) external returns (uint256);
}

interface IGatewayRegistry {
	function getGatewayBySymbol(string calldata _tokenSymbol) external view returns (IGateway);
	function getTokenBySymbol(string calldata _tokenSymbol) external view returns (IERC20);
}

contract Basic {
	IGatewayRegistry public registry;

	constructor(IGatewayRegistry _registry) public {
		registry = _registry;
	}
}