Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:59072 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936229AbdACXGu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jan 2017 18:06:50 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-sh@vger.kernel.org, linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/19] sh: sh3: sh770x: Fix platform data for the IRDA serial port
Date: Wed,  4 Jan 2017 01:06:28 +0200
Message-Id: <20170103230639.19660-9-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170103230639.19660-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170103230639.19660-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Even though most of its registers are 8-bit wide, the IRDA has two
16-bit registers that make it a 16-bit peripheral and not a 8-bit
peripheral with addresses shifted by one. Fix the memory resource size
and the platform data regshift value.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/sh/kernel/cpu/sh3/setup-sh770x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/sh/kernel/cpu/sh3/setup-sh770x.c b/arch/sh/kernel/cpu/sh3/setup-sh770x.c
index e1e54258b822..084a91e6027e 100644
--- a/arch/sh/kernel/cpu/sh3/setup-sh770x.c
+++ b/arch/sh/kernel/cpu/sh3/setup-sh770x.c
@@ -157,11 +157,10 @@ static struct platform_device scif1_device = {
 static struct plat_sci_port scif2_platform_data = {
 	.type		= PORT_IRDA,
 	.ops		= &sh770x_sci_port_ops,
-	.regshift	= 1,
 };
 
 static struct resource scif2_resources[] = {
-	DEFINE_RES_MEM(0xa4000140, 0x10),
+	DEFINE_RES_MEM(0xa4000140, 0x20),
 	DEFINE_RES_IRQ(evt2irq(0x880)),
 };
 
-- 
Regards,

Laurent Pinchart
