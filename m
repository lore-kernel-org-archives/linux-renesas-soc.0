Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9ABC282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 10:22:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8297A21019
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 10:22:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="gxMaAhp1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbfAWKWb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 05:22:31 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:51215 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfAWKWb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 05:22:31 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id AFE1325BE34;
        Wed, 23 Jan 2019 21:22:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548238949; bh=agTrvIVPev9HY5vSPPPHQE91Svww9nXzEAfSlwr0vcE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gxMaAhp1KEhptzlTJwGfYlb5yK4GpPUtvW/sn4waxdaIyu+OjLXB0y3XnjfWEp8K2
         OjQpBwZgp7ZkNKz8EWA117DCXmOyZ5nV80JgSIyzja/oOHHW78QIEDuOS95sMKdwNo
         K99QZtXhF51IihaPya3YNDredw1BRrtOslnRIKgI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id EF3C3940471; Wed, 23 Jan 2019 11:22:26 +0100 (CET)
Date:   Wed, 23 Jan 2019 11:22:26 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: gpio: sort includes
Message-ID: <20190123102226.tmxybjroig4bplzq@verge.net.au>
References: <20190119121655.5576-1-wsa+renesas@sang-engineering.com>
 <20190119121655.5576-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190119121655.5576-4-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jan 19, 2019 at 01:16:55PM +0100, Wolfram Sang wrote:
> Less risk for duplications when adding new ones.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/i2c/busses/i2c-gpio.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
> index b9d43bc2853f..d8205b56f243 100644
> --- a/drivers/i2c/busses/i2c-gpio.c
> +++ b/drivers/i2c/busses/i2c-gpio.c
> @@ -9,15 +9,15 @@
>   */
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
> -#include <linux/i2c.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c-algo-bit.h>
> -#include <linux/platform_data/i2c-gpio.h>
> +#include <linux/i2c.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
> -#include <linux/slab.h>
> -#include <linux/platform_device.h>
> -#include <linux/gpio/consumer.h>
>  #include <linux/of.h>
> +#include <linux/platform_data/i2c-gpio.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
>  
>  struct i2c_gpio_private_data {
>  	struct gpio_desc *sda;
> -- 
> 2.11.0
> 
