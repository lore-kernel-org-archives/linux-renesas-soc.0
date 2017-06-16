Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <149752258917.21887.4347773581840409774.sendpatchset@little-apple>
References: <149752254550.21887.15183665699230243235.sendpatchset@little-apple>
 <149752258917.21887.4347773581840409774.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jun 2017 09:18:38 +0200
Message-ID: <CAMuHMdXu=0L9GOB+4DWvSTnXZEeyw551JiJ0uro9eECDx4fX-Q@mail.gmail.com>
Subject: Re: [PATCH 04/04] iommu/ipmmu-vmsa: Replace local utlb code with
 fwspec ids
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sricharan R <sricharan@codeaurora.org>,
        Will Deacon <will.deacon@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Thu, Jun 15, 2017 at 12:29 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> Now when both 32-bit and 64-bit code inside the driver is using
> fwspec it is possible to replace the utlb handling with fwspec ids
> that get populated from ->of_xlate().

Thanks for your patch!

> --- 0013/drivers/iommu/ipmmu-vmsa.c
> +++ work/drivers/iommu/ipmmu-vmsa.c     2017-06-15 18:32:27.580607110 +0900

>  static int ipmmu_of_xlate(struct device *dev,
>                           struct of_phandle_args *spec)
>  {
> -       return ipmmu_init_platform_device(dev);
> +       iommu_fwspec_add_ids(dev, spec->args, 1);

Does it hurt if iommu_fwspec_add_ids() is called multiple times, as this is
done before the "Initialize once - xlate() will call multiple times" check?

> +
> +       return ipmmu_init_platform_device(dev, spec);
>  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
