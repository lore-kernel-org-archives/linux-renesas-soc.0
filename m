Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52154 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932513AbdHVOW6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2017 10:22:58 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH] arm64: dts: ulcb: Enable display output
Date: Tue, 22 Aug 2017 17:23:26 +0300
Message-Id: <20170822142326.9652-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The DU is already wired up to the HDMI encoder, all we need to do is
enable it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

This patch has been tested on the M3-W ULCB in Magnus' board farm. As no
display is connected to the HDMI output testing was limited, to probing the
device and verifying that it can be accessed from userspace.

Tests on the H3 ES1.1 and H3 ES2.0 ULCBs were less successful as I couldn't
get the boards to boot properly, but they failed without this patch as well,
so I don't think it should be a blocker.

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 1b868df2393f..dfec9072718b 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -157,6 +157,10 @@
 	};
 };
 
+&du {
+	status = "okay";
+};
+
 &ehci1 {
 	status = "okay";
 };
-- 
Regards,

Laurent Pinchart
