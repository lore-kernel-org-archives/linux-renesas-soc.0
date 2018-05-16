Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:33794 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751132AbeEPUh1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 16:37:27 -0400
Date: Wed, 16 May 2018 22:37:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] sh_eth: add RGMII support
Message-ID: <20180516203724.GL26028@lunn.ch>
References: <087c91a3-a451-6de7-5e0f-a835f8cc98f1@cogentembedded.com>
 <38a56174-c05d-8864-adf0-d3099e426a60@cogentembedded.com>
 <20180516203031.GI26028@lunn.ch>
 <252cbfe6-ed4b-aebb-e5b7-1b60cec7fb69@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <252cbfe6-ed4b-aebb-e5b7-1b60cec7fb69@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> > Hi Sergei
> > 
> > What about
> > 	PHY_INTERFACE_MODE_RGMII_ID,
> > 	PHY_INTERFACE_MODE_RGMII_RXID,
> > 	PHY_INTERFACE_MODE_RGMII_TXID,
> 
>    Oops, totally forgot about those... :-/

Everybody does. I keep intending to write a email template for
this, and phy_interface_mode_is_rgmii() :-)

	Andrew
