Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36638 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728378AbeGYOse (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 10:48:34 -0400
Received: by mail-lj1-f196.google.com with SMTP id u7-v6so6720099lji.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jul 2018 06:36:50 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Wed, 25 Jul 2018 15:36:43 +0200
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH 1/2] mmc: renesas_sdhi: skip SCC error check when retuning
Message-ID: <20180725133643.GE14991@bigcity.dyn.berto.se>
References: <20180725121031.24277-1-niklas.soderlund+renesas@ragnatech.se>
 <20180725121031.24277-2-niklas.soderlund+renesas@ragnatech.se>
 <20180725122106.jzv6v3j2wrtqrt6t@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180725122106.jzv6v3j2wrtqrt6t@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On 2018-07-25 14:21:07 +0200, Wolfram Sang wrote:
> Hi Niklas,
> 
> > * Changes since v3
> > - Add check for 4TAP for HS400.
> 
> Is it the same in the BSP or where does this info come from?

It comes from the BSP but I had to modify it to fit with the upstream 
implementation of 4 vs 8 taps. The original code from BSP:

        if (!(host->mmc->ios.timing == MMC_TIMING_UHS_SDR104) &&
            !(host->mmc->ios.timing == MMC_TIMING_MMC_HS200) &&
            !(host->mmc->ios.timing == MMC_TIMING_MMC_HS400 &&
              !host->hs400_use_4tap))
                return false;
> 
> 
> > +	if (!(host->mmc->ios.timing == MMC_TIMING_UHS_SDR104) &&
> > +	    !(host->mmc->ios.timing == MMC_TIMING_MMC_HS200) &&
> > +	    !(host->mmc->ios.timing == MMC_TIMING_MMC_HS400 &&
> > +	      !(host->pdata->flags & TMIO_MMC_HAVE_4TAP_HS400)))
> 
> This becomes very hard to read. We need to simplify it.

I agree but I could not find a neat way of doing it. How about?

    bool use_4tap = host->pdata->flags & TMIO_MMC_HAVE_4TAP_HS400;

    if (!(host->mmc->ios.timing == MMC_TIMING_UHS_SDR104) &&
	!(host->mmc->ios.timing == MMC_TIMING_MMC_HS200) &&
	!(host->mmc->ios.timing == MMC_TIMING_MMC_HS400 && !use_4tap))
	   return false;

> 
> And can you bounce me your debugging mail from today again? I seem to
> have lost it :(

Bounced.

> 
> Thanks,
> 
>    Wolfram



-- 
Regards,
Niklas S�derlund
