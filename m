Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22B2C4320A
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  1 Sep 2021 11:13:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D95F160F92
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  1 Sep 2021 11:13:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241850AbhIALOL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 1 Sep 2021 07:14:11 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:19484 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S241703AbhIALOJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 07:14:09 -0400
X-IronPort-AV: E=Sophos;i="5.84,369,1620658800"; 
   d="scan'208";a="92601869"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2021 20:13:11 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C630044258EC;
        Wed,  1 Sep 2021 20:13:11 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a779a0: Add iommus into sdhi node
Date:   Wed,  1 Sep 2021 20:13:05 +0900
Message-Id: <20210901111305.570206-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901111305.570206-1-yoshihiro.shimoda.uh@renesas.com>
References: <20210901111305.570206-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add iommus into sdhi node.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 4f15661f7317..e2716f1406cb 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -1090,6 +1090,7 @@ mmc0: mmc@ee140000 {
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 			resets = <&cpg 706>;
 			max-frequency = <200000000>;
+			iommus = <&ipmmu_ds0 32>;
 			status = "disabled";
 		};
 
-- 
2.25.1

