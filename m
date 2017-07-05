Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36918 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752536AbdGENFB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2017 09:05:01 -0400
Date: Wed, 5 Jul 2017 14:04:58 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] arm64: dts: r8a7796: add IMR-LX4 support
Message-ID: <20170705130458.GG24043@verge.net.au>
References: <20170627173400.581660959@cogentembedded.com>
 <CAMuHMdXxcbkPV+Jt7Xo5emQ4fyDHm1p1RgD9nsRfR78va4XFSA@mail.gmail.com>
 <e901ed94-c937-23cd-c43c-f2530dedd50f@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e901ed94-c937-23cd-c43c-f2530dedd50f@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 05, 2017 at 03:03:37PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 07/05/2017 12:54 PM, Geert Uytterhoeven wrote:
> 
> >>Describe the IMR-LX4 devices in the R8A7796 device tree.
> >>
> >>Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >
> >>--- renesas.orig/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> >>+++ renesas/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> >>@@ -1454,5 +1454,23 @@
> >>                                };
> >>                        };
> >>                };
> >>+
> >>+               imr-lx4@fe860000 {
> >>+                       compatible = "renesas,r8a7796-imr-lx4",
> >>+                                    "renesas,imr-lx4";
> >>+                       reg = <0 0xfe860000 0 0x2000>;
> >>+                       interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> >>+                       clocks = <&cpg CPG_MOD 823>;
> >>+                       power-domains = <&sysc R8A7796_PD_A3VC>;
> >
> >resets = <&cpg 823>;
> >
> >>+               };
> >>+
> >>+               imr-lx4@fe870000 {
> >>+                       compatible = "renesas,r8a7796-imr-lx4",
> >>+                                    "renesas,imr-lx4";
> >>+                       reg = <0 0xfe870000 0 0x2000>;
> >>+                       interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
> >>+                       clocks = <&cpg CPG_MOD 822>;
> >>+                       power-domains = <&sysc R8A7796_PD_A3VC>;
> >
> >resets = <&cpg 822>;
> >
> >With the issues above fixed:
> >
> >Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>    I'm afraid it's already merged by Simon...

I've gone through and added Geert's tags to patches that I merged recently.
I'm planning to push the updated patches later today.
