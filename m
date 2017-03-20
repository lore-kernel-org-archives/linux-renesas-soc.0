Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36673 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753299AbdCTI70 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 04:59:26 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 09/32] arm64: dts: r8a7796: Use rgmii-txid phy-mode for EthernetAVB
Date: Mon, 20 Mar 2017 09:57:20 +0100
Message-Id: <325f39010b431f6a1ece74d69f10dcca2329c08d.1489999913.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1489999913.git.horms+renesas@verge.net.au>
References: <cover.1489999913.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

Since commit 61fccb2d6274 ("ravb: Add tx and rx clock internal delays mode
of APSR") the EthernetAVB driver enables tx and rx clock internal delay
modes (TDM and RDM) depending on the phy mode as follows:

    phy mode   | ASPR delay mode
    -----------+----------------
    rgmii-id   | TDM and RDM
    rgmii-rxid | RDM
    rgmii-txid | TDM

And prior to the above commit no internal delay mode settings were
implemented for any phy mode.

With this and the above change present tx internal delay mode is enabled
which has been observed to address failures in the case of 1Gbps
communication using the by salvator-x board with the KSZ9031RNX phy. This
has been reported to occur with both the r8a7795 (H3) and r8a7796 (M3-W)
SoCs.

With the above patch present but this patch present tx and rx internal
delay modes are enabled; and with the above patch and this present absent
no internal delay modes are enabled. In both cases failures have been
observed when using 1Gbps communication in the environments described
above.

Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index c95ad177b097..1c1c1eae9cba 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -483,7 +483,7 @@
 					  "ch24";
 			clocks = <&cpg CPG_MOD 812>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
-			phy-mode = "rgmii-id";
+			phy-mode = "rgmii-txid";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
-- 
2.7.0.rc3.207.g0ac5344
