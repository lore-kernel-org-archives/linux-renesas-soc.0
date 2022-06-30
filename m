Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D57C433EF
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 30 Jun 2022 01:32:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbiF3BcM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 21:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231325AbiF3BcG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 21:32:06 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F83340CA;
        Wed, 29 Jun 2022 18:32:05 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LYLNS3gdwz1L8kC;
        Thu, 30 Jun 2022 09:29:44 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 30 Jun 2022 09:32:01 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 30 Jun
 2022 09:32:01 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
CC:     <clement.leger@bootlin.com>, <olteanv@gmail.com>,
        <f.fainelli@gmail.com>, <davem@davemloft.net>
Subject: [PATCH -next v2] net: dsa: rzn1-a5psw: add missing of_node_put() in a5psw_pcs_get()
Date:   Thu, 30 Jun 2022 09:41:53 +0800
Message-ID: <20220630014153.1888811-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

of_parse_phandle() will increase the refcount of 'pcs_node', so add
of_node_put() before return from a5psw_pcs_get().

Fixes: 888cdb892b61 ("net: dsa: rzn1-a5psw: add Renesas RZ/N1 advanced 5 port switch driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v2:
  call of_node_put() after miic_create()
---
 drivers/net/dsa/rzn1_a5psw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 3e910da98ae2..dece613ee881 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -917,12 +917,14 @@ static int a5psw_pcs_get(struct a5psw *a5psw)
 		}
 
 		a5psw->pcs[reg] = pcs;
+		of_node_put(pcs_node);
 	}
 	of_node_put(ports);
 
 	return 0;
 
 free_pcs:
+	of_node_put(pcs_node);
 	of_node_put(port);
 	of_node_put(ports);
 	a5psw_pcs_free(a5psw);
-- 
2.25.1

