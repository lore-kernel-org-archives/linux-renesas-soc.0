Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48835 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758945AbdEOFxV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 01:53:21 -0400
Date: Mon, 15 May 2017 07:53:16 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 05/10] arm64: renesas: r8a7796: add Sound SSI PIO
 support
Message-ID: <20170515055316.GD16545@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871srrj5tl.wl%kuninori.morimoto.gx@renesas.com>
 <CAMuHMdViYgnsGk=_YKFbTeOcncNiSF=v9jrzRgODqNvzsE+FLA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 12, 2017 at 11:43:39AM +0200, Geert Uytterhoeven wrote:
> Hi Morimoto-san, Simon,
> 
> On Fri, May 12, 2017 at 2:14 AM, Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
> > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > @@ -1259,7 +1259,42 @@
> >                 };
> >
> >                 rcar_sound: sound@ec500000 {
> 
> [...]
> 
> > +                       power-domains = <&cpg>;
> 
> power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> 
> (by comparing r8a779[66].dtsi).
> 
> Simon: As you have already applied this, can you please fix it up in your tree?

Sure, I have squashed the batch below into the relevant patch in my local
tree which I plan to push later today.

Morimoto-san,

FYI, I did a s/renesas/dts/ in the subject of the patches in this series.

On Mon, May 15, 2017 at 01:01:23AM +0000, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> commit a32681b13157f("arm64: dts: r8a7796: add Sound SSI PIO support")
> added R-Car sound, but it used old style power-domains.
> This patch tidyup it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index f815532..f21c5ce 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -1323,7 +1323,7 @@
>  				      "ctu.1", "ctu.0",
>  				      "dvc.0", "dvc.1",
>  				      "clk_a", "clk_b", "clk_c", "clk_i";
> -			power-domains = <&cpg>;
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
>  			status = "disabled";
>  
>  			rcar_sound,dvc {


The patch I now have queued-up is as follows:

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

arm64: dts: r8a7796: add Sound SSI PIO support

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 64 +++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 0a76a1c53082..5c6e54a1e27a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1165,7 +1165,42 @@
 		};
 
 		rcar_sound: sound@ec500000 {
-			/* placeholder */
+			/*
+			 * #sound-dai-cells is required
+			 *
+			 * Single DAI : #sound-dai-cells = <0>;	<&rcar_sound>;
+			 * Multi  DAI : #sound-dai-cells = <1>;	<&rcar_sound N>;
+			 */
+			/*
+			 * #clock-cells is required for audio_clkout0/1/2/3
+			 *
+			 * clkout	: #clock-cells = <0>;	<&rcar_sound>;
+			 * clkout0/1/2/3: #clock-cells = <1>;	<&rcar_sound N>;
+			 */
+			compatible =  "renesas,rcar_sound-r8a7796", "renesas,rcar_sound-gen3";
+			reg =	<0 0xec500000 0 0x1000>, /* SCU */
+				<0 0xec5a0000 0 0x100>,  /* ADG */
+				<0 0xec540000 0 0x1000>, /* SSIU */
+				<0 0xec541000 0 0x280>,  /* SSI */
+				<0 0xec740000 0 0x200>;  /* Audio DMAC peri peri*/
+			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
+
+			clocks = <&cpg CPG_MOD 1005>,
+				 <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>,
+				 <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>,
+				 <&cpg CPG_MOD 1010>, <&cpg CPG_MOD 1011>,
+				 <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1013>,
+				 <&cpg CPG_MOD 1014>, <&cpg CPG_MOD 1015>,
+				 <&audio_clk_a>, <&audio_clk_b>,
+				 <&audio_clk_c>,
+				 <&cpg CPG_CORE R8A7796_CLK_S0D4>;
+			clock-names = "ssi-all",
+				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
+				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
+				      "ssi.1", "ssi.0",
+				      "clk_a", "clk_b", "clk_c", "clk_i";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
 
 			rcar_sound,dvc {
 				dvc0: dvc-0 {
@@ -1184,9 +1219,34 @@
 
 			rcar_sound,ssi {
 				ssi0: ssi-0 {
+					interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
 				};
-
 				ssi1: ssi-1 {
+					interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi2: ssi-2 {
+					interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi3: ssi-3 {
+					interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi4: ssi-4 {
+					interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi5: ssi-5 {
+					interrupts = <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi6: ssi-6 {
+					interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi7: ssi-7 {
+					interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi8: ssi-8 {
+					interrupts = <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi9: ssi-9 {
+					interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
 				};
 			};
 		};
-- 
2.1.4
