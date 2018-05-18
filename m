Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:48316 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751413AbeERLGx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:06:53 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-sh@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] media: arch: sh: migor: Remove calls to empty arch_setup_pdev_archdata()
Date: Fri, 18 May 2018 13:06:51 +0200
Message-Id: <1526641611-2769-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1526641611-2769-1-git-send-email-geert+renesas@glider.be>
References: <1526641611-2769-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SuperH doesn't implement arch_setup_pdev_archdata(), and falls back to
the default (empty) implementation.  As this code is board-specific, the
call can just be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/sh/boards/mach-migor/setup.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sh/boards/mach-migor/setup.c b/arch/sh/boards/mach-migor/setup.c
index 271dfc260e8281f6..8cc09f3d03689e0d 100644
--- a/arch/sh/boards/mach-migor/setup.c
+++ b/arch/sh/boards/mach-migor/setup.c
@@ -603,7 +603,6 @@ static int __init migor_devices_setup(void)
 
 	/* Initialize CEU platform device separately to map memory first */
 	device_initialize(&migor_ceu_device.dev);
-	arch_setup_pdev_archdata(&migor_ceu_device);
 	dma_declare_coherent_memory(&migor_ceu_device.dev,
 				    ceu_dma_membase, ceu_dma_membase,
 				    ceu_dma_membase + CEU_BUFFER_MEMORY_SIZE - 1,
-- 
2.7.4
