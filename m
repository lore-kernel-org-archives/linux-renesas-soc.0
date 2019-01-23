Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B07C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 10:25:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F36CB21019
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 10:25:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="AL2WRuI2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfAWKZK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 05:25:10 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:51270 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbfAWKZK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 05:25:10 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8129925BE34;
        Wed, 23 Jan 2019 21:25:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548239108; bh=sijkbfJtsR40G0YNGE+V6GSlFCakggfOSz/YDleN1MY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AL2WRuI2JQupg70uYH+Et2lk9/PmOQfCxRezICT5tDMJqKSNbqYSMa3bFet09dlcH
         35aiidr581KfR1BAPJBe/RFpSyiqhlnwB07XdZKu/V6/kGJaJ0tcK+F/kby6jaNq98
         +JYHXe5NSXtdx0QvPOP6zTPCQ/yIrqOmMUMNdLas=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C53F0940471; Wed, 23 Jan 2019 11:25:06 +0100 (CET)
Date:   Wed, 23 Jan 2019 11:25:06 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: rcar: refactor TCYC handling
Message-ID: <20190123102506.hi6tvyby5f4wbaho@verge.net.au>
References: <20190121170800.21144-1-wsa+renesas@sang-engineering.com>
 <20190121170800.21144-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190121170800.21144-3-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 21, 2019 at 06:08:00PM +0100, Wolfram Sang wrote:
> The latest documentation made it clear that we need to initialize the
> TCYC value independently of DMA. Simplify the code to do that.

Hi Wolfram,

I see TCYC bit 6 is no longer used after this patch.
Does that warrant a mention in the changelog?

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-rcar.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 4da7a1f6178b..48312f22094c 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -39,8 +39,8 @@
>  #define ICSAR	0x1C	/* slave address */
>  #define ICMAR	0x20	/* master address */
>  #define ICRXTX	0x24	/* data port */
> -#define ICDMAER	0x3c	/* DMA enable */
> -#define ICFBSCR	0x38	/* first bit setup cycle */
> +#define ICFBSCR	0x38	/* first bit setup cycle (Gen3) */
> +#define ICDMAER	0x3c	/* DMA enable (Gen3) */
>  
>  /* ICSCR */
>  #define SDBS	(1 << 3)	/* slave data buffer select */
> @@ -83,7 +83,6 @@
>  #define TMDMAE	(1 << 0)	/* DMA Master Transmitted Enable */
>  
>  /* ICFBSCR */
> -#define TCYC06	0x04		/*  6*Tcyc delay 1st bit between SDA and SCL */
>  #define TCYC17	0x0f		/* 17*Tcyc delay 1st bit between SDA and SCL */
>  
>  
> @@ -212,6 +211,10 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
>  	rcar_i2c_write(priv, ICMSR, 0);
>  	/* start clock */
>  	rcar_i2c_write(priv, ICCCR, priv->icccr);
> +
> +	if (priv->devtype == I2C_RCAR_GEN3)
> +		rcar_i2c_write(priv, ICFBSCR, TCYC17);
> +
>  }
>  
>  static int rcar_i2c_bus_barrier(struct rcar_i2c_priv *priv)
> @@ -363,9 +366,6 @@ static void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
>  	/* Disable DMA Master Received/Transmitted */
>  	rcar_i2c_write(priv, ICDMAER, 0);
>  
> -	/* Reset default delay */
> -	rcar_i2c_write(priv, ICFBSCR, TCYC06);
> -
>  	dma_unmap_single(chan->device->dev, sg_dma_address(&priv->sg),
>  			 sg_dma_len(&priv->sg), priv->dma_direction);
>  
> @@ -461,9 +461,6 @@ static void rcar_i2c_dma(struct rcar_i2c_priv *priv)
>  		return;
>  	}
>  
> -	/* Set delay for DMA operations */
> -	rcar_i2c_write(priv, ICFBSCR, TCYC17);
> -
>  	/* Enable DMA Master Received/Transmitted */
>  	if (read)
>  		rcar_i2c_write(priv, ICDMAER, RMDMAE);
> -- 
> 2.11.0
> 
