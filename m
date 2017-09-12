Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:32933 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751499AbdILVFv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 17:05:51 -0400
Received: by mail-lf0-f54.google.com with SMTP id c80so29573675lfh.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Sep 2017 14:05:51 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170912210547.471712392@cogentembedded.com>
Date: Tue, 12 Sep 2017 23:37:27 +0300
To: Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 11/11] arm64: dts: renesas: eagle: add EtherAVB support
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=arm64-dts-renesas-eagle-add-EtherAVB-support.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the Eagle board  dependent part of the EtherAVB device node.
Enable DHCP  and NFS root for the kernel booting.

Based  on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |   15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -18,10 +18,11 @@
 
 	aliases {
 		serial0 = &scif0;
+		ethernet0 = &avb;
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial0:115200n8";
 	};
 
@@ -43,3 +44,15 @@
 &scif0 {
 	status = "okay";
 };
+
+&avb {
+//	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+		max-speed = <1000>;
+	};
+};
