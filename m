Return-Path: <SRS0=hqPp=TJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FBCC04AB1
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 May 2019 12:59:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F28A20989
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 May 2019 12:59:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfEIM7I (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 9 May 2019 08:59:08 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:51964 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfEIM7I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 08:59:08 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9CECE25AEB3;
        Thu,  9 May 2019 22:59:06 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 9AB129403F2; Thu,  9 May 2019 14:59:04 +0200 (CEST)
Date:   Thu, 9 May 2019 14:59:04 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] sata_rcar: Remove ata_host_alloc() error printing
Message-ID: <20190509125904.wsgg333yoniqduej@verge.net.au>
References: <20190429152209.22851-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429152209.22851-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 29, 2019 at 05:22:09PM +0200, Geert Uytterhoeven wrote:
> ata_host_alloc() can only fail due to memory allocation failures.
> Hence there is no need to print a message, as the memory allocation core
> code already takes care of that.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Jens, could you consider picking this one up?

> ---
>  drivers/ata/sata_rcar.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
> index 59b2317acea99e46..3495e1733a8e6756 100644
> --- a/drivers/ata/sata_rcar.c
> +++ b/drivers/ata/sata_rcar.c
> @@ -909,7 +909,6 @@ static int sata_rcar_probe(struct platform_device *pdev)
>  
>  	host = ata_host_alloc(dev, 1);
>  	if (!host) {
> -		dev_err(dev, "ata_host_alloc failed\n");
>  		ret = -ENOMEM;
>  		goto err_pm_put;
>  	}
> -- 
> 2.17.1
> 
