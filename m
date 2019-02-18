Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EC9C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 10:48:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5BF062147A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 10:48:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Dn/D/Y0A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730301AbfBRKsb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 05:48:31 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:45398 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730316AbfBRKsa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 05:48:30 -0500
Received: from penelope.horms.nl (unknown [62.119.166.9])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8158125BEAC;
        Mon, 18 Feb 2019 21:48:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1550486906; bh=ywfXuCMYMMxno5H1hvjTQde5VmOUreRVvV6jPD6zTf0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Dn/D/Y0ARJtLdqNwSNCjwQKMIn1hop/7vsIEiQmCfcBnb7ydGrDfmhjf+e2yLJt3/
         OXwA7HmSYjq22iXwaLUbuAIyCRfVcdITQwz/jUMqTbFvd/XNcS+ZKc3/ocgq/suLtE
         StWBRa7vBuRIV3HNn8nVM2amyadX7C5Q2Dpc3jis=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id C3956E218D3; Mon, 18 Feb 2019 11:48:07 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/4] dt-bindings: arm: renesas: Document RZ/A2M EVB
Date:   Mon, 18 Feb 2019 11:48:05 +0100
Message-Id: <58097b0e05c0dc70345c02cd83117f134574024e.1549624030.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549624030.git.horms+renesas@verge.net.au>
References: <cover.1549624030.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Chris Brandt <chris.brandt@renesas.com>

Add the RZ/A2M Evaluation board.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 9e1e07b5192e..cb9b4417e8a1 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -30,6 +30,8 @@ properties:
 
       - description: RZ/A2 (R7S9210)
         items:
+          - enum:
+              - renesas,rza2mevb # RZ/A2M Eval Board (RTK7921053S00000BE)
           - const: renesas,r7s9210
 
       - description: SH-Mobile AG5 (R8A73A00/SH73A0)
-- 
2.11.0

