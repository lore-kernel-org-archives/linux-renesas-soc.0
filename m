Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39536 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752694AbcEWB2h (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 22 May 2016 21:28:37 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 3/3] arm64: defconfig: enable Renesas R8A7796 SoC
Date: Mon, 23 May 2016 10:28:26 +0900
Message-Id: <1463966906-15129-4-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1463966906-15129-1-git-send-email-horms+renesas@verge.net.au>
References: <1463966906-15129-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch enables the Renesas R8A7796 SoC in the arm64 defconfig.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2 [Simon Horman]
* Added Acked-by tag from Geert Uytterhoeven
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f70505186820..0d37fa5a59aa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -44,6 +44,7 @@ CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_SEATTLE=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_R8A7795=y
+CONFIG_ARCH_R8A7796=y
 CONFIG_ARCH_STRATIX10=y
 CONFIG_ARCH_TEGRA=y
 CONFIG_ARCH_SPRD=y
-- 
2.1.4
