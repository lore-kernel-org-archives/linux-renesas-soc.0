Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99EDC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 11:45:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A87320857
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 11:45:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="myrxaOMD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbfCSLpX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 07:45:23 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:46324 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfCSLpW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 07:45:22 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2FE3D25B7CA;
        Tue, 19 Mar 2019 22:45:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552995920; bh=biS2fmmUhVfmIGiwEIe6zGJg3LWVeC8nkbXIDd3Sjkc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=myrxaOMD54fW18tWP7uhICVuY5gQswBudaJfgRE0HivLKPOF70pxU2//JKh19dUPB
         4CxRFS2hf8fSLeWdJjXnyNou/2F1NsheFDaoK+uBuAPbDDAf6DGvocMNYlBzzSNQT9
         onq37mAb11h9p29HRGOeAN4YYnZB1hkC93QyjYSQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7C970940663; Tue, 19 Mar 2019 12:45:18 +0100 (CET)
Date:   Tue, 19 Mar 2019 12:45:18 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: set CBSY flag before probing TMIO host
Message-ID: <20190319114518.rv6qzbqyendz45hi@verge.net.au>
References: <20190319103417.28407-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190319103417.28407-1-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 19, 2019 at 11:34:17AM +0100, Wolfram Sang wrote:
> The CBSY flag should be proper before calling tmio_mmc_host_probe()
> because this function will already use write16 which checks this bit.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> This patch depends on "[RFT] mmc: renesas_sdhi: limit block count to 16 bit for
> old revisions" [1]. This one, however, is not backed by a bug report but just
> found by code review. I wouldn't suggest stable here because the non-working
> case is probably more on the academic side (unless I overlooked something).
> Yet, the code becomes easier to read because it is the flow one would expect.
> So, I post this already for discussion. We need to wait for the dependency
> first, of course.
> 
> Tested on the SDR50 only SDHI of a Renesas Lager board (R-Car H2). No
> regressions encountered: still probes fine and works at the same speed.

Do you have plans for further testing?

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> [1] https://patchwork.kernel.org/patch/10859279/
> 
>  drivers/mmc/host/renesas_sdhi_core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 8742e27e4e8b..5885f3fb0b2f 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -779,14 +779,14 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  	if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
>  		mmc_data->max_blk_count = U16_MAX;
>  
> -	ret = tmio_mmc_host_probe(host);
> -	if (ret < 0)
> -		goto edisclk;
> -
>  	/* One Gen2 SDHI incarnation does NOT have a CBSY bit */
>  	if (ver == SDHI_VER_GEN2_SDR50)
>  		mmc_data->flags &= ~TMIO_MMC_HAVE_CBSY;
>  
> +	ret = tmio_mmc_host_probe(host);
> +	if (ret < 0)
> +		goto edisclk;
> +
>  	/* Enable tuning iff we have an SCC and a supported mode */
>  	if (of_data && of_data->scc_offset &&
>  	    (host->mmc->caps & MMC_CAP_UHS_SDR104 ||
> -- 
> 2.11.0
> 
