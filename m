Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20160602155519.31018.59925.sendpatchset@little-apple>
References: <20160602155519.31018.59925.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jun 2016 23:00:16 +0200
Message-ID: <CAMuHMdUjgqp3NkFC8RSOTvnsREB_b=Cj=DgYyBy--63JO=rzxg@mail.gmail.com>
Subject: Re: [PATCH v3 00/06] iommu/ipmmu-vmsa: IPMMU multi-arch update V3
To: Magnus Damm <magnus.damm@gmail.com>
Cc: iommu@lists.linux-foundation.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Joerg Roedel <joro@8bytes.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms+renesas@verge.net.au>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Thu, Jun 2, 2016 at 5:55 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> iommu/ipmmu-vmsa: IPMMU multi-arch update V3
>
> [PATCH v3 01/06] iommu/ipmmu-vmsa: Remove platform data handling
> [PATCH v3 02/06] iommu/ipmmu-vmsa: Rework interrupt code and use bitmap for context
> [PATCH v3 03/06] iommu/ipmmu-vmsa: Break out utlb parsing code
> [PATCH v3 04/06] iommu/ipmmu-vmsa: Break out domain allocation code
> [PATCH v3 05/06] iommu/ipmmu-vmsa: Add new IOMMU_DOMAIN_DMA ops
> [PATCH v3 06/06] iommu/ipmmu-vmsa: Drop LPAE Kconfig dependency
>
> These patches update the IPMMU driver with a couple of changes
> to support build on multiple architectures. In the process of
> doing so the interrupt code gets reworked and the foundation
> for supporting multiple contexts are added.
>
> In this version of the series the patch order has been reworked
> to make simplify review. Thanks to Laurent for his suggestions!
>
> The 32-bit ARM logic has intentionally been changed as little as possible
> to avoid breakage. Once CONFIG_IOMMU_DMA can be used it may be good time
> to revisit the init ordering for the 32-bit SoCs. There is room for
> improvement for sure like Robin Murphy kindly pointed out.

When IPMMU_VMSA is enabled on 32-bit ARM, the system crashes during boot.
I saw this first on r8a73a4/ape6evm, where my local config had it enabled.
After enabling IOMMU support and IPMMU_VMSA in my config for r8a7791/koelsch,
koelsch crashes during boot, too, although the failure mode is different.

Unfortunately I've lost all collected crash logs in a power failure due to the
bad weather. So you may beat me to reproduce this.

I did verify in time that the crashes do not happen with a similar config on
renesas-drivers-2016-05-31-v4.7-rc1, which contained the previous version of
your patch set.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
