Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2BDC001DC
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 27 Jul 2023 12:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233441AbjG0Mgg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 27 Jul 2023 08:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232939AbjG0Mgf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 08:36:35 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F5F106
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 05:36:33 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d80c:aaca:e11d:6940])
        by xavier.telenet-ops.be with bizsmtp
        id SCcV2A00R4qLm8F01CcVYm; Thu, 27 Jul 2023 14:36:31 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qP0E4-002cI6-8g;
        Thu, 27 Jul 2023 14:36:29 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qOwTz-00AKdI-GE;
        Thu, 27 Jul 2023 10:36:27 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] dt-bindings: irqchip: renesas,irqc: Add r8a779f0 support
Date:   Thu, 27 Jul 2023 10:36:23 +0200
Message-Id: <9467a1c67d5d240211f88336973fa968d39cc860.1690446928.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document support for the Interrupt Controller for External Devices
(INT-EX) in the Renesas R-Car S4-8 (R8A779F0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by,
  - Widen audience after testing.
---
 .../devicetree/bindings/interrupt-controller/renesas,irqc.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
index 95033cb514fbd8f6..b417341fc8ae049b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
@@ -37,6 +37,7 @@ properties:
           - renesas,intc-ex-r8a77990    # R-Car E3
           - renesas,intc-ex-r8a77995    # R-Car D3
           - renesas,intc-ex-r8a779a0    # R-Car V3U
+          - renesas,intc-ex-r8a779f0    # R-Car S4-8
           - renesas,intc-ex-r8a779g0    # R-Car V4H
       - const: renesas,irqc
 
-- 
2.34.1

