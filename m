Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg1-f172.google.com ([209.85.215.172]:33423 "EHLO
        mail-pg1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbeJVB3z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Oct 2018 21:29:55 -0400
Received: by mail-pg1-f172.google.com with SMTP id z2-v6so1516214pgp.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Oct 2018 10:14:56 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 22 Oct 2018 02:15:03 +0900
Message-Id: <154014210372.4344.14651283156002646732.sendpatchset@octo>
In-Reply-To: <154014207424.4344.6894320987219157257.sendpatchset@octo>
References: <154014207424.4344.6894320987219157257.sendpatchset@octo>
Subject: [PATCH 03/03] arm64: dts: renesas: r8a77990: Connect R-Car E3 AVB to IPMMU
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Hook up the R-Car E3 AVB device to IPMMU-DS0 16 as described in
the data sheet.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77990.dtsi |    1 +
 1 file changed, 1 insertion(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77990.dtsi	2018-10-22 01:48:50.488496607 +0900
@@ -604,6 +604,7 @@
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 812>;
 			phy-mode = "rgmii";
+			iommus = <&ipmmu_ds0 16>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
