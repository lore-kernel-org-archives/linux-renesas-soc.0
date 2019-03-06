Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A12C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 12:59:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 874EE206DD
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 12:59:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="maSITgB0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbfCFM7a (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 07:59:30 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53423 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbfCFM7a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 07:59:30 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8A7DA25B7D0;
        Wed,  6 Mar 2019 23:59:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551877166; bh=rwC5Mng7QGlAAKjh3zZxplgugFT+579UqBGXbJdSGi8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=maSITgB01S3xaYLWz8T0k6HcLgl4wnfR3zYkhLaDYRIk8ZZC/o8qFEGbK9fQ6P7CB
         nu4FkP7gJFWaG6HAkzOMkwukXXsyappoh4Z5sCF+yDg+xgEd0f2LD3peomFVAS0SXm
         t1mWZbUAlC5Pd63LOm5J4d8mFTzML+X9AjyYOiH4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 068FD94030D; Wed,  6 Mar 2019 13:59:24 +0100 (CET)
Date:   Wed, 6 Mar 2019 13:59:24 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: Re: [PATCH 1/2] i2c: rcar: fix concurrency issue related to ICDMAER
Message-ID: <20190306125924.4s26rqymqx24hjbr@verge.net.au>
References: <20190303150314.6528-1-wsa+renesas@sang-engineering.com>
 <20190303150314.6528-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190303150314.6528-2-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Mar 03, 2019 at 04:03:13PM +0100, Wolfram Sang wrote:
> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> 
> This patch fixes the problem that an interrupt may set up a new I2C
> message and the DMA callback overwrites this setup.
> 
> By disabling the DMA Enable Register(ICDMAER), rcar_i2c_dma_unmap()
> enables interrupts for register settings (such as Master Control
> Register(ICMCR)) and advances the I2C transfer sequence.
> 
> If an interrupt occurs immediately after ICDMAER is disabled, the
> callback handler later continues and overwrites the previous settings
> from the interrupt. So, disable ICDMAER at the end of the callback to
> ensure other interrupts are masked until then.
> 
> Note that this driver needs to work lock-free because there are IP cores
> with a HW race condition which prevent us from using a spinlock in the
> interrupt handler.
> 
> Reproduction test:
> 1. Add udelay(1) after disabling ICDMAER. (It is expected to
> generate an interrupt of rcar_i2c_irq())
> 
>     void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
>     {
>         ...
>         rcar_i2c_write(priv, ICDMAER, 0);
>         udelay(1);                        <-- Add this line
>         ...
>         priv->dma_direction = DMA_NONE;
>     }
> 
> 2. Execute DMA transfer.
> Performs DMA transfer of read or write. In the sample, write was used.
> 
>  $ i2cset -y -f 4 0x6a 0x01 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 i
> 
> 3. A log message of BUG_ON() will be displayed.
> 
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/i2c/busses/i2c-rcar.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index dd52a068b140..6410896f717b 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -363,9 +363,6 @@ static void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
>  	struct dma_chan *chan = priv->dma_direction == DMA_FROM_DEVICE
>  		? priv->dma_rx : priv->dma_tx;
>  
> -	/* Disable DMA Master Received/Transmitted */
> -	rcar_i2c_write(priv, ICDMAER, 0);
> -
>  	dma_unmap_single(chan->device->dev, sg_dma_address(&priv->sg),
>  			 sg_dma_len(&priv->sg), priv->dma_direction);
>  
> @@ -375,6 +372,9 @@ static void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
>  		priv->flags |= ID_P_NO_RXDMA;
>  
>  	priv->dma_direction = DMA_NONE;
> +
> +	/* Disable DMA Master Received/Transmitted */
> +	rcar_i2c_write(priv, ICDMAER, 0);
>  }
>  
>  static void rcar_i2c_cleanup_dma(struct rcar_i2c_priv *priv)
> -- 
> 2.11.0
> 
