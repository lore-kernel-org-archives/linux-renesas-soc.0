Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16197C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 10:18:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D996321019
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 10:18:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="lXtTNN0B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfAWKS6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 05:18:58 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:51180 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfAWKS6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 05:18:58 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 35EED25BE34;
        Wed, 23 Jan 2019 21:18:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548238736; bh=1nWOfxIq8URU8JBIDA3TFO3aDhD4dynf+8GUWNwUTdA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lXtTNN0BFkd2jtCbN8CBqt1Ac+UVCuWFKs3UN0ts3H3X2ohXPZRY9tqARAU+ccSvW
         xqN69cmc7lY5ahcw53Vsd9aGVGYsYR3evc8L/3rW00Vfw8R24Fk+4MztTrxJpjx9AO
         c6D6ElvQQIkETA4JCgOue5XgI58FqliL0SjA1GYQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6B08E940471; Wed, 23 Jan 2019 11:18:54 +0100 (CET)
Date:   Wed, 23 Jan 2019 11:18:54 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Haavard Skinnemoen <hskinnemoen@gmail.com>
Subject: Re: [PATCH] i2c: gpio: merge two very similar comments
Message-ID: <20190123101854.ps42vsgehusaimi5@verge.net.au>
References: <20190119113642.5348-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190119113642.5348-1-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jan 19, 2019 at 12:36:42PM +0100, Wolfram Sang wrote:
> I think it is clear enough if we have the explanation once and make it
> clear it is applicable for both SCL and SDA.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-gpio.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
> index c008d209f0b8..b9d43bc2853f 100644
> --- a/drivers/i2c/busses/i2c-gpio.c
> +++ b/drivers/i2c/busses/i2c-gpio.c
> @@ -286,10 +286,10 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>  
>  	/*
>  	 * First get the GPIO pins; if it fails, we'll defer the probe.
> -	 * If the SDA line is marked from platform data or device tree as
> -	 * "open drain" it means something outside of our control is making
> -	 * this line being handled as open drain, and we should just handle
> -	 * it as any other output. Else we enforce open drain as this is
> +	 * If the SCL/SDA lines are marked from platform data or device tree
> +	 * as "open drain" it means something outside of our control is making
> +	 * these lines being handled as open drain, and we should just handle
> +	 * them as any other output. Else we enforce open drain as this is
>  	 * required for an I2C bus.

<2c>
	If the SCL/SDA lines are marked "open drain" by platform data or
	device tree then this means that something outside of our control is
	marking these lines to be handled as open drain, and we should just
	handle them as we handle any other output. Else we enforce open
	drain as this is required for an I2C bus.
</2c>

>  	 */
>  	if (pdata->sda_is_open_drain)
> @@ -300,13 +300,6 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->sda))
>  		return PTR_ERR(priv->sda);
>  
> -	/*
> -	 * If the SCL line is marked from platform data or device tree as
> -	 * "open drain" it means something outside of our control is making
> -	 * this line being handled as open drain, and we should just handle
> -	 * it as any other output. Else we enforce open drain as this is
> -	 * required for an I2C bus.
> -	 */
>  	if (pdata->scl_is_open_drain)
>  		gflags = GPIOD_OUT_HIGH;
>  	else
> -- 
> 2.11.0
> 
