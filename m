Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <148897097336.16106.17118406255063350893.sendpatchset@little-apple>
References: <148897088333.16106.13237004440297956899.sendpatchset@little-apple>
 <148897097336.16106.17118406255063350893.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Mar 2017 14:58:51 +0100
Message-ID: <CAMuHMdVQgdZyn0YGYCWEwnhvkxKMGG_T0vDL5ir=vC-pvLOY6A@mail.gmail.com>
Subject: Re: [PATCH v3 09/09] iommu/ipmmu-vmsa: Hook up r8a7795 DT matching code
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

On Wed, Mar 8, 2017 at 12:02 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Tie in r8a7795 features and update the IOMMU_OF_DECLARE
> compat string to include the updated compat string.
>
> TODO:
>  - Consider making use of iommu_fwspec_add_ids() for uTLB handling
>      Needed to coexist with non-OF R-Car Gen2 somehow...
>  - Break out stuff useful for R-Car Gen2 from this series
>      Fix up the Gen2 IPMMU support code
>        and/or
>      Fold more stuff into the multi-arch series
>  - Add support for sysfs and iommu_device_link()/unlink()
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

> --- 0018/drivers/iommu/ipmmu-vmsa.c
> +++ work/drivers/iommu/ipmmu-vmsa.c     2017-03-08 19:11:53.600607110 +0900

> @@ -1043,6 +1048,17 @@ static struct iommu_group *ipmmu_find_gr
>         return group;
>  }
>
> +static bool ipmmu_slave_whitelist(struct device *dev)
> +{
> +       /* By default, do not allow use of IPMMU */
> +       return false;
> +}
> +
> +static const struct soc_device_attribute soc_r8a7795[] = {
> +       { .soc_id = "r8a7795", },

If/when the whitelist is/becomes device/revision specific, you probably want
to store a  pointer to the *_slave_whitelist() function in the .data member?

> +       { /* sentinel */ }
> +};
> +
>  static int ipmmu_of_xlate_dma(struct device *dev,
>                               struct of_phandle_args *spec)
>  {
> @@ -1053,6 +1069,18 @@ static int ipmmu_of_xlate_dma(struct dev
>         if (!of_device_is_available(spec->np))
>                 return -ENODEV;
>
> +       /* Failing in ->attach_device() results in a hang, so make
> +        * sure the root device is installed before going there
> +        */
> +       if (!__ipmmu_find_root()) {
> +               dev_info(dev, "Unable to locate IPMMU root device\n");

dev_err?

> +               return -ENODEV;
> +       }
> +
> +       /* For R-Car Gen3 use a white list to opt-in slave devices */
> +       if (soc_device_match(soc_r8a7795) && !ipmmu_slave_whitelist(dev))
> +               return -ENODEV;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
