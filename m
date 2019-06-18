Return-Path: <SRS0=HpHr=UR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82015C31E51
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Jun 2019 12:47:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B65920679
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Jun 2019 12:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfFRMry (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Jun 2019 08:47:54 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:33394 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbfFRMry (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 08:47:54 -0400
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id SCnr2000N3XaVaC06Cnrly; Tue, 18 Jun 2019 14:47:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hdDWh-0007hv-GO; Tue, 18 Jun 2019 14:47:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hdDWh-0003yA-Es; Tue, 18 Jun 2019 14:47:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL] arm64: renesas_defconfig: Refresh for v5.2-rc1
Date:   Tue, 18 Jun 2019 14:47:50 +0200
Message-Id: <20190618124750.15217-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update the defconfig for Renesas R-Car Gen3 boards:
  - Move CONFIG_COMPAT=y (moved in commit dd523791c939cfe6 ("arm64:
    Kconfig: Make CONFIG_COMPAT a menuconfig entry")),
  - Drop CONFIG_BACKLIGHT_LCD_SUPPORT=y (removed in commit
    8c5dc8d9f19c7992 ("video: backlight: Remove useless
    BACKLIGHT_LCD_SUPPORT kernel symbol")),
  - Drop CONFIG_RESET_CONTROLLER=y (auto-enabled since commit
    d245a940d97b5cd0 ("media: rcar-csi2: Use standby mode instead of
    resetting")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 34bc7a6ae1183a51..264fe03d6b085bae 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -45,10 +45,10 @@ CONFIG_SECCOMP=y
 CONFIG_KEXEC=y
 CONFIG_CRASH_DUMP=y
 CONFIG_XEN=y
+CONFIG_COMPAT=y
 # CONFIG_ARM64_LSE_ATOMICS is not set
 # CONFIG_ARM64_RAS_EXTN is not set
 # CONFIG_ARM64_PTR_AUTH is not set
-CONFIG_COMPAT=y
 CONFIG_HIBERNATION=y
 CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
 CONFIG_CPU_IDLE=y
@@ -215,7 +215,6 @@ CONFIG_DRM_DW_HDMI_AHB_AUDIO=y
 CONFIG_DRM_DW_HDMI_I2S_AUDIO=y
 CONFIG_DRM_DW_HDMI_CEC=y
 CONFIG_FB_MODE_HELPERS=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 # CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
@@ -298,7 +297,6 @@ CONFIG_IIO=y
 CONFIG_MAX9611=y
 CONFIG_PWM=y
 CONFIG_PWM_RCAR=y
-CONFIG_RESET_CONTROLLER=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=y
-- 
2.17.1

