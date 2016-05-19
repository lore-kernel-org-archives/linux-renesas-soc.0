Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:39215 "EHLO
	andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932577AbcESRqD (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 19 May 2016 13:46:03 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: r8a7794: Remove nonexistent thermal sensor clock
Date: Thu, 19 May 2016 19:45:59 +0200
Message-Id: <1463679959-30414-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to the latest information, there is no thermal IP block
present on the r8a7794 SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/dt-bindings/clock/r8a7794-clock.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/r8a7794-clock.h b/include/dt-bindings/clock/r8a7794-clock.h
index 4d3ecd626c1fe0a3..a3491ba2f6ecbf25 100644
--- a/include/dt-bindings/clock/r8a7794-clock.h
+++ b/include/dt-bindings/clock/r8a7794-clock.h
@@ -67,7 +67,6 @@
 #define R8A7794_CLK_IRQC		7
 
 /* MSTP5 */
-#define R8A7794_CLK_THERMAL		22
 #define R8A7794_CLK_PWM			23
 
 /* MSTP7 */
-- 
1.9.1
