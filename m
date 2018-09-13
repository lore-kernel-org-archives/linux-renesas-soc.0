Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34550 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbeIMORc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 10:17:32 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 12/13] ARM: dts: Include R-Car Gen1 product name in DTSI files
Date: Thu, 13 Sep 2018 11:08:35 +0200
Message-Id: <af69e34040d1d72f7002208a2a46fea7192c7ad6.1536824376.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1536824376.git.horms+renesas@verge.net.au>
References: <cover.1536824376.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Browsing the DTS for all the R-Car SoCs with similar part numbers
still makes my head hurt, so to improve the user friendliness of
the 32-bit ARM DTS code base include R-Car Gen1 product names for
each DTSI file.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7778.dtsi | 2 +-
 arch/arm/boot/dts/r8a7779.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index 1bce16cc6b20..05db0ccad7a6 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for Renesas r8a7778
+ * Device Tree Source for the R-Car M1A (R8A77781) SoC
  *
  * Copyright (C) 2013  Renesas Solutions Corp.
  * Copyright (C) 2013  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 03919714645a..3bc133d9489c 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for Renesas r8a7779
+ * Device Tree Source for the R-Car H1 (R8A77790) SoC
  *
  * Copyright (C) 2013 Renesas Solutions Corp.
  * Copyright (C) 2013 Simon Horman
-- 
2.11.0
