Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:42946 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727260AbeK2WBU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 17:01:20 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/6] [RFC] dt-bindings: power: r8a77965: Remove non-existent A3IR power domain
Date: Thu, 29 Nov 2018 11:56:19 +0100
Message-Id: <20181129105619.10695-7-geert+renesas@glider.be>
In-Reply-To: <20181129105619.10695-1-geert+renesas@glider.be>
References: <20181129105619.10695-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
removed the A3IR power domain on R-Car M3-N, as this SoC does not have
an Image Processing Unit (IMP-X5).

As this definition is no longer used from DT, it can be removed.

Fixes: a527709b78b3c997 ("soc: renesas: rcar-sysc: Add R-Car M3-N support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Marked as RFC, as this patch depends on "arm64: dts: renesas:
r8a77965: Remove non-existent IPMMU-IR".

If the dependency goes in first, this patch can be squashed with "soc:
renesas: r8a77965-sysc: Remove non-existent A3IR power domain".
---
 include/dt-bindings/power/r8a77965-sysc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/power/r8a77965-sysc.h b/include/dt-bindings/power/r8a77965-sysc.h
index 05a4b5917314791a..de82d8a15ea13a85 100644
--- a/include/dt-bindings/power/r8a77965-sysc.h
+++ b/include/dt-bindings/power/r8a77965-sysc.h
@@ -21,7 +21,6 @@
 #define R8A77965_PD_A3VC		14
 #define R8A77965_PD_3DG_A		17
 #define R8A77965_PD_3DG_B		18
-#define R8A77965_PD_A3IR		24
 #define R8A77965_PD_A2VC1		26
 
 /* Always-on power area */
-- 
2.17.1
