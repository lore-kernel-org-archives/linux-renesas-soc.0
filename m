Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:53855 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726866AbeILS5h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Sep 2018 14:57:37 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Andy Gross <andy.gross@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Heiko Stuebner <heiko@sntech.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: defconfig: enable R8A774C0 SoC
Date: Wed, 12 Sep 2018 14:52:50 +0100
Message-Id: <1536760371-17300-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the Renesas RZ/G2E (R8A774C0) SoC in the ARM64 defconfig.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
This patch applies on top of next-20180912

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 47d7665..a8bce1b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -51,6 +51,7 @@ CONFIG_ARCH_SEATTLE=y
 CONFIG_ARCH_SYNQUACER=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_R8A774A1=y
+CONFIG_ARCH_R8A774C0=y
 CONFIG_ARCH_R8A7795=y
 CONFIG_ARCH_R8A7796=y
 CONFIG_ARCH_R8A77965=y
-- 
2.7.4
