Return-Path: <SRS0=2iH4=WY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF78C3A5A7
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 28 Aug 2019 11:58:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0FED82173E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 28 Aug 2019 11:58:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfH1L6r (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 28 Aug 2019 07:58:47 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:50262 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbfH1L6r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 07:58:47 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id ubyi2000Q05gfCL01byipq; Wed, 28 Aug 2019 13:58:45 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i2wb4-0008As-Bf; Wed, 28 Aug 2019 13:58:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i2wFQ-0001kb-9n; Wed, 28 Aug 2019 13:36:20 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/7] soc: renesas: r8a7796-sysc: Fix power request conflicts
Date:   Wed, 28 Aug 2019 13:36:14 +0200
Message-Id: <20190828113618.6672-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828113618.6672-1-geert+renesas@glider.be>
References: <20190828113618.6672-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the location and contents of the SYSCEXTMASK register on R-Car
M3-W, to prevent conflicts between internal and external power requests.

This register does not exist on R-Car M3-W ES1.x.

Based on a patch in the BSP by Dien Pham <dien.pham.ry@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/soc/renesas/r8a7796-sysc.c | 22 +++++++++++++++++++++-
 drivers/soc/renesas/rcar-sysc.h    |  2 +-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/renesas/r8a7796-sysc.c b/drivers/soc/renesas/r8a7796-sysc.c
index 1b06f868b6e81c79..a4eaa8d1f5d0f49d 100644
--- a/drivers/soc/renesas/r8a7796-sysc.c
+++ b/drivers/soc/renesas/r8a7796-sysc.c
@@ -5,8 +5,10 @@
  * Copyright (C) 2016 Glider bvba
  */
 
+#include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/kernel.h>
+#include <linux/sys_soc.h>
 
 #include <dt-bindings/power/r8a7796-sysc.h>
 
@@ -39,7 +41,25 @@ static const struct rcar_sysc_area r8a7796_areas[] __initconst = {
 	{ "a3ir",	0x180, 0, R8A7796_PD_A3IR,	R8A7796_PD_ALWAYS_ON },
 };
 
-const struct rcar_sysc_info r8a7796_sysc_info __initconst = {
+
+/* Fixups for R-Car M3-W ES1.x revision */
+static const struct soc_device_attribute r8a7796es1[] __initconst = {
+	{ .soc_id = "r8a7796", .revision = "ES1.*" },
+	{ /* sentinel */ }
+};
+
+static int __init r8a7796_sysc_init(void)
+{
+	if (soc_device_match(r8a7796es1))
+		r8a7796_sysc_info.extmask_val = 0;
+
+	return 0;
+}
+
+struct rcar_sysc_info r8a7796_sysc_info __initdata = {
+	.init = r8a7796_sysc_init,
 	.areas = r8a7796_areas,
 	.num_areas = ARRAY_SIZE(r8a7796_areas),
+	.extmask_offs = 0x2f8,
+	.extmask_val = BIT(0),
 };
diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index 499797a9e18c2f10..64c2a0fa7945d80b 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -60,7 +60,7 @@ extern const struct rcar_sysc_info r8a7791_sysc_info;
 extern const struct rcar_sysc_info r8a7792_sysc_info;
 extern const struct rcar_sysc_info r8a7794_sysc_info;
 extern struct rcar_sysc_info r8a7795_sysc_info;
-extern const struct rcar_sysc_info r8a7796_sysc_info;
+extern struct rcar_sysc_info r8a7796_sysc_info;
 extern const struct rcar_sysc_info r8a77965_sysc_info;
 extern const struct rcar_sysc_info r8a77970_sysc_info;
 extern const struct rcar_sysc_info r8a77980_sysc_info;
-- 
2.17.1

