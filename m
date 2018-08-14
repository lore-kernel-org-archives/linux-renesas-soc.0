Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:9582 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728101AbeHNM5Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Aug 2018 08:57:25 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] arm64: renesas_defconfig: enable R8A774A1 SoC
Date: Tue, 14 Aug 2018 11:04:50 +0100
Message-Id: <1534241090-702-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the Renesas RZ/G2M (R8A774A1) SoC in the ARM64 renesas_defconfig.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 80071d4..e2336fd 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -31,6 +31,7 @@ CONFIG_JUMP_LABEL=y
 CONFIG_BLK_DEV_INTEGRITY=y
 # CONFIG_IOSCHED_DEADLINE is not set
 CONFIG_ARCH_RENESAS=y
+CONFIG_ARCH_R8A774A1=y
 CONFIG_ARCH_R8A7795=y
 CONFIG_ARCH_R8A7796=y
 CONFIG_ARCH_R8A77965=y
-- 
2.7.4
