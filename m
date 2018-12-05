Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:59352 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728133AbeLEPuc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 10:50:32 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC PATCH 4/7] soc: renesas: r8a77965-sysc: Fix power request conflicts
Date: Wed,  5 Dec 2018 16:50:25 +0100
Message-Id: <20181205155028.14335-5-geert+renesas@glider.be>
In-Reply-To: <20181205155028.14335-1-geert+renesas@glider.be>
References: <20181205155028.14335-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe the location and contents of the SYSCEXTMASK register on R-Car
M3-N, to prevent conflicts between internal and external power requests.

Based on a patch in the BSP by Dien Pham <dien.pham.ry@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/r8a77965-sysc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/renesas/r8a77965-sysc.c b/drivers/soc/renesas/r8a77965-sysc.c
index e0533beb50fd7063..b5d8230d4bbc1b87 100644
--- a/drivers/soc/renesas/r8a77965-sysc.c
+++ b/drivers/soc/renesas/r8a77965-sysc.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2016 Glider bvba
  */
 
+#include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/kernel.h>
 
@@ -33,4 +34,6 @@ static const struct rcar_sysc_area r8a77965_areas[] __initconst = {
 const struct rcar_sysc_info r8a77965_sysc_info __initconst = {
 	.areas = r8a77965_areas,
 	.num_areas = ARRAY_SIZE(r8a77965_areas),
+	.extmask_offs = 0x2f8,
+	.extmask_val = BIT(0),
 };
-- 
2.17.1
