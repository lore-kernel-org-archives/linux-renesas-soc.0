Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 30 May 2017 08:16:09 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] mmc: use proper name for the R-Car SoC
Message-ID: <20170530071609.p4wrpqywrfllgy4z@dell>
References: <20170528093051.11816-1-wsa+renesas@sang-engineering.com>
 <20170528093051.11816-5-wsa+renesas@sang-engineering.com>
 <CAPDyKFoyer03ukhHEGBsQ+Ua639E4dvPp_RJCmYW1Ymap90Pnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPDyKFoyer03ukhHEGBsQ+Ua639E4dvPp_RJCmYW1Ymap90Pnw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, 29 May 2017, Ulf Hansson wrote:

> On 28 May 2017 at 11:30, Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> > It is 'R-Car', not 'RCar'. No code or binding changes, only descriptive text.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Thanks, applied for next!
> 
> For mfd, Lee, please tell if you have any issues me picking this via
> my mmc tree.

I don't, but it is normal procedure to wait for an Ack from all
Maintainers involved before applying. ;)

> > ---
> > I suggest this trivial patch should be picked individually per susbsystem.
> >
> >  drivers/mmc/host/renesas_sdhi_core.c | 2 +-
> >  include/linux/mfd/tmio.h             | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> > index 846ee1a8e5a675..397b3e29977ea8 100644
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -130,7 +130,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
> >         unsigned int freq, diff, best_freq = 0, diff_min = ~0;
> >         int i, ret;
> >
> > -       /* tested only on RCar Gen2+ currently; may work for others */
> > +       /* tested only on R-Car Gen2+ currently; may work for others */
> >         if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
> >                 return clk_get_rate(priv->clk);
> >
> > diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
> > index a1520d88ebf3a3..c83c16b931a886 100644
> > --- a/include/linux/mfd/tmio.h
> > +++ b/include/linux/mfd/tmio.h
> > @@ -66,7 +66,7 @@
> >   */
> >  #define TMIO_MMC_SDIO_IRQ              (1 << 2)
> >
> > -/* Some features are only available or tested on RCar Gen2 or later */
> > +/* Some features are only available or tested on R-Car Gen2 or later */
> >  #define TMIO_MMC_MIN_RCAR2             (1 << 3)
> >
> >  /*
> >

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
