Return-Path: <SRS0=0nld=RA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35347C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:36:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F18B22087C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:36:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="d2xyUhNt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbfBYJgK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Feb 2019 04:36:10 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40685 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbfBYJgK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Feb 2019 04:36:10 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5F80C25B784;
        Mon, 25 Feb 2019 20:36:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551087368; bh=ALJB2tj7sNbRzSFus2ba6KPVNVjqfo38M7O/XL1RhHM=;
        h=From:To:Cc:Subject:Date:From;
        b=d2xyUhNtc7s36MlRQ6HFW2Yxm47Ge5P3/zL4szt1sPTWqx0iC7ox5SFEP4C5wpUL+
         BcnPu2kQsI+YO0kr38aqa0hJgGFftLQXnBMhlBK1KSzG/zKEYeyGv4fi6gX5uSIvnt
         GJ1oPvVg/5Jt/KgtggbHNEqkJ/V4bawNRS1I1O9E=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7B03694056F; Mon, 25 Feb 2019 10:36:06 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] arm64: dts: renesas: salvator: add dummy 2nd port to rcar_sound
Date:   Mon, 25 Feb 2019 10:36:04 +0100
Message-Id: <20190225093604.25753-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add dummy 2nd port node to rcar_sound ports node to satisfy dtc
recommendation that #address-cells / #size-cells is only needed.

This addresses the following warning:

arch/arm64/boot/dts/renesas/salvator-common.dtsi:703.8-719.4: Warning (graph_child_address): /soc/sound@ec500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
arch/arm64/boot/dts/renesas/salvator-common.dtsi:703.8-719.4: Warning (graph_child_address): /soc/sound@ec500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

This change should not have any run-time effect.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

---
Build tested against renesas-devel-20190214-v5.0-rc6
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index a225c2457274..20b35991bc17 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -716,6 +716,15 @@
 				capture  = <&ssi1 &src1 &dvc1>;
 			};
 		};
+
+		/* Dummy node to be overriden by board DT
+		 * Satisfies dtc recommendation that
+		 * #address-cells / #size-cells is only needed
+		 * for graph nodes with multiple child nodes.
+		 */
+		rsnd_port1: port@1 {
+			reg = <1>;
+		};
 	};
 };
 
-- 
2.11.0

