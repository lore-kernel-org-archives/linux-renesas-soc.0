Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52743 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750786AbdGNHWg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jul 2017 03:22:36 -0400
Date: Fri, 14 Jul 2017 09:22:32 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a7796: Add resets property to
 FCP devices
Message-ID: <20170714072231.GE12105@verge.net.au>
References: <20170713105822.5327-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXrpO_oHJESeVSwiN65YWxU2o9c-DNX-yb-NqcjsYHOeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXrpO_oHJESeVSwiN65YWxU2o9c-DNX-yb-NqcjsYHOeQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 13, 2017 at 01:16:19PM +0200, Geert Uytterhoeven wrote:
> On Thu, Jul 13, 2017 at 12:58 PM, Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > The FCP nodes are missing the resets property. Add it.
> >
> > Fixes: 7153c69fb8e1 ("arm64: dts: renesas: r8a7796: Add FCPF and FCPV instances")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have squashed this into the commit referenced above.
The result is as follows:


From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: arm64: dts: renesas: r8a7796: Add FCPF and FCPV instances

The FCPs handle the interface between various IP cores and memory. Add
the instances related to the FDPs and VSP2s.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 367da78ad4fc..b301554ff424 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1562,6 +1562,54 @@
 			/* placeholder */
 		};
 
+		fcpf0: fcp@fe950000 {
+			compatible = "renesas,fcpf";
+			reg = <0 0xfe950000 0 0x200>;
+			clocks = <&cpg CPG_MOD 615>;
+			power-domains = <&sysc R8A7796_PD_A3VC>;
+			resets = <&cpg 615>;
+		};
+
+		fcpvb0: fcp@fe96f000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfe96f000 0 0x200>;
+			clocks = <&cpg CPG_MOD 607>;
+			power-domains = <&sysc R8A7796_PD_A3VC>;
+			resets = <&cpg 607>;
+		};
+
+		fcpvi0: fcp@fe9af000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfe9af000 0 0x200>;
+			clocks = <&cpg CPG_MOD 611>;
+			power-domains = <&sysc R8A7796_PD_A3VC>;
+			resets = <&cpg 611>;
+		};
+
+		fcpvd0: fcp@fea27000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfea27000 0 0x200>;
+			clocks = <&cpg CPG_MOD 603>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 603>;
+		};
+
+		fcpvd1: fcp@fea2f000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfea2f000 0 0x200>;
+			clocks = <&cpg CPG_MOD 602>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 602>;
+		};
+
+		fcpvd2: fcp@fea37000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfea37000 0 0x200>;
+			clocks = <&cpg CPG_MOD 601>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 601>;
+		};
+
 		du: display@feb00000 {
 			/* placeholder */
 
-- 
2.1.4
