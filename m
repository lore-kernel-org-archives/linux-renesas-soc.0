Return-Path: <SRS0=/r1Q=SH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0D8C10F24
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 16:16:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4206F21738
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 16:16:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="rz09xpJ/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730492AbfDEQQg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 5 Apr 2019 12:16:36 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:43215 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbfDEQQf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Apr 2019 12:16:35 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D021B25B823;
        Sat,  6 Apr 2019 03:16:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554480991; bh=XiJdPbH+NrDm1Mi6AsAD+WGPt45efcXIyEUeEm4YcYE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rz09xpJ/oaFUsvujjiMa+v6CmYIEAc9c1AJEKtudmlgmoZBNNZXdIfevQQk/lTD6B
         WZHk5IlHpz81of6ldptFMsKwkfAro04IiddylBRK5ivgxhrye/aWNYcCB7xSQzxQWv
         sDehALM4MCU2pYo0fHPQHq9/NiUex81U7SVaExu0=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id BEC62E21EDF; Fri,  5 Apr 2019 18:16:28 +0200 (CEST)
Date:   Fri, 5 Apr 2019 18:16:28 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        David Miller <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: fix autoneg mismatch case in
 genphy_read_status
Message-ID: <20190405161628.67z7acycfu7beqln@verge.net.au>
References: <ad288d85-ea57-82bc-5711-1a0fbaad2aa8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad288d85-ea57-82bc-5711-1a0fbaad2aa8@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 02, 2019 at 08:43:30PM +0200, Heiner Kallweit wrote:
> The original patch didn't consider the case that autoneg process
> finishes successfully but both link partners have no mode in common.
> In this case there's no link, nevertheless we may be interested in
> what the link partner advertised.
> 
> Like phydev->link we set phydev->autoneg_complete in
> genphy_update_link() and use the stored value in genphy_read_status().
> This way we don't have to read register BMSR again.
> 
> Fixes: b6163f194c69 ("net: phy: improve genphy_read_status")
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Hi,

I have observed a regression with this patch as present as
4950c2ba49cc ("net: phy: fix autoneg mismatch case in genphy_read_status")
in net-next.

The platform is the Renesas R-Car E3 (r8a77990) based Ebisu-4D board.


Without this patch (commit before 4950c2ba49cc) the link is negotiated
as follows:

[    3.257699] libphy: ravb_mii: probed
[    3.266498] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:03:85:38, IRQ 104.
[    3.537082] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
[    9.667161] ravb e6800000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off

# ethtool --version
ethtool version 3.16
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


With this patch the link is negotiated as follows, note the "Unknown":

[    3.268609] libphy: ravb_mii: probed
[    3.277402] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:03:85:38, IRQ 104.
[    3.565057] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
[    9.804423] ravb e6800000.ethernet eth0: Link is Up - Unknown/Unknown - flow control off

And ethtool reports:

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



I noticed this when preparing a patch limit the maximum speed the device to
100Mbit/s as follows:

--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -272,6 +272,7 @@
                interrupt-parent = <&gpio2>;
                interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
                reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
+               max-speed = <100>;
        };
 };
 
While the 100Mbit/s limit applied on top of the commit before 4950c2ba49cc
things work as expected:

[    3.258347] libphy: ravb_mii: probed
[    3.266739] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:03:85:38, IRQ 104.
[    3.553642] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
[    5.585027] ravb e6800000.ethernet eth0: Link is Up - 100Mbps/Full - flow control off

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


However, with the 100Mbit/s limit applied on top of 4950c2ba49cc the boot hangs
while (or just after?) negotiating the link:

[    3.541549] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=165)
[    5.536389] ravb e6800000.ethernet eth0: Link is Up - Unknown/Unknown - flow control off

