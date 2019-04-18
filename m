Return-Path: <SRS0=TeIC=SU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2995C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 18 Apr 2019 11:01:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ACCBD2183E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 18 Apr 2019 11:01:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbfDRLBT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 18 Apr 2019 07:01:19 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:60354 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727807AbfDRLBT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Apr 2019 07:01:19 -0400
X-IronPort-AV: E=Sophos;i="5.60,365,1549897200"; 
   d="scan'208";a="13441696"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 Apr 2019 20:01:17 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 38BDA4010DE3;
        Thu, 18 Apr 2019 20:01:13 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Heiko Stuebner <heiko@sntech.de>,
        Andy Gross <agross@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, ebiharaml@si-linux.co.jp
Subject: [PATCH] arm64: defconfig: Enable TDA19988
Date:   Thu, 18 Apr 2019 12:00:55 +0100
Message-Id: <1555585255-30665-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The EK874 board comes with a TDA19988 chip on board, therefore
enable it in the defconfig.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 17daa97..19a900d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -496,6 +496,7 @@ CONFIG_VIDEO_SUN6I_CSI=m
 CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_DRM=m
+CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_EXYNOS=m
 CONFIG_DRM_EXYNOS5433_DECON=y
-- 
2.7.4

