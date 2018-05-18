Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbeERLQw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:16:52 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 044/102] arm64: dts: renesas: r8a7796: add HDMI sound support
Date: Fri, 18 May 2018 13:15:06 +0200
Message-Id: <c39f09876275022cd3e0095b9ed0a2875a065a3e.1526637994.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526637994.git.horms+renesas@verge.net.au>
References: <cover.1526637994.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Nguyen Viet Dung <nv-dung@jinso.co.jp>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index f33063dd7cd7..f41bc25b3933 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -2009,6 +2009,10 @@
 				port@1 {
 					reg = <1>;
 				};
+				port@2 {
+					/* HDMI sound */
+					reg = <2>;
+				};
 			};
 		};
 
-- 
2.11.0
