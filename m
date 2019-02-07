Return-Path: <SRS0=J+Ha=QO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A3EC282C2
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 09:10:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 630B1218B0
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 09:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfBGJKw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Feb 2019 04:10:52 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:38372 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbfBGJKw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Feb 2019 04:10:52 -0500
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id ZlAo1z0073XaVaC06lAoq5; Thu, 07 Feb 2019 10:10:49 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1grfho-0006nD-Cq; Thu, 07 Feb 2019 10:10:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1grfho-0005kN-AN; Thu, 07 Feb 2019 10:10:48 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL] arm64: dts: renesas: r8a774a1: Add required model to dummy board DTS
Date:   Thu,  7 Feb 2019 10:10:47 +0100
Message-Id: <20190207091047.22046-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

make dtbs_check:

    arch/arm64/boot/dts/renesas/r8a774a1-dummy.dt.yaml: 'model' is a required property

Fixes: caf23540a44f1036 ("arm64: dts: renesas: r8a774a1: Add dummy board DTS")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts b/arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts
index dc4418ab8096fc4c..9fe882137271164e 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts
@@ -1,2 +1,6 @@
 /dts-v1/;
 #include "r8a774a1.dtsi"
+
+/ {
+	model = "Dummy RZ/G2M board";
+};
-- 
2.17.1

