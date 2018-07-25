Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:42646 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728474AbeGYMlV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 08:41:21 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
        Eric Auger <eric.auger@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] hw/arm/sysbus-fdt: Fix assertion in copy_properties_from_host()
Date: Wed, 25 Jul 2018 13:30:00 +0200
Message-Id: <20180725113000.11014-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When copy_properties_from_host() ignores the error for an optional
property, it frees the error, but fails to reset it.

Hence if two or more optional properties are missing, an assertion is
triggered:

    util/error.c:57: error_setv: Assertion `*errp == NULL' failed.

Fis this by resetting err to NULL after ignoring the error.

Fixes: 9481cf2e5f2f2bb6 ("hw/arm/sysbus-fdt: helpers for clock node generation")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 hw/arm/sysbus-fdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 0d4c75702c3ddfae..43d6a7bb48ddc351 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -107,6 +107,7 @@ static void copy_properties_from_host(HostProperty *props, int nb_props,
                 /* mandatory property not found: bail out */
                 exit(1);
             }
+            err = NULL;
         }
     }
 }
-- 
2.17.1
