Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:46122 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753015AbdLKNz4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Dec 2017 08:55:56 -0500
Received: by mail-lf0-f65.google.com with SMTP id r143so19238780lfe.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2017 05:55:55 -0800 (PST)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Mon, 11 Dec 2017 14:55:52 +0100
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] Revert "ravb: add workaround for clock when resuming
 with WoL enabled"
Message-ID: <20171211135552.GR31989@bigcity.dyn.berto.se>
References: <1512982449-11051-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1512982449-11051-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thanks for your patch.

Feels good to get rid of this hack :-)

On 2017-12-11 09:54:09 +0100, Geert Uytterhoeven wrote:
> This reverts commit fbf3d034f2ff6264183cfa6845770e8cc2a986c8.
> 
> As of commit 560869100b99a3da ("clk: renesas: cpg-mssr: Restore module
> clocks during resume"), the workaround is no longer needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 27 ++-------------------------
>  1 file changed, 2 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 2b962d349f5f415b..009780df664b4a09 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2308,32 +2308,9 @@ static int __maybe_unused ravb_resume(struct device *dev)
>  	struct ravb_private *priv = netdev_priv(ndev);
>  	int ret = 0;
>  
> -	if (priv->wol_enabled) {
> -		/* Reduce the usecount of the clock to zero and then
> -		 * restore it to its original value. This is done to force
> -		 * the clock to be re-enabled which is a workaround
> -		 * for renesas-cpg-mssr driver which do not enable clocks
> -		 * when resuming from PSCI suspend/resume.
> -		 *
> -		 * Without this workaround the driver fails to communicate
> -		 * with the hardware if WoL was enabled when the system
> -		 * entered PSCI suspend. This is due to that if WoL is enabled
> -		 * we explicitly keep the clock from being turned off when
> -		 * suspending, but in PSCI sleep power is cut so the clock
> -		 * is disabled anyhow, the clock driver is not aware of this
> -		 * so the clock is not turned back on when resuming.
> -		 *
> -		 * TODO: once the renesas-cpg-mssr suspend/resume is working
> -		 *       this clock dance should be removed.
> -		 */
> -		clk_disable(priv->clk);
> -		clk_disable(priv->clk);
> -		clk_enable(priv->clk);
> -		clk_enable(priv->clk);
> -
> -		/* Set reset mode to rearm the WoL logic */
> +	/* If WoL is enabled set reset mode to rearm the WoL logic */
> +	if (priv->wol_enabled)
>  		ravb_write(ndev, CCC_OPC_RESET, CCC);
> -	}
>  
>  	/* All register have been reset to default values.
>  	 * Restore all registers which where setup at probe time and
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
