Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1B0C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 07:55:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B6EB217D4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 07:55:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbfDKHzO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 03:55:14 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:50216 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbfDKHzO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 03:55:14 -0400
Received: from fsav108.sakura.ne.jp (fsav108.sakura.ne.jp [27.133.134.235])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x3B7t3xo039504;
        Thu, 11 Apr 2019 16:55:03 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav108.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav108.sakura.ne.jp);
 Thu, 11 Apr 2019 16:55:03 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav108.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x3B7t0PT037864
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 11 Apr 2019 16:55:02 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
From:   Cao Van Dong <cv-dong@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, horms+renesas@verge.net.au,
        devicetree@vger.kernel.org, biju.das@bp.renesas.com
Cc:     yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: [PATCH v2 13/20] ARM: dts: r8a77470: Add can clocks
Date:   Thu, 11 Apr 2019 16:54:15 +0900
Message-Id: <1554969262-15028-14-git-send-email-cv-dong@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add can_clk node to dtsi for can support on the RZ/G1C (r8a77470) SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 arch/arm/boot/dts/r8a77470.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index fcf8dd0..8a6bff9 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -48,6 +48,14 @@
 		clock-frequency = <0>;
 	};
 
+	/* External CAN clock */
+	can_clk: can {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.7.4

