Return-Path: <SRS0=s4Ke=QT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2ABC282C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 15:33:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52AD3217FA
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 15:33:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728725AbfBLPdE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Feb 2019 10:33:04 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:39008 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728347AbfBLPdE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Feb 2019 10:33:04 -0500
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id brZ21z00A3XaVaC06rZ2S2; Tue, 12 Feb 2019 16:33:02 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gta3P-0005xD-Vp; Tue, 12 Feb 2019 16:32:59 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gta3P-0003Hz-T9; Tue, 12 Feb 2019 16:32:59 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] arm64: dts: renesas: r8a77990: Add Ebisu-4D board support
Date:   Tue, 12 Feb 2019 16:32:59 +0100
Message-Id: <20190212153259.12601-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Add initial support for the Renesas Ebisu-4D development board.

The Ebisu-4D board is very similar to the Ebisu board, but the memory
configuration is different.

  - The memory map of Ebisu-4D board is as follows:
      Bank0: 2 GiB RAM : 0x000048000000 -> 0x000bfffffff

  - The memory map of Ebisu board is as follows:
      Bank0: 1 GiB RAM : 0x000048000000 -> 0x0007fffffff

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Do we need this patch?

ATF v2.0-763-ga45ccf135e48 sees the full 2 GiB, but U-Boot
2019.01-00523-ge5fd39c88648 still sees only 896 MiB of RAM, and this
patch is needed to let Linux use the additional 1 GiB of RAM.

If U-Boot could see all RAM, it could update:
  1. the reg property in the memory node, and
  2. the dma-ranges property in the pcie node[*],
depending on the board, and we won't need separate DTSes for Ebisu and
Ebisu-4D.

[*] Looks like fdt_pci_dma_ranges() is called on Freescale platforms
    only?
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../boot/dts/renesas/r8a77990-ebisu-4d.dts    | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77990-ebisu-4d.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 36c0429f62c7b7f7..b6630ffd0cbb255c 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-m3nulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb r8a77970-v3msk.dtb
 dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb r8a77980-v3hsk.dtb
 dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
+dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu-4d.dtb
 dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
 
 # SoCs lacking upstream board support
diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu-4d.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu-4d.dts
new file mode 100644
index 0000000000000000..9f5bc7a7734f5fb8
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu-4d.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Ebisu-4D board
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a77990-ebisu.dts"
+
+/ {
+	model = "Renesas Ebisu-4D board based on r8a77990";
+	compatible = "renesas,ebisu", "renesas,r8a77990";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+};
+
+&pciec0 {
+	/* Map all possible DDR as inbound ranges */
+	dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+};
-- 
2.17.1

