Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4DFC10F14
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 08:15:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABD46204FD
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 08:15:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbfDJIP2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 04:15:28 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58693 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727042AbfDJIP2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 04:15:28 -0400
X-IronPort-AV: E=Sophos;i="5.60,332,1549897200"; 
   d="scan'208";a="12628484"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Apr 2019 17:15:27 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C257C426EAAF;
        Wed, 10 Apr 2019 17:15:24 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH V4 06/13] dt-bindings: usb: renesas_usbhs: Add support for r8a77470
Date:   Wed, 10 Apr 2019 09:08:28 +0100
Message-Id: <1554883715-41725-7-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
References: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document support for RZ/G1C (R8A77470) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v3-->v4
  * No change
V2-->V3
  * No change
V1-->V2
  * New patch
---
 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index d93b6a1..b8acc2a 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -6,6 +6,7 @@ Required properties:
 	- "renesas,usbhs-r8a7743" for r8a7743 (RZ/G1M) compatible device
 	- "renesas,usbhs-r8a7744" for r8a7744 (RZ/G1N) compatible device
 	- "renesas,usbhs-r8a7745" for r8a7745 (RZ/G1E) compatible device
+	- "renesas,usbhs-r8a77470" for r8a77470 (RZ/G1C) compatible device
 	- "renesas,usbhs-r8a774a1" for r8a774a1 (RZ/G2M) compatible device
 	- "renesas,usbhs-r8a774c0" for r8a774c0 (RZ/G2E) compatible device
 	- "renesas,usbhs-r8a7790" for r8a7790 (R-Car H2) compatible device
-- 
2.7.4

