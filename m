Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37449 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbeJUFsD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Oct 2018 01:48:03 -0400
Received: by mail-pf1-f196.google.com with SMTP id j23-v6so18061192pfi.4
        for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Oct 2018 14:36:13 -0700 (PDT)
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT] arm64: dts: renesas: r8a77990-ebisu: Enable i2c
Date: Sun, 21 Oct 2018 06:36:05 +0900
Message-Id: <1540071365-27533-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch enables I2C3 channels for the r8a77990-ebisu.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 611f026..4a596ef 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -294,6 +294,10 @@
 	clock-names = "fck", "dclkin.0", "extal";
 };
 
+&i2c3 {
+	status = "okay";
+};
+
 &ohci0 {
 	status = "okay";
 };
-- 
1.9.1
