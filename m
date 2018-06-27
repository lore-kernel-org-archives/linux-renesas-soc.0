Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44708 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932084AbeF0GON (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jun 2018 02:14:13 -0400
Received: by mail-lj1-f193.google.com with SMTP id t22-v6so642405ljc.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jun 2018 23:14:13 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Wed, 27 Jun 2018 08:14:11 +0200
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH 1/3] mmc: tmio: Add initial setting of interrupt mask
 register
Message-ID: <20180627061411.GQ5237@bigcity.dyn.berto.se>
References: <20180606232252.31583-1-niklas.soderlund+renesas@ragnatech.se>
 <20180606232252.31583-2-niklas.soderlund+renesas@ragnatech.se>
 <20180609181552.ks4awvnin4khowb4@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180609181552.ks4awvnin4khowb4@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your feedback.

On 2018-06-09 20:15:52 +0200, Wolfram Sang wrote:
> Hi Niklas,
> 
> On Thu, Jun 07, 2018 at 01:22:50AM +0200, Niklas S�derlund wrote:
> > From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > 
> > The initial value of the interrupt mask register may be different from
> > the H/W manual at the startup of the kernel by setting of initial program.
> 
> s/initial program/bootloader/ ?

Sounds much better.

> 
> > Since the error interrupts may be unmasked, the driver sets initial value.
> > 
> > Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/mmc/host/tmio_mmc.h      | 1 +
> >  drivers/mmc/host/tmio_mmc_core.c | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> > index e7d651352dc90fb8..bfb76b2963f80894 100644
> > --- a/drivers/mmc/host/tmio_mmc.h
> > +++ b/drivers/mmc/host/tmio_mmc.h
> > @@ -102,6 +102,7 @@
> >  
> >  /* Define some IRQ masks */
> >  /* This is the mask used at reset by the chip */
> > +#define TMIO_MASK_INIT          0x8b7f031d /* H/W initial value */
> 
> known on R-Car 2+ only!

No it's also know on Gen3 :-)

If you check the documents for the registers SD_INFO1_MASK and 
SD_INFO2_MASK they describe there respective initial values. If one 
combines them you get the same constant as documented here.

The tricky part is that sd_ctrl_write32_as_16_and_16() is used to write 
them so you have to take 16 bits from each register description as that 
is how the are written. After the fun bus shift is applied this ends up 
writing the lower 16 bits of the constant to 0x80 and the higher 
16 of it to 0x88.

> 
> >  #define TMIO_MASK_ALL           0x837f031d
> >  #define TMIO_MASK_READOP  (TMIO_STAT_RXRDY | TMIO_STAT_DATAEND)
> >  #define TMIO_MASK_WRITEOP (TMIO_STAT_TXRQ | TMIO_STAT_DATAEND)
> > diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> > index 3080299303045adc..2ede81476daf76ce 100644
> > --- a/drivers/mmc/host/tmio_mmc_core.c
> > +++ b/drivers/mmc/host/tmio_mmc_core.c
> > @@ -1273,6 +1273,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
> >  	tmio_mmc_clk_stop(_host);
> >  	tmio_mmc_reset(_host);
> >  
> > +	sd_ctrl_write32_as_16_and_16(_host, CTL_IRQ_MASK, TMIO_MASK_INIT);
> 
> So, we should at least protect this with TMIO_MMC_MIN_RCAR2, I'd think.
> Maybe we should even move it to renesas_sdhi_core.c, but I am not too
> sure about that.
> 
> Regards,
> 
>    Wolfram
> 



-- 
Regards,
Niklas S�derlund
