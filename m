Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FAAC41513
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 26 Jul 2023 14:45:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbjGZOpF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 26 Jul 2023 10:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232569AbjGZOpD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2023 10:45:03 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4EFCE
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 07:44:58 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d80c:aaca:e11d:6940])
        by laurent.telenet-ops.be with bizsmtp
        id Rqkv2A00Z4qLm8F01qkv3H; Wed, 26 Jul 2023 16:44:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qOfko-002Ym3-FH;
        Wed, 26 Jul 2023 16:44:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qOfl1-00A8Hj-K1;
        Wed, 26 Jul 2023 16:44:55 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] dt-bindings: irqchip: renesas,irqc: Add r8a779f0 support
Date:   Wed, 26 Jul 2023 16:44:41 +0200
Message-Id: <a0d2858974207d5dbdae00a444ff5ee92e2ee4d3.1690382328.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690382328.git.geert+renesas@glider.be>
References: <cover.1690382328.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document support for the Interrupt Controller for External Devices
(INT-EX) in the Renesas R-Car S4-8 (R8A779F0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

