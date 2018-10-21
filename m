Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg1-f182.google.com ([209.85.215.182]:46817 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbeJVB3o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Oct 2018 21:29:44 -0400
Received: by mail-pg1-f182.google.com with SMTP id r190-v6so6291867pgr.13
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Oct 2018 10:14:46 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 22 Oct 2018 02:14:54 +0900
Message-Id: <154014209450.4344.15784321191626541752.sendpatchset@octo>
In-Reply-To: <154014207424.4344.6894320987219157257.sendpatchset@octo>
References: <154014207424.4344.6894320987219157257.sendpatchset@octo>
Subject: [PATCH 02/03] arm64: dts: renesas: r8a77980: Connect R-Car V3H AVB to IPMMU
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Hook up the R-Car V3H AVB device to IPMMU-DS1 33 as described in
the data sheet.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77980.dtsi |    1 +
 1 file changed, 1 insertion(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77980.dtsi	2018-10-22 01:50:17.072036042 +0900
@@ -667,6 +667,7 @@
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 812>;
 			phy-mode = "rgmii";
+			iommus = <&ipmmu_ds1 33>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
