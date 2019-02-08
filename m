Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDA6C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0278E20863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="V2noUOT2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbfBHLOU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:14:20 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46395 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfBHLOU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:14:20 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1B96F25BEF2;
        Fri,  8 Feb 2019 22:14:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624457; bh=RzzmvDEoY1isB5lMRIxbI0N4DsQa1Ph89rxIb9dUdpk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V2noUOT25Pk/Icl0r37/3C0oMw3SEYoZBITxk8gMismqzy3KK5uCkasG4zr5SopuS
         jCFFfpAl+2AMJyWdNeug9I8vjsFpGBWtGqV8AvTQQmTBZMAbhO9vXZuiR4MvsaqSAI
         sXlO1veNfrhV5rwPfcNiAlnKurGend+rhyqoFnxY=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 67F76940171; Fri,  8 Feb 2019 12:14:15 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 02/12] ARM: dts: iwg23s-sbc: Enable RTC
Date:   Fri,  8 Feb 2019 12:14:03 +0100
Message-Id: <55327bff832c9903a9133cdad56783b54bd8596a.1549623128.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549623128.git.horms+renesas@verge.net.au>
References: <cover.1549623128.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

Enable NXP pcf85263 real time clock for the iWave SBC based on RZ/G1C.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index 40b7f98d6013..77d18242ef59 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -84,12 +84,30 @@
 	clock-frequency = <20000000>;
 };
 
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	rtc@51 {
+		compatible = "nxp,pcf85263";
+		reg = <0x51>;
+	};
+};
+
 &pfc {
 	avb_pins: avb {
 		groups = "avb_mdio", "avb_gmii_tx_rx";
 		function = "avb";
 	};
 
+	i2c3_pins: i2c3 {
+		groups = "i2c3_c";
+		function = "i2c3";
+	};
+
 	mmc_pins_uhs: mmc_uhs {
 		groups = "mmc_data8", "mmc_ctrl";
 		function = "mmc";
-- 
2.11.0

