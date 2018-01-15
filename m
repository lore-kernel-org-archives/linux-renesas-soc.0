Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38246 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751895AbeAOIlw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 03:41:52 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Bogdan Mirea <Bogdan-Stefan_Mirea@mentor.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/3] arm64: dts: renesas: eagle: Remove renesas, no-ether-link property
Date: Mon, 15 Jan 2018 09:41:24 +0100
Message-Id: <20180115084125.8112-3-horms+renesas@verge.net.au>
In-Reply-To: <20180115084125.8112-1-horms+renesas@verge.net.au>
References: <20180115084125.8112-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Regarding Salvator-X and ULCB boards, Bogdan Mirea says:

    The present change is a bug fix for AVB link iteratively up/down.

    Steps to reproduce:
    - start AVB TX stream (Using aplay via MSE),
    - disconnect+reconnect the eth cable,
    - after a reconnection the eth connection goes iteratively up/down
      without user interaction,
    - this may heal after some seconds or even stay for minutes.

    As the documentation specifies, the "renesas,no-ether-link" option
    should be used when a board does not provide a proper AVB_LINK signal.
    There is no need for this option enabled on RCAR H3/M3 Salvator-X/XS
    and ULCB starter kits since the AVB_LINK is correctly handled by HW.

    Choosing to keep or remove the "renesas,no-ether-link" option will
    have impact on the code flow in the following ways:
    - keeping this option enabled may lead to unexpected behavior since
      the RX & TX are enabled/disabled directly from adjust_link function
      without any HW interrogation,
    - removing this option, the RX & TX will only be enabled/disabled after
      HW interrogation. The HW check is made through the LMON pin in PSR
      register which specifies AVB_LINK signal value (0 - at low level;
      1 - at high level).

    In conclusion, the present change is also a safety improvement because
    it removes the "renesas,no-ether-link" option leading to a proper way
    of detecting the link state based on HW interrogation and not on
    software heuristic.

On examination of the documentation for the Eagle board this change seems
necessary as AVB_LINK is documented as being connected.

Fixes: 38525608952a ("arm64: dts: renesas: eagle: add EtherAVB support")
Cc: Bogdan Mirea <Bogdan-Stefan_Mirea@mentor.com>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 8fe5c193e049..83210542db34 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -34,7 +34,6 @@
 };
 
 &avb {
-	renesas,no-ether-link;
 	phy-handle = <&phy0>;
 	status = "okay";
 
-- 
2.11.0
