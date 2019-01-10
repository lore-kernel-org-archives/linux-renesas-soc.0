Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39790C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 14:28:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07D6B214C6
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 14:28:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ZWdqLwDD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbfAJO2z (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 09:28:55 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40191 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbfAJO2z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 09:28:55 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2AD7425B78D;
        Fri, 11 Jan 2019 01:28:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547130532; bh=fZThQyC5Koq5AXMYyJb9TBHMB4uX/jHex3OlNiCVT/Q=;
        h=From:To:Cc:Subject:Date:From;
        b=ZWdqLwDD+5kXPE5WGQ1xGmt80pna3ia8qQw+Ha4FZeAvVjIFw0QTt7BzRcKoWwTO4
         7bFr2PCwuKkw2rKMHQIKfV92rzBug0/Vbx+5eSYk8rlkBxPTyUY3rnPh1m/Tw21jJ0
         VehqCeYIHE3Mc2HZ1RMuqm789XTa0CbHU3yu9jE8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2F253940462; Thu, 10 Jan 2019 15:28:50 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Enable HS400 of SDHI3
Date:   Thu, 10 Jan 2019 15:28:33 +0100
Message-Id: <20190110142833.31577-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SDHI3 UHS pin control and use it when enabling HS200 support
for SDHI3.

Based on work by Takeshi Kihara.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Tested on top of renesas-devel-20190110-v5.0-rc1

[    2.967136] renesas_sdhi_internal_dmac ee160000.sd: mmc0 base at 0xee160000 max clock rate 200 MHz
[    3.055659] mmc0: new HS400 MMC card at address 0001
[    3.061726] mmcblk0: mmc0:0001 BGSD3R 29.1 GiB
[    3.070827] mmcblk0boot0: mmc0:0001 BGSD3R partition 1 16.0 MiB
[    3.077508] mmcblk0boot1: mmc0:0001 BGSD3R partition 2 16.0 MiB
[    3.084132] mmcblk0rpmb: mmc0:0001 BGSD3R partition 3 4.00 MiB, chardev (243:0)
[    2.967136] renesas_sdhi_internal_dmac ee160000.sd: mmc0 base at 0xee160000 max clock rate 200 MHz
[    3.055659] mmc0: new HS400 MMC card at address 0001
[    3.061726] mmcblk0: mmc0:0001 BGSD3R 29.1 GiB
[    3.070827] mmcblk0boot0: mmc0:0001 BGSD3R partition 1 16.0 MiB
[    3.077508] mmcblk0boot1: mmc0:0001 BGSD3R partition 2 16.0 MiB
[    3.084132] mmcblk0rpmb: mmc0:0001 BGSD3R partition 3 4.00 MiB, chardev (243:0)

[    2.901527] renesas_sdhi_internal_dmac ee160000.sd: Linked as a consumer to regulator.2
[    2.909824] renesas_sdhi_internal_dmac ee160000.sd: Linked as a consumer to regulator.1
[    2.967136] renesas_sdhi_internal_dmac ee160000.sd: mmc0 base at 0xee160000 max clock rate 200 MHz
[    3.055659] mmc0: new HS400 MMC card at address 0001
[    3.061726] mmcblk0: mmc0:0001 BGSD3R 29.1 GiB
[    3.070827] mmcblk0boot0: mmc0:0001 BGSD3R partition 1 16.0 MiB
[    3.077508] mmcblk0boot1: mmc0:0001 BGSD3R partition 2 16.0 MiB
[    3.084132] mmcblk0rpmb: mmc0:0001 BGSD3R partition 3 4.00 MiB, chardev (243:0)

128+0 records in
128+0 records out
134217728 bytes (134 MB) copied, 0.92438 s, 145 MB/s
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 9.02486 s, 59.5 MB/s
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 7.36003 s, 72.9 MB/s

512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 11.0156 s, 48.7 MB/s
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 7.15907 s, 75.0 MB/s
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 8.78869 s, 61.1 MB/s
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 10.3861 s, 51.7 MB/s

The above test results seem favourable when compared to
testing against renesas-devel-20190110-v5.0-rc1 where the eMMC
device uses HS200 mode.

512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 14.7343 s, 36.4 MB/s
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 8.46809 s, 63.4 MB/s
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 14.6945 s, 36.5 MB/s

512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 19.1677 s, 28.0 MB/s
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 21.3139 s, 25.2 MB/s
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 19.9205 s, 27.0 MB/s
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 89383aa35d65..f2846c9eb83f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -535,6 +535,12 @@
 		power-source = <1800>;
 	};
 
+	sdhi3_pins_uhs: sd3_uhs {
+		groups = "sdhi3_data8", "sdhi3_ctrl", "sdhi3_ds";
+		function = "sdhi3";
+		power-source = <1800>;
+	};
+
 	sound_pins: sound {
 		groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data";
 		function = "ssi";
@@ -689,12 +695,13 @@
 &sdhi3 {
 	/* used for on-board 8bit eMMC */
 	pinctrl-0 = <&sdhi3_pins>;
-	pinctrl-1 = <&sdhi3_pins>;
+	pinctrl-1 = <&sdhi3_pins_uhs>;
 	pinctrl-names = "default", "state_uhs";
 
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&reg_1p8v>;
 	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
 	bus-width = <8>;
 	non-removable;
 	status = "okay";
-- 
2.11.0

