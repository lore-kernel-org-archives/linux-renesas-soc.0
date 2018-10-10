Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39504 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726870AbeJJSaR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Oct 2018 14:30:17 -0400
Received: by mail-lj1-f194.google.com with SMTP id p1-v6so4479537ljg.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Oct 2018 04:08:37 -0700 (PDT)
Date: Wed, 10 Oct 2018 13:08:34 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v2] mmc: tmio: Add initial setting of interrupt mask
 register
Message-ID: <20181010110833.GD24305@bigcity.dyn.berto.se>
References: <20180926150026.668-1-niklas.soderlund+renesas@ragnatech.se>
 <20181002225402.GA812@kunai>
 <20181005155056.GX24305@bigcity.dyn.berto.se>
 <20181009235357.5ilx45oh6eym6loe@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181009235357.5ilx45oh6eym6loe@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for our feedback.

On 2018-10-10 01:53:58 +0200, Wolfram Sang wrote:
> Hi Niklas,
> 
> > There are already checks for TMIO_MMC_MIN_RCAR2 inside 
> > tmio_mmc_host_probe(), but I agree with you it would be good if instead 
> > of adding to that start to move Renesas specific code out.
> 
> Thanks!
> 
> > I did a quick test and it seems sane to move this to the end of 
> > renesas_sdhi_hw_reset(). Before I send a v3 of this what is your view?
> 
> It seems a good place to me if it also gets called when probing the
> device. From a quick glimpse, I see that this function ends up in
> mmc_ops->hw_reset, but I haven't verified that the MMC core calls it
> during probe. But you said you tested it...
> 

You are correct, in mmc/next it is not called during probe. I see now I 
did my testing on-top of the reset series I'm currently reworking and 
then it's called at the right time to use the initial set irq mask for 
the _host->sdcard_irq_mask read out in tmio_mmc_host_probe().

I will move this patch back to the top of the reset series as it would 
IMHO create the least amount of code churn. Another option is to merge 
this version now and move it once the reset series is accepted.

-- 
Regards,
Niklas S�derlund
