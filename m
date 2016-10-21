Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 20/23] ARM: shmobile: rcar-gen2: Stop passing mode pins state to clock driver
Date: Fri, 21 Oct 2016 15:17:34 +0200
Message-Id: <1477055857-17936-21-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
References: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Now the R-Car Gen2 CPG clock driver obtains the state of the mode pins
from the R-Car RST driver, there's no longer a need to pass this state
explicitly. Hence we can just call of_clk_init() instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Dirk Behme <dirk.behme@de.bosch.com>
---
v4:
  - Add Acked-by,
  - Rebase on top of "ARM: shmobile: rcar-gen2: Obtain extal frequency
    from DT",
  - Remove the call to rcar_gen2_read_mode_pins(),

v3:
  - Drop "select MFD_SYSCON", as the clock driver no longer uses syscon,

v2:
  - Kill compiler warning if CONFIG_ARM_ARCH_TIMER is not enabled.
---
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index afb9fdcd3d9084e2..b527258e0a62e806 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk/renesas.h>
+#include <linux/clk-provider.h>
 #include <linux/clocksource.h>
 #include <linux/device.h>
 #include <linux/dma-contiguous.h>
@@ -71,7 +71,6 @@ static unsigned int __init get_extal_freq(void)
 
 void __init rcar_gen2_timer_init(void)
 {
-	u32 mode = rcar_gen2_read_mode_pins();
 #ifdef CONFIG_ARM_ARCH_TIMER
 	void __iomem *base;
 	u32 freq;
@@ -130,7 +129,7 @@ void __init rcar_gen2_timer_init(void)
 	iounmap(base);
 #endif /* CONFIG_ARM_ARCH_TIMER */
 
-	rcar_gen2_clocks_init(mode);
+	of_clk_init(NULL);
 	clocksource_probe();
 }
 
-- 
1.9.1

