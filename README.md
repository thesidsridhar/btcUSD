# Validator-Owned Liquidity
# Using Restaked Assets to Allocate Liquidity 

## Introduction: Restaked Liquidity 

Now that EigenLayer enables validators to restake their assets to provide security, the most effective way to increase EigenLayer adoption is to enable validators to restake their assets to provide liquidity. 

In this research article, we articulate why EigenLayer’s community should prioritize actively validated services (AVS) that focus on providing liquidity, potential directions for this liquidity-oriented AVS category, and what we are doing to lead that charge. 

## Desires: Validators, Protocols, and EigenLayer

There are numerous desires for multiple parties that validator-owned liquidity (VOL) seeks to fulfill.

### Validators
Higher yields on staked assets
Differentiated offering relative to other validators

### Protocols/Chains/dApps/DAOs
Increased security
Increased liquidity

### EigenLayer
More developers developing AVSs
More validators operating AVSs
More protocols using AVSs
More revenue

VOL can fulfill all of these desires. To understand how, let’s first understand what we mean by VOL.

## What is VOL?

Validator-owned liquidity is the idea that validators can create liquid-staking derivatives (LSDs) based on assets staked by that validator and use those LSDs to provide liquidity for the protocol(s) that it is validating. 

VOL is a riff on the protocol-owned liquidity (POL) concept that was coined by Olympus DAO. POL is when a protocol provides liquidity for its native asset in a decentralized exchange. VOL differs from POL in that VOL enables validators to own the liquidity while POL enables the protocol to own the liquidity. 

VOL also has similarities to LSDs—such as Lido’s stETH or Frax’s frxETH—in that it generates derivatives that are based on the validator’s staked assets. VOL differs from LSDs in that the validators remain the owner of the resulting derivative while liquid-staking providers enable non-validators to own the LSD.

For example, developers could build an AVS on EigenLayer that enables validators to turn their staked ETH into a new form liquid-staked ETH (e.g., validETH). If a validator is staking 32 ETH, this AVS could enable the validator to mint 30 validETH for the validator to allocate as it sees fit. The validETH would be redeemable for the underlying ETH at any time. The AVS would likey want to include security precautions, such as reducing the mint ratio of validETH per staked ETH, to help maintain the peg between ETH and validETH by accounting for slashing risk.

##  How Does VOL Fulfill Validator, Protocol, and EigenLayer Desires?

### Validators
VOL fulfills validator desires by increasing yield and differentiating its offering relative to other validators. Validators are already taking a risk on new protocols by choosing to provide security for those protocols. VOL enables validators to double-down on this bet by providing liquidity in addition to security. Validators could charge protocols extra for the liquidity provisioning service, thereby increasing the validator’s yield. The differing yields would also help validators differentiate their offerings relative to other validators because they would be able to offer delegators a broader risk/reward spectrum. Delegators would see validators offering a broader range of yields and delegate accordingly. 

### Protocols
VOL fulfills protocol desires by enabling them to receive liquidity in addition to security. New protocols need to source security to avoid ledger manipulation and liquidity to bootstrap the market for their native tokens. Restaking to provide security is a relatively well understood and accepted practice because staking is primarily about providing security, which makes restaking’s purpose nearly identical to the purpose of the initial stake. Restaking to provide liquidity complements the security offering by providing protocols with the second of its two most desirable services. 

### EigenLayer
VOL fulfills EigenLayer desires by increasing the development of AVSs, validators operating AVSs, protocols using AVSs, and protocol revenue. Using restaked assets to provide liquidity opens an entirely new category of AVS for developers to build. VOL is just one example—we list additional examples in the section below. Each AVS presents a promising opportunity for entrepreneurial developers to create businesses on EigenLayer. These liquidity-oriented AVSs will attract more validators because these AVSs will be able to offer increased yield and increased expressibility. It will also attract more protocols, thereby increasing EigenLayer revenue, because EigenLayer will be able to provide protocols with their two most desirable services: security and liquidity. 

## Additional Opportunities for Liquidity-Oriented AVSs

Creating validator-owned liquid-staking tokens pegged to ETH is just one of many possible liquidity-oriented AVSs. 

### New Stablecoin
Rather than create an LSD that is pegged to ETH, developers could create an AVS that uses validator collateral to generate a new stablecoin that is pegged to the $USD.

### More Existing Stablecoins
Rather than create a new stablecoin, existing DeFi protocols build their own AVSs that enable the issuance of their pre-existing stabletoken. For example, Maker could build an AVS that uses validator stake as collateral for the minting of DAI. 

### Institutional Liquidity
Developers could create an AVS that enables DeFi protocols to interact with other DeFi protocols. For example, this AVS could create markets for Uniswap to borrow DAI using validator-owned LP tokens as collateral.

## Conclusion

Enabling validators to restake their assets to provide liquidity is the most effective way to increase EigenLayer adoption. It is a win-win-win for everyone involved, including the validators, protocols, and EigenLayer itself. What starts as a simple liquid-staking derivative on validator capital can open a new category of institutional DeFi. The design space for this new category is enormous. If you are interested in helping us explore, design, and/or build this new category, we’d love to hear from you: DMs open @timewavelabs. 

Max Einhorn
Siddarth Sridhar 



