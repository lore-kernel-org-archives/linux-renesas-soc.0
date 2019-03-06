Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AE1C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 12:59:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE474206DD
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 12:59:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Imjw2fhq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbfCFM7U (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 07:59:20 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53411 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbfCFM7U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 07:59:20 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0FC3A25B7D0;
        Wed,  6 Mar 2019 23:59:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551877158; bh=/eEJEii8FBV4+PmJdO9JUHuNGErSxLbwsGHd5A5eFCs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Imjw2fhqSGosEPue3Rrf0lRBIfJ1wTgvuKwoI2WgyJwriDP/TJPGMdkFTBwNBotf9
         +ORmf8/ie13AEgL5aulsNfxM97F/EcEr2ylC5cbf/qayivWmyGscXxMDsQw97+W1cV
         gh7u1V1p45APHR57PF9DxSz8csOyVccw6rvRJ9mc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7F58A94030D; Wed,  6 Mar 2019 13:59:16 +0100 (CET)
Date:   Wed, 6 Mar 2019 13:59:16 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: rcar: explain the lockless design
Message-ID: <20190306125916.fmuza4jrmdtjswt7@verge.net.au>
References: <20190303150314.6528-1-wsa+renesas@sang-engineering.com>
 <20190303150314.6528-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190303150314.6528-3-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Mar 03, 2019 at 04:03:14PM +0100, Wolfram Sang wrote:
> To make sure people can understand the lockless design of this driver
> without the need to dive into git history, add a comment giving an
> overview of the situation.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/i2c/busses/i2c-rcar.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 6410896f717b..3ce74edcd70c 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -611,6 +611,15 @@ static bool rcar_i2c_slave_irq(struct rcar_i2c_priv *priv)
>  	return true;
>  }
>  
> +/*
> + * This driver has a lock-free design because there are IP cores (at least
> + * R-Car Gen2) which have an inherent race condition in their hardware design.
> + * There, we need to clear RCAR_BUS_MASK_DATA bits as soon as possible after
> + * the interrupt was generated, otherwise an unwanted repeated message gets
> + * generated. It turned out that taking a spinlock at the beginning of the ISR
> + * was already causing repeated messages. Thus, this driver was converted to
> + * the now lockless behaviour. Please keep this in mind when hacking the driver.
> + */
>  static irqreturn_t rcar_i2c_irq(int irq, void *ptr)
>  {
>  	struct rcar_i2c_priv *priv = ptr;
> -- 
> 2.11.0
> 
