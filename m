Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf1-f171.google.com ([209.85.210.171]:33558 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbeJVB3f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Oct 2018 21:29:35 -0400
Received: by mail-pf1-f171.google.com with SMTP id 78-v6so16351862pfq.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Oct 2018 10:14:37 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 22 Oct 2018 02:14:44 +0900
Message-Id: <154014208447.4344.743576721786725309.sendpatchset@octo>
In-Reply-To: <154014207424.4344.6894320987219157257.sendpatchset@octo>
References: <154014207424.4344.6894320987219157257.sendpatchset@octo>
Subject: [PATCH 01/03] arm64: dts: renesas: r8a77965: Connect R-Car M3-N AVB to IPMMU
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Hook up the R-Car M3-N AVB device to IPMMU-DS0 16 as described in
the data sheet.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77965.dtsi |    1 +
 1 file changed, 1 insertion(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77965.dtsi	2018-10-22 01:46:02.498689171 +0900
@@ -900,6 +900,7 @@
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 812>;
 			phy-mode = "rgmii";
+			iommus = <&ipmmu_ds0 16>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
