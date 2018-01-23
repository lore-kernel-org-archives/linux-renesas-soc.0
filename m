Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:43570 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751154AbeAWKC6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Jan 2018 05:02:58 -0500
Received: by mail-qt0-f195.google.com with SMTP id s3so28240864qtb.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2018 02:02:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171114090051.262isjc2oqe7b2qk@verge.net.au>
References: <20171114090051.262isjc2oqe7b2qk@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Jan 2018 11:02:56 +0100
Message-ID: <CAMuHMdUXkXYEi_vuz2ERWeQdYFHG6sWPXo2-KQq-JtxG6DL6Sg@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] iommu/ipmmu-vmsa: Add
 r8a779(6|70|95) support
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, Nov 14, 2017 at 10:00 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> please consider pulling IPMMU driver support for the
> r8a7796 (R-Car M3-W), r8a77970 (R-Car V3M) and r8a77995 (R-Car D3) SoCs.
>
> This is v5 of the driver updates for the r8a7795, they are unchanged other
> than rebasing since v4. The driver changes for the r8a77970 and r8a77995
> are new.
>
> I will provide the corresponding bindings and DTS updates for these SoCs
> separately.
>
> This pull request is based on the iommu/ipmmu-vmsa branch of the vfio tree
> which now includes the IPMMU driver and bindings for the r8a7795 (R-Car H3)
> SoC.
>
>
> The following changes since commit 58b8e8bf409236cdea379b8a3ab5d7b85a003d22:
>
>   iommu/ipmmu-vmsa: Hook up r8a7795 DT matching code (2017-11-06 10:29:39 -0700)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/ipmmu-driver-v5
>
> for you to fetch changes up to 251fd0273a508dbfb1185f40f731c58e0b17ffa8:

This new conflicts with:

e7747d88e05eabed ("iommu/ipmmu-vmsa: Remove redundant of_iommu_init_fn hook")
b0c560f7d8a4b333 ("iommu: Clean up of_iommu_init_fn")

I fixed it up like below:

diff --cc drivers/iommu/ipmmu-vmsa.c
index 40ae6e87cb880223,49c6fc0c1ae675b2..0000000000000000
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@@ -1108,8 -1124,24 +1124,11 @@@ static void __exit ipmmu_exit(void
  subsys_initcall(ipmmu_init);
  module_exit(ipmmu_exit);

 -#ifdef CONFIG_IOMMU_DMA
 -static int __init ipmmu_vmsa_iommu_of_setup(struct device_node *np)
 -{
 -      ipmmu_init();
 -      return 0;
 -}
 -
 -IOMMU_OF_DECLARE(ipmmu_vmsa_iommu_of, "renesas,ipmmu-vmsa",
 -               ipmmu_vmsa_iommu_of_setup);
 -IOMMU_OF_DECLARE(ipmmu_r8a7795_iommu_of, "renesas,ipmmu-r8a7795",
 -               ipmmu_vmsa_iommu_of_setup);
 -IOMMU_OF_DECLARE(ipmmu_r8a7796_iommu_of, "renesas,ipmmu-r8a7796",
 -               ipmmu_vmsa_iommu_of_setup);
 -IOMMU_OF_DECLARE(ipmmu_r8a77970_iommu_of, "renesas,ipmmu-r8a77970",
 -               ipmmu_vmsa_iommu_of_setup);
 -IOMMU_OF_DECLARE(ipmmu_r8a77995_iommu_of, "renesas,ipmmu-r8a77995",
 -               ipmmu_vmsa_iommu_of_setup);
 -#endif
 +IOMMU_OF_DECLARE(ipmmu_vmsa_iommu_of, "renesas,ipmmu-vmsa");
 +IOMMU_OF_DECLARE(ipmmu_r8a7795_iommu_of, "renesas,ipmmu-r8a7795");
++IOMMU_OF_DECLARE(ipmmu_r8a7796_iommu_of, "renesas,ipmmu-r8a7796");
++IOMMU_OF_DECLARE(ipmmu_r8a77970_iommu_of, "renesas,ipmmu-r8a77970");
++IOMMU_OF_DECLARE(ipmmu_r8a77995_iommu_of, "renesas,ipmmu-r8a77995");

  MODULE_DESCRIPTION("IOMMU API for Renesas VMSA-compatible IPMMU");
  MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
