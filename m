Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:33772 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751013AbeEPUah (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 16:30:37 -0400
Date: Wed, 16 May 2018 22:30:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] sh_eth: add RGMII support
Message-ID: <20180516203031.GI26028@lunn.ch>
References: <087c91a3-a451-6de7-5e0f-a835f8cc98f1@cogentembedded.com>
 <38a56174-c05d-8864-adf0-d3099e426a60@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38a56174-c05d-8864-adf0-d3099e426a60@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 16, 2018 at 10:56:45PM +0300, Sergei Shtylyov wrote:
> The R-Car V3H (AKA R8A77980) GEther controller  adds support for the RGMII
> PHY interface mode as a new  value  for the RMII_MII register.
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
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
> +	case PHY_INTERFACE_MODE_RGMII:
> +		value = 0x3;
> +		break;

Hi Sergei

What about
	PHY_INTERFACE_MODE_RGMII_ID,
	PHY_INTERFACE_MODE_RGMII_RXID,
	PHY_INTERFACE_MODE_RGMII_TXID,

     Andrew
