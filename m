Return-Path: <SRS0=vwki=QX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0285C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 23:59:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9457721B69
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 23:59:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfBPX7Q (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 18:59:16 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:57108 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbfBPX7Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 18:59:16 -0500
X-Halon-ID: db9eb8fc-3246-11e9-b530-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id db9eb8fc-3246-11e9-b530-005056917a89;
        Sun, 17 Feb 2019 00:59:12 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Cc:     Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] arm64: dts: r8a77990-ebisu: Fix adv7482 hexadecimal register address
Date:   Sun, 17 Feb 2019 00:58:53 +0100
Message-Id: <20190216235854.15244-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190216235854.15244-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190216235854.15244-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

The register address used for the reg property of the adv7482 node in
other Renesas device trees are decimal not hex, change this for Ebisu to
align it with the others.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[Niklas: rewrite commit message]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 62bdddcbbae7d9e9..23914c2b83965621 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -383,7 +383,7 @@
 		};
 
 		port@a {
-			reg = <0xa>;
+			reg = <10>;
 
 			adv7482_txa: endpoint {
 				clock-lanes = <0>;
-- 
2.20.1

