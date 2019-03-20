Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF8EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 20:15:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9DD7C218A2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 20:15:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="xhGfK/jN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbfCTUPA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 16:15:00 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46026 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbfCTUPA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 16:15:00 -0400
Received: by mail-lf1-f67.google.com with SMTP id 5so2862798lft.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2019 13:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=3WJ8fXehUtINVulqVXOPSyNo0IUL17PXjawEjijbF+Y=;
        b=xhGfK/jNUtqllFgn2m1xISrRn1h3tdWTyVFROKZpTxj0zQOsAxbV2Dn/o+sZHlL+y0
         h1V9Kk9AzszcfXxrEGSMFO2caFGaMIAzEWuhcOXFQrh9nFhCZ2XmvjFkCV8Ep6/iKx+q
         hh2oO9Rug5fSyukTa2ZaNNKwkX5OGjwVHiUPsolB0fyoDRE6I2USeJ2qzW62h2E2Bx3D
         733Nai/442GgnhV3/35Ay0JrPYYZCqi9hfiOlY2nRN+gP5yFFjPe/dZ+TtcARrq69niZ
         C9AREPVcqfdJlr2yLQXy17SbxVgkhkXB7IGPeAUwVKg3Y7vbkr2p2fVOWomqsVF/rRHf
         HvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=3WJ8fXehUtINVulqVXOPSyNo0IUL17PXjawEjijbF+Y=;
        b=gCwdo7NS1enYJgu5ccUCjmmOsXULZu5HlRDzl5e2dtQgQ91X9zo2GSLHcfC/PSHfHt
         rZ7l4e/0htiRAXDvZS4dNB7c7vBeX47UWxmbW9gW5LwArZKz4/yUINDUnmWk7Yw09Uqi
         1j4otUg70nNwZxEVJw7qBl/RTFiR0UCFMMgoseRmghv0x+e3yYEhLj+DQxk/f8+vdSQT
         VphtNX7dm2Xy0PMqA9sm5dWin00w9KMeN8eZqEt5yDUyuf72bruIcf0qU8s71PniJdAL
         VW4rwIl1tLdmag+ZYWishwtUOPHyj2DtNz+xjzbxvl/OhLYNiVeV7Ltaf2ArZGxPMYzh
         ossw==
X-Gm-Message-State: APjAAAXrKCUW7i4vmXMvlyPsibLUqzYEbN0bT0Gfn76n9wZfNeHuBHf6
        AdUXUOLxYPNmGrCFy5wMhnR01Q==
X-Google-Smtp-Source: APXvYqwOVz0bF01LP+SJqUYPNnWPF3p/t0hCtqlzF0EdjS7WY1jUQEPFF2q4khOqG6/Il561YncTrA==
X-Received: by 2002:ac2:548a:: with SMTP id t10mr16817017lfk.115.1553112898523;
        Wed, 20 Mar 2019 13:14:58 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id p5sm505692ljg.44.2019.03.20.13.14.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Mar 2019 13:14:57 -0700 (PDT)
Date:   Wed, 20 Mar 2019 21:14:57 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: set CBSY flag before probing TMIO host
Message-ID: <20190320201456.GQ26015@bigcity.dyn.berto.se>
References: <20190319103417.28407-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190319103417.28407-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2019-03-19 11:34:17 +0100, Wolfram Sang wrote:
> The CBSY flag should be proper before calling tmio_mmc_host_probe()
> because this function will already use write16 which checks this bit.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

This matches whit how I read the code, nice catch.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

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
> 
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

-- 
Regards,
Niklas Söderlund
