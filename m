Return-Path: <SRS0=jird=CT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDEDC433E2
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Sep 2020 12:23:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3665F208FE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Sep 2020 12:23:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730309AbgIJMMq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Sep 2020 08:12:46 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:55864 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730319AbgIJMDH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 08:03:07 -0400
X-IronPort-AV: E=Sophos;i="5.76,412,1592838000"; 
   d="scan'208";a="56719476"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Sep 2020 21:03:06 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 72BBC425E932;
        Thu, 10 Sep 2020 21:03:06 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/4] dt-bindings: arm: renesas: Document Renesas Falcon boards
Date:   Thu, 10 Sep 2020 21:02:49 +0900
Message-Id: <1599739372-30669-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599739372-30669-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1599739372-30669-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree bindings documentation for Renesas R-Car V3U
Falcon CPU and BreakOut boards.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 9f8c3353..01a6d0c 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -283,6 +283,14 @@ properties:
 
       - description: R-Car V3U (R8A779A0)
         items:
+          - enum:
+              - renesas,falcon-cpu # Falcon CPU board (RTP0RC779A0CPB0010S)
+          - const: renesas,r8a779a0
+
+      - items:
+          - enum:
+              - renesas,falcon-breakout # Falcon BreakOut board (RTP0RC779A0BOB0010S)
+          - const: renesas,falcon-cpu
           - const: renesas,r8a779a0
 
       - description: RZ/N1D (R9A06G032)
-- 
2.7.4

