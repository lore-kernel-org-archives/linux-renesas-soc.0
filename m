Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:58454 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751504AbeFHMfZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jun 2018 08:35:25 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77995: Fix VSP registers range
Date: Fri, 08 Jun 2018 15:35:41 +0300
Message-ID: <17008507.Jhr6cnHLcg@avalon>
In-Reply-To: <CAMuHMdXk3EbgYLo0Y8jZcugGq3ud7ZZ_4K_qwhi2W6sP84J4aA@mail.gmail.com>
References: <20180608111655.2725-1-laurent.pinchart+renesas@ideasonboard.com> <20180608111655.2725-2-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdXk3EbgYLo0Y8jZcugGq3ud7ZZ_4K_qwhi2W6sP84J4aA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Friday, 8 June 2018 14:53:28 EEST Geert Uytterhoeven wrote:
> On Fri, Jun 8, 2018 at 1:18 PM Laurent Pinchart wrote:
> > The R8A77995 VSP and FCP nodes have overlapping register ranges, as the
> > SoC integrates the FCP devices in the memory range usually used by the
> > VSP LUT and CLUT, which are not present. Fix this by shortening the VSP
> > registers range to 0x5000.
> 
> According to datasheet rev. 1.00, the CLUT is present on R-Car D3, the
> LUT is not.

That was a typo, the commit message should have mentioned CLU, not CLUT. I've 
sent a v2 that fixes this and covers the H3 and M3* SoCs.

> > Fixes: 295952a183d3 ("arm64: dts: renesas: r8a77995: add VSP instances")
> > Reported-by: Simon Horman <horms+renesas@verge.net.au>
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Apart from my comment above:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

-- 
Regards,

Laurent Pinchart
