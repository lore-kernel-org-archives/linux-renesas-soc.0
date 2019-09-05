Return-Path: <SRS0=W0u2=XA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960AEC3A5A5
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  5 Sep 2019 09:37:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7445320825
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  5 Sep 2019 09:37:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387519AbfIEJhb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 5 Sep 2019 05:37:31 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:49465 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730872AbfIEJhb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 05:37:31 -0400
X-IronPort-AV: E=Sophos;i="5.64,470,1559487600"; 
   d="scan'208";a="25819834"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Sep 2019 18:37:29 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9A155400C0A5;
        Thu,  5 Sep 2019 18:37:27 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 3/3] arm64: Add Renesas R8A774B1 support
Date:   Thu,  5 Sep 2019 10:30:43 +0100
Message-Id: <1567675844-19247-4-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567675844-19247-1-git-send-email-biju.das@bp.renesas.com>
References: <1567675844-19247-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add configuration option for the RZ/G2N (R8A774B1) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 3c5e017..d6a7df3 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -178,6 +178,12 @@ config ARCH_R8A774A1
 	help
 	  This enables support for the Renesas RZ/G2M SoC.
 
+config ARCH_R8A774B1
+	bool "Renesas RZ/G2N SoC Platform"
+	select ARCH_RCAR_GEN3
+	help
+	  This enables support for the Renesas RZ/G2N SoC.
+
 config ARCH_R8A774C0
 	bool "Renesas RZ/G2E SoC Platform"
 	select ARCH_RCAR_GEN3
-- 
2.7.4

