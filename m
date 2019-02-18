Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1880C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 10:48:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B67602175B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 10:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="boy2rsnJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730312AbfBRKs3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 05:48:29 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:45398 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730301AbfBRKs3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 05:48:29 -0500
Received: from penelope.horms.nl (unknown [62.119.166.9])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C80E925BEDA;
        Mon, 18 Feb 2019 21:48:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1550486904; bh=F3cCUCLMmHYfgbDN9NlFeyvUSJy2jx37FQe1yMcCG6A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=boy2rsnJRuRrYGsI3WrMuTETiNXwKvmpsGoXanvAaEI6O+gKYZoecYqJtfJe7Ebz3
         ea9BrdVVxhdaTI5D7q9ahP9cvczMWnT+kzncnI/lTWoVsiB4LrHYZsu0KlE8AqjQBy
         dxs/eeHBAv4iz9xmRARIguSEJYqLlCk7MWq4vYY0=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id BF9D6E218D1; Mon, 18 Feb 2019 11:48:07 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/4] dt-bindings: arm: renesas: Add si-linux cat87[45] boards
Date:   Mon, 18 Feb 2019 11:48:04 +0100
Message-Id: <1a69a73c9b006ae72e06a5e637932bfe2fb7bc05.1549624030.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549624030.git.horms+renesas@verge.net.au>
References: <cover.1549624030.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

This patch adds board cat874 (powered by the RZ/G2E) and board
cat875 (that sits on top of cat874). Both boards are made by
Silicon Linux.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 5e9d4864a600..9e1e07b5192e 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -108,6 +108,14 @@ properties:
 
       - description: RZ/G2E (R8A774C0)
         items:
+          - enum:
+              - si-linux,cat874 # Silicon Linux RZ/G2E 96board platform (CAT874)
+          - const: renesas,r8a774c0
+
+      - items:
+          - enum:
+              - si-linux,cat875 # Silicon Linux sub board for CAT874 (CAT875)
+          - const: si-linux,cat874
           - const: renesas,r8a774c0
 
       - description: R-Car M1A (R8A77781)
-- 
2.11.0

