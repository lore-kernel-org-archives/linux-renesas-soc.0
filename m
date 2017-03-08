Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <148897090350.16106.1978549972946371705.sendpatchset@little-apple>
References: <148897088333.16106.13237004440297956899.sendpatchset@little-apple>
 <148897090350.16106.1978549972946371705.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Mar 2017 14:47:09 +0100
Message-ID: <CAMuHMdUGnXiOu5oDJ-DE+KGDZEB11P6cwnwdTPwd1HVBT4TqbA@mail.gmail.com>
Subject: Re: [PATCH v3 02/09] iommu/ipmmu-vmsa: Add optional root device feature
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

On Wed, Mar 8, 2017 at 12:01 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add root device handling to the IPMMU driver by allowing certain
> DT compat strings to enable has_cache_leaf_nodes that in turn will
> support both root devices with interrupts and leaf devices that
> face the actual IPMMU consumer devices.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

> --- 0011/drivers/iommu/ipmmu-vmsa.c
> +++ work/drivers/iommu/ipmmu-vmsa.c     2017-03-08 17:56:51.770607110 +0900

> @@ -216,6 +219,44 @@ static void set_archdata(struct device *
>  #define IMUASID_ASID0_SHIFT            0
>
>  /* -----------------------------------------------------------------------------
> + * Root device handling
> + */
> +
> +static bool ipmmu_is_root(struct ipmmu_vmsa_device *mmu)
> +{
> +       if (mmu->features->has_cache_leaf_nodes)
> +               return mmu->is_leaf ? false : true;

Expressions using the ternary operator are sometimes hard to read.
In this case, you want negation, so why not use that?

return !mmu->is_leaf;

> +       else

I'd drop the else.

> +               return true; /* older IPMMU hardware treated as single root */
> +}
> +
> +static struct ipmmu_vmsa_device *__ipmmu_find_root(void)
> +{
> +       struct ipmmu_vmsa_device *mmu;
> +       bool found = false;

struct ipmmu_vmsa_device *root = NULL;

> +
> +       spin_lock(&ipmmu_devices_lock);
> +
> +       list_for_each_entry(mmu, &ipmmu_devices, list) {
> +               if (ipmmu_is_root(mmu)) {
> +                       found = true;

root = mmu;

> +                       break;
> +               }
> +       }
> +
> +       spin_unlock(&ipmmu_devices_lock);
> +       return found ? mmu : NULL;

return root;

> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
