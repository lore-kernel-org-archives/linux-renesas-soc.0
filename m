Return-Path: <SRS0=/r1Q=SH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A8DC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 08:21:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 20F1121738
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 08:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729728AbfDEIVR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 5 Apr 2019 04:21:17 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:41419 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726594AbfDEIVR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Apr 2019 04:21:17 -0400
X-IronPort-AV: E=Sophos;i="5.60,310,1549897200"; 
   d="scan'208";a="12362244"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Apr 2019 17:21:15 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D1B0B42F7B91;
        Fri,  5 Apr 2019 17:21:13 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] arm64: renesas_defconfig: Enable REALTEK_PHY config option
Date:   Fri,  5 Apr 2019 09:14:46 +0100
Message-Id: <1554452086-51303-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for Realtek phy, which is used by RZ/G2E (r8a774c0) based
Silicon Linux CAT874 board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 8a83012..0a17854 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -111,6 +111,7 @@ CONFIG_VIRTIO_NET=y
 CONFIG_RAVB=y
 CONFIG_MDIO_BUS_MUX_MMIOREG=y
 CONFIG_MICREL_PHY=y
+CONFIG_REALTEK_PHY=y
 # CONFIG_WLAN is not set
 CONFIG_INPUT_MATRIXKMAP=y
 CONFIG_INPUT_EVDEV=y
-- 
2.7.4

