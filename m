Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:54946 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbeJPVPY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 17:15:24 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MAINTAINERS: Add Renesas RZ/A and RZ/N files to Renesas pinctrl section
Date: Tue, 16 Oct 2018 13:56:53 +0200
Message-Id: <20181016115653.12810-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add paths for the Renesas RZ/A and RZ/N series pin controller drivers,
as they are not under sh-pfc/, but still maintained with the other
Renesas pin controller drivers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v4.21.

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 809600de0b7293c8..77ff83bc09464c1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11672,6 +11672,7 @@ M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	linux-renesas-soc@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc
 S:	Maintained
+F:	drivers/pinctrl/pinctrl-rz*
 F:	drivers/pinctrl/sh-pfc/
 
 PIN CONTROLLER - SAMSUNG
-- 
2.17.1
