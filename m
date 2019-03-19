Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86414C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 12:02:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5177D20854
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 12:02:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="gPWy/hdO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfCSMCh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 08:02:37 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:46585 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfCSMCg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 08:02:36 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id F39F425B7B1;
        Tue, 19 Mar 2019 23:02:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552996954; bh=vnxNC51KaVufVFgb2BQFpFUm4aN3LCYDMZgGhDQh4BE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gPWy/hdOzq4EuLhfPEAaJNqwNOR/uTuGfYHOOn0mFAJBCrSmaPqYZbA7TsOyy1fin
         j/jg1/7rMHYxczLSZpwsItf6SYMePn8p0dlPB8iXy9ddbxRsIYUonZKtgiNjPB/p0o
         ESRIxZ+A4ej3EnoAQaWF5W1e8bj/gaBMDWYyyqwY=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0C97E940663; Tue, 19 Mar 2019 13:02:31 +0100 (CET)
Date:   Tue, 19 Mar 2019 13:02:30 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH RFT] mmc: renesas_sdhi: limit block count to 16 bit for
 old revisions
Message-ID: <20190319120230.mrdtvor235ic54uk@verge.net.au>
References: <20190319101259.20078-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190319101259.20078-1-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 19, 2019 at 11:12:59AM +0100, Wolfram Sang wrote:
> R-Car Gen2 has two different SDHI incarnations in the same chip. The
> older one does not support the recently introduced 32 bit register
> access to the block count register. Make sure we use this feature only
> after the first known version.
> 
> Thanks to the Renesas Testing team for this bug report!
> 
> Fixes:5603731a15ef ("mmc: tmio: fix access width of Block Count Register")
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> 
> I could reproduce the issue on my Renesas Lager board (R-Car H2) and this patch
> fixes the issue for me. Still, if we could confirmation from the testing team,
> this would be awesome to have before applying, I think.
> 
>  drivers/mmc/host/renesas_sdhi_core.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 71e13844df6c..8742e27e4e8b 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -641,6 +641,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  	struct renesas_sdhi *priv;
>  	struct resource *res;
>  	int irq, ret, i;
> +	u16 ver;
>  
>  	of_data = of_device_get_match_data(&pdev->dev);
>  
> @@ -773,12 +774,17 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  	if (ret)
>  		goto efree;
>  
> +	ver = sd_ctrl_read16(host, CTL_VERSION);
> +	/* GEN2_SDR104 is first known SDHI to use 32bit block count */
> +	if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
> +		mmc_data->max_blk_count = U16_MAX;
> +
>  	ret = tmio_mmc_host_probe(host);
>  	if (ret < 0)
>  		goto edisclk;
>  
>  	/* One Gen2 SDHI incarnation does NOT have a CBSY bit */
> -	if (sd_ctrl_read16(host, CTL_VERSION) == SDHI_VER_GEN2_SDR50)
> +	if (ver == SDHI_VER_GEN2_SDR50)
>  		mmc_data->flags &= ~TMIO_MMC_HAVE_CBSY;
>  
>  	/* Enable tuning iff we have an SCC and a supported mode */
> -- 
> 2.11.0
> 
