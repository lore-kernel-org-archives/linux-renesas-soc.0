Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:46924 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbeLCOTC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 09:19:02 -0500
MIME-Version: 1.0
References: <20181129111839.12879-1-geert+renesas@glider.be> <20181129142508.GJ3175@vkoul-mobl.Dlink>
In-Reply-To: <20181129142508.GJ3175@vkoul-mobl.Dlink>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Dec 2018 15:17:36 +0100
Message-ID: <CAMuHMdX_JS6Ak3jN2wBLTRe0tCY=bhRiU1gpMG_43A0B4uCebw@mail.gmail.com>
Subject: Re: [PATCH v2] dmaengine: sh: Remove R-Mobile APE6 support
To: Vinod <vkoul@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Dan Williams <dan.j.williams@intel.com>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vinod,

On Thu, Nov 29, 2018 at 3:25 PM Vinod Koul <vkoul@kernel.org> wrote:
> On 29-11-18, 12:18, Geert Uytterhoeven wrote:
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
>
> Sorry but this doesnt apply for me, can you please rebase on topic/sh
> and resend.

Sorry, will rebase and resend.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
