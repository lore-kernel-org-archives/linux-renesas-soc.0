Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34495 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752181AbdI2Lxx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:53:53 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/8] dt-bindings: apmu: Document r8a7745 support
Date: Fri, 29 Sep 2017 13:52:48 +0200
Message-Id: <055fb568157c3a6754228138b3ca51247cb4f466.1506676368.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506676368.git.horms+renesas@verge.net.au>
References: <cover.1506676368.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Document APMU and SMP enable method for RZ/G1E (also known as
r8a7745) SoC.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/power/renesas,apmu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/renesas,apmu.txt b/Documentation/devicetree/bindings/power/renesas,apmu.txt
index af21502e939c..f747f95eee58 100644
--- a/Documentation/devicetree/bindings/power/renesas,apmu.txt
+++ b/Documentation/devicetree/bindings/power/renesas,apmu.txt
@@ -8,6 +8,7 @@ Required properties:
 - compatible: Should be "renesas,<soctype>-apmu", "renesas,apmu" as fallback.
 	      Examples with soctypes are:
 		- "renesas,r8a7743-apmu" (RZ/G1M)
+		- "renesas,r8a7745-apmu" (RZ/G1E)
 		- "renesas,r8a7790-apmu" (R-Car H2)
 		- "renesas,r8a7791-apmu" (R-Car M2-W)
 		- "renesas,r8a7792-apmu" (R-Car V2H)
-- 
2.1.4
