Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:60992 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752071AbdK1Nf4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Nov 2017 08:35:56 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: defconfig: Refresh renesas_defconfig
Date: Tue, 28 Nov 2017 14:35:45 +0100
Message-Id: <1511876145-8355-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

RC_CORE defaults to n again since commit 5573d124292a01af ("[media]
media: default for RC_CORE should be n").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 68f5073ae4cbb505..88cbd4f769d15b1f 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -145,7 +145,6 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_BD9571MWV=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_PWM=y
-# CONFIG_RC_CORE is not set
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_SDR_SUPPORT=y
-- 
2.7.4
