Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752665AbdJTKa3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Oct 2017 06:30:29 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 40/42] dt-bindings: clk: r7s72100: Add missing I and G clocks
Date: Fri, 20 Oct 2017 12:29:07 +0200
Message-Id: <44842cc8a89aa7742bc47737aa75da5910aa5f33.1508493785.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1508493785.git.horms+renesas@verge.net.au>
References: <cover.1508493785.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add the missing definitions for the I (CPU) and G (Image Processing)
clocks, so these clocks can be referred to from device nodes in DT.

Note that these clocks are already fully supported otherwise (DT
bindings, Linux driver, r7s72100.dtsi), they were just omitted from the
header file.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 include/dt-bindings/clock/r7s72100-clock.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/r7s72100-clock.h b/include/dt-bindings/clock/r7s72100-clock.h
index 7dd8bc0c3cd0..0dcb3e87d44c 100644
--- a/include/dt-bindings/clock/r7s72100-clock.h
+++ b/include/dt-bindings/clock/r7s72100-clock.h
@@ -11,6 +11,8 @@
 #define __DT_BINDINGS_CLOCK_R7S72100_H__
 
 #define R7S72100_CLK_PLL	0
+#define R7S72100_CLK_I		1
+#define R7S72100_CLK_G		2
 
 /* MSTP2 */
 #define R7S72100_CLK_CORESIGHT	0
-- 
2.11.0
