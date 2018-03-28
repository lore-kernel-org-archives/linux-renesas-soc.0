Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:36548 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752738AbeC1TaT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Mar 2018 15:30:19 -0400
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
Subject: [PATCH v2 8/8] ARM: multi_v7_defconfig: Enable r8a77470 SoC
Date: Wed, 28 Mar 2018 20:26:16 +0100
Message-Id: <1522265176-33226-9-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1522265176-33226-1-git-send-email-biju.das@bp.renesas.com>
References: <1522265176-33226-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable recently added r8a77470 (RZ/G1C) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
V1->V2:
* Incorporated Fabrizio's comment

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index da73876..388af57 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -89,6 +89,7 @@ CONFIG_ARCH_R8A73A4=y
 CONFIG_ARCH_R8A7740=y
 CONFIG_ARCH_R8A7743=y
 CONFIG_ARCH_R8A7745=y
+CONFIG_ARCH_R8A77470=y
 CONFIG_ARCH_R8A7778=y
 CONFIG_ARCH_R8A7779=y
 CONFIG_ARCH_R8A7790=y
-- 
2.7.4
