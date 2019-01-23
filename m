Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1637CC282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 14:30:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E50DF21726
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 14:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfAWOa0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 09:30:26 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:1222 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726183AbfAWOa0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 09:30:26 -0500
X-IronPort-AV: E=Sophos;i="5.56,511,1539615600"; 
   d="scan'208";a="5989066"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jan 2019 23:30:24 +0900
Received: from rtamta01.rta.renesas.com (transport.eroom.renesas.com [143.103.48.75])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CF16541E9321;
        Wed, 23 Jan 2019 23:30:24 +0900 (JST)
Received: from ubuntu.localdomain (unknown [143.103.58.245])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id E2EF9BF;
        Wed, 23 Jan 2019 14:30:23 +0000 (UTC)
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2] dt-bindings: arm: renesas: Document RZ/A2M EVB
Date:   Wed, 23 Jan 2019 09:30:12 -0500
Message-Id: <20190123143012.119912-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the RZ/A2M Evaluation board.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
 * 'enum' is supposed to go under 'items'
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 5e9d4864a600..f2ef83d473d6 100644
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
2.16.1

