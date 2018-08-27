Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34065 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbeH0TQU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 15:16:20 -0400
Received: by mail-lj1-f195.google.com with SMTP id f8-v6so12749246ljk.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Aug 2018 08:29:14 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Mon, 27 Aug 2018 17:29:11 +0200
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] mmc: renesas_sdhi: handle 4tap hs400 mode quirk
 based on SoC revision
Message-ID: <20180827152911.GE15572@bigcity.dyn.berto.se>
References: <20180806191227.28401-1-niklas.soderlund+renesas@ragnatech.se>
 <20180806191227.28401-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXstt90ZEOv5nxgDd5jV_Ux98tsYoVr_U=hSZrHYb=dfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXstt90ZEOv5nxgDd5jV_Ux98tsYoVr_U=hSZrHYb=dfQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thanks for your feedback.

On 2018-08-06 21:55:17 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Mon, Aug 6, 2018 at 9:43 PM Niklas S�derlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Latest datasheet makes it clear that not all ES revisions of the H3 and
> > M3-W have the 4-tap HS400 mode quirk, currently the quirk is set
> > unconditionally for these two SoCs. Prepare to handle the quirk based on
> > SoC revision instead of compatibility value by using soc_device_match()
> > and set the TMIO_MMC_HAVE_4TAP_HS400 flag explicitly.
> 
> Thanks for your patch!
> 
> > The reason for adding a new quirks struct instead of just a flag is that
> > looking ahead it seems more quirks needs to be handled in a SoC revision
> > basis.
> 
> Do you expect to add a lot? If yes...

Looking at the BSP it looks like there will be just one more quirk 
needed.

> 
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> 
> > @@ -569,6 +588,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
> >
> >         of_data = of_device_get_match_data(&pdev->dev);
> >
> > +       attr = soc_device_match(sdhi_quirks_match);
> > +       if (attr)
> > +               quirks = attr->data;
> 
> ... you may consider just storing a plain struct renesas_sdhi_of_data in
> the sdhi_quirks_match[] table.

I think this design is less messy as the quirks gets added in 
renesas_sdhi_core.c instead of needing to keep 
renesas_sdhi_internal_dmac.c and renesas_sdhi_sys_dmac.c in sync with 
the quirks.

Wolfram what do you think about this design?

> 
> > +
> >         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >         if (!res)
> >                 return -EINVAL;
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
