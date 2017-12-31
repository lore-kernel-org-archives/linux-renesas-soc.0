Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:41568 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751013AbdLaSow (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Dec 2017 13:44:52 -0500
Received: by mail-lf0-f66.google.com with SMTP id h137so8172655lfe.8
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Dec 2017 10:44:51 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20171231184448.233694839@cogentembedded.com>
Date: Sun, 31 Dec 2017 21:41:36 +0300
To: netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org ("open list:RENESAS ETHERNET DRIVERS")
Subject: [PATCH 2/2] sh_eth: kill redundant check in the probe() method
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=sh_eth-kill-redundant-check-in-the-probe-method.patch
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Browsing thru the driver diassembly, I noticed that gcc was  able to
figure  out  that the 'ndev' pointer is always non-NULL when calling
free_netdev()  on the probe() method's  error path and  thus skip that
redundant NULL check... gcc is smart, be like gcc! :-)

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -3282,8 +3282,7 @@ out_napi_del:
 
 out_release:
 	/* net_dev free */
-	if (ndev)
-		free_netdev(ndev);
+	free_netdev(ndev);
 
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
