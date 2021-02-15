Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16867C4332B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Feb 2021 17:27:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCC3864DEC
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Feb 2021 17:27:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbhBOR0x (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Feb 2021 12:26:53 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:50891 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232138AbhBORZZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Feb 2021 12:25:25 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B0E361C0005;
        Mon, 15 Feb 2021 17:24:35 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: media: max9286: Describe gpio-hog
Date:   Mon, 15 Feb 2021 18:24:44 +0100
Message-Id: <20210215172447.2026514-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210215172447.2026514-1-jacopo+renesas@jmondi.org>
References: <20210215172447.2026514-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The MAX9286 GMSL deserializer features gpio controller capabilities,
as it provides 2 GPIO lines.

As establishing a regulator that uses one of the GPIO lines and
enabling/disabling it at run-time in the max9286 won't work due to
a circular dependency on the gpio-controller/regulator creation, allow
the usage of a gpio-hog for that purpose.

The usage of the gpio-hog is required in designs where the MAX9286
GPIO lines control the remote cameras power.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../devicetree/bindings/media/i2c/maxim,max9286.yaml     | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index ee16102fdfe7..9d5ecfd2397c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -50,6 +50,15 @@ properties:
   '#gpio-cells':
     const: 2
 
+  camvdd_en:
+    type: object
+    properties:
+      gpio-hog: true
+      gpios: true
+      output-low: true
+      line-name:
+        const: "CAMVDD_EN"
+
   maxim,reverse-channel-microvolt:
     minimum: 30000
     maximum: 200000
-- 
2.30.0

