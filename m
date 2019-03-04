Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE4EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 08:04:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43A26208E4
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 08:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="ZS41g9Fg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfCDIEk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 03:04:40 -0500
Received: from de-deferred2.bosch-org.com ([139.15.180.217]:55012 "EHLO
        de-deferred2.bosch-org.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725997AbfCDIEj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 03:04:39 -0500
X-Greylist: delayed 487 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Mar 2019 03:04:38 EST
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
        by fe0vms0193.rbdmz01.com (Postfix) with ESMTPS id 44CXR23ZWjz2kj;
        Mon,  4 Mar 2019 08:56:30 +0100 (CET)
Received: from si0vm1947.rbesz01.com (unknown [139.15.230.188])
        by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 44CXR02Pzzz1XLFjP;
        Mon,  4 Mar 2019 08:56:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=2015-01-21; t=1551686188;
        bh=NJEzbVtRLgM7qYE9X5B0j8kwymv1uaTDWBadZxvwBis=; l=10;
        h=From:From:Reply-To:Sender;
        b=ZS41g9FgLCOL9iQ4bOcyewKI058uWyegh91psCpFr95yV1urib4rNO4LqGpJomVmZ
         ilMsoS70tmmiYFR9QRNl02qvPwtCSvcL+jvj53/0pdA8lPaKeV0JcHbUYRcQ1uCYJK
         lk5XXfRSI//4kpE0rhEsxlVdnJswLLLnj3XyHG20=
Received: from fe0vm02900.rbesz01.com (unknown [10.58.172.176])
        by si0vm1947.rbesz01.com (Postfix) with ESMTPS id 44CXR01t5rz6CjTc1;
        Mon,  4 Mar 2019 08:56:28 +0100 (CET)
X-AuditID: 0a3aad0c-805ff7000000255a-a4-5c7cda2c538d
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by fe0vm02900.rbesz01.com (SMG Outbound) with SMTP id 6C.9A.09562.C2ADC7C5; Mon,  4 Mar 2019 08:56:28 +0100 (CET)
Received: from FE-HUB2000.de.bosch.com (unknown [10.4.103.109])
        by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 44CXQz6zcQzQ2l;
        Mon,  4 Mar 2019 08:56:27 +0100 (CET)
Received: from HI-Z0EVG.hi.de.bosch.com (10.34.218.219) by
 FE-HUB2000.de.bosch.com (10.4.103.109) with Microsoft SMTP Server id
 15.1.1713.5; Mon, 4 Mar 2019 08:56:19 +0100
From:   Dirk Behme <dirk.behme@de.bosch.com>
To:     <linux-renesas-soc@vger.kernel.org>
CC:     <dmaengine@vger.kernel.org>, <vkoul@kernel.org>,
        <geert+renesas@glider.be>, <niklas.soderlund+renesas@ragnatech.se>,
        <laurent.pinchart+renesas@ideasonboard.com>,
        <Achim.Dahlhoff@de.bosch.com>, <dirk.behme@de.bosch.com>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        <stable@vger.kernel.org>
Subject: [PATCH 1/2] dmaengine: sh: rcar-dmac: With cyclic DMA residue 0 is valid
Date:   Mon, 4 Mar 2019 08:56:09 +0100
Message-ID: <20190304075610.10810-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.34.218.219]
X-Brightmail-Tracker: H4sIAAAAAAAAA22SbUxbZRTHeXrbu0vTi5cLg7MOcF6NJmxgYZpVJURlurpl6pyJBsu0yKWt
        9oXcW3Awog268TLJCrMQKDA0THkTXbsXyge21eDAjLGMiW7pGiUibExi0jGEhem9FNZ+8Nt5
        /uf8zv95/nkIjA6sUxJGi43lLDoTg8ul8me/TU7bcr1cq7o3hat7nMsydaurHqnPXEtX11X4
        pepTN+ck6hsjW9TtJyaR2usfxp4nNHWjaRpXVZNM4+6uxjXT4wu45u7FOqkm6E55Hc+VZxWw
        JmMJyz2Z/Z7c8NXyl3hRS/T+swP1Ujv6c10NiiaAegqGpyslYk1TlRIY/SKvBsmFugfBWGej
        LHT4DsGhywO4OIVTqeB1VK3Q8dQTsHzjCiYOYdRpCRzs/EEqNuKoPXBp1reyVko9Bo2eb2Ri
        TVJZEJj+Gg9ZPwwNPTWSkB4LI01/rLCYoH96yoWFaoDzMzNYaP4R6G32yhzooeYIpDkCaY5A
        2hHWjRIKWVWJWZX5jEqVzuWzfJkqI/19q9mNQoEr+tFQh96HKAIxCrLtXLmWlulK+FKzDz1N
        SJj15HShIMXkWwtKDTre8C5XbGJ5RkkmXd6ppeMeyHxxvtnI80arxYeAwJh4cnBc4MgCXWkZ
        y1lDmA9tJKRMIqknXtPSlF5nYz9k2SKWW+s+RxAMkEu/CGAsx+rZ/YVGk22tzSSTKCoqik6I
        7ETaSohoH9pKKATvw7+K3nyRzswb9av4hhBOr6lh9CeUQ/x+MNiK0VKL1cIqE8nvxStQ4qSh
        2PLgBsokcvGlA1p6fUQjvOUWuoaEDOPIN0RzhfCvw95AbhTjil0Vw1DmcYGhBmXQUTuJoK1/
        HoGz9jcc7p+uIODOySYCLnpGSZivuh8DJ4/ZKXAvHKMg8PcJGqp7B+IhUDWUCFen5pPg9uxI
        Mlz1tKRAYNm7CZzHFzeDf2ImDQK1ixng/tGZCX2Oo1vhbO3P2+DSwl/ZMFx9/UVhVcN2qJ+t
        2wnevrHdcKSv8VX4x337TfA3dObB59VTeRC4s7TvlhCsRAg2OH5ADNams/1PsKtq+HVKO3Je
        QL15rm0f2x/9QLa5S2Efbrwb/Gi+Zs+A1uSpYBVzO84zcz0Tm3bsPVr+SmugK/aF7r7SKzk3
        D2d36d/Jzd1uw4MpL/8bNfa2Z9eio2migxvae05RljoZ1etva40rSklwtQf8+fyGmE8c9w59
        dkazr2WQi+lfeutCZZZK5Xg8J4GR8gZdRirG8br/AHj1p2lxBAAA
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Having a cyclic DMA, a residue 0 is not an indication of a completed
DMA. In case of cyclic DMA make sure that dma_set_residue() is called
and with this a residue of 0 is forwarded correctly to the caller.

Fixes: 3544d2878817 ("dmaengine: rcar-dmac: use result of updated get_residue in tx_status")
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>
Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Cc: <stable@vger.kernel.org> # v4.8+
---
Note: Patch done against mainline v5.0

 drivers/dma/sh/rcar-dmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 2b4f25698169..2ea59229d7f5 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1378,7 +1378,7 @@ static enum dma_status rcar_dmac_tx_status(struct dma_chan *chan,
 	spin_unlock_irqrestore(&rchan->lock, flags);
 
 	/* if there's no residue, the cookie is complete */
-	if (!residue)
+	if (!residue && !rchan->desc.running->cyclic)
 		return DMA_COMPLETE;
 
 	dma_set_residue(txstate, residue);
-- 
2.20.0

