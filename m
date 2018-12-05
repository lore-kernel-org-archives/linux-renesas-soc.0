Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:56696 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbeLEPuc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 10:50:32 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC PATCH 6/7] soc: renesas: r8a77980-sysc: Fix power request conflicts
Date: Wed,  5 Dec 2018 16:50:27 +0100
Message-Id: <20181205155028.14335-7-geert+renesas@glider.be>
In-Reply-To: <20181205155028.14335-1-geert+renesas@glider.be>
References: <20181205155028.14335-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe the location and contents of the SYSCEXTMASK register on R-Car
V3H, to prevent conflicts between internal and external power requests.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/r8a77980-sysc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/renesas/r8a77980-sysc.c b/drivers/soc/renesas/r8a77980-sysc.c
index a8dbe55e8ba82d7e..e3b5ee1b3091dee1 100644
--- a/drivers/soc/renesas/r8a77980-sysc.c
+++ b/drivers/soc/renesas/r8a77980-sysc.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2018 Cogent Embedded, Inc.
  */
 
+#include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/kernel.h>
 
@@ -49,4 +50,6 @@ static const struct rcar_sysc_area r8a77980_areas[] __initconst = {
 const struct rcar_sysc_info r8a77980_sysc_info __initconst = {
 	.areas = r8a77980_areas,
 	.num_areas = ARRAY_SIZE(r8a77980_areas),
+	.extmask_offs = 0x138,
+	.extmask_val = BIT(0),
 };
-- 
2.17.1
