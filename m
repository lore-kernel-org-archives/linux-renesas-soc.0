Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54554 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753403AbdFPNaX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 09:30:23 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] arm64: defconfig: enable Simple Sound Card support
Date: Fri, 16 Jun 2017 15:30:01 +0200
Message-Id: <b27866e91efb69d2ae335f130b5c9762272b918e.1497616974.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1497616974.git.horms+renesas@verge.net.au>
References: <cover.1497616974.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

commit 7fa72cca39a0 ("ASoC: rsnd: add HDMI output support")
exchanged Renesas Sound driver's Kconfig selection
from SND_SIMPLE_CARD to SND_SIMPLE_CARD_UTILS, because of this,
defconfig doesn't select SND_SIMPLE_CARD today.
All Renesas platform needs SND_SIMPLE_CARD, Let's select it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ce072859e3b2..1bbac74a0c44 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -369,6 +369,7 @@ CONFIG_SND_BCM2835_SOC_I2S=m
 CONFIG_SND_SOC_RCAR=y
 CONFIG_SND_SOC_SAMSUNG=y
 CONFIG_SND_SOC_AK4613=y
+CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
-- 
2.1.4
