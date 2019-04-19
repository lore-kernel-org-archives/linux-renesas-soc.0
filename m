Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF9EC282DA
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7FA3222AF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727394AbfDSSXI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:23:08 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727522AbfDSSXH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:23:07 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0F71625BEE3;
        Sat, 20 Apr 2019 00:34:55 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 2287DE21F33; Fri, 19 Apr 2019 16:34:50 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 21/21] ARM: dts: ape6evm: Reorder bootargs
Date:   Fri, 19 Apr 2019 16:34:48 +0200
Message-Id: <0750e8344eb7c48f82a54920172a5d0f78eb223b.1555655522.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1555655522.git.horms+renesas@verge.net.au>
References: <cover.1555655522.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Reorder bootargs parameters to make the APE6EVM board bootargs match other
boards from Renesas. No need to be special.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a73a4-ape6evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
index b1e0d556be0a..f70f4a3e5c43 100644
--- a/arch/arm/boot/dts/r8a73a4-ape6evm.dts
+++ b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
@@ -19,7 +19,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel root=/dev/nfs ip=dhcp rw";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial0:115200n8";
 	};
 
-- 
2.11.0

