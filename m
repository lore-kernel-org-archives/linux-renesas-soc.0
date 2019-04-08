Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F7AC282CE
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 07:47:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B8E6213F2
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 07:47:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="SFBAYw3X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfDHHrI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 03:47:08 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:47865 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbfDHHrH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 03:47:07 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 65F2525B80D;
        Mon,  8 Apr 2019 17:47:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554709624; bh=ySR5YRs9mGZ9qd1PY3rh9cs4bSpOuFpiSqOfF+UoaD0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SFBAYw3XwLdTrqU4XgyihrgltPHlf79heHZlxA1wv+xXW2wIGwpiNlB809q+AF0pk
         iPQhbQp9NKCX4xVGhP56nrsV5eYKuItCftBsFH3n+u6PYtx/sjev9w2YufQW0LGkyw
         wR7AxuOVt+X2krTgBkExqWycnR8H2YIlBuS8T368=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B550F94069B; Mon,  8 Apr 2019 09:47:02 +0200 (CEST)
Date:   Mon, 8 Apr 2019 09:47:02 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        David Miller <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: fix autoneg mismatch case in
 genphy_read_status
Message-ID: <20190408074702.o6orqut3wgxfllsa@verge.net.au>
References: <ad288d85-ea57-82bc-5711-1a0fbaad2aa8@gmail.com>
 <20190405161628.67z7acycfu7beqln@verge.net.au>
 <b5c4f0da-f4ac-3a4b-923e-ebe021ed0550@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5c4f0da-f4ac-3a4b-923e-ebe021ed0550@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Apr 07, 2019 at 05:09:28PM +0200, Heiner Kallweit wrote:
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
> There's one path where phydev->autoneg_complete isn't set.
> Could you please test whether the following fixes the issue?
> 
> 
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index a6f3ad971..2df8f7737 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -1710,19 +1710,17 @@ int genphy_update_link(struct phy_device *phydev)
>  	 */
>  	if (!phy_polling_mode(phydev)) {
>  		status = phy_read(phydev, MII_BMSR);
> -		if (status < 0) {
> +		if (status < 0)
>  			return status;
> -		} else if (status & BMSR_LSTATUS) {
> -			phydev->link = 1;
> -			return 0;
> -		}
> +		else if (status & BMSR_LSTATUS)
> +			goto done;
>  	}
>  
>  	/* Read link and autonegotiation status */
>  	status = phy_read(phydev, MII_BMSR);
>  	if (status < 0)
>  		return status;
> -
> +done:
>  	phydev->link = status & BMSR_LSTATUS ? 1 : 0;
>  	phydev->autoneg_complete = status & BMSR_ANEGCOMPLETE ? 1 : 0;
>  

Thanks, that seems to resolve the problem I observed.
Using the same link partner as for the tests above I see:

* 4950c2ba49cc
  + fix (above)
  + patch to debug values of MII_BMSR in genphy_update_link()

# dmesg | egrep '(libphy|ravb|Micr)'
[    2.028167] libphy: Fixed MDIO Bus: probed
[    3.255678] ravb e6800000.ethernet: ignoring dependency for device, assuming no driver
[    3.267865] libphy: ravb_mii: probed
[    3.276210] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:03:85:38, IRQ 104.
[    3.563438] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
[    3.581951] libphy: 1: MII_BMSR=0x00007949
[    3.586439] libphy: 2: MII_BMSR=0x00007949
[    9.985009] libphy: 1: MII_BMSR=0x0000796d
[    9.990101] ravb e6800000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
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
        Link partner advertised link modes:  10baseT/Half 10baseT/Full 
                                             100baseT/Half 100baseT/Full 
                                             1000baseT/Full 
        Link partner advertised pause frame use: No
        Link partner advertised auto-negotiation: Yes
        Speed: 1000Mb/s
        Duplex: Full
        Port: MII
        PHYAD: 0
        Transceiver: external
        Auto-negotiation: on
        Supports Wake-on: g
        Wake-on: d
        Current message level: 0x000000cc (204)
                               link timer rx_err tx_err
        Link detected: yes


* 4950c2ba49cc
  + fix (above)
  + patch to debug values of MII_BMSR in genphy_update_link()
  + 100Mbit/s limit patch

# dmesg | egrep '(libphy|ravb|Micr)'
[    2.026010] libphy: Fixed MDIO Bus: probed
[    3.251741] ravb e6800000.ethernet: ignoring dependency for device, assuming no driver
[    3.264054] libphy: ravb_mii: probed
[    3.272573] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:03:85:38, IRQ 104.
[    3.559364] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
[    3.577913] libphy: 1: MII_BMSR=0x00007949
[    3.582407] libphy: 2: MII_BMSR=0x00007949
[    5.663264] libphy: 1: MII_BMSR=0x0000796d
[    5.668004] ravb e6800000.ethernet eth0: Link is Up - 100Mbps/Full - flow control off
# ethtool eth0  
Settings for eth0:
        Supported ports: [ TP MII ]
        Supported link modes:   100baseT/Full 
        Supported pause frame use: No
        Supports auto-negotiation: Yes
        Advertised link modes:  100baseT/Full 
        Advertised pause frame use: No
        Advertised auto-negotiation: Yes
        Link partner advertised link modes:  10baseT/Half 10baseT/Full 
                                             100baseT/Half 100baseT/Full 
        Link partner advertised pause frame use: No
        Link partner advertised auto-negotiation: Yes
        Speed: 100Mb/s
        Duplex: Full
        Port: MII
        PHYAD: 0
        Transceiver: external
        Auto-negotiation: on
        Supports Wake-on: g
        Wake-on: d
        Current message level: 0x000000cc (204)
                               link timer rx_err tx_err
        Link detected: yes
