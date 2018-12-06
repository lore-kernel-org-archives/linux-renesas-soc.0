Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55731 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbeLFV5T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:57:19 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/3] arm64: defconfig: Enable scu-simple-card driver
Date: Thu,  6 Dec 2018 13:57:07 -0800
Message-Id: <595096daf0ac9c1741b6182eb72d636802a21006.1544126077.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544126077.git.horms+renesas@verge.net.au>
References: <cover.1544126077.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the scu-simple-card which is used by
the R-Car E3 (r8a77990) based Ebisu board.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f88190463481..9d0b42d96f03 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -491,6 +491,7 @@ CONFIG_SND_SOC_RT5514=m
 CONFIG_SND_SOC_RT5514_SPI=m
 CONFIG_SND_SOC_RT5645=m
 CONFIG_SND_SIMPLE_CARD=m
+CONFIG_SND_SIMPLE_SCU_CARD=y
 CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_I2C_HID=m
 CONFIG_USB=y
-- 
2.11.0
