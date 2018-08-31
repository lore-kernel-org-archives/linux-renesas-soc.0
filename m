Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:42538 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbeHaMQc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 08:16:32 -0400
MIME-Version: 1.0
References: <20180830213843.14680-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWTPNxUQ+Go-CPe3KZqr9eoLTaegbvE2OdmwHhBi6n+hg@mail.gmail.com> <20180831075703.GG28374@bigcity.dyn.berto.se>
In-Reply-To: <20180831075703.GG28374@bigcity.dyn.berto.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Aug 2018 10:10:04 +0200
Message-ID: <CAMuHMdWa-c1QcYN_moyck4J1Dte3LyEHfRZ5Ai915UX82CxbPw@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: renesas_sdhi_internal_dmac: set scatter/gather
 max segment size
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Fri, Aug 31, 2018 at 9:57 AM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2018-08-31 00:10:28 +0200, Geert Uytterhoeven wrote:
> > On Thu, Aug 30, 2018 at 11:39 PM Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > Fix warning when running with CONFIG_DMA_API_DEBUG_SG=y by allocating a
> > > device_dma_parameters structure and filling in the max segment size. The
> > > size used is the result of a discussion with Renesas hardware engineers
> > > and unfortunately not found in the datasheet.
> > >
> > >   renesas_sdhi_internal_dmac ee140000.sd: DMA-API: mapping sg segment
> > >   longer than device claims to support [len=126976] [max=65536A]

> > > --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> > > +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> > > @@ -308,12 +308,23 @@ static const struct soc_device_attribute gen3_soc_whitelist[] = {
> > >  static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
> > >  {
> > >         const struct soc_device_attribute *soc = soc_device_match(gen3_soc_whitelist);
> > > +       struct device *dev = &pdev->dev;
> > >
> > >         if (!soc)
> > >                 return -ENODEV;
> > >
> > >         global_flags |= (unsigned long)soc->data;
> > >
> > > +       if (!dev->dma_parms) {
> >
> > I guess dev->dma_parms is retained on unbind/rebind?
> >
> > > +               dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
> > > +                                             GFP_KERNEL);
> >
> > But by using devm_kzalloc(), the memory will be freed, and lead to reuse after
> > free?
>
> I don't know how the unbind/rebind behaves in this regard. In v1 of this

I expect the struct device to be retained. You can check with sysfs unbind/bind,
and CONFIG_DEBUG_SLAB=y to enable poisoning on free (or just print
the value found for less spectacular behavior ;-)

> patch I used kzalloc() and a remove function to free the memory and
> reset the dev->dma_parms pointe to NULL. Do you think that is the
> correct approach here?

As a comment in the other thread said you should not set it multiple times,
probably the best solution is to:
  (a) check if dev->dma_parms is already set, and if not:
      (b) allocate using plain kzalloc() (with a comment why!),
      (c) not free the memory nor reset dev->dma_parms (with a comment why!).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
