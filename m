Return-Path: <SRS0=vAcw=UQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5EAC31E54
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Jun 2019 08:37:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3136821874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Jun 2019 08:37:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbfFQIh3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Jun 2019 04:37:29 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:35016 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfFQIh2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 04:37:28 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8132425B7A8;
        Mon, 17 Jun 2019 18:37:23 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 81CCF940341; Mon, 17 Jun 2019 10:37:21 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 2/2] arm64: dts: renesas: r8a77995: Add cpg reset for LVDS Interface
Date:   Mon, 17 Jun 2019 10:37:04 +0200
Message-Id: <20190617083704.3941-3-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190617083704.3941-1-horms+renesas@verge.net.au>
References: <20190617083704.3941-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Yoshihiro Kaneko <ykaneko0929@gmail.com>

It is necessary to reset the LVDS Interface according to display on/off.
Therefore, this patch adds CPG reset properties in DU device node
for the R8A77995 SoC.

This patch was inspired by a patch in the BSP by Takeshi Kihara
<takeshi.kihara.df@renesas.com>.

According to Laurent Pinchart, R-Car Gen3 reset is handled at the group
level so specifying one reset entry per group is sufficient. For
this reason <&cpg 724> is not listed as a reset for "du.1" as
was the case in an earlier revision of this patch.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v2 [Simon Horman]
- only add one reset entry per group

v1 [Yoshihiro Kaneko]
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 0a344eb55094..ca6aeabd6d04 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1001,6 +1001,8 @@
 			clocks = <&cpg CPG_MOD 724>,
 				 <&cpg CPG_MOD 723>;
 			clock-names = "du.0", "du.1";
+			resets = <&cpg 724>;
+			reset-names = "du.0";
 			vsps = <&vspd0 0 &vspd1 0>;
 			status = "disabled";
 
-- 
2.11.0

