Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20160606035810.31763.53611.sendpatchset@little-apple>
References: <20160606035723.31763.66500.sendpatchset@little-apple> <20160606035810.31763.53611.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Feb 2017 13:59:11 +0100
Message-ID: <CAMuHMdWSDrcbrh5+hQ4SqwOxobG0b1zpRN0+Gpgopi+kzLOLQg@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] iommu/ipmmu-vmsa: Make use of IOMMU_OF_DECLARE()
To: Magnus Damm <magnus.damm@gmail.com>
Cc: iommu@lists.linux-foundation.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Joerg Roedel <joro@8bytes.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Mon, Jun 6, 2016 at 5:58 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Hook up IOMMU_OF_DECLARE() support in case CONFIG_IOMMU_DMA
> is enabled. The only current supported case for 32-bit ARM
> is disabled, however for 64-bit ARM this is required.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
>
>  Changes since V1:
>  - Reworked slightly to fit updated patch order and
>    [PATCH v3 00/06] iommu/ipmmu-vmsa: IPMMU multi-arch update V3
>
>  drivers/iommu/ipmmu-vmsa.c |   26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> --- 0015/drivers/iommu/ipmmu-vmsa.c
> +++ work/drivers/iommu/ipmmu-vmsa.c     2016-06-06 10:57:26.790607110 +0900

> +#ifdef CONFIG_IOMMU_DMA
> +static int __init ipmmu_vmsa_iommu_of_setup(struct device_node *np)
> +{
> +       static const struct iommu_ops *ops = &ipmmu_ops;
> +
> +       ipmmu_init();
> +
> +       of_iommu_set_ops(np, (struct iommu_ops *)ops);

As of commit 65e251a4634c5644 ("iommu: Drop the of_iommu_{set/get}_ops()
interface"), this should become:

        iommu_register_instance(&np->fwnode, (struct iommu_ops *)ops);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
