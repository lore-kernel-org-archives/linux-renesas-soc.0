Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54381 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965482AbdIZKGN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 06:06:13 -0400
Received: from avalon.guest.par1.mozilla.com (unknown [IPv6:2a00:8c40:243:232:120b:a9ff:fe3c:7148])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 88EA82021B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 12:06:04 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC] [FW] bl2: plat: renesas: rcar: Enable all lossy decompression areas
Date: Tue, 26 Sep 2017 13:05:51 +0300
Message-Id: <20170926100605.2313-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Enable lossy decompression areas 1 and 2 with a memory region of 48MB
each to support the RGB32 and packed YUV formats.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 plat/renesas/rcar/bl2_rcar_setup.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/plat/renesas/rcar/bl2_rcar_setup.c b/plat/renesas/rcar/bl2_rcar_setup.c
index 716ec8aa1c66..5b31bda75039 100755
--- a/plat/renesas/rcar/bl2_rcar_setup.c
+++ b/plat/renesas/rcar/bl2_rcar_setup.c
@@ -277,16 +277,16 @@ struct entry_point_info *bl2_plat_get_bl31_ep_info(void)
 #define	LOSSY_ENA_DIS0			LOSSY_ENABLE
 
 /* Settings of Entry 1 */
-#define	LOSSY_ST_ADDR1			0x0U /* Undefined */
-#define	LOSSY_END_ADDR1			0x0U /* Undefined */
+#define	LOSSY_ST_ADDR1			(0x57000000U)
+#define	LOSSY_END_ADDR1			(0x5a000000U)
 #define	LOSSY_FMT1				LOSSY_FMT_ARGB8888
-#define	LOSSY_ENA_DIS1			LOSSY_DISABLE
+#define	LOSSY_ENA_DIS1			LOSSY_ENABLE
 
 /* Settings of Entry 2 */
-#define	LOSSY_ST_ADDR2			0x0U /* Undefined */
-#define	LOSSY_END_ADDR2			0x0U /* Undefined */
+#define	LOSSY_ST_ADDR2			(0x5a000000U)
+#define	LOSSY_END_ADDR2			(0x5d000000U)
 #define	LOSSY_FMT2				LOSSY_FMT_YUV422INTLV
-#define	LOSSY_ENA_DIS2			LOSSY_DISABLE
+#define	LOSSY_ENA_DIS2			LOSSY_ENABLE
 
 static void bl2_lossy_setting(uint32_t no, uint64_t start_addr, 
 	uint64_t end_addr, uint32_t format, uint32_t enable);
-- 
Regards,

Laurent Pinchart
