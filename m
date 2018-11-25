Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46220 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbeKZBba (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Nov 2018 20:31:30 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: [PATCH 5/5] [HACK] arm64: dts: r8a77995: draak: Add panel to DT
Date: Sun, 25 Nov 2018 16:40:31 +0200
Message-Id: <20181125144031.4407-6-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20181125144031.4407-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20181125144031.4407-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index cd067319e6f3..140519e39f06 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -487,3 +487,14 @@
 		};
 	};
 };
+
+#define lvds_connector lvds1_out
+#include "../../../../arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi"
+
+&lvds1 {
+	status = "okay";
+};
+
+&{/panel/} {
+	backlight = <&backlight>;
+};
-- 
Regards,

Laurent Pinchart
