Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54118 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756134AbdERNHy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2017 09:07:54 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] sh_eth: Use platform device for printing before register_netdev()
Date: Thu, 18 May 2017 16:08:03 +0300
Message-ID: <1924994.oxPFtnWdQK@avalon>
In-Reply-To: <1495112495-25086-1-git-send-email-geert+renesas@glider.be>
References: <1495112495-25086-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Thursday 18 May 2017 15:01:34 Geert Uytterhoeven wrote:
> The MDIO initialization failure message is printed using the network
> device, before it has been registered, leading to:
> 
>      (null): failed to initialise MDIO
> 
> Use the platform device instead to fix this:
> 
>     sh-eth ee700000.ethernet: failed to initialise MDIO
> 
> Fixes: daacf03f0bbfefee ("sh_eth: Register MDIO bus before registering the
> network device")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/net/ethernet/renesas/sh_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/sh_eth.c
> b/drivers/net/ethernet/renesas/sh_eth.c index
> f68c4db656eda846..c85222b02754f5a7 100644
> --- a/drivers/net/ethernet/renesas/sh_eth.c
> +++ b/drivers/net/ethernet/renesas/sh_eth.c
> @@ -3220,7 +3220,7 @@ static int sh_eth_drv_probe(struct platform_device
> *pdev) /* MDIO bus init */
>  	ret = sh_mdio_init(mdp, pd);
>  	if (ret) {
> -		dev_err(&ndev->dev, "failed to initialise MDIO\n");
> +		dev_err(&pdev->dev, "failed to initialise MDIO\n");
>  		goto out_release;
>  	}

-- 
Regards,

Laurent Pinchart
