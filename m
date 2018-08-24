Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35817 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbeHXMuh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 08:50:37 -0400
Date: Fri, 24 Aug 2018 11:16:48 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S. Miller" <davem@davemloft.net>, linux-can@vger.kernel.org,
        netdev@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3][can-next] can: rcar_can: Add RZ/G2 support
Message-ID: <20180824091648.nishwazvmyolmeae@verge.net.au>
References: <1535029653-7418-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1535029653-7418-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1535029653-7418-3-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 23, 2018 at 02:07:32PM +0100, Fabrizio Castro wrote:
> RZ/G2 devices don't have clkp2, therefore this commit adds a
> generic compatible string for them to allow for proper checking
> during probe.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Chris Paterson <Chris.Paterson2@renesas.com>


Are we sure these clocks are for all RZ/G2 SoCs?

If so


Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


> ---
> 
> This patch applies on linux-can-next-for-4.19-20180727
> 
>  drivers/net/can/rcar/rcar_can.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/can/rcar/rcar_can.c b/drivers/net/can/rcar/rcar_can.c
> index fbd9284..397208e 100644
> --- a/drivers/net/can/rcar/rcar_can.c
> +++ b/drivers/net/can/rcar/rcar_can.c
> @@ -27,6 +27,7 @@
>  
>  #define RCAR_SUPPORTED_CLOCKS	(BIT(CLKR_CLKP1) | BIT(CLKR_CLKP2) | \
>  				 BIT(CLKR_CLKEXT))
> +#define RZG2_SUPPORTED_CLOCKS	(BIT(CLKR_CLKP1) | BIT(CLKR_CLKEXT))
>  
>  /* Mailbox configuration:
>   * mailbox 60 - 63 - Rx FIFO mailboxes
> @@ -933,6 +934,10 @@ static const struct of_device_id rcar_can_of_table[] __maybe_unused = {
>  		.compatible = "renesas,rcar-gen3-can",
>  		.data = (void *)RCAR_SUPPORTED_CLOCKS,
>  	},
> +	{
> +		.compatible = "renesas,rzg-gen2-can",
> +		.data = (void *)RZG2_SUPPORTED_CLOCKS,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, rcar_can_of_table);
> -- 
> 2.7.4
> 
