Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60263 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbeKNAh0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 19:37:26 -0500
Date: Tue, 13 Nov 2018 06:38:57 -0800
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Vinod <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Richard Weinberger <richard@nod.at>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux-sh list <linux-sh@vger.kernel.org>
Subject: Re: [PATCH/RFC] dmaengine: sh: Remove R-Mobile APE6 support
Message-ID: <20181113143857.tsbv4alzrnn6wcrl@verge.net.au>
References: <20181112152221.10053-1-geert+renesas@glider.be>
 <CAMuHMdVV+NnwX+4o19wyF6GVF7Xk52nDyruJLfAfzvAMPhrcKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVV+NnwX+4o19wyF6GVF7Xk52nDyruJLfAfzvAMPhrcKQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 12, 2018 at 04:30:29PM +0100, Geert Uytterhoeven wrote:
> CC SuperH
> 
> On Mon, Nov 12, 2018 at 4:22 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Renesas R-Mobile APE6 support is currently unused:
> >   - DMA slaves were never enabled in r8a73a4.dtsi,
> >   - The driver relies on legacy filter matching and describing all
> >     slaves and MID/RIDs in a table, unlike modern DMA engine drivers for
> >     similar hardware like rcar-dmac,
> >   - The driver doesn't seem to work well.
> >
> > Remove the driver, it can be resurrected from git history when needed.
> >
> > As this was the last user of SH_DMAE_BASE on Renesas ARM SoCs, the
> > sh-dma-engine driver core is now used on SuperH only.
> >
> > Note that the DT bindings are still present, as r8a73a4.dtsi uses them.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Notes:
> >   1. As Renesas ARM SoCs no longer use drivers/dma/sh/shdma-base.c, the
> >      task to remove use of the deprecated dma_slave_config.direction
> >      field gets thrown into the SuperH maintainers' basket ;-)
> >   2. This affects shmobile_defconfig and renesas_defconfig
> >      (CONFIG_SH_DMAE_BASE and CONFIG_SH_DMAE are no longer enabled by
> >      default).
> >   3. I tried to get SCIFA DMA to work by:
> >        - Applying the DT and driver patches below,
> >        - Reverting 219fb0c1436e4893 ("serial: sh-sci: Remove the
> >          platform data dma slave rx/tx channel IDs").
> >      After that, serial console output using DMA seems to work, but the
> >      system locks up when receiving any serial console input.
> >      Probably it is easier to add r8a73a4 support to rcar-dmac.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
