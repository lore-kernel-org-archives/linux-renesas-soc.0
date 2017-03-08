Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <148885666392.28553.6653211200015255398.sendpatchset@little-apple>
References: <148885660307.28553.995847796823338863.sendpatchset@little-apple> <148885666392.28553.6653211200015255398.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Mar 2017 10:55:02 +0100
Message-ID: <CAMuHMdVZda4ofjPS0PtQBgnBJPrqgkSGFD92EeuHfU9f8tpMFg@mail.gmail.com>
Subject: Re: [PATCH v7 06/07] iommu/ipmmu-vmsa: ARM and ARM64 archdata access
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Tue, Mar 7, 2017 at 4:17 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Not all architectures have an iommu member in their archdata, so
> use #ifdefs support build with COMPILE_TEST on any architecture.

to support

> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- 0010/drivers/iommu/ipmmu-vmsa.c
> +++ work/drivers/iommu/ipmmu-vmsa.c     2017-03-06 19:26:26.070607110 +0900
> @@ -72,6 +72,25 @@ static struct ipmmu_vmsa_domain *to_vmsa
>         return container_of(dom, struct ipmmu_vmsa_domain, io_domain);
>  }
>
> +#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
> +static struct ipmmu_vmsa_archdata *to_archdata(struct device *dev)
> +{
> +       return dev->archdata.iommu;
> +}
> +static void set_archdata(struct device *dev, struct ipmmu_vmsa_archdata *p)
> +{
> +       dev->archdata.iommu = p;
> +}
> +#else

#else /* compile testing */

> +static struct ipmmu_vmsa_archdata *to_archdata(struct device *dev)
> +{
> +       return NULL;
> +}
> +static void set_archdata(struct device *dev, struct ipmmu_vmsa_archdata *p)
> +{
> +}
> +#endif

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
