Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:39798 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbeK2Xft (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 18:35:49 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/13] clk: renesas: Miscellaneous fixes
Date: Thu, 29 Nov 2018 14:31:03 +0200
Message-ID: <32174624.vDOvzGRv0l@avalon>
In-Reply-To: <20181129105008.10239-1-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Thursday, 29 November 2018 12:49:55 EET Geert Uytterhoeven wrote:
> 	Hi Mike, Stephen, Laurent, Kieran,
> 
> This patch series contains several fixes for the Renesas Clock drivers
> and DT bindings, and a small simplification:
>   - Removal of non-existent clocks,
>   - Addition of the CPEX clocks, which can be used a source for a timer
>     (CMT1),
>   - Correction of DU parent clocks.
> Most of these have been found by skimming the Hardware Manual Errata.
> 
> This has been boot-tested on Salvator-X(S) (R-Car H3, M3-W, M3-N), Eagle
> (R-Car V3M), and Draak (R-Car D3), except for the DU parts.
> Testing of the DU on R-Car D3 and E3 would be appreciated, as the DU
> driver may have a workaround for the incorrect parent clock rates.

As explained in my review of 09/13, I believe the DU clock patches to both be 
correct and have no effect for D3 and E3. No action is needed on the DU side, 
there is no workaround for the incorrect frequency.

> I intend to queue this in clk-renesas-for-v4.21.
> 
> Thanks!
> 
> Geert Uytterhoeven (12):
>   dt-bindings: clock: r8a7795: Remove CSIREF clock
>   dt-bindings: clock: r8a7796: Remove CSIREF clock
>   clk: renesas: r8a774a1: Add CPEX clock
>   clk: renesas: r8a7795: Add CPEX clock
>   clk: renesas: r8a7796: Add CPEX clock
>   clk: renesas: r8a77965: Add CPEX clock
>   clk: renesas: r8a77970: Add CPEX clock
>   clk: renesas: r8a77995: Correct parent clock of DU
>   clk: renesas: r8a77995: Remove non-existent VIN5-7 module clocks
>   clk: renesas: r8a77995: Remove non-existent SSP clocks
>   clk: renesas: r8a77995: Add missing CPEX clock
>   clk: renesas: r8a77995: Simplify PLL3 multiplier/divider
> 
> Takeshi Kihara (1):
>   clk: renesas: r8a77990: Correct parent clock of DU
> 
>  drivers/clk/renesas/r8a774a1-cpg-mssr.c       |  1 +
>  drivers/clk/renesas/r8a7795-cpg-mssr.c        |  1 +
>  drivers/clk/renesas/r8a7796-cpg-mssr.c        |  1 +
>  drivers/clk/renesas/r8a77965-cpg-mssr.c       |  1 +
>  drivers/clk/renesas/r8a77970-cpg-mssr.c       |  1 +
>  drivers/clk/renesas/r8a77990-cpg-mssr.c       |  4 ++--
>  drivers/clk/renesas/r8a77995-cpg-mssr.c       | 15 ++++++---------
>  include/dt-bindings/clock/r8a7795-cpg-mssr.h  |  2 +-
>  include/dt-bindings/clock/r8a7796-cpg-mssr.h  |  2 +-
>  include/dt-bindings/clock/r8a77995-cpg-mssr.h |  5 +++--
>  10 files changed, 18 insertions(+), 15 deletions(-)

-- 
Regards,

Laurent Pinchart
