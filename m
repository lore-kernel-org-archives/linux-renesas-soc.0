Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:33161 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S3002689AbcHEVwo (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 5 Aug 2016 17:52:44 -0400
Received: by mail-lf0-f42.google.com with SMTP id b199so212601839lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Aug 2016 14:52:43 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: r8a7792: fix misindented line
Date: Sat, 06 Aug 2016 00:52:39 +0300
Message-ID: <4152284.qHAgBjWaW0@wasted.cogentembedded.com>
In-Reply-To: <1618499.8bcj8adpVO@wasted.cogentembedded.com>
References: <1618499.8bcj8adpVO@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Commit 2a0900655d5e (ARM: dts: r8a7792: add I2C support) had a wrongly
indented line at the end of the "aliases" subnode -- fix it.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20160725-v4.7-rc7' tag of Simon
Horman's 'renesas.git' repo.

 arch/arm/boot/dts/r8a7792.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -31,7 +31,7 @@
 		vin3 = &vin3;
 		vin4 = &vin4;
 		vin5 = &vin5;
-};
+	};
 
 	cpus {
 		#address-cells = <1>;
