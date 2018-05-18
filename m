Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:37152 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752030AbeERTMp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 15:12:45 -0400
Date: Fri, 18 May 2018 21:12:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/1] sh_eth: add RGMII support
Message-ID: <20180518191239.GG23100@lunn.ch>
References: <f30c98ff-f6da-9e7f-c637-49076a428885@cogentembedded.com>
 <727139b8-d482-5a55-9149-f763eae75bca@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <727139b8-d482-5a55-9149-f763eae75bca@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 18, 2018 at 09:30:18PM +0300, Sergei Shtylyov wrote:
> The R-Car V3H (AKA R8A77980) GEther controller  adds support for the RGMII
> PHY interface mode as a new  value  for the RMII_MII register.
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> Changes in version 2:
> - included PHY_INTERFACE_MODE_RGMII_{|RX|TX}ID in the RGMII *case*.
> 
>  drivers/net/ethernet/renesas/sh_eth.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
> ===================================================================
> --- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
> +++ net-next/drivers/net/ethernet/renesas/sh_eth.c
> @@ -466,6 +466,9 @@ static void sh_eth_select_mii(struct net
>  	u32 value;
>  
>  	switch (mdp->phy_interface) {
> +	case PHY_INTERFACE_MODE_RGMII ... PHY_INTERFACE_MODE_RGMII_TXID:
> +		value = 0x3;
> +		break;

Ah, your don't see that form used very often.
I just checked, clang/llvm should also support it.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
