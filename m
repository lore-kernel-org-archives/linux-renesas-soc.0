Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FEBC12002
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 19 Jul 2021 15:59:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A42786143D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 19 Jul 2021 15:59:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346563AbhGSPSk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 19 Jul 2021 11:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347436AbhGSPQV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 11:16:21 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07EACC0AC0CE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 08:10:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1844:c86f:c84a:fde8])
        by andre.telenet-ops.be with bizsmtp
        id X3ej2500i2WKXR1013ejyu; Mon, 19 Jul 2021 17:38:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m5VLv-000sks-68; Mon, 19 Jul 2021 17:38:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m5VLu-00Ajkg-Ew; Mon, 19 Jul 2021 17:38:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 01/10] dt-bindings: arm: renesas: Document R-Car H3e-2G and M3e-2G SoCs and boards
Date:   Mon, 19 Jul 2021 17:38:32 +0200
Message-Id: <fd11328199d8abba5b9ee1f43f4d467d1bc41df6.1626708063.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626708063.git.geert+renesas@glider.be>
References: <cover.1626708063.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the compatible values for the R-Car H3e-2G (R8A779M1) and
M3e-2G (R8A779M3) SoCs.  These are different gradings of the R-Car H3
ES3.0 (R8A77951) and M3-W+ (R8A77961) SoCs.

All R-Car Gen3e on-SoC devices are identical to the devices on the
corresponding R-Car Gen3 SoCs, and thus just use the compatible values
for the latter.  The root compatible properties do gain an additional
value, to sort out integration issues if they ever arise.

Document the use of these SoCs on the Salvator-XS and ULCB (with and
without Kingfisher) development boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v2:
  - Add Reviewed-by, Acked-by.
---
 .../devicetree/bindings/arm/renesas.yaml      | 50 +++++++++++++++----
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index a0cce4e250398b1d..8a11918866b86482 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -238,17 +238,29 @@ properties:
           - const: renesas,r8a77961
 
       - description: Kingfisher (SBEV-RCAR-KF-M03)
-        items:
-          - const: shimafuji,kingfisher
-          - enum:
-              - renesas,h3ulcb
-              - renesas,m3ulcb
-              - renesas,m3nulcb
-          - enum:
-              - renesas,r8a7795
-              - renesas,r8a7796
-              - renesas,r8a77961
-              - renesas,r8a77965
+        oneOf:
+          - items:
+              - const: shimafuji,kingfisher
+              - enum:
+                  - renesas,h3ulcb
+                  - renesas,m3ulcb
+                  - renesas,m3nulcb
+              - enum:
+                  - renesas,r8a7795
+                  - renesas,r8a7796
+                  - renesas,r8a77961
+                  - renesas,r8a77965
+          - items:
+              - const: shimafuji,kingfisher
+              - enum:
+                  - renesas,h3ulcb
+                  - renesas,m3ulcb
+              - enum:
+                  - renesas,r8a779m1
+                  - renesas,r8a779m3
+              - enum:
+                  - renesas,r8a7795
+                  - renesas,r8a77961
 
       - description: R-Car M3-N (R8A77965)
         items:
@@ -296,6 +308,22 @@ properties:
           - const: renesas,falcon-cpu
           - const: renesas,r8a779a0
 
+      - description: R-Car H3e-2G (R8A779M1)
+        items:
+          - enum:
+              - renesas,h3ulcb      # H3ULCB (R-Car Starter Kit Premier)
+              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version)
+          - const: renesas,r8a779m1
+          - const: renesas,r8a7795
+
+      - description: R-Car M3e-2G (R8A779M3)
+        items:
+          - enum:
+              - renesas,m3ulcb      # M3ULCB (R-Car Starter Kit Pro)
+              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version)
+          - const: renesas,r8a779m3
+          - const: renesas,r8a77961
+
       - description: RZ/N1D (R9A06G032)
         items:
           - enum:
-- 
2.25.1

