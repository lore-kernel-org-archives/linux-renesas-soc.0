Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D134C282E0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 14:55:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5880B20693
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 14:55:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732936AbfDJOzl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 10:55:41 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:8187 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732919AbfDJOzl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 10:55:41 -0400
X-IronPort-AV: E=Sophos;i="5.60,332,1549897200"; 
   d="scan'208";a="12656272"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Apr 2019 23:55:40 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 55D9841F5807;
        Wed, 10 Apr 2019 23:55:38 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH V5 05/13] ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in shmobile_defconfig
Date:   Wed, 10 Apr 2019 15:48:42 +0100
Message-Id: <1554907730-14792-6-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
References: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable PHY_RCAR_GEN3_USB2 in shmobile_defconfig so that boards
based on RZ/G1C SoC design can use the corresponding driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
V4-->V5
 * No change
V3-->V4
 * No change
V2-->V3
 * New patch
   https://patchwork.kernel.org/patch/10879899/
---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 9b0efac..ff9348d 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -197,6 +197,7 @@ CONFIG_PWM_RENESAS_TPU=y
 CONFIG_RESET_CONTROLLER=y
 CONFIG_GENERIC_PHY=y
 CONFIG_PHY_RCAR_GEN2=y
+CONFIG_PHY_RCAR_GEN3_USB2=y
 # CONFIG_DNOTIFY is not set
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
-- 
2.7.4

