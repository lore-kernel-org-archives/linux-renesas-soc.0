Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41626 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727172AbeLJMJD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 07:09:03 -0500
Date: Mon, 10 Dec 2018 13:08:57 +0100
From: Simon Horman <horms@verge.net.au>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: shmobile: Fix R-Car Gen2 regulator quirk
Message-ID: <20181210120857.puyfajkncvrznley@verge.net.au>
References: <20181207202858.17129-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181207202858.17129-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Dec 07, 2018 at 09:28:58PM +0100, Marek Vasut wrote:
> The quirk code currently detects all compatible I2C chips with a shared
> IRQ line on all I2C busses, adds them into a list, and registers a bus
> notifier. For every chip for which the bus notifier triggers, the quirk
> code performs I2C transfer on that I2C bus for all addresses in the list.
> The problem is that this may generate transfers to non-existing chips on
> systems with multiple I2C busses.
> 
> This patch adds a check to verify that the I2C bus to which the chip with
> shared IRQ is attached to matches the I2C bus of the chip which triggered
> the bus notifier and only starts the I2C transfer if they match.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
> index d4774d8ff997..f78e5348bd4c 100644
> --- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
> +++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
> @@ -40,6 +40,7 @@
>  struct regulator_quirk {
>  	struct list_head		list;
>  	const struct of_device_id	*id;
> +	struct device_node		*np;
>  	struct of_phandle_args		irq_args;
>  	struct i2c_msg			i2c_msg;
>  	bool				shared;	/* IRQ line is shared */
> @@ -102,6 +103,9 @@ static int regulator_quirk_notify(struct notifier_block *nb,
>  		if (!pos->shared)
>  			continue;
>  
> +		if (pos->np->parent != client->dev.parent->of_node)
> +			continue;
> +
>  		dev_info(&client->dev, "clearing %s@0x%02x interrupts\n",
>  			 pos->id->compatible, pos->i2c_msg.addr);
>  
> @@ -167,6 +171,7 @@ static int __init rcar_gen2_regulator_quirk(void)
>  		memcpy(&quirk->i2c_msg, id->data, sizeof(quirk->i2c_msg));
>  
>  		quirk->id = id;
> +		quirk->np = np;
>  		quirk->i2c_msg.addr = addr;
>  
>  		ret = of_irq_parse_one(np, 0, argsa);
> -- 
> 2.18.0
> 
