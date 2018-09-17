Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:54546 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727858AbeIQUlM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 16:41:12 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Biju Das <biju.das@bp.renesas.com>, Arnd Bergmann <arnd@arndb.de>,
        Stefan Agner <stefan@agner.ch>, Eric Anholt <eric@anholt.net>,
        Simon Horman <horms+renesas@verge.net.au>,
        Tony Lindgren <tony@atomide.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: multi_v7_defconfig: Enable r8a7744 SoC
Date: Mon, 17 Sep 2018 16:06:29 +0100
Message-Id: <1537196790-4775-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1537196790-4775-1-git-send-email-biju.das@bp.renesas.com>
References: <1537196790-4775-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable recently added r8a7744 (RZ/G1N) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index dec755c..2b2cf6a 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -79,6 +79,7 @@ CONFIG_ARCH_R7S72100=y
 CONFIG_ARCH_R8A73A4=y
 CONFIG_ARCH_R8A7740=y
 CONFIG_ARCH_R8A7743=y
+CONFIG_ARCH_R8A7744=y
 CONFIG_ARCH_R8A7745=y
 CONFIG_ARCH_R8A77470=y
 CONFIG_ARCH_R8A7778=y
-- 
2.7.4
