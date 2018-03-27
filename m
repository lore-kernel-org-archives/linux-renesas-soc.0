Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:61409 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752210AbeC0Olt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Mar 2018 10:41:49 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Tony Lindgren <tony@atomide.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Borislav Petkov <bp@suse.de>,
        linux-arm-kernel@lists.infradead.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH  12/12] ARM: multi_v7_defconfig: Enable r8a77470 SoC
Date: Tue, 27 Mar 2018 15:37:23 +0100
Message-Id: <1522161443-54428-13-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
References: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable recently added r8a77470 (RZ/G1C) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c1e045a..3623900 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -90,6 +90,7 @@ CONFIG_ARCH_R8A73A4=y
 CONFIG_ARCH_R8A7740=y
 CONFIG_ARCH_R8A7743=y
 CONFIG_ARCH_R8A7745=y
+CONFIG_ARCH_R8A7747=y
 CONFIG_ARCH_R8A7778=y
 CONFIG_ARCH_R8A7779=y
 CONFIG_ARCH_R8A7790=y
-- 
2.7.4
