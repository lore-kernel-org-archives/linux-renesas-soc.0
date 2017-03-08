Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34903 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752266AbdCHNzP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2017 08:55:15 -0500
MIME-Version: 1.0
In-Reply-To: <148897092335.16106.10892669490439039957.sendpatchset@little-apple>
References: <148897088333.16106.13237004440297956899.sendpatchset@little-apple>
 <148897092335.16106.10892669490439039957.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Mar 2017 14:52:47 +0100
Message-ID: <CAMuHMdVrNMY41k2arM_sZc3cWh+Ac0anRzRLuk8B3PDi8v+i2g@mail.gmail.com>
Subject: Re: [PATCH v3 04/09] iommu/ipmmu-vmsa: Make use of IOMMU_OF_DECLARE()
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
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Wed, Mar 8, 2017 at 12:02 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Hook up IOMMU_OF_DECLARE() support in case CONFIG_IOMMU_DMA
> is enabled. The only current supported case for 32-bit ARM
> is disabled, however for 64-bit ARM usage of OF is required.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se

While I'm not such a big fan of *_OF_DECLARE() (it doesn't support deferred
probing, which is needed for any device with dependencies, like clocks and
power domains), what's the rationale for not using IOMMU_OF_DECLARE()
on arm32, and thus the need for setup_done?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
