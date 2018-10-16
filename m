Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:37368 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbeJPSXX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 14:23:23 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MAINTAINERS: Remove Laurent Pinchart as Renesas pinctrl maintainer
Date: Tue, 16 Oct 2018 13:33:39 +0300
Message-Id: <20181016103339.4942-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Geert Uytterhoeven has long taken over and I'm not involved anymore with
the Renesas pinctrl driver. Remove myself from the maintainers list.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 69373eb328d4..f9d00cc05202 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11515,7 +11515,6 @@ F:	Documentation/devicetree/bindings/pinctrl/qcom,*.txt
 F:	drivers/pinctrl/qcom/
 
 PIN CONTROLLER - RENESAS
-M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	linux-renesas-soc@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc
-- 
Regards,

Laurent Pinchart
