Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:33481 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934087AbeBMJrM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 04:47:12 -0500
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: geert@linux-m68k.org, horms@verge.net.au, magnus.damm@gmail.com,
        robh+dt@kernel.org, mark.rutland@arm.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 13/15] Documentation: devicetree: ravb: Add r8a77965
Date: Tue, 13 Feb 2018 10:46:00 +0100
Message-Id: <1518515162-23663-14-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1518515162-23663-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1518515162-23663-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add documentation for r8a77965 compatible string to renesas ravb device
tree bindings documentation.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/net/renesas,ravb.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
index c902261..bf071a5 100644
--- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
+++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
@@ -17,6 +17,7 @@ Required properties:
 
       - "renesas,etheravb-r8a7795" for the R8A7795 SoC.
       - "renesas,etheravb-r8a7796" for the R8A7796 SoC.
+      - "renesas,etheravb-r8a77965" for the R8A77965 SoC.
       - "renesas,etheravb-r8a77970" for the R8A77970 SoC.
       - "renesas,etheravb-r8a77995" for the R8A77995 SoC.
       - "renesas,etheravb-rcar-gen3" as a fallback for the above
-- 
2.7.4
