Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:48438 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424003AbeCBM1u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Mar 2018 07:27:50 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/2] ARM: shmobile: defconfig: Refresh
Date: Fri,  2 Mar 2018 13:27:45 +0100
Message-Id: <1519993666-11041-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1519993666-11041-1-git-send-email-geert+renesas@glider.be>
References: <1519993666-11041-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

  - CONFIG_AEABI is enabled since commit 494609701e06a004 ("ARM: always
    enable AEABI for ARMv6+"),
  - CONFIG_SERIAL_SH_SCI_CONSOLE is enabled since commit
    c5bb576d5e21e91a ("tty: serial: sh-sci: Hide serial console config
    question"),
  - CONFIG_SERIAL_SH_SCI_DMA is enabled since commit be7e251d20e6c800
    ("tty: serial: sh-sci: Hide DMA config question").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/configs/shmobile_defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 79b2b7c122644033..e3658ec04e837f8a 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -34,7 +34,6 @@ CONFIG_SMP=y
 CONFIG_SCHED_MC=y
 CONFIG_HAVE_ARM_ARCH_TIMER=y
 CONFIG_NR_CPUS=8
-CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
 CONFIG_CMA=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
@@ -105,8 +104,6 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_EM=y
 CONFIG_SERIAL_SH_SCI=y
 CONFIG_SERIAL_SH_SCI_NR_UARTS=20
-CONFIG_SERIAL_SH_SCI_CONSOLE=y
-CONFIG_SERIAL_SH_SCI_DMA=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MUX=y
 CONFIG_I2C_DEMUX_PINCTRL=y
-- 
2.7.4
