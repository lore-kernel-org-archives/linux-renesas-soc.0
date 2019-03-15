Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E39C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 13:09:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 974A02186A
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 13:09:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="NM0pfzsO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbfCONJT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 09:09:19 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36494 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729019AbfCONJS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 09:09:18 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1EA0D25B76D;
        Sat, 16 Mar 2019 00:09:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552655357; bh=IWigxzdEYG0HT4mAkiqMjYlTDp6fyWmtTnh+jzVHOBA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NM0pfzsOA5pRe9Di1wdBkunZfsgRpg6MKLxsPhqUYktUdRIb46bZnus5wS8i/i3UJ
         2QDT+8YW6ormk4VqJPxqYOhQL8l9BysPz0a4543MW9aXdpguGzkZpql2yMMcLoiVEs
         /1qB42BrcI9vrKmK1BVau9W2a+qhlnXiE8F80/k4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 564E89403F2; Fri, 15 Mar 2019 14:09:15 +0100 (CET)
Date:   Fri, 15 Mar 2019 14:09:15 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 3/3] i2c: rcar: wait for data empty before starting DMA
Message-ID: <20190315130915.db66lmz4zmh46y6r@verge.net.au>
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
 <20190305175434.13107-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190305175434.13107-4-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 05, 2019 at 06:54:34PM +0100, Wolfram Sang wrote:
> When sending with DMA, the driver transfers the first byte with PIO (as
> documented). However, it started DMA right after the first byte was
> written. This worked, but was not according to the datasheet which
> suggests to wait until data register was empty again. Implement this.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/i2c/busses/i2c-rcar.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 7e009febe97f..63286b3cc69b 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -480,6 +480,10 @@ static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
>  	if (!(msr & MDE))
>  		return;
>  
> +	/* Check if DMA can be enabled and take over */
> +	if (priv->pos == 1 && rcar_i2c_dma(priv))
> +		return;
> +
>  	if (priv->pos < msg->len) {
>  		/*
>  		 * Prepare next data to ICRXTX register.
> @@ -490,13 +494,6 @@ static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
>  		 */
>  		rcar_i2c_write(priv, ICRXTX, msg->buf[priv->pos]);
>  		priv->pos++;
> -
> -		/*
> -		 * Try to use DMA to transmit the rest of the data if
> -		 * address transfer phase just finished.
> -		 */
> -		if (msr & MAT)
> -			rcar_i2c_dma(priv);
>  	} else {
>  		/*
>  		 * The last data was pushed to ICRXTX on _PREV_ empty irq.
> -- 
> 2.11.0
> 
