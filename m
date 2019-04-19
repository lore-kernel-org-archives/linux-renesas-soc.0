Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998E2C282DA
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:22:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 766A7222AF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:22:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbfDSSW0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:22:26 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbfDSSWW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:22:22 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A608925BEE5;
        Sat, 20 Apr 2019 00:34:55 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 154F3E21F2F; Fri, 19 Apr 2019 16:34:50 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 18/21] ARM: dts: kzm9d: Add rw parameter to bootargs
Date:   Fri, 19 Apr 2019 16:34:45 +0200
Message-Id: <94b42a96dad89da7602828bab481feef70b76ccb.1555655522.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1555655522.git.horms+renesas@verge.net.au>
References: <cover.1555655522.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Add rw as bootargs parameter to make the KZM9D board bootargs match other
boards from Renesas. No need to be special.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/emev2-kzm9d.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/emev2-kzm9d.dts b/arch/arm/boot/dts/emev2-kzm9d.dts
index 1bb8e5c9d029..abfff54d6de5 100644
--- a/arch/arm/boot/dts/emev2-kzm9d.dts
+++ b/arch/arm/boot/dts/emev2-kzm9d.dts
@@ -25,7 +25,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial1:115200n8";
 	};
 
-- 
2.11.0

