Return-Path: <SRS0=UKHE=Q4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD293C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 16:11:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8EC062085A
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 16:11:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbfBUQL1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Feb 2019 11:11:27 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:5211 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725880AbfBUQL0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Feb 2019 11:11:26 -0500
X-IronPort-AV: E=Sophos;i="5.58,395,1544454000"; 
   d="scan'208";a="8293234"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Feb 2019 01:11:24 +0900
Received: from renesas-VirtualBox.ree.adwin.renesas.com (unknown [10.226.37.56])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2110E40A70AF;
        Fri, 22 Feb 2019 01:11:21 +0900 (JST)
From:   Gareth Williams <gareth.williams.jx@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 1/2] dt: snps,designware-i2c: Add clock bindings documentation
Date:   Thu, 21 Feb 2019 16:10:58 +0000
Message-Id: <1550765459-14519-2-git-send-email-gareth.williams.jx@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550765459-14519-1-git-send-email-gareth.williams.jx@renesas.com>
References: <1550765459-14519-1-git-send-email-gareth.williams.jx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Phil Edworthy <phil.edworthy@renesas.com>

The driver requires an undocumented clock property, so detail it.
Add documentation for a separate, optional, peripheral clock.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4:
 - Updated commit message to reference "peripheral clock" instead of 
   "bus clock" 
 - Added Wolfram's Acked-by
v3:
 - Changed clocks and clock-names sections to use term "peripheral clock"
   (pclk) instead of "bus clock" (busclk).
v2:
 - No changes.
v1:
 - Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-designware.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-designware.txt b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
index 3e4bcc2..f94aa59 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-designware.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
@@ -6,12 +6,21 @@ Required properties :
                 or "mscc,ocelot-i2c" with "snps,designware-i2c" for fallback
  - reg : Offset and length of the register set for the device
  - interrupts : <IRQ> where IRQ is the interrupt number.
+ - clocks : phandles for the clocks, see the description of clock-names below.
+   The phandle for the "ic_clk" clock is required. The phandle for the "pclk"
+   clock is optional. If a single clock is specified but no clock-name, it is
+   the "ic_clk" clock. If both clocks are listed, the "ic_clk" must be first.
 
 Recommended properties :
 
  - clock-frequency : desired I2C bus clock frequency in Hz.
 
 Optional properties :
+
+ - clock-names : Contains the names of the clocks:
+    "ic_clk", for the core clock used to generate the external I2C clock.
+    "pclk", the peripheral clock, required for register accesses.
+
  - reg : for "mscc,ocelot-i2c", a second register set to configure the SDA hold
    time, named ICPU_CFG:TWI_DELAY in the datasheet.
 
-- 
2.7.4

