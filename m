Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:60039 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728346AbeKAIb7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Nov 2018 04:31:59 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] arm64: dts: renesas: enable HS400 on R-Car Gen3
Date: Thu,  1 Nov 2018 00:31:25 +0100
Message-Id: <20181031233125.2800-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Successfully tested on H3 ES2.0 and M3-N ES1.0.
Transfer rates where >160MB/s for H3 and >200MB/s for M3-N.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 1 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 1 +
 2 files changed, 2 insertions(+)
---

Hi Simon,

This patch have quiet a few dependencies I'm afraid, let me know if you 
wish to be notified once they all upstream. I don't think it's a good 
idea to pick this up before all dependencies are resolved.

- [PATCH] mmc: renesas_sdhi: remove workaround for HS400 clock
- [PATCH v3 0/3] mmc: tmio: fix reset operation
- [PATCH v2 0/3] mmc: renesas_sdhi: extend quirk selection to handle ES revisions
- [PATCH 0/2] renesas: rcar-gen3: add HS400 quirk for SD clock


diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index d28ae95405f1152b..6bc041cc63bdc81b 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -762,6 +762,7 @@
 	vqmmc-supply = <&reg_1p8v>;
 	bus-width = <8>;
 	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
 	non-removable;
 	fixed-emmc-driver-type = <1>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 7e6078508ba0ba19..88d03177ae2b327c 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -430,6 +430,7 @@
 	vqmmc-supply = <&reg_1p8v>;
 	bus-width = <8>;
 	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
 	non-removable;
 	status = "okay";
 };
-- 
2.19.1
