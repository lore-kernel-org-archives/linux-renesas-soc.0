Return-Path: <SRS0+PmC+=RR=vger.kernel.org=netdev-owner@vergenet.net>
Date: Tue, 24 May 2016 14:34:22 -0700 (PDT)
Message-Id: <20160524.143422.552507610109476444.davem@davemloft.net>
To: yanhaishuang@cmss.chinamobile.com
Cc: kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ip6_gre: Set flowi6_proto as IPPROTO_GRE in
 xmit path.
From: David Miller <davem@davemloft.net>
In-Reply-To: <1463825855-7363-2-git-send-email-yanhaishuang@cmss.chinamobile.com>
References: <1463825855-7363-1-git-send-email-yanhaishuang@cmss.chinamobile.com>
	<1463825855-7363-2-git-send-email-yanhaishuang@cmss.chinamobile.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: netdev-owner@vger.kernel.org
Return-Path: <SRS0+0pbH=RS=vger.kernel.org=linux-renesas-soc-owner@vergenet.net>
Received: from kirsty.vergenet.net ([202.4.237.240]:55933 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753967AbcEYBBy (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 24 May 2016 21:01:54 -0400
Date: Wed, 25 May 2016 10:01:51 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: rcar-gen2: Use ICRAM1 for jump stub on
 all SoCs
Message-ID: <20160525010150.GD7292@verge.net.au>
References: <1463498133-23918-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1463498133-23918-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>
Return-Path: <SRS0+QJW2=RY=cogentembedded.com=sergei.shtylyov@vergenet.net>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 12/13] ARM: dts: blanche: initial device tree
Date: Wed, 01 Jun 2016 01:32:35 +0300
Message-ID: <1923946.Jvi0TDUXFC@wasted.cogentembedded.com>
In-Reply-To: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Date: Sat, 21 May 2016 18:17:35 +0800

> In gre6 xmit path, we are sending a GRE packet, so set fl6 proto
> to IPPROTO_GRE properly.
> 
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>

Applied.

On Tue, May 17, 2016 at 05:15:33PM +0200, Geert Uytterhoeven wrote:
> Currently the different SoCs in the R-Car Gen2 family use different
> types of on-chip RAM for the jump stub:
>   - R-Car H2 uses Media RAM,
>   - R-Car M2-W uses another type of optional On-chip RAM, as it doesn't
>     have Media RAM,
>   - R-Car M2-N uses Inter Connect RAM in Magnus Damm's "ARM: shmobile:
>     r8a7793 boot address update".
> 
> As all R-Car Gen2 SoCs have 4 KiB of Inter Connect RAM, consolidate the
> code by always using that.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested on r8a7790/lager and r8a7791/koelsch.
> ---
>  arch/arm/mach-shmobile/pm-rcar-gen2.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)

Thanks, I have queued this up.

Add the initial device  tree for the R8A7792 SoC based Blanche board.
The board has 2 debug serial ports: SCIF0 and SCIF3; include support for
them,  so that  the serial console  can  work.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/Makefile            |    1 
 arch/arm/boot/dts/r8a7792-blanche.dts |   44 ++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

Index: renesas/arch/arm/boot/dts/Makefile
===================================================================
--- renesas.orig/arch/arm/boot/dts/Makefile
+++ renesas/arch/arm/boot/dts/Makefile
@@ -638,6 +638,7 @@ dtb-$(CONFIG_ARCH_SHMOBILE_MULTI) += \
 	r8a7790-lager.dtb \
 	r8a7791-koelsch.dtb \
 	r8a7791-porter.dtb \
+	r8a7792-blanche.dtb \
 	r8a7793-gose.dtb \
 	r8a7794-alt.dtb \
 	r8a7794-silk.dtb \
Index: renesas/arch/arm/boot/dts/r8a7792-blanche.dts
===================================================================
--- /dev/null
+++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -0,0 +1,44 @@
+/*
+ * Device Tree Source for the Blanche board
+ *
+ * Copyright (C) 2016 Cogent Embedded, Inc.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/dts-v1/;
+#include "r8a7792.dtsi"
+
+/ {
+	model = "Blanche";
+	compatible = "renesas,blanche", "renesas,r8a7792";
+
+	aliases {
+		serial0 = &scif0;
+		serial1 = &scif3;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x40000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <20000000>;
+};
+
+&scif0 {
+	status = "okay";
+};
+
+&scif3 {
+	status = "okay";
+};
