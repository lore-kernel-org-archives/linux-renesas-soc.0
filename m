Return-Path: <SRS0=3qy3=B5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CACC433E1
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Aug 2020 10:11:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A222207BB
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Aug 2020 10:11:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbgHSKL2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Aug 2020 06:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726919AbgHSKL1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Aug 2020 06:11:27 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89929C061757
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2020 03:11:27 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id HNBS2300G4C55Sk06NBS4S; Wed, 19 Aug 2020 12:11:26 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8L42-0008T1-3g; Wed, 19 Aug 2020 12:11:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8L42-0003A6-2c; Wed, 19 Aug 2020 12:11:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v5.9-rc1
Date:   Wed, 19 Aug 2020 12:11:25 +0200
Message-Id: <20200819101125.12113-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas ARM systems:
  - Drop CONFIG_BACKLIGHT_GENERIC=n (removed in commit 7ecdea4a0226f6c5
    ("backlight: generic_bl: Remove this driver as it is unused")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.10.
---
 arch/arm/configs/shmobile_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 5e42549660c0d49c..b6b9118b2a73dab1 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -136,7 +136,6 @@ CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_I2C_ADV7511=y
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_FB_SH_MOBILE_LCDC=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_BACKLIGHT_AS3711=y
 CONFIG_SOUND=y
-- 
2.17.1

