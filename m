Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35775 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751403AbdATHvq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 02:51:46 -0500
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] soc: renesas: rcar-sysc:- Prevent resource leake and NULL-pointer error
Date: Fri, 20 Jan 2017 13:10:12 +0530
Message-Id: <1484898012-15234-1-git-send-email-arvind.yadav.cs@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If rcar_sysc_pd_init will fail, Handle ERROR properly.
 -Release memory
 -Unmap I/O memory from kernel address space.

In rcar_sysc_init, If ioremap_nocache will fail. It will return NULL.
Kernel can run into a NULL-pointer dereference.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/soc/renesas/rcar-sysc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 225c35c..17df921 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -349,7 +349,7 @@ static int __init rcar_sysc_pd_init(void)
 	domains = kzalloc(sizeof(*domains), GFP_KERNEL);
 	if (!domains) {
 		error = -ENOMEM;
-		goto out_put;
+		goto out_iounmap;
 	}
 
 	domains->onecell_data.domains = domains->domains;
@@ -380,7 +380,7 @@ static int __init rcar_sysc_pd_init(void)
 		pd = kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
 		if (!pd) {
 			error = -ENOMEM;
-			goto out_put;
+			goto out_kfree;
 		}
 
 		strcpy(pd->name, area->name);
@@ -400,6 +400,10 @@ static int __init rcar_sysc_pd_init(void)
 
 	error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
 
+out_kfree:
+	kfree(domains);
+out_iounmap:
+	iounmap(base);
 out_put:
 	of_node_put(np);
 	return error;
@@ -414,6 +418,8 @@ void __init rcar_sysc_init(phys_addr_t base, u32 syscier)
 		return;
 
 	rcar_sysc_base = ioremap_nocache(base, PAGE_SIZE);
+	if (!rcar_sysc_base)
+		return;
 
 	/*
 	 * Mask all interrupt sources to prevent the CPU from receiving them.
-- 
1.9.1
