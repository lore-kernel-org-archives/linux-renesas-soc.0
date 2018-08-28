Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:40989 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbeH1FmK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 01:42:10 -0400
From: Rob Herring <robh@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: shmobile: Convert to using %pOFn instead of device_node.name
Date: Mon, 27 Aug 2018 20:52:03 -0500
Message-Id: <20180828015252.28511-2-robh@kernel.org>
In-Reply-To: <20180828015252.28511-1-robh@kernel.org>
References: <20180828015252.28511-1-robh@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

In preparation to remove the node name pointer from struct device_node,
convert printf users to use the %pOFn format specifier.

Cc: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
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
2.17.1
