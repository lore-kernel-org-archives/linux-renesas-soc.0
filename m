Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:35648 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750742AbdAWMul (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 07:50:41 -0500
Received: by mail-io0-f194.google.com with SMTP id m98so14857509iod.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2017 04:50:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <148517354599.18128.1970642879780864733.sendpatchset@little-apple>
References: <148517349585.18128.10696161017872202809.sendpatchset@little-apple>
 <148517354599.18128.1970642879780864733.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Jan 2017 13:50:18 +0100
Message-ID: <CAMuHMdWyV4DWN5pKsp+Z6C0MhZF5fKch4T1g1_Hbk3oxrR6_zw@mail.gmail.com>
Subject: Re: [PATCH/RFC 2/2] iommu/ipmmu-vmsa: Opt-in slave devices based on
 ES version
To: Magnus Damm <magnus.damm@gmail.com>
Cc: iommu@lists.linux-foundation.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Joerg Roedel <joro@8bytes.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Mon, Jan 23, 2017 at 1:12 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Match on r8a7795 ES2 and enable a certain DMA controller.
> In other cases the IPMMU driver remains disabled.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
>
>  drivers/iommu/ipmmu-vmsa.c |   24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> --- 0001/drivers/iommu/ipmmu-vmsa.c
> +++ work/drivers/iommu/ipmmu-vmsa.c     2017-01-23 20:57:02.620607110 +0900
> @@ -23,6 +23,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
> +#include <linux/sys_soc.h>
>
>  #if defined(CONFIG_ARM) && !defined(CONFIG_IOMMU_DMA)
>  #include <asm/dma-iommu.h>
> @@ -1002,16 +1003,39 @@ static void ipmmu_domain_free_dma(struct
>         }
>  }
>
> +static const struct soc_device_attribute r8a7795es2[] = {
> +       { .soc_id = "r8a7795", .revision = "ES2.*" },
> +       { /* sentinel */ }
> +};
> +
> +static int ipmmu_slave_whitelist(struct device *dev)
> +{
> +       /* Opt-in slave devices based on SoC and ES version */
> +       if (soc_device_match(r8a7795es2)) {
> +               if (!strcmp(dev_name(dev), "e7310000.dma-controller"))
> +                       return 0;
> +       }

I have two comments about the construct above:
  1. IPMMU will be disabled on all non-r8a7795 SoCs.
     Is that what you want?
  2. Usually we match on the old broken versions instead (e.g. against
     "ES1.*"), as (1) it marks more clearly support for old SoCs, and
                (2) it makes it easier to remove the check later when these
                    old SoCs are deemed extinct later.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
