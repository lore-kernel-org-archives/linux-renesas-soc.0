Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:38690 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754167AbdGJN20 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2017 09:28:26 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Olof Johansson <olof@lixom.net>,
        Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 7/9] ARM: multi_v7_defconfig: Replace SND_SOC_RSRC_CARD by SND_SIMPLE_SCU_CARD
Date: Mon, 10 Jul 2017 15:28:20 +0200
Message-Id: <1499693302-25120-8-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1499693302-25120-1-git-send-email-geert+renesas@glider.be>
References: <1499693302-25120-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SND_SOC_RSRC_CARD was renamed SND_SIMPLE_SCU_CARD, hence update
multi_v7_defconfig.

Fixes: d12c6216c4a58f9f ("ASoC: rsrc-card: rename rsrc-card to simple-scu-card phase3")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
multi_v7_defconfig is in desperate need of a refresh.

Again, I just replaced the symbols, and ignored any other churn.
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 4d19c1b4b8e7c1e8..7fa1746970ecc531 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -650,7 +650,7 @@ CONFIG_SND_SOC_SMDK_WM8994_PCM=m
 CONFIG_SND_SOC_SNOW=m
 CONFIG_SND_SOC_SH4_FSI=m
 CONFIG_SND_SOC_RCAR=m
-CONFIG_SND_SOC_RSRC_CARD=m
+CONFIG_SND_SIMPLE_SCU_CARD=m
 CONFIG_SND_SUN4I_CODEC=m
 CONFIG_SND_SOC_TEGRA=m
 CONFIG_SND_SOC_TEGRA_RT5640=m
-- 
2.7.4
