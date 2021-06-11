Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75243C48BD1
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jun 2021 11:37:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64FB461287
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jun 2021 11:37:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbhFKLjA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jun 2021 07:39:00 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:42669 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231681AbhFKLjA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 07:39:00 -0400
X-IronPort-AV: E=Sophos;i="5.83,265,1616425200"; 
   d="scan'208";a="83950441"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Jun 2021 20:37:02 +0900
Received: from localhost.localdomain (unknown [10.226.92.121])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6A362401C57C;
        Fri, 11 Jun 2021 20:36:58 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Michael Walle <michael@walle.cc>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Nishanth Menon <nm@ti.com>, Fabio Estevam <festevam@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/5] arm64: defconfig: Enable DMA controller for RZ/G2L SoC's
Date:   Fri, 11 Jun 2021 12:36:42 +0100
Message-Id: <20210611113642.18457-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210611113642.18457-1-biju.das.jz@bp.renesas.com>
References: <20210611113642.18457-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable DMA Controller for RZ/G2L SoC's in the defconfig.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 756fb464b107..91eb7e7fa654 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -925,6 +925,7 @@ CONFIG_QCOM_BAM_DMA=y
 CONFIG_QCOM_HIDMA_MGMT=y
 CONFIG_QCOM_HIDMA=y
 CONFIG_RCAR_DMAC=y
+CONFIG_RZ_DMAC=y
 CONFIG_RENESAS_USB_DMAC=m
 CONFIG_TI_K3_UDMA=y
 CONFIG_TI_K3_UDMA_GLUE_LAYER=y
-- 
2.17.1

