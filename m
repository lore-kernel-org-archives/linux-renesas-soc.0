Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:47427 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726577AbeHMK2s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Aug 2018 06:28:48 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Arnd Bergmann <arnd@arndb.de>,
        Andy Gross <andy.gross@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Heiko Stuebner <heiko@sntech.de>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Alex Elder <elder@linaro.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Olof Johansson <olof@lixom.net>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: defconfig: enable R8A774A1 SoC
Date: Mon, 13 Aug 2018 08:41:33 +0100
Message-Id: <1534146093-1651-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1534146093-1651-1-git-send-email-biju.das@bp.renesas.com>
References: <1534146093-1651-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the Renesas RZ/G2M (R8A774A1) SoC in the ARM64 defconfig.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4327f62..1c953ff 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -49,6 +49,7 @@ CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_SEATTLE=y
 CONFIG_ARCH_SYNQUACER=y
 CONFIG_ARCH_RENESAS=y
+CONFIG_ARCH_R8A774A1=y
 CONFIG_ARCH_R8A7795=y
 CONFIG_ARCH_R8A7796=y
 CONFIG_ARCH_R8A77965=y
-- 
2.7.4
