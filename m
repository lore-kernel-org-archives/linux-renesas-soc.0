Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36215 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751879AbdFPHQ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 03:16:58 -0400
MIME-Version: 1.0
In-Reply-To: <149752256764.21887.17904093211691192196.sendpatchset@little-apple>
References: <149752254550.21887.15183665699230243235.sendpatchset@little-apple>
 <149752256764.21887.17904093211691192196.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jun 2017 09:16:56 +0200
Message-ID: <CAMuHMdU6WmnMFXvdBgFnc91NH2JVET=D9r8Wip07U7KrCwwoig@mail.gmail.com>
Subject: Re: [PATCH 02/04] iommu/ipmmu-vmsa: Consistent ->of_xlate() handling
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
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Thu, Jun 15, 2017 at 12:29 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> The 32-bit ARM code gets updated to make use of ->of_xlate() and the
> code is shared between 64-bit and 32-bit ARM. The of_device_is_available()
> check gets dropped since it is included in of_iommu_xlate().
>
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
>
>  drivers/iommu/ipmmu-vmsa.c |   51 ++++++++++++++------------------------------
>  1 file changed, 17 insertions(+), 34 deletions(-)
>
> --- 0009/drivers/iommu/ipmmu-vmsa.c
> +++ work/drivers/iommu/ipmmu-vmsa.c     2017-06-15 17:22:27.460607110 +0900
> @@ -680,6 +680,10 @@ static int ipmmu_init_platform_device(st
>         int num_utlbs;
>         int ret = -ENODEV;
>
> +       /* Initialize once - xlate() will call multiple times */
> +       if (to_priv(dev))
> +               return 0;

I think this is more clear if you move this check to ...

> +
>         /* Find the master corresponding to the device. */
>
>         num_utlbs = of_count_phandle_with_args(dev->of_node, "iommus",
> @@ -734,6 +738,12 @@ error:
>         return ret;
>  }
>
> +static int ipmmu_of_xlate(struct device *dev,
> +                         struct of_phandle_args *spec)
> +{

... here

> +       return ipmmu_init_platform_device(dev);
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
