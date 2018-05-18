Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:42242 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751540AbeERLGx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:06:53 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-sh@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] media: arch: sh: ecovec: Remove calls to empty arch_setup_pdev_archdata()
Date: Fri, 18 May 2018 13:06:50 +0200
Message-Id: <1526641611-2769-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1526641611-2769-1-git-send-email-geert+renesas@glider.be>
References: <1526641611-2769-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SuperH doesn't implement arch_setup_pdev_archdata(), and falls back to
the default (empty) implementation.  As this code is board-specific, the
calls can just be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/sh/boards/mach-ecovec24/setup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index adc61d14172c63b8..dc9708227b0d58e8 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -1396,7 +1396,6 @@ static int __init arch_setup(void)
 
 	/* Initialize CEU platform devices separately to map memory first */
 	device_initialize(&ecovec_ceu_devices[0]->dev);
-	arch_setup_pdev_archdata(ecovec_ceu_devices[0]);
 	dma_declare_coherent_memory(&ecovec_ceu_devices[0]->dev,
 				    ceu0_dma_membase, ceu0_dma_membase,
 				    ceu0_dma_membase +
@@ -1405,7 +1404,6 @@ static int __init arch_setup(void)
 	platform_device_add(ecovec_ceu_devices[0]);
 
 	device_initialize(&ecovec_ceu_devices[1]->dev);
-	arch_setup_pdev_archdata(ecovec_ceu_devices[1]);
 	dma_declare_coherent_memory(&ecovec_ceu_devices[1]->dev,
 				    ceu1_dma_membase, ceu1_dma_membase,
 				    ceu1_dma_membase +
-- 
2.7.4
