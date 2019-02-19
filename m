Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D1CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 15:11:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2423621736
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 15:11:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbfBSPL4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 10:11:56 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:55160 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728888AbfBSPL4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 10:11:56 -0500
X-IronPort-AV: E=Sophos;i="5.58,388,1544454000"; 
   d="scan'208";a="8285359"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 20 Feb 2019 00:11:53 +0900
Received: from renesas-VirtualBox.ree.adwin.renesas.com (unknown [10.226.37.56])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E3CE94485B1C;
        Wed, 20 Feb 2019 00:11:51 +0900 (JST)
From:   Gareth Williams <gareth.williams.jx@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>
Subject: [PATCH v2 1/2] dt: snps,designware-i2c: Add clock bindings documentation
Date:   Tue, 19 Feb 2019 15:10:41 +0000
Message-Id: <1550589042-11096-2-git-send-email-gareth.williams.jx@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550589042-11096-1-git-send-email-gareth.williams.jx@renesas.com>
References: <1550589042-11096-1-git-send-email-gareth.williams.jx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Phil Edworthy <phil.edworthy@renesas.com>

The driver requires an undocumented clock property, so detail it.
Add documentation for a separate, optional, bus clock.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Signed-off-by: Gareth Williams <gareth.williams.jx@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2:
 - No changes.
---
 Documentation/devicetree/bindings/i2c/i2c-designware.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-designware.txt b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
index 3e4bcc2..822ebce 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-designware.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
@@ -6,12 +6,21 @@ Required properties :
                 or "mscc,ocelot-i2c" with "snps,designware-i2c" for fallback
  - reg : Offset and length of the register set for the device
  - interrupts : <IRQ> where IRQ is the interrupt number.
+ - clocks : phandles for the clocks, see the description of clock-names below.
+   The phandle for the "ic_clk" clock is required. The phandle for the "bus"
+   clock is optional. If a single clock is specified but no clock-name, it is
+   the "ic_clk" clock. If both clocks are listed, the "ic_clk" must be first.
 
 Recommended properties :
 
  - clock-frequency : desired I2C bus clock frequency in Hz.
 
 Optional properties :
+
+ - clock-names : Contains the names of the clocks:
+    "ic_clk", for the core clock used to generate the external I2C clock.
+    "bus", the bus clock, sometimes described as pclk, for register accesses.
+
  - reg : for "mscc,ocelot-i2c", a second register set to configure the SDA hold
    time, named ICPU_CFG:TWI_DELAY in the datasheet.
 
-- 
2.7.4

