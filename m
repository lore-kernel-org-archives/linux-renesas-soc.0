Return-Path: <SRS0=HvZV=RK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B6EC10F03
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 10:25:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B59A20675
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 10:25:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="U6iX74ju"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbfCGKZG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Mar 2019 05:25:06 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:48642 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfCGKZG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Mar 2019 05:25:06 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 591D725B7CB;
        Thu,  7 Mar 2019 21:25:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551954304; bh=bLwriT0wanzAuNLOAjjF6vIBqXh1ybo+sTtDeP6cjk4=;
        h=From:To:Cc:Subject:Date:From;
        b=U6iX74jueyJ+AsoYzz0NQfKRDg4zXT4sKJdMHXV7d3X7hpniU0S5Dxal0PL7xyd/Y
         5Mk8ikYbJiina/CvZqSbKl3hKizvdunr7rcn/WQLIDID4MMJHsTAIjZ8Jk4yymVazL
         AO+w12YsjNTT5d+lO3tiTHBGWa20P+X8EP4+eH0E=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 94594942D51; Thu,  7 Mar 2019 11:25:02 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     David Miller <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH net] ravb: Decrease TxFIFO depth of Q3 and Q2 to one
Date:   Thu,  7 Mar 2019 11:24:47 +0100
Message-Id: <20190307102447.1205-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Masaru Nagai <masaru.nagai.vx@renesas.com>

Hardware has the CBS (Credit Based Shaper) which affects only Q3
and Q2. When updating the CBS settings, even if the driver does so
after waiting for Tx DMA finished, there is a possibility that frame
data still remains in TxFIFO.

To avoid this, decrease TxFIFO depth of Q3 and Q2 to one.

This patch has been exercised this using netperf TCP_MAERTS, TCP_STREAM
and UDP_STREAM tests run on an Ebisu board. No performance change was
detected, outside of noise in the tests, both in terms of throughput and
CPU utilisation.

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Signed-off-by: Masaru Nagai <masaru.nagai.vx@renesas.com>
Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
[simon: updated changelog]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/net/ethernet/renesas/ravb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index d28c8f9ca55b..8154b38c08f7 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -458,7 +458,7 @@ static int ravb_dmac_init(struct net_device *ndev)
 		   RCR_EFFS | RCR_ENCF | RCR_ETS0 | RCR_ESF | 0x18000000, RCR);
 
 	/* Set FIFO size */
-	ravb_write(ndev, TGC_TQP_AVBMODE1 | 0x00222200, TGC);
+	ravb_write(ndev, TGC_TQP_AVBMODE1 | 0x00112200, TGC);
 
 	/* Timestamp enable */
 	ravb_write(ndev, TCCR_TFEN, TCCR);
-- 
2.11.0

