Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18E5C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 12:56:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADF5120854
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 12:56:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="j0jm6OuD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbfCOM4r (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 08:56:47 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36343 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbfCOM4r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 08:56:47 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A634625B76D;
        Fri, 15 Mar 2019 23:56:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552654604; bh=cvwp/90pESMohJyPOU9OOmO+mDsw7Ztli5l6N0W5DTw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j0jm6OuDWfB0GCi3nLAx/OkjmId/dQtardar1h5wKtDCZJIGIdVYBcu9w2xejfyF+
         K9SWv81dqN2EMCrDayObkxEG+CEFtm6Q+YiCMXD2wlgpO8jve6NcFc3dr2rqXeCCsH
         9uU9rf+DSpfPeAV7gOyNBW9vkf9VUoRptnsPWVxo=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1F64A9403F2; Fri, 15 Mar 2019 13:56:43 +0100 (CET)
Date:   Fri, 15 Mar 2019 13:56:43 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/3] i2c: rcar: sanity check for minimal DMA length
Message-ID: <20190315125642.vk5kas4ntohh2phi@verge.net.au>
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
 <20190305175434.13107-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190305175434.13107-2-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 05, 2019 at 06:54:32PM +0100, Wolfram Sang wrote:
> Use a macro for the hardcoded value and apply a build check. If it is
> not met, the driver logic will not work anymore.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/i2c/busses/i2c-rcar.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 3ce74edcd70c..925858915569 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -85,6 +85,7 @@
>  /* ICFBSCR */
>  #define TCYC17	0x0f		/* 17*Tcyc delay 1st bit between SDA and SCL */
>  
> +#define RCAR_MIN_DMA_LEN	8
>  
>  #define RCAR_BUS_PHASE_START	(MDBS | MIE | ESG)
>  #define RCAR_BUS_PHASE_DATA	(MDBS | MIE)
> @@ -412,8 +413,8 @@ static void rcar_i2c_dma(struct rcar_i2c_priv *priv)
>  	int len;
>  
>  	/* Do various checks to see if DMA is feasible at all */
> -	if (IS_ERR(chan) || msg->len < 8 || !(msg->flags & I2C_M_DMA_SAFE) ||
> -	    (read && priv->flags & ID_P_NO_RXDMA))
> +	if (IS_ERR(chan) || msg->len < RCAR_MIN_DMA_LEN ||
> +	    !(msg->flags & I2C_M_DMA_SAFE) || (read && priv->flags & ID_P_NO_RXDMA))
>  		return;
>  
>  	if (read) {
> @@ -921,6 +922,9 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>  	struct i2c_timings i2c_t;
>  	int irq, ret;
>  
> +	/* Otherwise logic will break because some bytes must always use PIO */
> +	BUILD_BUG_ON_MSG(RCAR_MIN_DMA_LEN < 3, "Invalid min DMA length");
> +
>  	priv = devm_kzalloc(dev, sizeof(struct rcar_i2c_priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
> -- 
> 2.11.0
> 
