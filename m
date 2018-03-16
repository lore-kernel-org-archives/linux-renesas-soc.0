Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753313AbeCPOxV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:53:21 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/3] ARM: shmobile: defconfig: Refresh
Date: Fri, 16 Mar 2018 15:51:50 +0100
Message-Id: <c7b6b600a23473748d5e82e814c6ebbbcf37b006.1521206439.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521206439.git.horms+renesas@verge.net.au>
References: <cover.1521206439.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

- CONFIG_AEABI is enabled since commit 494609701e06a004 ("ARM: always
    enable AEABI for ARMv6+"),
  - CONFIG_SERIAL_SH_SCI_CONSOLE is enabled since commit
    c5bb576d5e21e91a ("tty: serial: sh-sci: Hide serial console config
    question"),
  - CONFIG_SERIAL_SH_SCI_DMA is enabled since commit be7e251d20e6c800
    ("tty: serial: sh-sci: Hide DMA config question").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/shmobile_defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 79b2b7c12264..e3658ec04e83 100644
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
2.11.0
