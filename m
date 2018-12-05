Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:34124 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbeLEPuc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 10:50:32 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC PATCH 7/7] soc: renesas: r8a77990-sysc: Fix power request conflicts
Date: Wed,  5 Dec 2018 16:50:28 +0100
Message-Id: <20181205155028.14335-8-geert+renesas@glider.be>
In-Reply-To: <20181205155028.14335-1-geert+renesas@glider.be>
References: <20181205155028.14335-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe the location and contents of the SYSCEXTMASK register on R-Car
E3, to prevent conflicts between internal and external power requests.

Based on a patch in the BSP by Dien Pham <dien.pham.ry@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/r8a77990-sysc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/renesas/r8a77990-sysc.c b/drivers/soc/renesas/r8a77990-sysc.c
index 664b244eb1dd9d95..1d2432020b7a15d2 100644
--- a/drivers/soc/renesas/r8a77990-sysc.c
+++ b/drivers/soc/renesas/r8a77990-sysc.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2018 Renesas Electronics Corp.
  */
 
+#include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/kernel.h>
 #include <linux/sys_soc.h>
@@ -50,4 +51,6 @@ const struct rcar_sysc_info r8a77990_sysc_info __initconst = {
 	.init = r8a77990_sysc_init,
 	.areas = r8a77990_areas,
 	.num_areas = ARRAY_SIZE(r8a77990_areas),
+	.extmask_offs = 0x2f8,
+	.extmask_val = BIT(0),
 };
-- 
2.17.1
