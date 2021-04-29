Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7D5C433B4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 29 Apr 2021 12:47:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BE7161408
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 29 Apr 2021 12:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237050AbhD2MsW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 29 Apr 2021 08:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236862AbhD2MsV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Apr 2021 08:48:21 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB16C06138B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Apr 2021 05:47:34 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by albert.telenet-ops.be with bizsmtp
        id ycnY2400y4p6Y3806cnYMf; Thu, 29 Apr 2021 14:47:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lc64q-001FC4-Bg; Thu, 29 Apr 2021 14:47:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lc64p-009Vw9-Ud; Thu, 29 Apr 2021 14:47:31 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: display: renesas,du: Make resets optional on R-Car H1
Date:   Thu, 29 Apr 2021 14:47:31 +0200
Message-Id: <2da75fd2e971dfab8dd05a2a28bb1d6d9cbe5adb.1619700420.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The "resets" property is not present on R-Car Gen1 SoCs.
Supporting it would require migrating from renesas,cpg-clocks to
renesas,cpg-mssr.

Reflect this in the DT bindings by removing the global "required:
resets".  All SoCs that do have "resets" properties already have
SoC-specific rules making it required.

Fixes: 99d66127fad25ebb ("dt-bindings: display: renesas,du: Convert binding to YAML")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/display/renesas,du.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index 552a99ce4f1280d7..e955034da53b86e2 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -89,7 +89,6 @@ required:
   - reg
   - clocks
   - interrupts
-  - resets
   - ports
 
 allOf:
-- 
2.25.1

