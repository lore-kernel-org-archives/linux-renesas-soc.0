Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:55334 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751204AbeDRO6W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 10:58:22 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: r8a77995-sysc: Cleanups
Date: Wed, 18 Apr 2018 16:58:18 +0200
Message-Id: <1524063498-2752-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Minor cleanup of artefacts caused by deriving from r8a7795-sysc.c:
  - Remove unused inclusion of <linux/sys_soc.h>,
  - Make r8a77995_areas[] const.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/r8a77995-sysc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/renesas/r8a77995-sysc.c b/drivers/soc/renesas/r8a77995-sysc.c
index f718429cab02393d..1b2ef415bbe1cbf7 100644
--- a/drivers/soc/renesas/r8a77995-sysc.c
+++ b/drivers/soc/renesas/r8a77995-sysc.c
@@ -10,13 +10,12 @@
 
 #include <linux/bug.h>
 #include <linux/kernel.h>
-#include <linux/sys_soc.h>
 
 #include <dt-bindings/power/r8a77995-sysc.h>
 
 #include "rcar-sysc.h"
 
-static struct rcar_sysc_area r8a77995_areas[] __initdata = {
+static const struct rcar_sysc_area r8a77995_areas[] __initconst = {
 	{ "always-on",     0, 0, R8A77995_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
 	{ "ca53-scu",  0x140, 0, R8A77995_PD_CA53_SCU,  R8A77995_PD_ALWAYS_ON,
 	  PD_SCU },
-- 
2.7.4
