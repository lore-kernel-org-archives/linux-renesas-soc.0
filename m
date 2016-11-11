Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35301 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933831AbcKKRIS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2016 12:08:18 -0500
Received: by mail-wm0-f65.google.com with SMTP id a20so10776156wme.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Nov 2016 09:08:17 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org
Cc: kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org,
        airlied@linux.ie, koji.matsuoka.xm@renesas.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 10/10] dt-bindings: drm/bridge: Add renesas,rcar-dw-hdmi
Date: Fri, 11 Nov 2016 18:07:46 +0100
Message-Id: <1478884066-1090-11-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt b/Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
index 5e9a84d..7db107f 100644
--- a/Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
+++ b/Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
@@ -5,6 +5,7 @@ Required properties:
    * "snps,dw-hdmi-tx"
    * "fsl,imx6q-hdmi"
    * "fsl,imx6dl-hdmi"
+   * "renesas,rcar-dw-hdmi"
    * "rockchip,rk3288-dw-hdmi"
 - reg: Physical base address and length of the controller's registers.
 - interrupts: The HDMI interrupt number
-- 
2.7.4
