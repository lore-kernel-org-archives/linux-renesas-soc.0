Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:38298 "EHLO
        mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752389AbeBSLtx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 06:49:53 -0500
Received: by mail-pf0-f174.google.com with SMTP id i3so2048235pfe.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2018 03:49:53 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 19 Feb 2018 20:49:42 +0900
Message-Id: <151904098248.30541.17415579752890048779.sendpatchset@little-apple>
In-Reply-To: <151904097369.30541.12132732484797103163.sendpatchset@little-apple>
References: <151904097369.30541.12132732484797103163.sendpatchset@little-apple>
Subject: [PATCH 01/02] ARM: dts: silk: Add r1ex24002 EEPROM to DT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Extend the Silk board support to include U14 which is an I2C based EEPROM
hooked up to the I2C1 bus.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/r8a7794-silk.dts |    6 ++++++
 1 file changed, 6 insertions(+)

--- 0001/arch/arm/boot/dts/r8a7794-silk.dts
+++ work/arch/arm/boot/dts/r8a7794-silk.dts	2018-02-19 20:03:54.730607110 +0900
@@ -226,6 +226,12 @@
 				};
 			};
 		};
+
+		eeprom@50 {
+			compatible = "renesas,r1ex24002", "atmel,24c02";
+			reg = <0x50>;
+			pagesize = <16>;
+		};
 	};
 };
 
