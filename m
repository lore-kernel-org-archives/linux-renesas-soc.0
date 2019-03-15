Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C01C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 12:06:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB3D620854
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 12:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Ct1Wh4gO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbfCOMGN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 08:06:13 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:35783 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727550AbfCOMGN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 08:06:13 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C16B625B76D;
        Fri, 15 Mar 2019 23:06:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552651571; bh=i5cEq21AzFK8f7eMprOMpt/KYioUXkJR4wDZBwE9rfs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ct1Wh4gOhtOiXSy6Uh2z6pm5WKNpBfGPGieoWAUrg27LFfu8hJH8LLRaUmA4JIRmm
         0kAEzOIWJdDkYWbO04tBiVadcUAQcDN7Q1DbKGTzAQfoKL2j3ZCSy8WcU+kUEPzPP1
         TbWaDoOSoKynPsAWFdT3RycyUpowbN+YPfWuh3Vg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 296569403F2; Fri, 15 Mar 2019 13:06:09 +0100 (CET)
Date:   Fri, 15 Mar 2019 13:06:09 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH v7 3/3] mfd: da9063: occupy second I2C address, too
Message-ID: <20190315120608.uurc4d25p7ceas2n@verge.net.au>
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
 <20190313165526.28588-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190313165526.28588-4-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 13, 2019 at 05:55:26PM +0100, Wolfram Sang wrote:
> Even though we don't use it yet, we should mark the second I2C address
> this device is listening to as used.
> 
> Not yet for upstream until all dependencies are merged!
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/mfd/da9063-i2c.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
> index 50a24b1921d0..92ae2681d9e4 100644
> --- a/drivers/mfd/da9063-i2c.c
> +++ b/drivers/mfd/da9063-i2c.c
> @@ -227,6 +227,8 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
>  		return ret;
>  	}
>  
> +	devm_i2c_new_dummy_errptr(&i2c->dev, i2c->adapter, i2c->addr + 1);
> +
>  	return da9063_device_init(da9063, i2c->irq);
>  }
>  
> -- 
> 2.11.0
> 
