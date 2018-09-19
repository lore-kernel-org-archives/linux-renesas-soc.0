Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:38709 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726911AbeISSJt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 14:09:49 -0400
Date: Wed, 19 Sep 2018 14:32:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Simon Horman <horms@verge.net.au>
Cc: David Miller <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 net-next 07/12] net: ethernet: Add helper to remove a
 supported link mode
Message-ID: <20180919123200.GB26940@lunn.ch>
References: <1536709999-13420-1-git-send-email-andrew@lunn.ch>
 <1536709999-13420-8-git-send-email-andrew@lunn.ch>
 <20180917151302.l6mzzy5xmqlbgejj@verge.net.au>
 <20180917153811.GE5458@lunn.ch>
 <20180918105817.z2o5yybcth7diqsu@verge.net.au>
 <20180918130236.GB29092@lunn.ch>
 <20180919074557.vixjj3rg76ayy3k7@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180919074557.vixjj3rg76ayy3k7@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> > And here also.
> 
> Thanks for raising this, I noticed it too.
> 
> > Looking at the code, i see:
> > 
> > /* E-MAC init function */
> > static void ravb_emac_init(struct net_device *ndev)
> > {
> >         struct ravb_private *priv = netdev_priv(ndev);
> > 
> >         /* Receive frame limit set register */
> >         ravb_write(ndev, ndev->mtu + ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN, RFLR);
> > 
> >         /* EMAC Mode: PAUSE prohibition; Duplex; RX Checksum; TX; RX */
> >         ravb_write(ndev, ECMR_ZPF | (priv->duplex ? ECMR_DM : 0) |
> >                    (ndev->features & NETIF_F_RXCSUM ? ECMR_RCSC : 0) |
> >                    ECMR_TE | ECMR_RE, ECMR);
> > 
> > Does this mean Pause is not supported in the hardware?
> 
> According to my reading of the documentation Pause is supported by the
> hardware and the above code seems to conflict with the comment (possibly
> both the code and comment predate the current documentation). My reading of
> the documentation is that the above unconditionally _enables_ receiving and
> sending Pause frames with time parameter value 0.

Hi Simon

We should first prove that this additional Pause is causing the
issue. After that, we can decide if we want to add Pause support to
the driver. Please could you test this patch.

Thanks
	Andrew

>From 0f69f4991454d48f34b05d5dc006c04a180c7842 Mon Sep 17 00:00:00 2001
From: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 18 Sep 2018 18:12:54 -0500
Subject: [PATCH] ravb: Disable Pause Advertisement

The previous commit to ravb had the side effect of making the PHY
advertise Pause. This previously did not happen, and it appears the
MAC does not support Pause. By default, phydev->supported has Pause
enabled, but phydev->advertising does not. Rather than rely on this,
be explicit, and remove the Pause link mode.

Reported-by: Simon Horman <horms@verge.net.au>
Fixes: 41124fa64d4b ("net: ethernet: Add helper to remove a supported link mode")
Signed-off-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/renesas/ravb_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index fb2a1125780d..d7630c0fdb0a 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1073,9 +1073,10 @@ static int ravb_phy_init(struct net_device *ndev)
 		netdev_info(ndev, "limited PHY to 100Mbit/s\n");
 	}
 
-	/* 10BASE is not supported */
+	/* 10BASE and Pause is not supported */
 	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_10baseT_Half_BIT);
 	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_10baseT_Full_BIT);
+	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_Pause_BIT);
 
 	phy_attached_info(phydev);
 
-- 
2.19.0.rc1
