Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f196.google.com ([209.85.221.196]:40382 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbeKLTAB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Nov 2018 14:00:01 -0500
Received: by mail-vk1-f196.google.com with SMTP id v70so1788487vkv.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Nov 2018 01:07:44 -0800 (PST)
MIME-Version: 1.0
References: <154014429795.2869.7870954544925695802.sendpatchset@octo>
 <CAMuHMdXv3LYcjpWxRxnVbcei5e7i0VxOL5RRro24b5_mKODakw@mail.gmail.com>
 <OSBPR01MB2293329B49BE6DCC6E949EF7D8C10@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <CAMuHMdW9U1rJ1mR2kHosb_e7zMGTDN2eznmeEwDu6V0fO35aCA@mail.gmail.com> <OSBPR01MB229375E9A5748E3931A4701CD8C10@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB229375E9A5748E3931A4701CD8C10@OSBPR01MB2293.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Nov 2018 10:07:31 +0100
Message-ID: <CAMuHMdViRia++mKaTnTkoEd42M1nN-L=mvBg32mye_eGxmgpwg@mail.gmail.com>
Subject: Re: [PATCH/RFC] iommu/ipmmu-vmsa: R-Car M3-N/V3H/E3 AVB whitelist prototype
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Mon, Nov 12, 2018 at 9:53 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Monday, November 12, 2018 5:19 PM
> > On Mon, Nov 12, 2018 at 8:24 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> <snip>
> > > --- a/drivers/iommu/ipmmu-vmsa.c
> > > +++ b/drivers/iommu/ipmmu-vmsa.c
> > > @@ -758,10 +758,10 @@ static bool ipmmu_slave_whitelist(struct device *dev)
> > >  }
> > >
> > >  static const struct soc_device_attribute soc_rcar_gen3[] = {
> > > -       { .soc_id = "r8a7795", },
> > > -       { .soc_id = "r8a7796", },
> > > +       { .soc_id = "r8a7795", .revision = "ES3.*" },
> > >         { .soc_id = "r8a77965", },
> > >         { .soc_id = "r8a77970", },
> > > +       { .soc_id = "r8a77990", },
> > >         { .soc_id = "r8a77995", },
> > >         { /* sentinel */ }
> > >  };
> >
> > Given the above, I think the time is ripe to convert this from a whitelist to a
> > blacklist?
>
> About the SoCs, I think so. (I updated example patch below and it seems better :) )
> However, I would like to keep ipmmu_slave_whitelist to avoid any trouble for now...

OK, IC.

> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -757,12 +757,10 @@ static bool ipmmu_slave_whitelist(struct device *dev)
>         return false;
>  }
>
> -static const struct soc_device_attribute soc_rcar_gen3[] = {
> -       { .soc_id = "r8a7795", },
> -       { .soc_id = "r8a7796", },
> -       { .soc_id = "r8a77965", },
> -       { .soc_id = "r8a77970", },
> -       { .soc_id = "r8a77995", },
> +static const struct soc_device_attribute soc_rcar_gen3_blacklist[] = {
> +       { .soc_id = "r8a7795", .revision = "ES1.*" },
> +       { .soc_id = "r8a7795", .revision = "ES2.*" },

I think you can combine both lines using "ES[12].*", too.
But it may be considered less readable, and not greppable for e.g. "ES1".

> +       { .soc_id = "r8a7796", .revision = "ES1.*" },
>         { /* sentinel */ }
>  };
>
> @@ -770,7 +768,8 @@ static int ipmmu_of_xlate(struct device *dev,
>                           struct of_phandle_args *spec)
>  {
>         /* For R-Car Gen3 use a white list to opt-in slave devices */
> -       if (soc_device_match(soc_rcar_gen3) && !ipmmu_slave_whitelist(dev))
> +       if (!soc_device_match(soc_rcar_gen3_blacklist) &&
> +           !ipmmu_slave_whitelist(dev))
>                 return -ENODEV;

Ah, this has the side effect of applying ipmmu_slave_whitelist() on R-Car
Gen2, too, which is probably not what we want?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
