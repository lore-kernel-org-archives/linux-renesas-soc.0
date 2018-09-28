Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58179 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729111AbeI1QqB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 12:46:01 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/7] ARM: shmobile: Convert to using %pOFn instead of device_node.name
Date: Fri, 28 Sep 2018 12:22:45 +0200
Message-Id: <b9fad74bfe767aa924d5e329ab3c9a92b20f6b91.1538123953.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1538123953.git.horms+renesas@verge.net.au>
References: <cover.1538123953.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Rob Herring <robh@kernel.org>

In preparation to remove the node name pointer from struct device_node,
convert printf users to use the %pOFn format specifier.

Signed-off-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/pm-rmobile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/pm-rmobile.c b/arch/arm/mach-shmobile/pm-rmobile.c
index e348bcfe389d..9dd6cadcd900 100644
--- a/arch/arm/mach-shmobile/pm-rmobile.c
+++ b/arch/arm/mach-shmobile/pm-rmobile.c
@@ -189,7 +189,7 @@ static void __init add_special_pd(struct device_node *np, enum pd_types type)
 		return;
 	}
 
-	pr_debug("Special PM domain %s type %d for %pOF\n", pd->name, type, np);
+	pr_debug("Special PM domain %pOFn type %d for %pOF\n", pd, type, np);
 
 	special_pds[num_special_pds].pd = pd;
 	special_pds[num_special_pds].type = type;
-- 
2.11.0
