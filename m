Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] drivers: sh: clk: Remove obsolete and unused clk_round_parent()
Date: Thu, 21 Jan 2016 11:42:51 +0900
Message-Id: <90069ad1b602d05740ed0fc5f72f09a616ceddd0.1453343708.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1453343708.git.horms+renesas@verge.net.au>
References: <cover.1453343708.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1453343708.git.horms+renesas@verge.net.au>
References: <cover.1453343708.git.horms+renesas@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

clk_round_parent() was only ever used by AP4EVB, until commit
b24bd7e97b3784af ("ARM: shmobile: Remove AP4EVB board support").

The Common Clock Framework does not provide clk_round_parent(), hence
remove it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/sh/clk/core.c  | 88 --------------------------------------------------
 include/linux/sh_clk.h |  4 ---
 2 files changed, 92 deletions(-)

diff --git a/drivers/sh/clk/core.c b/drivers/sh/clk/core.c
index be56b22ca941..6bf973bd9654 100644
--- a/drivers/sh/clk/core.c
+++ b/drivers/sh/clk/core.c
@@ -555,94 +555,6 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(clk_round_rate);
 
-long clk_round_parent(struct clk *clk, unsigned long target,
-		      unsigned long *best_freq, unsigned long *parent_freq,
-		      unsigned int div_min, unsigned int div_max)
-{
-	struct cpufreq_frequency_table *freq, *best = NULL;
-	unsigned long error = ULONG_MAX, freq_high, freq_low, div;
-	struct clk *parent = clk_get_parent(clk);
-
-	if (!parent) {
-		*parent_freq = 0;
-		*best_freq = clk_round_rate(clk, target);
-		return abs(target - *best_freq);
-	}
-
-	cpufreq_for_each_valid_entry(freq, parent->freq_table) {
-		if (unlikely(freq->frequency / target <= div_min - 1)) {
-			unsigned long freq_max;
-
-			freq_max = (freq->frequency + div_min / 2) / div_min;
-			if (error > target - freq_max) {
-				error = target - freq_max;
-				best = freq;
-				if (best_freq)
-					*best_freq = freq_max;
-			}
-
-			pr_debug("too low freq %u, error %lu\n", freq->frequency,
-				 target - freq_max);
-
-			if (!error)
-				break;
-
-			continue;
-		}
-
-		if (unlikely(freq->frequency / target >= div_max)) {
-			unsigned long freq_min;
-
-			freq_min = (freq->frequency + div_max / 2) / div_max;
-			if (error > freq_min - target) {
-				error = freq_min - target;
-				best = freq;
-				if (best_freq)
-					*best_freq = freq_min;
-			}
-
-			pr_debug("too high freq %u, error %lu\n", freq->frequency,
-				 freq_min - target);
-
-			if (!error)
-				break;
-
-			continue;
-		}
-
-		div = freq->frequency / target;
-		freq_high = freq->frequency / div;
-		freq_low = freq->frequency / (div + 1);
-
-		if (freq_high - target < error) {
-			error = freq_high - target;
-			best = freq;
-			if (best_freq)
-				*best_freq = freq_high;
-		}
-
-		if (target - freq_low < error) {
-			error = target - freq_low;
-			best = freq;
-			if (best_freq)
-				*best_freq = freq_low;
-		}
-
-		pr_debug("%u / %lu = %lu, / %lu = %lu, best %lu, parent %u\n",
-			 freq->frequency, div, freq_high, div + 1, freq_low,
-			 *best_freq, best->frequency);
-
-		if (!error)
-			break;
-	}
-
-	if (parent_freq)
-		*parent_freq = best->frequency;
-
-	return error;
-}
-EXPORT_SYMBOL_GPL(clk_round_parent);
-
 #ifdef CONFIG_PM
 static void clks_core_resume(void)
 {
diff --git a/include/linux/sh_clk.h b/include/linux/sh_clk.h
index 1f208b2a1ed6..645896b81244 100644
--- a/include/linux/sh_clk.h
+++ b/include/linux/sh_clk.h
@@ -113,10 +113,6 @@ long clk_rate_div_range_round(struct clk *clk, unsigned int div_min,
 long clk_rate_mult_range_round(struct clk *clk, unsigned int mult_min,
 			       unsigned int mult_max, unsigned long rate);
 
-long clk_round_parent(struct clk *clk, unsigned long target,
-		      unsigned long *best_freq, unsigned long *parent_freq,
-		      unsigned int div_min, unsigned int div_max);
-
 #define SH_CLK_MSTP(_parent, _enable_reg, _enable_bit, _status_reg, _flags) \
 {									\
 	.parent		= _parent,					\
-- 
2.1.4
