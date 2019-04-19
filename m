Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E5BC282E0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:22:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17814222D9
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:22:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbfDSSWh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:22:37 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727344AbfDSSWg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:22:36 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E4A9C25BEFD;
        Sat, 20 Apr 2019 00:35:11 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id D4E79E21AFA; Fri, 19 Apr 2019 16:35:09 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wen Yang <wen.yang99@zte.com.cn>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/2] ARM: shmobile: fix a leaked reference by adding missing of_node_put
Date:   Fri, 19 Apr 2019 16:35:08 +0200
Message-Id: <115bbc30c6d2d7c8eddf87f88c1b7033522d47d2.1555683298.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1555683298.git.horms+renesas@verge.net.au>
References: <cover.1555683298.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Wen Yang <wen.yang99@zte.com.cn>

The call to of_get_next_child returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
./arch/arm/mach-shmobile/pm-rcar-gen2.c:77:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 66, but without a corresponding object release within this function.
./arch/arm/mach-shmobile/pm-rcar-gen2.c:85:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 66, but without a corresponding object release within this function.
./arch/arm/mach-shmobile/pm-rcar-gen2.c:90:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 66, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/pm-rcar-gen2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-shmobile/pm-rcar-gen2.c b/arch/arm/mach-shmobile/pm-rcar-gen2.c
index 8c2a20591524..e84599dd96f1 100644
--- a/arch/arm/mach-shmobile/pm-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/pm-rcar-gen2.c
@@ -72,6 +72,7 @@ void __init rcar_gen2_pm_init(void)
 	}
 
 	error = of_address_to_resource(np, 0, &res);
+	of_node_put(np);
 	if (error) {
 		pr_err("Failed to get smp-sram address: %d\n", error);
 		return;
-- 
2.11.0

