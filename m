Return-Path: <SRS0=6t/Y=UU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67365C43613
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 21 Jun 2019 09:17:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A406208C3
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 21 Jun 2019 09:17:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfFUJRU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 21 Jun 2019 05:17:20 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34780 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJRU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:17:20 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 153B825AEE7;
        Fri, 21 Jun 2019 19:16:39 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 83083942C3C; Fri, 21 Jun 2019 11:16:33 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 18/53] arm64: dts: renesas: ebisu: Remove renesas, no-ether-link property
Date:   Fri, 21 Jun 2019 11:15:56 +0200
Message-Id: <90d4fa39d028f2e46c57c3d0e1b759e5287d98b7.1561107232.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107232.git.horms+renesas@verge.net.au>
References: <cover.1561107232.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

It is incorrect to specify the no-ether-link property for the AVB device on
the Ebisu board. This is because the property should only be used when a
board does not provide a proper AVB_LINK signal. However, the Ebisu board
does provide this signal.

As per 87c059e9c39d ("arm64: dts: renesas: salvator-x: Remove renesas,
no-ether-link property") this fixes a bug:

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

    Choosing to keep or remove the "renesas,no-ether-link" option will have
    impact on the code flow in the following ways:
    - keeping this option enabled may lead to unexpected behavior since the
      RX & TX are enabled/disabled directly from adjust_link function
      without any HW interrogation,
    - removing this option, the RX & TX will only be enabled/disabled after
      HW interrogation. The HW check is made through the LMON pin in PSR
      register which specifies AVB_LINK signal value (0 - at low level;
      1 - at high level).

    In conclusion, the present change is also a safety improvement because
    it removes the "renesas,no-ether-link" option leading to a proper way
    of detecting the link state based on HW interrogation and not on
    software heuristic.

Fixes: 8441ef643d7d ("arm64: dts: renesas: r8a77990: ebisu: Enable EthernetAVB")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[simon: updated changelog]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 4b3449319c81..83fc13ac3fa1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -262,7 +262,6 @@
 &avb {
 	pinctrl-0 = <&avb_pins>;
 	pinctrl-names = "default";
-	renesas,no-ether-link;
 	phy-handle = <&phy0>;
 	status = "okay";
 
-- 
2.11.0

