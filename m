Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:46150 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751380AbdLDTZi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 14:25:38 -0500
Date: Mon, 4 Dec 2017 20:25:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        "David S. Miller" <davem@davemloft.net>,
        Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] net: sh_eth: do not advertise Gigabit capabilities when
 not available
Message-ID: <20171204192528.GB12805@lunn.ch>
References: <20171204141346.17410-1-thomas.petazzoni@free-electrons.com>
 <018f1129-826b-ecd7-9b71-b720706aa930@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <018f1129-826b-ecd7-9b71-b720706aa930@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> >diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
> >index db72d13cebb9..0074c5998481 100644
> >--- a/drivers/net/ethernet/renesas/sh_eth.c
> >+++ b/drivers/net/ethernet/renesas/sh_eth.c
> >@@ -1892,6 +1892,11 @@ static int sh_eth_phy_init(struct net_device *ndev)
> >  		return PTR_ERR(phydev);
> >  	}
> >+	/* mask with MAC supported features */
> >+	if (mdp->cd->register_type != SH_ETH_REG_GIGABIT)
> >+		phydev->supported &= PHY_BASIC_FEATURES;
> >+	phydev->advertising = phydev->supported;
> >+
> 
>    Um, looking at this again, I think we have phy_set_max_speed() for that
> kind of stuff now...

Ah, yes. I forgot about that.

Thomas, can you make a v2?

    Andrew
