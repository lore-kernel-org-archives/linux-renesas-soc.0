Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:46856 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728101AbeLEPuc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 10:50:32 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC PATCH 5/7] soc: renesas: r8a77970-sysc: Fix power request conflicts
Date: Wed,  5 Dec 2018 16:50:26 +0100
Message-Id: <20181205155028.14335-6-geert+renesas@glider.be>
In-Reply-To: <20181205155028.14335-1-geert+renesas@glider.be>
References: <20181205155028.14335-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe the location and contents of the SYSCEXTMASK register on R-Car
V3M, to prevent conflicts between internal and external power requests.

Based on a patch in the BSP by Dien Pham <dien.pham.ry@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/r8a77970-sysc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/renesas/r8a77970-sysc.c b/drivers/soc/renesas/r8a77970-sysc.c
index 280c48b80f240424..b3033e3f0fd0b0ff 100644
--- a/drivers/soc/renesas/r8a77970-sysc.c
+++ b/drivers/soc/renesas/r8a77970-sysc.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2017 Cogent Embedded Inc.
  */
 
+#include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/kernel.h>
 
@@ -32,4 +33,6 @@ static const struct rcar_sysc_area r8a77970_areas[] __initconst = {
 const struct rcar_sysc_info r8a77970_sysc_info __initconst = {
 	.areas = r8a77970_areas,
 	.num_areas = ARRAY_SIZE(r8a77970_areas),
+	.extmask_offs = 0x1b0,
+	.extmask_val = BIT(0),
 };
-- 
2.17.1
