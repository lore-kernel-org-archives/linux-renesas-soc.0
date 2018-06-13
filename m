Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:42931 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934975AbeFMQmT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 12:42:19 -0400
Received: by mail-lf0-f68.google.com with SMTP id v135-v6so4941643lfa.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jun 2018 09:42:18 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] arm64: dts: renesas: condor/v3hsk: specify Ethernet PHY
 IRQs
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <4acc208e-c593-1e8a-00ca-fc9a5574074e@cogentembedded.com>
Message-ID: <42861d8f-3570-03b9-987c-bb15fa92a9c7@cogentembedded.com>
Date: Wed, 13 Jun 2018 19:42:15 +0300
MIME-Version: 1.0
In-Reply-To: <4acc208e-c593-1e8a-00ca-fc9a5574074e@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Specify Ethernet PHY IRQs in the Condor/V3HSK board device trees, now that
we have the GPIO support (previously phylib had  to resort to polling).

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- merged in the analogous V3HSK patch, renamed the patch, and updated the
  patch description accordingly.

 arch/arm64/boot/dts/renesas/r8a77980-condor.dts |    2 ++
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts  |    2 ++
 2 files changed, 4 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -59,6 +59,8 @@
 	phy0: ethernet-phy@0 {
 		rxc-skew-ps = <1500>;
 		reg = <0>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -48,6 +48,8 @@
 
 	phy0: ethernet-phy@0 {
 		reg = <0>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
