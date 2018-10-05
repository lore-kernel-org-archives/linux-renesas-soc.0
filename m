Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42297 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727857AbeJEWuR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Oct 2018 18:50:17 -0400
Received: by mail-lj1-f193.google.com with SMTP id y71-v6so12032470lje.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Oct 2018 08:50:59 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Fri, 5 Oct 2018 17:50:56 +0200
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v2] mmc: tmio: Add initial setting of interrupt mask
 register
Message-ID: <20181005155056.GX24305@bigcity.dyn.berto.se>
References: <20180926150026.668-1-niklas.soderlund+renesas@ragnatech.se>
 <20181002225402.GA812@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181002225402.GA812@kunai>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your feedback.

On 2018-10-03 00:54:02 +0200, Wolfram Sang wrote:
> On Wed, Sep 26, 2018 at 05:00:26PM +0200, Niklas S�derlund wrote:
> > From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > 
> > The initial value of the interrupt mask register may be different from
> > the H/W manual at the startup of the kernel by setting from the
> > bootloader. Since the error interrupts may be unmasked, the driver sets
> > initial value.
> > 
> > The initial value is only known for R-Car Gen2 and Gen3 platforms so
> > limit the initialization to those platforms.
> > 
> > Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > 
> > ---
> > 
> > * Changes since v1
> > - Limit the initialization to Gen2+ platforms by checking the
> >   TMIO_MMC_MIN_RCAR2 flag.
> > - Rename the constant for the initialization value to reflect it's only
> >   for R-Car Gen2+ platforms.
> 
> Those changes are good! I wonder, though, if we shouldn't move the code
> out of TMIO core into the SDHI core? This seems very Renesas specific.
> What do you think?
> 

There are already checks for TMIO_MMC_MIN_RCAR2 inside 
tmio_mmc_host_probe(), but I agree with you it would be good if instead 
of adding to that start to move Renesas specific code out.

I did a quick test and it seems sane to move this to the end of 
renesas_sdhi_hw_reset(). Before I send a v3 of this what is your view?

-- 
Regards,
Niklas S�derlund
