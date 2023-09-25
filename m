Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF020CE79A4
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Sep 2023 21:26:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233157AbjIYV0l (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Sep 2023 17:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjIYV0k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2023 17:26:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D917111B;
        Mon, 25 Sep 2023 14:26:33 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3975FC433C7;
        Mon, 25 Sep 2023 21:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695677193;
        bh=9Nh14aFUGUsaxHvq/E7g7v9+31uftoSiCiNR23fyrLI=;
        h=From:To:Cc:Subject:Date:From;
        b=rEFVSaMxl4PTBk3T8GgUZ6WMUDwFU3LdVPn4KA0JATvSAGLQNXzpUZkVFqabj8EWq
         ZEgmaHOCMXABi54Z1izv8dctSripSzBkwKDwpFBHR0rLEedNoWt21qeKMND6X+XOfN
         Sm1sR4sPG1Qcz1opK8WdWMDUfTc9OmuxgtsekqF6LHV50Gp1Ta7JrPpM6uPMFSvF61
         OMqeNJe+aF9M+3iPhf3x7CNzeGsWwiHwO3oP5MN3982EjlMK1YkeXHb8349ch2wMFS
         DyXL8dwCRHNt4uP2+aEcAT4jQS7AxjX1nUOqBRrjWAnf/jmC9FsAE5Qhz/8dXrb/wP
         hwRdAAguGqKeg==
Received: (nullmailer pid 1974921 invoked by uid 1000);
        Mon, 25 Sep 2023 21:26:30 -0000
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: memory-controllers: Make "additionalProperties: true" explicit
Date:   Mon, 25 Sep 2023 16:26:21 -0500
Message-Id: <20230925212626.1974676-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make it explicit that child nodes have additional properties and the
child node schema is not complete. The complete schemas are applied
separately based the compatible strings.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/memory-controllers/ingenic,nemc.yaml    | 1 +
 .../devicetree/bindings/memory-controllers/renesas,rpc-if.yaml  | 2 ++
 .../devicetree/bindings/memory-controllers/ti,gpmc.yaml         | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml b/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml
index b40cec0eb651..ee74a362f4ca 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml
@@ -40,6 +40,7 @@ patternProperties:
   ".*@[0-9]+$":
     type: object
     $ref: mc-peripheral-props.yaml#
+    additionalProperties: true
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
index 56e62cd0b36a..25f3bb9890ae 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
@@ -80,6 +80,8 @@ properties:
 patternProperties:
   "flash@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         contains:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
index b049837ee669..c7a8a041da50 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
@@ -130,7 +130,7 @@ patternProperties:
       bus. The device can be a NAND chip, SRAM device, NOR device
       or an ASIC.
     $ref: ti,gpmc-child.yaml
-
+    additionalProperties: true
 
 required:
   - compatible
-- 
2.40.1

