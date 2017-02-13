Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39779 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751808AbdBMND4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 08:03:56 -0500
Date: Mon, 13 Feb 2017 14:03:39 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        magnus.damm@gmail.com
Subject: Re: [PATCH v2 3/4] arm64: renesas: r8a7796 dtsi: Add all HSCIF nodes
Message-ID: <20170213130339.GD29718@verge.net.au>
References: <1481129088-22026-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1481129088-22026-4-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1b13b1aa-5acb-263b-5720-21f99744da0e@cogentembedded.com>
 <20170213120136.GC8737@verge.net.au>
 <28166972-c0fe-00f8-5d3e-0e482dfc06f7@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28166972-c0fe-00f8-5d3e-0e482dfc06f7@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 13, 2017 at 03:06:21PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 2/13/2017 3:01 PM, Simon Horman wrote:
> 
> >>>Add the device nodes for all HSCIF serial ports, incl. clocks, and
> >>>clock domain.
> >>
> >>   Not power domain?
> >>
> >>>Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> >>>Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>---
> >>>arch/arm64/boot/dts/renesas/r8a7796.dtsi | 70 ++++++++++++++++++++++++++++++++
> >>>1 file changed, 70 insertions(+)
> >>>
> >>>diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> >>>index 7bf0f2f..c508e0f 100644
> >>>--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> >>>+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> >>>@@ -421,6 +421,76 @@
> >>>			};
> >>>		};
> >>>
> >>>+		hscif0: serial@e6540000 {
> >>>+			compatible = "renesas,hscif-r8a7796",
> >>>+				     "renesas,rcar-gen3-hscif",
> >>>+				     "renesas,hscif";
> >>>+			reg = <0 0xe6540000 0 96>;
> >>
> >>   0xc0?
> >
> >Do you mean 96 should be 0xc0 (= 192 = 2 * 96) ?
> 
>    Oops! 0x60, of course.

Thanks,

I queued up this patch after
- s/clock domain/power domain/ in changelog
- Updating to use 0x60 as you suggest above.

> >If so, perhaps the r8a7795 needs updating too?

Thanks, I'll see about sending an update.
