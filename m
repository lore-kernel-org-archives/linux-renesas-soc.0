Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69F1C282CB
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADAD820863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="cbPuqAtI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbfBHLNm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:13:42 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46205 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfBHLNk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:13:40 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CFF3A25BEEB;
        Fri,  8 Feb 2019 22:13:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624407; bh=LXqCs4gHIThNGCSk0zwAk1s+XnKTUDKAw5NrXWT5taI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cbPuqAtIDUug4r6YK6XE6YoAAl/9AC3AxUxIaQE3Da/ketFCTF+YheHmV22ZvjJhN
         PHg2L6/kHKcGbBwlzAv/njkUUD4MhaMYTbwYZIE5sXSj2M04nkR2PQaW9doNKl6gNz
         Qyho6mk5yMZP+FBTh+yD03WTVNPq9PzJXB/88I/8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 5C7FD940A91; Fri,  8 Feb 2019 12:13:23 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 11/12] arm64: dts: renesas: r8a774c0-cat874: Add pciec0 support
Date:   Fri,  8 Feb 2019 12:13:20 +0100
Message-Id: <aaf6c75c0458122600a20db9d41a0350f0a8dff8.1549623801.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549623801.git.horms+renesas@verge.net.au>
References: <cover.1549623801.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

Silicon Linux CAT 874 board has 2GB DDR memory. Update the dma-ranges
mapping for pciec0 node. Also declare pcie bus clock, since it is
generated on the CAT874 main board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 477a56b3273c..96ee0d2c6357 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -56,6 +56,15 @@
 	clock-frequency = <48000000>;
 };
 
+&pcie_bus_clk {
+	clock-frequency = <100000000>;
+};
+
+&pciec0 {
+	/* Map all possible DDR as inbound ranges */
+	dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+};
+
 &pfc {
 	scif2_pins: scif2 {
 		groups = "scif2_data_a";
-- 
2.11.0

