Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:40298 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726866AbeILS5j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Sep 2018 14:57:39 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] arm64: renesas_defconfig: enable R8A774C0 SoC
Date: Wed, 12 Sep 2018 14:52:51 +0100
Message-Id: <1536760371-17300-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1536760371-17300-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1536760371-17300-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the Renesas RZ/G2E (R8A774C0) SoC in the ARM64 Renesas
defconfig.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
This patch applies on top of renesas-drivers-2018-09-11-v4.19-rc3

 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 929e18c..6fa30af 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -30,6 +30,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_R8A774A1=y
+CONFIG_ARCH_R8A774C0=y
 CONFIG_ARCH_R8A7795=y
 CONFIG_ARCH_R8A7796=y
 CONFIG_ARCH_R8A77965=y
-- 
2.7.4
