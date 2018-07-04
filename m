Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:52362 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932864AbeGDLni (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jul 2018 07:43:38 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/5] ARM: shmobile: defconfig: Drop NET_VENDOR_<FOO>=n
Date: Wed,  4 Jul 2018 13:43:29 +0200
Message-Id: <20180704114333.27584-2-geert+renesas@glider.be>
In-Reply-To: <20180704114333.27584-1-geert+renesas@glider.be>
References: <20180704114333.27584-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enabling NET_VENDOR_* Kconfig options does not directly affect the
kernel, so there is no need to explicitly disable them.
The individual network drivers under them are still disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/configs/shmobile_defconfig | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 4d0d5a00a18854f0..393697a54fb40e08 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -73,22 +73,9 @@ CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 CONFIG_SATA_RCAR=y
 CONFIG_NETDEVICES=y
-# CONFIG_NET_VENDOR_ARC is not set
-# CONFIG_NET_CADENCE is not set
-# CONFIG_NET_VENDOR_BROADCOM is not set
-# CONFIG_NET_VENDOR_CIRRUS is not set
-# CONFIG_NET_VENDOR_FARADAY is not set
-# CONFIG_NET_VENDOR_INTEL is not set
-# CONFIG_NET_VENDOR_MARVELL is not set
-# CONFIG_NET_VENDOR_MICREL is not set
-# CONFIG_NET_VENDOR_NATSEMI is not set
 CONFIG_SH_ETH=y
 CONFIG_RAVB=y
-# CONFIG_NET_VENDOR_SEEQ is not set
 CONFIG_SMSC911X=y
-# CONFIG_NET_VENDOR_STMICRO is not set
-# CONFIG_NET_VENDOR_VIA is not set
-# CONFIG_NET_VENDOR_WIZNET is not set
 CONFIG_MICREL_PHY=y
 CONFIG_SMSC_PHY=y
 CONFIG_INPUT_EVDEV=y
-- 
2.17.1
