Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:46963 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934226AbeBMLYS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 06:24:18 -0500
Received: by mail-lf0-f67.google.com with SMTP id q194so24599940lfe.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2018 03:24:17 -0800 (PST)
Subject: [PATCH v2 2/2] arm64: dts: renesas: eagle: specify EtherAVB PHY IRQ
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <038a791d-aa57-9c3d-eaea-09c5704ecb54@cogentembedded.com>
Message-ID: <0ccd631e-691a-2b15-7680-6e0c847a6ca2@cogentembedded.com>
Date: Tue, 13 Feb 2018 14:24:14 +0300
MIME-Version: 1.0
In-Reply-To: <038a791d-aa57-9c3d-eaea-09c5704ecb54@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Specify  EtherAVB PHY IRQ  in the Eagle board's device tree, now that we
have the GPIO support (previously phylib had to resort to polling).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |    2 ++
 1 file changed, 2 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -44,6 +44,8 @@
 	phy0: ethernet-phy@0 {
 		rxc-skew-ps = <1500>;
 		reg = <0>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
