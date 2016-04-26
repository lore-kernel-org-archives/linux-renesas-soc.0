Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52474 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750874AbcDZB2x (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 21:28:53 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 02/11] soc: renesas: rcar-sysc: Improve rcar_sysc_power() debug info
Date: Tue, 26 Apr 2016 11:28:37 +1000
Message-Id: <68667cebfc0d27d2153d7a6b489f3231b533d9bc.1461632180.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1461632180.git.horms+renesas@verge.net.au>
References: <cover.1461632180.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Print requested power domain state.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/rcar-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index d59bcdf78f0b..9ba5fd15c53b 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -128,7 +128,7 @@ static int rcar_sysc_power(const struct rcar_sysc_ch *sysc_ch, bool on)
  out:
 	spin_unlock_irqrestore(&rcar_sysc_lock, flags);
 
-	pr_debug("sysc power domain %d: %08x -> %d\n",
+	pr_debug("sysc power %s domain %d: %08x -> %d\n", on ? "on" : "off",
 		 sysc_ch->isr_bit, ioread32(rcar_sysc_base + SYSCISR), ret);
 	return ret;
 }
-- 
2.7.0.rc3.207.g0ac5344
