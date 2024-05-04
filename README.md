# Babel: The Bitcoin Stablecoin

> Inspired by the innovation of [**Prisma Finance**](https://prismafinance.com/), Babel brings to the forefront a stablecoin, btcUSD, which is collateralized by Babylon-staked Bitcoin.
> 

## How Does Babylon’s Bitcoin Staking Design Work?

---

Babylon's Bitcoin Staking Design employs innovative protocols to extend Bitcoin's security to the decentralized world, focusing on trustless and self-custodian staking mechanisms. The key components include Bitcoin timestamping, which sends verifiable timestamps of data to Bitcoin, and Bitcoin staking, allowing Bitcoin to be staked trustlessly in decentralized systems.

In the event of a secret key leak, the only permitted action is to send the staked Bitcoin to a predefined burn address, ensuring security through a combination of a public EOTS key and a jury system. This system requires the coordination of multiple signatures for a slashing transaction (they do not burn Bitcoin - they allow others to claim it in a double-sign) to execute, specifically the leaked secret key and a jury's private key, which pre-signs this transaction.

To address trust and security concerns, the design includes mechanisms for emulating covenants through a jury system, utilizing a multi-signature setup to mitigate the risk of malicious actions by jury members.

![Screen Shot 2024-04-25 at 2.05.45 PM.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/ead55c70-8951-4ebd-8e4f-e1b6b49e7901/4a8e94d3-cecf-4809-9fcc-357e33cd5366/Screen_Shot_2024-04-25_at_2.05.45_PM.png)

## Why the Prisma Design?

---

- **Utilization of Liquid Staking Tokens (LSTs):** By leveraging Ethereum's LSTs, Prisma taps into a rich vein of assets that are both yield-generating and highly liquid. This approach allows users to maintain exposure to Ethereum's staking rewards while participating in DeFi activities, creating a bridge between staking and liquidity provision that enhances capital efficiency.
- **Incentive Alignment through Tokenomics:** Prisma's use of incentives, particularly through the distribution of its native token (for instance, PRISMA or its hypothetical Bitcoin equivalent, BABEL), aligns the interests of participants with the protocol's health and growth. This system encourages users to contribute to the protocol's liquidity, security, and governance, fostering a vibrant ecosystem where active participation is rewarded.
- **Decentralized Governance:** The protocol's governance model empowers token holders with decision-making authority over crucial aspects of the system, such as collateral parameters and fee structures. This decentralization ensures that the protocol can adapt and evolve according to the community's needs and perspectives, making it more resilient and responsive to changes in the broader DeFi landscape.
- **Security and Trust:** By building on top of Ethereum's PoS blockchain and utilizing a non-custodial approach, Prisma minimizes trust assumptions and reduces the risk of central points of failure. This security-first approach is crucial for maintaining user confidence and ensuring the safe custody of assets within the protocol.
- **Capital Efficiency:** Prisma's design allows users to mint stablecoins using their staked assets as collateral, offering a novel way to leverage staking investments without liquidating positions. This mechanism enhances capital efficiency within the DeFi space, enabling users to participate in additional yield-generating opportunities without compromising their long-term investment strategies.
- **Integration with Existing DeFi Ecosystems:** By incentivizing the use of its minted stablecoins on popular platforms like Curve and Convex Finance, Prisma ensures that its assets are deeply integrated into the DeFi ecosystem. This strategy not only boosts the utility and liquidity of its stablecoins but also contributes to a more interconnected and synergistic DeFi environment.

## How Does Babel Work?

---

![Screen Shot 2024-04-25 at 2.08.32 PM.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/ead55c70-8951-4ebd-8e4f-e1b6b49e7901/12ad3354-bd48-49ba-ab7a-5d83d9c84c81/Screen_Shot_2024-04-25_at_2.08.32_PM.png)

Prisma's model, when adapted to a Bitcoin-based framework, operates in the decentralized finance (DeFi) ecosystem by utilizing Bitcoin's liquid staking tokens to offer novel financial services. Here's a reimagined outline of Prisma's operation, with specific elements replaced to fit a Bitcoin-centric protocol:

- **Minting of btcUSD Stablecoin:** Users can mint a stablecoin, btcUSD, by providing Bitcoin liquid staking tokens as collateral. This process involves depositing accepted forms of Bitcoin-based LSTs into the protocol. These tokens represent staked Bitcoin that earns staking rewards, making them valuable collateral for minting btcUSD.
- **Incentivization on Curve and Convex Finance Analogs:** To enhance the utility and appeal of btcUSD within the DeFi space, the protocol will incentivize its circulation and staking on platforms like Curve and Convex Finance. Users can earn additional rewards by providing liquidity with btcUSD on these platforms, including trading fees, CRV (Curve's token), CVX (Convex Finance's token), and BABEL (the protocol's own token).
- **Decentralized and Non-Custodial:** The infrastructure is designed to be both decentralized and non-custodial, ensuring users maintain control over their assets. This approach aligns with the DeFi movement's principles, emphasizing transparency, user sovereignty, and minimal reliance on centralized financial institutions.
- **Governance Through BABEL Token:** The BABEL token is pivotal in the governance of the protocol. BABEL holders can participate in decision-making processes regarding the protocol's development, such as adjustments to collateral parameters, fee structures, and other crucial elements that influence the system's functionality and security.

## The Stablecoin Market

---

In the evolving landscape of digital finance, the stablecoin sector has emerged as a critical junction for liquidity, stability, and innovation. The journey through 2023 has delineated a path marked by pivotal transformations, mirroring the broader cryptocurrency market's dynamism and the traditional financial system's complexities.

- **Fiat Reliance and Systemic Risks:** Instances such as the transient destabilization of USDC's peg, following the untimely downfall of a banking institution holding a portion of its reserves, starkly underscore the vulnerabilities tied to the traditional banking sector's vicissitudes.
- **Centralized Control and Transparency Deficit:** The saga of USDT, riddled with scrutiny over the opacity of its reserves and centralized issuance, exemplifies the perils of centralization—raising alarms about the potential for manipulation and the assurance of backing.
- **Regulatory Whirlwind:** The narrative of Libra (rebranded to Diem) vividly illustrates the convoluted journey through the regulatory labyrinth, highlighting the critical need for navigating the mosaic of global regulatory landscapes with dexterity.
- **Liquidity and Market Stress:** The Black Thursday of March 2020 serves as a grim reminder of the liquidity crises that can besiege the DeFi platforms, testing the stability mechanisms of stablecoins and their ability to maintain liquidity under duress.
- **Hedging Limitations:** The rebound saga post-March 2020 paints a vivid picture of the limitations inherent in traditional stablecoins as hedging instruments, where their holders missed the ensuing rally, underlining the need for a solution that encapsulates both stability and the growth potential of underlying assets.
- **Inflationary Exposures:** The pegging of stablecoins like USDT and USDC to inflation-prone fiat currencies, such as the USD, inadvertently subjects their holders to the whims of monetary inflation, thereby diluting the real value of their digital holdings over time.
- **Volatility in Returns:** The fluctuating DAI Savings Rate (DSR) by MakerDAO exemplifies the unpredictable nature of returns in the current DeFi landscape, underscoring the quest for stability in yield generation.
- **Complexity and Catastrophes:** The downfall of TerraUSD (UST) encapsulates the catastrophic potential of complex stablecoin mechanisms, showcasing the dire need for simplicity, transparency, and resilience in design.

In addressing these critiques, the proposition of a Bitcoin-backed stablecoin emerges as a beacon of innovation, drawing upon the foundational security, decentralization, and market trust vested in Bitcoin. This novel stablecoin archetype proposes:

- A departure from traditional financial system dependencies, thus mitigating systemic risks and enhancing resilience against traditional banking sector's instabilities.
- A paradigm shift towards decentralization and transparency, countering the centralization and opacity issues that plague current offerings.
- An inherent capability to navigate the regulatory landscapes with agility, leveraging Bitcoin's established global acceptance and regulatory familiarity.
- Superior liquidity solutions, especially crucial during market stress periods, by tapping into Bitcoin's liquidity pool.
- A hedging mechanism that marries the stability of stablecoins with the growth potential of Bitcoin, offering a hedge that captures upside during market recoveries.
- Protection against fiat inflation, by anchoring the stablecoin's value to Bitcoin, thereby insulating holders from fiat currency devaluations.
- Predictable and stable returns in the DeFi ecosystem, heralding a new era of yield generation mechanisms that balance stability with growth.
- Simplicity in design, eschewing the pitfalls of complexity that led to past catastrophes, thereby fostering trust and broader adoption.

## Babylon LST Architecture

---

![Screen Shot 2024-04-25 at 2.10.50 PM.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/ead55c70-8951-4ebd-8e4f-e1b6b49e7901/c92429c2-cc91-47ed-aab7-916b396e61e8/Screen_Shot_2024-04-25_at_2.10.50_PM.png)

The Babylon Bitcoin LST architecture introduces a novel approach to enhancing the security and liquidity of staked assets within the blockchain ecosystem. It is designed around three core security properties that ensure the integrity and functionality of the system:

- **Fully Slashable PoS Security:** This feature ensures that if there is a safety violation, one-third of the bitcoin stake is automatically slashed. This mechanism is predicated on the premise that as long as two-thirds of the bitcoin stake adheres to the PoS protocol honestly, the PoS chain remains operational and secure. This design principle guarantees the security of the network by incentivizing honest participation and penalizing malfeasance.
- **Staker Security:** Babylon's architecture prioritizes the protection of individual stakers, ensuring that each bitcoin staker has the ability to withdraw or "unbond" their funds, provided they comply with the PoS protocol honestly. This security measure instills confidence among participants by safeguarding their investments against unjust losses, thereby promoting a trustworthy staking environment.
- **Token Deposit and Tokenization:** Users can deposit their Bitcoin LSTs into the Babylon protocol, engaging in a process akin to traditional liquid staking mechanisms. This step seamlessly integrates Bitcoin into the PoS ecosystem, overcoming the native liquidity constraints associated with traditional staking. Upon deposit, Babylon issues derivative tokens (e.g., stBTC or btcUSD), which embody the staked Bitcoin's value while ensuring that these assets remain liquid and functional within the DeFi ecosystem.
- **Maintained Liquidity:** The derivative tokens issued by Babylon serve as a bridge, allowing users to retain the utility of their staked assets. These tokens can be traded, utilized across DeFi applications, or employed as collateral, thus preserving the assets' liquidity. This mechanism ensures that participants are not forced to choose between staking for network security and utilizing their assets for other financial pursuits, thereby resolving one of the critical dilemmas in the staking landscape.
- **Staking Rewards Distribution:** By pooling the staked Bitcoin LSTs and participating in the consensus mechanisms of secured PoS chains, Babylon capitalizes on the staking process to generate rewards. These rewards are then distributed to holders of the derivative tokens, aligning with their stake in the network. This approach not only incentivizes the staking process but also ensures that rewards are fairly allocated among participants, fostering a sustainable and rewarding ecosystem.

To enable the secure staking of bitcoin across different blockchain networks, Babylon employs a cross-chain staking architecture. In this system, the staked bitcoin remains secured in a script on the bitcoin network itself, while stakers are afforded the flexibility to designate their preferred validator on the secured chain. Importantly, the staked bitcoin is only at risk of being slashed if the designated validator commits offenses that are deemed slashable according to the protocol's guidelines.

The Babylon control plane plays a pivotal role in orchestrating the cross-chain staking architecture, delivering several key functionalities:

- **Bitcoin Timestamping Service:** It provides PoS chains with the ability to synchronize with the bitcoin network, ensuring consistency and reliability across different blockchain systems.
- **Marketplace and Tracking:** The control plane acts as a marketplace to match bitcoin stakes with PoS chains and meticulously tracks crucial staking and validation information, such as the registration and refreshment of EOTS keys.
- **Recording Finality Signatures:** It maintains a record of the finality signatures for PoS chains, further bolstering the security and integrity of the staking process.

By integrating these sophisticated mechanisms, the Babylon Bitcoin LST architecture heralds a new era in blockchain security and liquidity, offering a robust framework for the staking of bitcoin to secure remote chains. This innovative approach not only enhances the security of the blockchain ecosystem but also provides stakers with unprecedented liquidity and safety for their staked assets.

![Screen Shot 2024-04-25 at 2.11.43 PM.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/ead55c70-8951-4ebd-8e4f-e1b6b49e7901/efec7b1a-2f27-42b8-91a8-c72494d2763a/Screen_Shot_2024-04-25_at_2.11.43_PM.png)

## How Can We Use the Babylon LST Architecture

---

In the framework outlined by Babylon's Bitcoin Staking Litepaper, the protocol introduces a novel approach to enhancing Bitcoin's utility within the proof-of-stake (PoS) ecosystem. Initially, users, through their preferred BTC wallet interfaces such as OKX or equivalent, initiate a staking lock on the Bitcoin blockchain. This procedure securely earmarks their Bitcoin holdings for staking purposes, seamlessly integrating Bitcoin's robust security model with the flexibility and yield potential of the PoS paradigm.

Subsequently, users are afforded the opportunity to direct their staking power by selecting a Babylon PoS validator. This selection process is critical, as it aligns the user's staked assets with a validator that represents their interests and expectations for network participation and governance.

The primary Liquid Staking Token (LST), denoted as stBTC, is minted from this process (see [Lorenzo Protocol](https://lorenzo-protocol.gitbook.io/lorenzoprotocol/lorenzo-liquid-staking/stbtc-the-liquid-staking-token)). This token serves as a representation of the staked Bitcoin within the Babylon ecosystem, preserving the intrinsic value of the underlying asset while enabling its functionality within a PoS context.

Expanding upon this foundation, Babylon introduces an innovative mechanism allowing users to further leverage their stBTC holdings. By staking stBTC within designated pools, users can mint an overcollateralized stablecoin, referred to as btcUSD. This process not only enhances the liquidity and utility of staked Bitcoin but also contributes to a more capital-efficient ecosystem by facilitating a variety of DeFi activities underpinned by the inherent value and security of Bitcoin.

## Key Parameters

---

- **Total Value Staked:** Babel will run their own Babylon validator and in which stBTC stakers can “restake '' into and use as a base of operations for btcUSD minting.
- **Total Value Locked (TVL):** Babel aims to secure a substantial amount in TVL, indicating a strong user base and high liquidity within the platform.
- **Minted btcUSD:** The platform ensures that a significant volume of btcUSD is minted, showcasing the utility and demand for the stablecoin in the DeFi space.
- **Minimum Collateral Ratio (MCR):** Babel maintains an optimal MCR to ensure that each btcUSD is adequately backed, instilling confidence and stability in the stablecoin.
- **Debt Interest Rate:** The protocol is designed with a competitive debt interest rate, ensuring that the costs associated with minting btcUSD are reasonable and attractive to users.
- **Staked BTC APR:** Babel ensures that users receive competitive Annual Percentage Rates (APR) on their stBTC, making it an appealing choice for investors looking for steady returns.

## Who Uses Babel?

---

Babel caters to a diverse audience within the DeFi space:

- Holders of stBTC:
    - **Collateral Utilization:** Holders have the unique advantage of leveraging their stBTC as collateral to mint btcUSD, enabling a seamless transition of Bitcoin's value into the DeFi ecosystem. This process not only preserves the intrinsic value of their Bitcoin holdings but also amplifies their utility in decentralized finance applications.
    - **DeFi Participation:** By engaging in DeFi activities through Babel, stBTC holders can explore a vast array of yield-generating opportunities. This includes liquidity provision, participating in lending protocols, and exploring novel financial instruments that were previously inaccessible to Bitcoin holders, thereby maximizing their assets' potential.
- Issuers of Bitcoin LSTs:
    - **Liquidity Incentivization:** Babel empowers issuers to enhance the liquidity of their Bitcoin LSTs by providing incentives for actions that support the ecosystem's growth. This includes bonuses for minting btcUSD, thereby encouraging deeper market integration and liquidity provision.
    - **Flexible Incentive Structures:** Issuers can tailor their incentive programs to promote the minting of btcUSD with their specific LSTs, directing the flow of capital in ways that benefit both issuers and participants. This flexibility ensures that incentives align with the evolving needs of the DeFi space.
    - **Emissions Strategy:** With the ability to adjust emissions, issuers can stimulate specific behaviors within the Babel ecosystem. This might involve encouraging the use of particular collateral types or rewarding users for maintaining active borrow positions, further enhancing the protocol's dynamism.
    - **Support for LP Token Stakers:** Recognizing the crucial role of liquidity providers, issuers can direct emissions towards LP token stakers who contribute to the stability and depth of the market. This fosters a supportive environment for liquidity providers, ensuring their contributions are rewarded and incentivizing sustained participation.