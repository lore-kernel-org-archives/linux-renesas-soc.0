Return-Path: <SRS0=F/Q8=RI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E977C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 05:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 788DC20848
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 05:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="dMWSHP4j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbfCEF4f (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Mar 2019 00:56:35 -0500
Received: from de-out1.bosch-org.com ([139.15.230.186]:52152 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbfCEF4f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Mar 2019 00:56:35 -0500
Received: from si0vm1947.rbesz01.com (unknown [139.15.230.188])
        by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 44D5k90ybDz4f3kZ2;
        Tue,  5 Mar 2019 06:56:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=2015-01-21; t=1551765393;
        bh=NJEzbVtRLgM7qYE9X5B0j8kwymv1uaTDWBadZxvwBis=; l=10;
        h=From:From:Reply-To:Sender;
        b=dMWSHP4jO9XTBPMCwxg5p4MDCTGBWm4kb70u41KOscP8yoj0YXJ+gS9SeIQWKxjqq
         d09vuRcKyzXvJoTjtSsLlNQt3cvcie3TgIX7pgWBaBXfaBN1D5jFSqTWlw5RNoBDqX
         Ta+iWDREELVr6QaeX/bmtvfkTkA5Rh0SkoNT6fqE=
Received: from fe0vm1740.rbesz01.com (unknown [10.58.172.176])
        by si0vm1947.rbesz01.com (Postfix) with ESMTPS id 44D5k90WyXz6CjQfJ;
        Tue,  5 Mar 2019 06:56:33 +0100 (CET)
X-AuditID: 0a3aad14-3dbff70000000792-42-5c7e0f9051ba
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by fe0vm1740.rbesz01.com (SMG Outbound) with SMTP id 60.EC.01938.09F0E7C5; Tue,  5 Mar 2019 06:56:32 +0100 (CET)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
        by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 44D5k85RJXzQ2v;
        Tue,  5 Mar 2019 06:56:32 +0100 (CET)
Received: from HI-Z0EVG.hi.de.bosch.com (10.34.218.219) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.1713.5; Tue, 5 Mar 2019 06:56:32 +0100
From:   Dirk Behme <dirk.behme@de.bosch.com>
To:     <linux-renesas-soc@vger.kernel.org>
CC:     <dmaengine@vger.kernel.org>, <vkoul@kernel.org>,
        <geert+renesas@glider.be>, <niklas.soderlund+renesas@ragnatech.se>,
        <laurent.pinchart+renesas@ideasonboard.com>,
        <Achim.Dahlhoff@de.bosch.com>, <dirk.behme@de.bosch.com>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        <stable@vger.kernel.org>
Subject: [PATCH v2 1/2] dmaengine: sh: rcar-dmac: With cyclic DMA residue 0 is valid
Date:   Tue, 5 Mar 2019 06:56:27 +0100
Message-ID: <20190305055628.11826-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.34.218.219]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Sf0wTZxjHeXttOToOrwfIswpuXBZddLCCGC/TELO5rDOb+ofZEq2RYxy0
        kbbkrqBoZKzGrcVUSzcwhSFkGYyBsFgQrD+YdpvChrIIW1IGRIluqGwz65AxVrc7CrZ/7L/n
        /T7P5/m+7zcvjlHjsRrcaLZyvJktppUqueqljrQM17IKvdbfxjDtNSEF01DvRkxvIJOpto3J
        mbP3fpMx4wMvME1nJhHjG+vHNuO66usZunq7R6HztjmUul+GZ5W6R4PVcl3Qu3KHcpdqUwFX
        bCzj+Bdz81SGm1W98pKuuAP+4B2sEj2KrUJxOJA5cP5is1ircIp8XwaBj46j8OECAo//H4U0
        RZFfIHD+LJdqJbkGfC77Ap1ErobQ+E1MAjCyRwZHW79aGEokd0JoaHoBlpPPwQ33pFKqCXIT
        tHceQ2HrZ6C2vUoW1tUw4LmzwGKifuRsPRauAa5MTWHh+XQ4XedTuNCyuiikLgqpi0KaENaG
        kgs5bZkpa0OONpPP54SD2qzMdywmLwrnnXQOzfsL/YjEER1PdM8f1lMKtkwoN/nRelxGJxP7
        vxOlhHxLQbmBFQx7+dJiTqA1ROr3W/VU4hNZKM03GQXBaDH7EeAYnUQ4FBV6iihgyw9yvCWM
        +dEKXE6nEEX4dj1FFrFWbh/HlXD8UncjjtNAuAkRVPNcEXeg0FhsXWrTaQSKiYmhlkd3om1l
        eJwfrcPjRe9paQUhlLAmwVi0iD8dxqklNYJ+i17Bbx8NNmCU3Gwxc5oU4hOJJ6VJQ6n5yQ00
        qcTcq4f0VHJUI7LlPgogMcNEIijB8eK3jngDsUKKS70oRqDsZpEhbUr41DmJ4NS5GQQ1zltK
        eNxjw+HPbg8Og13XCZixP06A7sZKEryzjSRMPDxDgeP0+SSYsH+TAiN3Z1Jh+sFAGox0fbwS
        JkK+Z6GmeW4tjP04lQETzrks8F6tyYZO14fr4EvnDxvgsruWgRuzv+ZCv2P0ZXFf7RZwP6je
        Cq0N194AX+fQm3Ci8+Q2+Ms7vRPGalv33BeDlYnBBocPScFaWev/BLuoRl6nqUQJLZ//vfv5
        LXxLKC9vB/pg7vd3P7u97d5eoWLwwuXe5Lc3Zu8aXD5asI+d71Efa+zDyI7MHDgeaFD/8dbQ
        Q1tA5rJ0tDz1WtPIqdjDm98bDqr60//tgNKWhEuXXHHb7RfbjrQ6+u5ey+173WOj1Ve1682r
        +K+9aT8ljvJr02/tzzlxhZYLBjZrDcYL7H/ol6MacAQAAA==
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

Changes in v2: None

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

