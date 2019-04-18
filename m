Return-Path: <SRS0=TeIC=SU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C480BC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 18 Apr 2019 11:33:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9DCA5217FA
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 18 Apr 2019 11:33:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbfDRLdw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 18 Apr 2019 07:33:52 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:4018 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727807AbfDRLdw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Apr 2019 07:33:52 -0400
X-IronPort-AV: E=Sophos;i="5.60,365,1549897200"; 
   d="scan'208";a="13444190"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 Apr 2019 20:33:50 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D2BE4402C666;
        Thu, 18 Apr 2019 20:33:48 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, ebiharaml@si-linux.co.jp
Subject: [PATCH] [LOCAL] arm64: defconfig: Enable TDA998X
Date:   Thu, 18 Apr 2019 12:33:46 +0100
Message-Id: <1555587226-374-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The EK874 comes with the TDA1998X chip on board, therefore
enable TDA998X option.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index d936e05..c9fba9b 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -198,6 +198,7 @@ CONFIG_VIDEO_ADV748X=y
 # CONFIG_MEDIA_TUNER_MXL301RF is not set
 # CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
 CONFIG_DRM=y
+CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_RCAR_DW_HDMI=y
 CONFIG_DRM_RCAR_LVDS=y
-- 
2.7.4

