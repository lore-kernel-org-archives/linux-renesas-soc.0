Return-Path: <SRS0+SwVF=NS=vger.kernel.org=linux-sh-owner@vergenet.net>
Date: Mon, 18 Jan 2016 10:55:03 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	Linux-sh list <linux-sh@vger.kernel.org>
Subject: Re: [PATCH] ARM: shmobile: armadillo800eva dts: Correct extal1
 frequency to 24 MHz
Message-ID: <20160118015502.GG1905@verge.net.au>
References: <1450435896-6026-1-git-send-email-geert+renesas@glider.be>
 <CAMuHMdUZx5ynmJOz+EDzFSGOgVQraVquj0GtdMgkE0UxCQ-V2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUZx5ynmJOz+EDzFSGOgVQraVquj0GtdMgkE0UxCQ-V2Q@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
Return-Path: <horms@vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 02/14] ARM: dts: r8a7793: add audio clock to device tree
Date: Mon, 18 Jan 2016 14:27:57 +0900
Message-Id: <1453094889-25204-3-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1453094889-25204-1-git-send-email-horms+renesas@verge.net.au>
References: <1453094889-25204-1-git-send-email-horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 05, 2016 at 02:37:07PM +0100, Geert Uytterhoeven wrote:
> On Fri, Dec 18, 2015 at 11:51 AM, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > On r8a7740/armadillo, actual clock rates are ca. 4% lower than reported
> > by /sys/kernel/debug/clk/clk_summary. Correct the extal1 frequency from
> > 25 MHz to 24 MHz to fix this.
> >
> > This matches the Armadillo-800 EVA Product Manual, which claims the main
> > crystal runs at 24 MHz, and the old legacy/reference board code.
> 
> Ping? I think we want this applied to -stable and -ltsi, too.

Sorry for letting this slip through the cracks.

I have queued up the following as a fix for v4.5.

From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: armadillo800eva Correct extal1 frequency to 24 MHz

On r8a7740/armadillo, actual clock rates are ca. 4% lower than reported
by /sys/kernel/debug/clk/clk_summary. Correct the extal1 frequency from
25 MHz to 24 MHz to fix this.

This matches the Armadillo-800 EVA Product Manual, which claims the main
crystal runs at 24 MHz, and the old legacy/reference board code.

Fixes: 25aa7ba3fdfb ("ARM: shmobile: armadillo800eva: Sync DTS")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
index 105d9c95de4a..5c76dcc89df5 100644
--- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
@@ -180,7 +180,7 @@
 };
 
 &extal1_clk {
-	clock-frequency = <25000000>;
+	clock-frequency = <24000000>;
 };
 &extal2_clk {
 	clock-frequency = <48000000>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-sh" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

Instantiate audio clock in r8a7793 device tree.
audio_clk_a/b/c are required for R-Car sound.

Based on similar work for the r8a7791 by Kuninori Morimoto.

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7793.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 221f5707a622..bf6be4a40e31 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -706,6 +706,29 @@
 			clock-output-names = "extal";
 		};
 
+		/*
+		 * The external audio clocks are configured as 0 Hz fixed frequency clocks by
+		 * default. Boards that provide audio clocks should override them.
+		 */
+		audio_clk_a: audio_clk_a {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+			clock-output-names = "audio_clk_a";
+		};
+		audio_clk_b: audio_clk_b {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+			clock-output-names = "audio_clk_b";
+		};
+		audio_clk_c: audio_clk_c {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+			clock-output-names = "audio_clk_c";
+		};
+
 		/* Special CPG clocks */
 		cpg_clocks: cpg_clocks@e6150000 {
 			compatible = "renesas,r8a7793-cpg-clocks",
-- 
2.1.4
