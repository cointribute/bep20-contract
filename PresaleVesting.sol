// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IBEP20 {
  /**
   * @dev Returns the amount of tokens in existence.
   */
  function totalSupply() external view returns (uint256);

  /**
   * @dev Returns the token decimals.
   */
  function decimals() external view returns (uint8);

  /**
   * @dev Returns the token symbol.
   */
  function symbol() external view returns (string memory);

  /**
  * @dev Returns the token name.
  */
  function name() external view returns (string memory);

  /**
   * @dev Returns the bep token owner.
   */
  function getOwner() external view returns (address);

  /**
   * @dev Returns the amount of tokens owned by `account`.
   */
  function balanceOf(address account) external view returns (uint256);

  /**
   * @dev Moves `amount` tokens from the caller's account to `recipient`.
   *
   * Returns a boolean value indicating whether the operation succeeded.
   *
   * Emits a {Transfer} event.
   */
  function transfer(address recipient, uint256 amount) external returns (bool);

  /**
   * @dev Returns the remaining number of tokens that `spender` will be
   * allowed to spend on behalf of `owner` through {transferFrom}. This is
   * zero by default.
   *
   * This value changes when {approve} or {transferFrom} are called.
   */
  function allowance(address _owner, address spender) external view returns (uint256);

  /**
   * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
   *
   * Returns a boolean value indicating whether the operation succeeded.
   *
   * IMPORTANT: Beware that changing an allowance with this method brings the risk
   * that someone may use both the old and the new allowance by unfortunate
   * transaction ordering. One possible solution to mitigate this race
   * condition is to first reduce the spender's allowance to 0 and set the
   * desired value afterwards:
   * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
   *
   * Emits an {Approval} event.
   */
  function approve(address spender, uint256 amount) external returns (bool);

  /**
   * @dev Moves `amount` tokens from `sender` to `recipient` using the
   * allowance mechanism. `amount` is then deducted from the caller's
   * allowance.
   *
   * Returns a boolean value indicating whether the operation succeeded.
   *
   * Emits a {Transfer} event.
   */
  function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

  /**
   * @dev Emitted when `value` tokens are moved from one account (`from`) to
   * another (`to`).
   *
   * Note that `value` may be zero.
   */
  event Transfer(address indexed from, address indexed to, uint256 value);

  /**
   * @dev Emitted when the allowance of a `spender` for an `owner` is set by
   * a call to {approve}. `value` is the new allowance.
   */
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
  /**
   * @dev Returns the addition of two unsigned integers, reverting on
   * overflow.
   *
   * Counterpart to Solidity's `+` operator.
   *
   * Requirements:
   *
   * - Addition cannot overflow.
   */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    require(c >= a, 'SafeMath: addition overflow');

    return c;
  }

  /**
   * @dev Returns the subtraction of two unsigned integers, reverting on
   * overflow (when the result is negative).
   *
   * Counterpart to Solidity's `-` operator.
   *
   * Requirements:
   *
   * - Subtraction cannot overflow.
   */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    return sub(a, b, 'SafeMath: subtraction overflow');
  }

  /**
   * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
   * overflow (when the result is negative).
   *
   * Counterpart to Solidity's `-` operator.
   *
   * Requirements:
   *
   * - Subtraction cannot overflow.
   */
  function sub(
    uint256 a,
    uint256 b,
    string memory errorMessage
  ) internal pure returns (uint256) {
    require(b <= a, errorMessage);
    uint256 c = a - b;

    return c;
  }

  /**
   * @dev Returns the multiplication of two unsigned integers, reverting on
   * overflow.
   *
   * Counterpart to Solidity's `*` operator.
   *
   * Requirements:
   *
   * - Multiplication cannot overflow.
   */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
    if (a == 0) {
      return 0;
    }

    uint256 c = a * b;
    require(c / a == b, 'SafeMath: multiplication overflow');

    return c;
  }

  /**
   * @dev Returns the integer division of two unsigned integers. Reverts on
   * division by zero. The result is rounded towards zero.
   *
   * Counterpart to Solidity's `/` operator. Note: this function uses a
   * `revert` opcode (which leaves remaining gas untouched) while Solidity
   * uses an invalid opcode to revert (consuming all remaining gas).
   *
   * Requirements:
   *
   * - The divisor cannot be zero.
   */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    return div(a, b, 'SafeMath: division by zero');
  }

  /**
   * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
   * division by zero. The result is rounded towards zero.
   *
   * Counterpart to Solidity's `/` operator. Note: this function uses a
   * `revert` opcode (which leaves remaining gas untouched) while Solidity
   * uses an invalid opcode to revert (consuming all remaining gas).
   *
   * Requirements:
   *
   * - The divisor cannot be zero.
   */
  function div(
    uint256 a,
    uint256 b,
    string memory errorMessage
  ) internal pure returns (uint256) {
    require(b > 0, errorMessage);
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold

    return c;
  }

  /**
   * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
   * Reverts when dividing by zero.
   *
   * Counterpart to Solidity's `%` operator. This function uses a `revert`
   * opcode (which leaves remaining gas untouched) while Solidity uses an
   * invalid opcode to revert (consuming all remaining gas).
   *
   * Requirements:
   *
   * - The divisor cannot be zero.
   */
  function mod(uint256 a, uint256 b) internal pure returns (uint256) {
    return mod(a, b, 'SafeMath: modulo by zero');
  }

  /**
   * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
   * Reverts with custom message when dividing by zero.
   *
   * Counterpart to Solidity's `%` operator. This function uses a `revert`
   * opcode (which leaves remaining gas untouched) while Solidity uses an
   * invalid opcode to revert (consuming all remaining gas).
   *
   * Requirements:
   *
   * - The divisor cannot be zero.
   */
  function mod(
    uint256 a,
    uint256 b,
    string memory errorMessage
  ) internal pure returns (uint256) {
    require(b != 0, errorMessage);
    return a % b;
  }

  function min(uint256 x, uint256 y) internal pure returns (uint256 z) {
    z = x < y ? x : y;
  }

  // babylonian method (https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Babylonian_method)
  function sqrt(uint256 y) internal pure returns (uint256 z) {
    if (y > 3) {
      z = y;
      uint256 x = y / 2 + 1;
      while (x < z) {
        z = x;
        x = (y / x + x) / 2;
      }
    } else if (y != 0) {
      z = 1;
    }
  }
}

/**
 * @dev Cointribute - Presale - And you know it.
 */
contract CointributePresale {
  using SafeMath for uint256;
  
  uint256 constant MAX_AMOUNT = 2 ether;
  uint256 constant TOKENS_FOR_MAX_AMOUNT = 10000 ether;
  
  uint256 constant PRESALE_CLOSING = 1623974400;
  uint256 constant VESTING_START_TIME = 1624060800;
  uint256 constant VESTING_END_TIME = 1626566400;

  IBEP20 immutable public token;

  address payable private owner;
  
  struct Beneficiary {
    uint256 tokens;
    uint256 released;
    bool exists;
  }

  mapping (address => Beneficiary) private beneficiaries;
  uint256 public lockedTokens = 0;

  constructor (IBEP20 presaleToken) {
    token = presaleToken;
    owner = payable(msg.sender);
    
    /* Whitelist */ 
    beneficiaries[address(0)] = Beneficiary(0, 0, true);
  }
  
  function withdrawBalance() public {
    require(msg.sender == owner, "Error: only owner can withdraw balance");
    owner.transfer(address(this).balance);
  }
  
  function withdrawTokens() public {
    require(msg.sender == owner, "Error: only owner can withdraw tokens");
    require(block.timestamp > VESTING_START_TIME, "Error: tokens withdraw not allowed yet.");

    token.transfer(owner, token.balanceOf(address(this)).sub(lockedTokens));
  }
  
  function addBeneficiary(address beneficiary) public {
    require(msg.sender == owner, "Error: only owner can add beneficiary");
    require(!beneficiaries[beneficiary].exists, "Error: beneficiary already exists");

    beneficiaries[beneficiary] = Beneficiary(0, 0, true);    
  }
  
  function buyTokensFromBnb() payable public {
    require(beneficiaries[msg.sender].exists, "Error: wallet not whitelisted");
    require(block.timestamp < PRESALE_CLOSING, "Error: presale is closed.");
    require(msg.value > 0, "Error: You must send a minimum amount of BNB.");
    
    uint256 tokensWorth = TOKENS_FOR_MAX_AMOUNT.mul(msg.value).div(MAX_AMOUNT);
    uint256 newTokensBalance = beneficiaries[msg.sender].tokens.add(tokensWorth);
    require (newTokensBalance <= TOKENS_FOR_MAX_AMOUNT, "Error: maximum amount reached.");
    
    lockedTokens = lockedTokens.add(tokensWorth);
    beneficiaries[msg.sender].tokens = newTokensBalance;
  }
  
  /**
   * @dev Transfers vested tokens to beneficiary.
   */
  function release() public {
    return releaseForBeneficiary(msg.sender);
  }
  
  function releaseForBeneficiary(address beneficiary) public {
    require(beneficiaries[beneficiary].exists, "Error: wallet not whitelisted");
    require(block.timestamp > VESTING_START_TIME, "Error: too early to release.");

    uint256 unreleased = releasableAmount(beneficiary);
    require(unreleased > 0, "Error: nothing to release.");

    lockedTokens = lockedTokens.sub(unreleased);
    beneficiaries[beneficiary].released = beneficiaries[beneficiary].released.add(unreleased);
    token.transfer(beneficiary, unreleased);
  }
  
  /**
   * @dev Calculates the amount that has already vested but hasn't been released yet.
   */
  function releasableAmount(address beneficiary) view public returns (uint256) {
    require(beneficiaries[beneficiary].exists, "Error: wallet not whitelisted");
    return vestedAmount(beneficiary).sub(releasedAmount(beneficiary));
  }
  
  /**
   * @dev Calculates the amount that has already vested.
   */
  function vestedAmount(address beneficiary) view public returns (uint256) {
    require(beneficiaries[beneficiary].exists, "Error: wallet not whitelisted");
    uint256 totalBalance = totalAmount(beneficiary);
    
    if (block.timestamp >= VESTING_END_TIME) {
      return totalBalance;
    } else {
      return totalBalance.mul(block.timestamp.sub(VESTING_START_TIME)).div(VESTING_END_TIME - VESTING_START_TIME);
    }
  }
  
  /**
   * @dev Calculates the amount that has already vested but hasn't been released yet.
   */
  function releasedAmount(address beneficiary) view public returns (uint256) {
    require(beneficiaries[beneficiary].exists, "Error: wallet not whitelisted");
    return beneficiaries[beneficiary].released;
  }
  
  /**
   * @dev Get total amount of tokens for beneficiary
   */
  function totalAmount(address beneficiary) public view returns (uint256) {
    require(beneficiaries[beneficiary].exists, "Error: wallet not whitelisted");
    return beneficiaries[beneficiary].tokens;
  }
}
