Return-Path: <SRS0=KXCr=AP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081D7C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  4 Jul 2020 15:48:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3F1F207D4
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  4 Jul 2020 15:48:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgGDPsJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 4 Jul 2020 11:48:09 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:38550 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726501AbgGDPsJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Jul 2020 11:48:09 -0400
X-Halon-ID: bf20658e-be0d-11ea-933e-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id bf20658e-be0d-11ea-933e-005056917a89;
        Sat, 04 Jul 2020 17:48:06 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] ARM: shmobile: defconfig: Resotre support for V4L2 platform devices
Date:   Sat,  4 Jul 2020 17:47:52 +0200
Message-Id: <20200704154752.2980029-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since commit [1] the Renesas V4L2 platform devices are no longer enabled
with the shmobile_defconfig, restore functionality by enabling
MEDIA_PLATFORM_SUPPORT.

1. b0cd4fb276653f8f ("media: Kconfig: on !EMBEDDED && !EXPERT, enable driver filtering")

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 9cf3143025e1eea4..c14612fc06767621 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -112,6 +112,7 @@ CONFIG_MEDIA_SUPPORT=y
 CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_CONTROLLER=y
 CONFIG_VIDEO_V4L2_SUBDEV_API=y
+CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_RCAR_VIN=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
-- 
2.27.0

