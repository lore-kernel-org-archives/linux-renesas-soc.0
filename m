Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1398C282CE
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 07:47:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76D81213F2
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 07:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="KssKc+J1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfDHHrF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 03:47:05 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:47858 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbfDHHrF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 03:47:05 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C2BE725B766;
        Mon,  8 Apr 2019 17:46:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554709619; bh=3DtCZATA4o3aQmMTDpyKElLqptrr/+Lp03UuCOAMPGo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KssKc+J1rK7xTketozZtwgEVkFY360/JyizmEQbTG/bjhrToR3z7nYhISLKzNPSbr
         xkjRNYm362j2VqljHSoSeXSTzalySPKf/Z0PpYD1Uyqa2c5e5ATZl2fbhvTH9LeXMv
         ulCqC8qIPHZXJyEGRwCigrNuOVz5GLmTbS/RiL0k=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 27DAD94069B; Mon,  8 Apr 2019 09:46:57 +0200 (CEST)
Date:   Mon, 8 Apr 2019 09:46:56 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        David Miller <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: fix autoneg mismatch case in
 genphy_read_status
Message-ID: <20190408074651.kgiqinjzk43bq6kr@verge.net.au>
References: <ad288d85-ea57-82bc-5711-1a0fbaad2aa8@gmail.com>
 <20190405161628.67z7acycfu7beqln@verge.net.au>
 <c5421a7b-dcb5-cfb1-1123-90a785a951e6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5421a7b-dcb5-cfb1-1123-90a785a951e6@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 05, 2019 at 07:40:51PM +0200, Heiner Kallweit wrote:
> On 05.04.2019 18:16, Simon Horman wrote:
> > On Tue, Apr 02, 2019 at 08:43:30PM +0200, Heiner Kallweit wrote:
> >> The original patch didn't consider the case that autoneg process
> >> finishes successfully but both link partners have no mode in common.
> >> In this case there's no link, nevertheless we may be interested in
> >> what the link partner advertised.
> >>
> >> Like phydev->link we set phydev->autoneg_complete in
> >> genphy_update_link() and use the stored value in genphy_read_status().
> >> This way we don't have to read register BMSR again.
> >>
> >> Fixes: b6163f194c69 ("net: phy: improve genphy_read_status")
> >> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > 
> > Hi,
> > 
> > I have observed a regression with this patch as present as
> > 4950c2ba49cc ("net: phy: fix autoneg mismatch case in genphy_read_status")
> > in net-next.
> > 
> > The platform is the Renesas R-Car E3 (r8a77990) based Ebisu-4D board.
> > 
> > 
> > Without this patch (commit before 4950c2ba49cc) the link is negotiated
> > as follows:
> > 
> > [    3.257699] libphy: ravb_mii: probed
> > [    3.266498] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:03:85:38, IRQ 104.
> > [    3.537082] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
> > [    9.667161] ravb e6800000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
> > 
> > # ethtool --version
> > ethtool version 3.16
> > # ethtool eth0
> > Settings for eth0:
> >         Supported ports: [ TP MII ]
> >         Supported link modes:   100baseT/Full 
> >                                 1000baseT/Full 
> >         Supported pause frame use: No
> >         Supports auto-negotiation: Yes
> >         Advertised link modes:  100baseT/Full 
> >                                 1000baseT/Full 
> >         Advertised pause frame use: No
> >         Advertised auto-negotiation: Yes
> >         Link partner advertised link modes:  10baseT/Half 10baseT/Full 
> >                                              100baseT/Half 100baseT/Full 
> >                                              1000baseT/Full 
> >         Link partner advertised pause frame use: No
> >         Link partner advertised auto-negotiation: Yes
> >         Speed: 1000Mb/s
> >         Duplex: Full
> >         Port: MII
> >         PHYAD: 0
> >         Transceiver: external
> >         Auto-negotiation: on
> >         Supports Wake-on: g
> >         Wake-on: d
> >         Current message level: 0x000000cc (204)
> >                                link timer rx_err tx_err
> >         Link detected: yes
> > 
> > 
> > With this patch the link is negotiated as follows, note the "Unknown":
> > 
> > [    3.268609] libphy: ravb_mii: probed
> > [    3.277402] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:03:85:38, IRQ 104.
> > [    3.565057] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
> > [    9.804423] ravb e6800000.ethernet eth0: Link is Up - Unknown/Unknown - flow control off
> > 
> Looks like the PHY doesn't set the "aneg complete" bit. But then, how
> can the link be up? Could you please add a debug output in
> genphy_update_link() printing the value of register BMSR?

I added the following debug patch:

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 72fc714c9427..88c6cf79c438 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1710,6 +1710,7 @@ int genphy_update_link(struct phy_device *phydev)
 	 */
 	if (!phy_polling_mode(phydev)) {
 		status = phy_read(phydev, MII_BMSR);
+		pr_err("1: MII_BMSR=0x%08x\n", status);
 		if (status < 0) {
 			return status;
 		} else if (status & BMSR_LSTATUS) {
@@ -1720,6 +1721,7 @@ int genphy_update_link(struct phy_device *phydev)
 
 	/* Read link and autonegotiation status */
 	status = phy_read(phydev, MII_BMSR);
+	pr_err("2: MII_BMSR=0x%08x\n", status);
 	if (status < 0)
 		return status;
 

And the out put is as follows:

# dmesg | egrep '(ravb|libphy|Mic)'
[    2.028963] libphy: Fixed MDIO Bus: probed
[    3.244122] ravb e6800000.ethernet: ignoring dependency for device, assuming no driver
[    3.256398] libphy: ravb_mii: probed
[    3.264867] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:03:85:38, IRQ 104.
[    3.551385] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
[    3.569904] libphy: 1: MII_BMSR=0x00007949
[    3.574397] libphy: 2: MII_BMSR=0x00007949
[    9.899946] libphy: 1: MII_BMSR=0x0000796d
[    9.904786] ravb e6800000.ethernet eth0: Link is Up - Unknown/Unknown - flow control off

# ethtool eth0
Settings for eth0:
        Supported ports: [ TP MII ]
        Supported link modes:   100baseT/Full 
                                1000baseT/Full 
        Supported pause frame use: No
        Supports auto-negotiation: Yes
        Advertised link modes:  100baseT/Full 
                                1000baseT/Full 
        Advertised pause frame use: No
        Advertised auto-negotiation: Yes
        Speed: Unknown!
        Duplex: Unknown! (255)
        Port: MII
        PHYAD: 0
        Transceiver: external
        Auto-negotiation: on
        Supports Wake-on: g
        Wake-on: d
        Current message level: 0x000000cc (204)
                               link timer rx_err tx_err
        Link detected: yes

> I wonder whether your case may be caused by a chip erratum. Item 5 in
> the errata documentation
> (http://ww1.microchip.com/downloads/en/DeviceDoc/80000692D.pdf)
> may be a candidate. Could you please check (as explained in the
> errata document) and report the exact PHY version?
> 
> Could you please also test with another link partner?

With a different link partner it seems that the problem remains:

root@Debian:~# dmesg | egrep '(ravb|libphy|Mic)'
[    2.023596] libphy: Fixed MDIO Bus: probed
[    3.243061] ravb e6800000.ethernet: ignoring dependency for device, assuming no driver
[    3.255157] libphy: ravb_mii: probed
[    3.263732] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:03:85:38, IRQ 104.
[    3.543377] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
[    3.561950] libphy: 1: MII_BMSR=0x00007949
[    3.566436] libphy: 2: MII_BMSR=0x00007949
[   12.798173] libphy: 1: MII_BMSR=0x0000796d
[   12.802974] ravb e6800000.ethernet eth0: Link is Up - Unknown/Unknown - flow control off
root@Debian:~# ethtool eth0
Settings for eth0:
        Supported ports: [ TP MII ]
        Supported link modes:   100baseT/Full 
                                1000baseT/Full 
        Supported pause frame use: No
        Supports auto-negotiation: Yes
        Advertised link modes:  100baseT/Full 
                                1000baseT/Full 
        Advertised pause frame use: No
        Advertised auto-negotiation: Yes
        Speed: Unknown!
        Duplex: Unknown! (255)
        Port: MII
        PHYAD: 0
        Transceiver: external
        Auto-negotiation: on
        Supports Wake-on: g
        Wake-on: d
        Current message level: 0x000000cc (204)
                               link timer rx_err tx_err
        Link detected: yes

> > And ethtool reports:
> > 
> > # ethtool eth0
> > Settings for eth0:
> >         Supported ports: [ TP MII ]
> >         Supported link modes:   100baseT/Full 
> >                                 1000baseT/Full 
> >         Supported pause frame use: No
> >         Supports auto-negotiation: Yes
> >         Advertised link modes:  100baseT/Full 
> >                                 1000baseT/Full 
> >         Advertised pause frame use: No
> >         Advertised auto-negotiation: Yes
> >         Speed: Unknown!
> >         Duplex: Unknown! (255)
> >         Port: MII
> >         PHYAD: 0
> >         Transceiver: external
> >         Auto-negotiation: on
> >         Supports Wake-on: g
> >         Wake-on: d
> >         Current message level: 0x000000cc (204)
> >                                link timer rx_err tx_err
> >         Link detected: yes
> > 
> > 
> > 
> > I noticed this when preparing a patch limit the maximum speed the device to
> > 100Mbit/s as follows:
> > 
> > --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > @@ -272,6 +272,7 @@
> >                 interrupt-parent = <&gpio2>;
> >                 interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
> >                 reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
> > +               max-speed = <100>;
> >         };
> >  };
> >  
> > While the 100Mbit/s limit applied on top of the commit before 4950c2ba49cc
> > things work as expected:
> > 
> > [    3.258347] libphy: ravb_mii: probed
> > [    3.266739] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:03:85:38, IRQ 104.
> > [    3.553642] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
> > [    5.585027] ravb e6800000.ethernet eth0: Link is Up - 100Mbps/Full - flow control off
> > 
> > # ethtool eth0
> > Settings for eth0:
> >         Supported ports: [ TP MII ]
> >         Supported link modes:   100baseT/Full 
> >         Supported pause frame use: No
> >         Supports auto-negotiation: Yes
> >         Advertised link modes:  100baseT/Full 
> >         Advertised pause frame use: No
> >         Advertised auto-negotiation: Yes
> >         Link partner advertised link modes:  10baseT/Half 10baseT/Full 
> >                                              100baseT/Half 100baseT/Full 
> I wondered why the link partner suddenly doesn't report 1Gbps support.
> Seems to be a small flaw in phylib, if locally 1Gbps isn't supported
> (or support is disabled) then we don't check for the link partners
> 1Gbps capability.
> 
> >         Link partner advertised pause frame use: No
> >         Link partner advertised auto-negotiation: Yes
> >         Speed: 100Mb/s
> >         Duplex: Full
> >         Port: MII
> >         PHYAD: 0
> >         Transceiver: external
> >         Auto-negotiation: on
> >         Supports Wake-on: g
> >         Wake-on: d
> >         Current message level: 0x000000cc (204)
> >                                link timer rx_err tx_err
> >         Link detected: yes
> > 
> > 
> > However, with the 100Mbit/s limit applied on top of 4950c2ba49cc the boot hangs
> > while (or just after?) negotiating the link:
> > 
> > [    3.541549] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
> > [    5.536389] ravb e6800000.ethernet eth0: Link is Up - Unknown/Unknown - flow control off
> > 
> > 
> 
