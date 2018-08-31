Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44025 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbeHaMDR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 08:03:17 -0400
Received: by mail-lj1-f193.google.com with SMTP id m84-v6so9335433lje.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Aug 2018 00:57:05 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Fri, 31 Aug 2018 09:57:03 +0200
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] mmc: renesas_sdhi_internal_dmac: set scatter/gather
 max segment size
Message-ID: <20180831075703.GG28374@bigcity.dyn.berto.se>
References: <20180830213843.14680-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWTPNxUQ+Go-CPe3KZqr9eoLTaegbvE2OdmwHhBi6n+hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWTPNxUQ+Go-CPe3KZqr9eoLTaegbvE2OdmwHhBi6n+hg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thanks for your feedback.

On 2018-08-31 00:10:28 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> Thanks for your patch!
> 
> On Thu, Aug 30, 2018 at 11:39 PM Niklas S�derlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Fix warning when running with CONFIG_DMA_API_DEBUG_SG=y by allocating a
> > device_dma_parameters structure and filling in the max segment size. The
> > size used is the result of a discussion with Renesas hardware engineers
> > and unfortunately not found in the datasheet.
> >
> >   renesas_sdhi_internal_dmac ee140000.sd: DMA-API: mapping sg segment
> >   longer than device claims to support [len=126976] [max=65536A]
> 
> Bogus trailing "A".

Thanks, that is a odd copy-and-past error :-)

> 
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > ---
> >
> > * Changes since v1
> > - Use devm_kzalloc() instead of a custom remove function to clean up.
> > ---
> >  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> > index c9dab9ce1ed55174..715e0c5dc30e4ebf 100644
> > --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> > +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> > @@ -308,12 +308,23 @@ static const struct soc_device_attribute gen3_soc_whitelist[] = {
> >  static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
> >  {
> >         const struct soc_device_attribute *soc = soc_device_match(gen3_soc_whitelist);
> > +       struct device *dev = &pdev->dev;
> >
> >         if (!soc)
> >                 return -ENODEV;
> >
> >         global_flags |= (unsigned long)soc->data;
> >
> > +       if (!dev->dma_parms) {
> 
> I guess dev->dma_parms is retained on unbind/rebind?
> 
> > +               dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
> > +                                             GFP_KERNEL);
> 
> But by using devm_kzalloc(), the memory will be freed, and lead to reuse after
> free?

I don't know how the unbind/rebind behaves in this regard. In v1 of this 
patch I used kzalloc() and a remove function to free the memory and 
reset the dev->dma_parms pointe to NULL. Do you think that is the 
correct approach here?

> 
> > +               if (!dev->dma_parms)
> > +                       return -ENOMEM;
> > +       }
> > +
> > +       if (dma_set_max_seg_size(dev, 0xffffffff))
> > +               dev_warn(dev, "Unable to set seg size\n");
> > +
> >         return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma_ops);
> >  }
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas S�derlund
