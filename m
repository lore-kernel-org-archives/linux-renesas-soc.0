Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2FEECAAD3
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  9 Sep 2022 09:13:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232122AbiIIJNz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 9 Sep 2022 05:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232129AbiIIJNi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 05:13:38 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C5BF149442
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 02:13:34 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:91db:705e:cfbc:a001])
        by michel.telenet-ops.be with bizsmtp
        id HlDT2800j0sKggw06lDUP4; Fri, 09 Sep 2022 11:13:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWa4l-004bak-9G; Fri, 09 Sep 2022 11:13:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWa4k-004Oct-CC; Fri, 09 Sep 2022 11:13:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] dt-bindings: net: renesas,etheravb: Add r8a779g0 support
Date:   Fri,  9 Sep 2022 11:13:23 +0200
Message-Id: <cddb61cd9702ceefc702176bd8ff640c4ff59ffd.1662714607.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662714607.git.geert+renesas@glider.be>
References: <cover.1662714607.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document support for the Renesas Ethernet AVB (EtherAVB-IF) block in the
Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/net/renesas,etheravb.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
index cd5998e08e2195be..3f41294f5997722f 100644
--- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
@@ -45,6 +45,7 @@ properties:
       - items:
           - enum:
               - renesas,etheravb-r8a779a0     # R-Car V3U
+              - renesas,etheravb-r8a779g0     # R-Car V4H
           - const: renesas,etheravb-rcar-gen4 # R-Car Gen4
 
       - items:
@@ -211,7 +212,7 @@ allOf:
               - renesas,etheravb-r8a77965
               - renesas,etheravb-r8a77970
               - renesas,etheravb-r8a77980
-              - renesas,etheravb-r8a779a0
+              - renesas,etheravb-rcar-gen4
     then:
       required:
         - tx-internal-delay-ps
-- 
2.25.1

