Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yb0-f182.google.com ([209.85.213.182]:34318 "EHLO
        mail-yb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753045AbdGGCJn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jul 2017 22:09:43 -0400
Received: by mail-yb0-f182.google.com with SMTP id e201so6444349ybb.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Jul 2017 19:09:38 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH] arm64: dts: renesas: ulcb: sound clock-frequency needs descending order
Date: Fri,  7 Jul 2017 05:09:33 +0300
Message-Id: <1499393373-11514-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>

It will be used ADG clock initial settings, and will be
sound codec's initial system clock which needs maximum clock frequency.
Thus, descending order is required.

Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index b5c6ee0..d1a3f3b 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -281,7 +281,7 @@
 
 	/* audio_clkout0/1/2/3 */
 	#clock-cells = <1>;
-	clock-frequency = <11289600 12288000>;
+	clock-frequency = <12288000 11289600>;
 
 	status = "okay";
 
-- 
1.9.1
