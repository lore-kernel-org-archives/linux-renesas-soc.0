Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/2] drivers: sh: clk: Avoid crashes when passing NULL clocks
Date: Thu, 21 Jan 2016 11:42:52 +0900
Message-Id: <6575a9c69a211ac1cf454f9c76be54f7a5fae9fe.1453343708.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1453343708.git.horms+renesas@verge.net.au>
References: <cover.1453343708.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1453343708.git.horms+renesas@verge.net.au>
References: <cover.1453343708.git.horms+renesas@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Several clock API functions handle NULL clocks when the Common Clock
Framework is used, while their legacy SH counterparts don't, and would
just crash when a NULL clock is passed.

Add NULL checks to clk_get_rate(), clk_set_rate(), clk_get_parent(), and
clk_round_rate(), to avoid different behavior in drivers shared between
legacy and CCF-based platforms.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/sh/clk/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/sh/clk/core.c b/drivers/sh/clk/core.c
index 6bf973bd9654..92863e3818e5 100644
--- a/drivers/sh/clk/core.c
+++ b/drivers/sh/clk/core.c
@@ -469,6 +469,9 @@ void clk_enable_init_clocks(void)
 
 unsigned long clk_get_rate(struct clk *clk)
 {
+	if (!clk)
+		return 0;
+
 	return clk->rate;
 }
 EXPORT_SYMBOL_GPL(clk_get_rate);
@@ -478,6 +481,9 @@ int clk_set_rate(struct clk *clk, unsigned long rate)
 	int ret = -EOPNOTSUPP;
 	unsigned long flags;
 
+	if (!clk)
+		return 0;
+
 	spin_lock_irqsave(&clock_lock, flags);
 
 	if (likely(clk->ops && clk->ops->set_rate)) {
@@ -535,12 +541,18 @@ EXPORT_SYMBOL_GPL(clk_set_parent);
 
 struct clk *clk_get_parent(struct clk *clk)
 {
+	if (!clk)
+		return NULL;
+
 	return clk->parent;
 }
 EXPORT_SYMBOL_GPL(clk_get_parent);
 
 long clk_round_rate(struct clk *clk, unsigned long rate)
 {
+	if (!clk)
+		return 0;
+
 	if (likely(clk->ops && clk->ops->round_rate)) {
 		unsigned long flags, rounded;
 
-- 
2.1.4
