Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9CFC56202
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 26 Nov 2020 12:25:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97C7B2087C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 26 Nov 2020 12:25:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ebegGbRz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732832AbgKZMZ0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 26 Nov 2020 07:25:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732307AbgKZMZZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 07:25:25 -0500
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18ECBC0613D4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2020 04:25:25 -0800 (PST)
Received: by mail-ua1-x944.google.com with SMTP id v9so475443uar.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2020 04:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z0R8R2jRUBjx4Bl2gydbnlUNsAXVgTr3tONaL7KpOr8=;
        b=ebegGbRzwXfxBzAhS27GYQiIki+X7TrcC4MeZIV/HhnMZVCREiAZah+qAmYGJQZQbT
         lNKR8hPz8RXUEo8KYu4eFtqktC4XRnrU1Pkgk6Ix/KxaQV0Io3wZxPT5XAMFnbgcNev0
         L7xxOR50D3B4XwCQFhxbQ7Oy1Uc8MszwOJSewu6djUbCe1ECrF/Vb1untmKrUKiRIZJK
         aqw5esy0TH4WRd7ac5uUWjods47LU8rkfOEC/SZ+Q3Oef4+mZYAz00ln6VaB4a6g4hva
         BVd1SGA5iC8G1ep2sXM70bs2SLSDFMmPViLltJtOQ/8vXUo1Vi9kXmimpF4AP0hmN4Ff
         xmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z0R8R2jRUBjx4Bl2gydbnlUNsAXVgTr3tONaL7KpOr8=;
        b=OU26QZMW2FFr7hgh1ak8BCiVhZhgvp5gA4PX6JElzrBYFws47aKNtSGFyLUYoJo4r6
         p0ZZ11GqWL5C+LqhCHws83Cojt6AqYaddI8QVZzrS+AIK+vmligLapV7KzNZnO7hPLJg
         1x3i7x5GXEbsFpgb7RsFjZeXheHi035cOoHA2+ANH2z4dOP7/x3ACuGnq449AtwlREDj
         k4rPGrtQGVGM9B4abTj67lACyltL5r3Hubxi1XRVTqmxg3sAeEHtPzpJziHJ8Tnu2aQ2
         piUPaOuL2e/yPAdxO0LzDdAv1jmTLi+UioUgDh8WFBOECzqOuW/weiWNmtj7rrk1aBzC
         cgvQ==
X-Gm-Message-State: AOAM533obZfbW+Eg2M7SA3ccFO24+TKZTgPSotBRuORkxwcLPY+/dbSw
        b5zY4Zr0kjaGmcBgRwYGsfLQCHXcl8XqwOVaZQPDhg==
X-Google-Smtp-Source: ABdhPJyIbGHUduONNAJYMEVtVww2ipJCdnEnn7o/ur8X9U+TIiWucwa3nmNUuTCbSkCIeITZgm7L8y5esOktO29kySA=
X-Received: by 2002:ab0:c12:: with SMTP id a18mr1325949uak.19.1606393524171;
 Thu, 26 Nov 2020 04:25:24 -0800 (PST)
MIME-Version: 1.0
References: <20201125204953.3344-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201125204953.3344-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 26 Nov 2020 13:24:47 +0100
Message-ID: <CAPDyKFrA1av8NV8r1ARtv70_uxvvW0jaUp+=+APp=bp03=Ph9g@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: improve bringing HW to a sane state with MMC_POWER_OFF
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 25 Nov 2020 at 21:51, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Further testing of error cases revealed that downgrade is not enough, so
> we need to reset the SCC which is done by calling the custom reset
> function. This reset function can distinguish between the various SDHI
> variants, so protecting the call with MIN_RCAR2 is enough here.
>
> Fixes: 24ce2d7b8bea ("mmc: tmio: bring tuning HW to a sane state with MMC_POWER_OFF")
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> I was also evaluating if tmio_mmc_reset() would be better than
> host->reset. I finally decided against it. This is the minimal change
> that we need and which fixes an actual issue. I can't see why we would
> want to terminate DMA because either everything went smooth and DMA
> completed or the DMA error has already been handled. I think. Please
> speak up if you disagree.

I have no strong opinion, but just wanted to highlight that I observed
that tmio_mmc_host_runtime_resume() calls tmio_mmc_reset(). No idea
what that means for R-Car Gen2+.

>
>  drivers/mmc/host/tmio_mmc_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 7f4a28125010..a89547f5d733 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -929,9 +929,9 @@ static void tmio_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>         switch (ios->power_mode) {
>         case MMC_POWER_OFF:
>                 tmio_mmc_power_off(host);
> -               /* Downgrade ensures a sane state for tuning HW (e.g. SCC) */
> -               if (host->mmc->ops->hs400_downgrade)
> -                       host->mmc->ops->hs400_downgrade(host->mmc);
> +               /* For R-Car Gen2+, we need to reset SDHI specific SCC */
> +               if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
> +                       host->reset(host);
>                 host->set_clock(host, 0);
>                 break;
>         case MMC_POWER_UP:
> --
> 2.28.0
>

Kind regards
Uffe
