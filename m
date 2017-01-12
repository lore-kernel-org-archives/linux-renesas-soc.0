Return-Path: <devicetree-owner@vger.kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] ARM: dts: r7s72100: fix sdhi clock define
Date: Thu, 12 Jan 2017 13:11:49 -0500
Message-Id: <20170112181149.29035-1-chris.brandt@renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Now that all the clocks in the boot loader are disabled before booting
the kernel, and the mstp driver has been fixed for RZ/A1, here is a typo
that was missed during original testing.

Fixes: 7c8522b7047c ("ARM: dts: r7s72100: add sdhi clock to device tree")
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 include/dt-bindings/clock/r7s72100-clock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/r7s72100-clock.h b/include/dt-bindings/clock/r7s72100-clock.h
index 29e01ed..318ab14 100644
--- a/include/dt-bindings/clock/r7s72100-clock.h
+++ b/include/dt-bindings/clock/r7s72100-clock.h
@@ -46,6 +46,6 @@
 
 /* MSTP12 */
 #define R7S72100_CLK_SDHI0	3
-#define R7S72100_CLK_SDHI1	2
+#define R7S72100_CLK_SDHI1	1
 
 #endif /* __DT_BINDINGS_CLOCK_R7S72100_H__ */
-- 
2.10.1


