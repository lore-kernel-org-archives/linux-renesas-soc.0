Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8868C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 12:25:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C13F20652
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 12:25:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Qsih71lG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727393AbfARMZv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 07:25:51 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:58038 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbfARMZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 07:25:51 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id F093B25B77D;
        Fri, 18 Jan 2019 23:25:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547814348; bh=EGL3Fof5c7u2Hk8YvSvu6nzZWxc5ocPI6tNgCREVSXw=;
        h=From:To:Cc:Subject:Date:From;
        b=Qsih71lGwPMkO7I1FfiBfKzznvXTtp9yaCiqEPcXm7ZRkuxlPLfqL39afI2Z/H39N
         Xs5EyGFCo/VmwpZB5XJi0ezu/4gUPaVn11GhORR5rvtwbCCHe2laqxdDRVBD9KgBk5
         ANrZeX6Whh/GCH+HN2+M2GGgg6BGgTt60EKkxTjg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 67E90940356; Fri, 18 Jan 2019 13:25:46 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2] arm64: dts: renesas: r8a77990: ebisu: Enable HS400 of SDHI3
Date:   Fri, 18 Jan 2019 13:25:36 +0100
Message-Id: <20190118122536.20000-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable HS400 of SDHI3 using the corresponding DT property.
No further changes are required.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Tested on top of renesas-devel-20190110-v5.0-rc1
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 89383aa35d65..144c0820cf60 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -695,6 +695,7 @@
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&reg_1p8v>;
 	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
 	bus-width = <8>;
 	non-removable;
 	status = "okay";
-- 
2.11.0

