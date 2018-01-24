Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54767 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933067AbeAXKif (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jan 2018 05:38:35 -0500
Date: Wed, 24 Jan 2018 11:38:16 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [GIT PULL FOR renesas-drivers] iommu/ipmmu-vmsa: Add
 r8a779(6|70|95) support
Message-ID: <20180124103815.jtwitncktvagv4mg@verge.net.au>
References: <20171114090051.262isjc2oqe7b2qk@verge.net.au>
 <CAMuHMdUXkXYEi_vuz2ERWeQdYFHG6sWPXo2-KQq-JtxG6DL6Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUXkXYEi_vuz2ERWeQdYFHG6sWPXo2-KQq-JtxG6DL6Sg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 23, 2018 at 11:02:56AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Tue, Nov 14, 2017 at 10:00 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > please consider pulling IPMMU driver support for the
> > r8a7796 (R-Car M3-W), r8a77970 (R-Car V3M) and r8a77995 (R-Car D3) SoCs.
> >
> > This is v5 of the driver updates for the r8a7795, they are unchanged other
> > than rebasing since v4. The driver changes for the r8a77970 and r8a77995
> > are new.
> >
> > I will provide the corresponding bindings and DTS updates for these SoCs
> > separately.
> >
> > This pull request is based on the iommu/ipmmu-vmsa branch of the vfio tree
> > which now includes the IPMMU driver and bindings for the r8a7795 (R-Car H3)
> > SoC.
> >
> >
> > The following changes since commit 58b8e8bf409236cdea379b8a3ab5d7b85a003d22:
> >
> >   iommu/ipmmu-vmsa: Hook up r8a7795 DT matching code (2017-11-06 10:29:39 -0700)
> >
> > are available in the git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/ipmmu-driver-v5
> >
> > for you to fetch changes up to 251fd0273a508dbfb1185f40f731c58e0b17ffa8:
> 
> This new conflicts with:
> 
> e7747d88e05eabed ("iommu/ipmmu-vmsa: Remove redundant of_iommu_init_fn hook")
> b0c560f7d8a4b333 ("iommu: Clean up of_iommu_init_fn")
> 
> I fixed it up like below:
> 
> diff --cc drivers/iommu/ipmmu-vmsa.c
> index 40ae6e87cb880223,49c6fc0c1ae675b2..0000000000000000
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@@ -1108,8 -1124,24 +1124,11 @@@ static void __exit ipmmu_exit(void
>   subsys_initcall(ipmmu_init);
>   module_exit(ipmmu_exit);
> 
>  -#ifdef CONFIG_IOMMU_DMA
>  -static int __init ipmmu_vmsa_iommu_of_setup(struct device_node *np)
>  -{
>  -      ipmmu_init();
>  -      return 0;
>  -}
>  -
>  -IOMMU_OF_DECLARE(ipmmu_vmsa_iommu_of, "renesas,ipmmu-vmsa",
>  -               ipmmu_vmsa_iommu_of_setup);
>  -IOMMU_OF_DECLARE(ipmmu_r8a7795_iommu_of, "renesas,ipmmu-r8a7795",
>  -               ipmmu_vmsa_iommu_of_setup);
>  -IOMMU_OF_DECLARE(ipmmu_r8a7796_iommu_of, "renesas,ipmmu-r8a7796",
>  -               ipmmu_vmsa_iommu_of_setup);
>  -IOMMU_OF_DECLARE(ipmmu_r8a77970_iommu_of, "renesas,ipmmu-r8a77970",
>  -               ipmmu_vmsa_iommu_of_setup);
>  -IOMMU_OF_DECLARE(ipmmu_r8a77995_iommu_of, "renesas,ipmmu-r8a77995",
>  -               ipmmu_vmsa_iommu_of_setup);
>  -#endif
>  +IOMMU_OF_DECLARE(ipmmu_vmsa_iommu_of, "renesas,ipmmu-vmsa");
>  +IOMMU_OF_DECLARE(ipmmu_r8a7795_iommu_of, "renesas,ipmmu-r8a7795");
> ++IOMMU_OF_DECLARE(ipmmu_r8a7796_iommu_of, "renesas,ipmmu-r8a7796");
> ++IOMMU_OF_DECLARE(ipmmu_r8a77970_iommu_of, "renesas,ipmmu-r8a77970");
> ++IOMMU_OF_DECLARE(ipmmu_r8a77995_iommu_of, "renesas,ipmmu-r8a77995");
> 
>   MODULE_DESCRIPTION("IOMMU API for Renesas VMSA-compatible IPMMU");
>   MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");

Thanks, I pushed topic/ipmmu-driver-v6 which incorporates these changes.
