Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46080 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751007AbdEVMaK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2017 08:30:10 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/3] ARM: dts: r7s72100: add USB bit definitions
Date: Mon, 22 May 2017 14:30:04 +0200
Message-Id: <40c9bbea140e64a4257b794969e759c2c481c399.1495454780.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1495454780.git.horms+renesas@verge.net.au>
References: <cover.1495454780.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Chris Brandt <chris.brandt@renesas.com>

Add the bit locations that correspond to the USB clocks.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 include/dt-bindings/clock/r7s72100-clock.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/r7s72100-clock.h b/include/dt-bindings/clock/r7s72100-clock.h
index bc256d31099a..dcd2072151fc 100644
--- a/include/dt-bindings/clock/r7s72100-clock.h
+++ b/include/dt-bindings/clock/r7s72100-clock.h
@@ -34,6 +34,8 @@
 
 /* MSTP7 */
 #define R7S72100_CLK_ETHER	4
+#define R7S72100_CLK_USB0	1
+#define R7S72100_CLK_USB1	0
 
 /* MSTP8 */
 #define R7S72100_CLK_MMCIF	4
-- 
2.1.4
