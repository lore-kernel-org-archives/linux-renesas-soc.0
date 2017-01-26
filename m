Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1485424391-29914-1-git-send-email-geert+renesas@glider.be>
References: <1485424391-29914-1-git-send-email-geert+renesas@glider.be>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 26 Jan 2017 19:17:00 +0900
Message-ID: <CANqRtoQ+5K1_raVjNyexP+zB9FHmhLizxYCoi1rLC9F8FVw4SA@mail.gmail.com>
Subject: Re: [PATCH/RFC] iommu/ipmmu-vmsa: Restrict IOMMU Domain Geometry to
 32-bit address space
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        iommu@lists.linux-foundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Thu, Jan 26, 2017 at 6:53 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Currently, the IPMMU/VMSA driver supports 32-bit I/O Virtual Addresses
> only, and thus sets io_pgtable_cfg.ias = 32.  However, it doesn't force
> a 32-bit IOVA space through the IOMMU Domain Geometry.
>
> Hence if a device (e.g. SYS-DMAC) rightfully configures a 40-bit DMA
> mask, it will still be handed out a 40-bit IOVA, outside the 32-bit IOVA
> space, leading to out-of-bounds accesses of the PGD when mapping the
> IOVA.
>
> Force a 32-bit IOMMU Domain Geometry to fix this.

Nice, thanks!

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Should the generic code restrict the geometry based on IAS instead?

Might make sense. Since this is a software policy limited by hardware
it might be good to use as small IOVA space as possible to improve
performance. So selecting IOVA space based on slave device or domain
policy or something similar might be a good thing to do. Not sure how
to tie that into the IOMMU subsystem though...

Thanks!

/ magnus
