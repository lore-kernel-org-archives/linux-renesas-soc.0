Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36502 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761904AbcINQqT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 12:46:19 -0400
Received: by mail-wm0-f66.google.com with SMTP id b184so3386180wma.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 09:46:18 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: horms@verge.net.au, magnus.damm@gmail.com, wsa@the-dreams.de,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 1/6] i2c: rcar: add support for r8a7796 (R-Car M3-W)
Date: Wed, 14 Sep 2016 18:46:06 +0200
Message-Id: <20160914164611.31237-2-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <20160914164611.31237-1-ulrich.hecht+renesas@gmail.com>
References: <20160914164611.31237-1-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Same as r8a7795.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-rcar.txt | 1 +
 drivers/i2c/busses/i2c-rcar.c                      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
index 5f0cb50..239632a 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
@@ -11,6 +11,7 @@ Required properties:
 	"renesas,i2c-r8a7793"
 	"renesas,i2c-r8a7794"
 	"renesas,i2c-r8a7795"
+	"renesas,i2c-r8a7796"
 - reg: physical base address of the controller and length of memory mapped
   region.
 - interrupts: interrupt specifier.
diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index e96ea24..726615e 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -802,6 +802,7 @@ static const struct of_device_id rcar_i2c_dt_ids[] = {
 	{ .compatible = "renesas,i2c-r8a7793", .data = (void *)I2C_RCAR_GEN2 },
 	{ .compatible = "renesas,i2c-r8a7794", .data = (void *)I2C_RCAR_GEN2 },
 	{ .compatible = "renesas,i2c-r8a7795", .data = (void *)I2C_RCAR_GEN3 },
+	{ .compatible = "renesas,i2c-r8a7796", .data = (void *)I2C_RCAR_GEN3 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rcar_i2c_dt_ids);
-- 
2.9.3
