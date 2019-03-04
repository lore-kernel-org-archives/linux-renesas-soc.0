Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC00FC10F06
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 08:04:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B2262082F
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 08:04:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="AlmnSkPH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbfCDIEl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 03:04:41 -0500
Received: from de-deferred1.bosch-org.com ([139.15.180.216]:57948 "EHLO
        de-deferred1.bosch-org.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726001AbfCDIEk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 03:04:40 -0500
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
        by si0vms0224.rbdmz01.com (Postfix) with ESMTPS id 44CXR94SlZz2mB;
        Mon,  4 Mar 2019 08:56:37 +0100 (CET)
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
        by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 44CXR80ygXz1XLG75;
        Mon,  4 Mar 2019 08:56:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=2015-01-21; t=1551686196;
        bh=uzfkAeBUABvAjefBm6TuwCwstgh+jM8v7OZAw7mZ6fo=; l=10;
        h=From:From:Reply-To:Sender;
        b=AlmnSkPHaWa004eA7u1ViBeUto4PSvnEw/7hmMcwVLm7BNaWgdvoXqvJwumQu4Whp
         ktOSEaCxDli5hdnAd1BWt1PBlbSoxy/Pg27A3Zs7jUcrnqljlz/ifiJij2+pQIyDUA
         DO/7k1QA4tGUZpAZ/N2d3gS48Nz0WdSEP5/EoM/w=
Received: from fe0vm1740.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 44CXR80FHHz309;
        Mon,  4 Mar 2019 08:56:36 +0100 (CET)
X-AuditID: 0a3aad14-3f3ff70000000792-28-5c7cda339568
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by fe0vm1740.rbesz01.com (SMG Outbound) with SMTP id 84.31.01938.33ADC7C5; Mon,  4 Mar 2019 08:56:35 +0100 (CET)
Received: from FE-HUB2000.de.bosch.com (fe-hub2000.de.bosch.com [10.4.103.109])
        by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 44CXR750jlz4bp;
        Mon,  4 Mar 2019 08:56:35 +0100 (CET)
Received: from HI-Z0EVG.hi.de.bosch.com (10.34.218.219) by
 FE-HUB2000.de.bosch.com (10.4.103.109) with Microsoft SMTP Server id
 15.1.1713.5; Mon, 4 Mar 2019 08:56:26 +0100
From:   Dirk Behme <dirk.behme@de.bosch.com>
To:     <linux-renesas-soc@vger.kernel.org>
CC:     <dmaengine@vger.kernel.org>, <vkoul@kernel.org>,
        <geert+renesas@glider.be>, <niklas.soderlund+renesas@ragnatech.se>,
        <laurent.pinchart+renesas@ideasonboard.com>,
        <Achim.Dahlhoff@de.bosch.com>, <dirk.behme@de.bosch.com>,
        <stable@vger.kernel.org>
Subject: [PATCH 2/2] dmaengine: sh: rcar-dmac: Fix glitch in dmaengine_tx_status
Date:   Mon, 4 Mar 2019 08:56:10 +0100
Message-ID: <20190304075610.10810-2-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190304075610.10810-1-dirk.behme@de.bosch.com>
References: <20190304075610.10810-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.34.218.219]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Se0xbZRjG+Xractpw9PRwe23HFpuhsA3WjjmbXQzGkDTTBDRLjEuNno7T
        S+gFe8ptI4awjDAcyljYoHXd2EVw08HQmXVQnDXoasS5ogKz6Kw4OjIxWbc4RgDPobD2D/97
        vvd5ft/7nScHx6i7yXLcbHMyDhttUYqlQunWT7PyCm7W6lSzDwo059vmRZrj7lakOVwfEmou
        3ZkRaCYCGzQnL4aRxhu6hhUmaw8P52ndjR0ibd+5g2Lt1Mi/Ym20b3WJaLd0eyljMVcyjo0v
        vC01Lbb/KS4/lFk91v0tVof+ppoQjgO5Gbz3dzUhKU6RDQK4fnshOXboRxA+FRTEDj0ILr7v
        4hwJLibXgbelcUmnkc/C/EQQ40MYuYCgM9qA8UYqWQK/uA+JeC0k18JE+9CSJsjt4OtuWcoA
        uQaOnm8S8FpC7oDRtlHEa4rLXGg+g2J5GQQ6JoW8xrj8/ktuLKYBvopElu95Gj5xeUUtSOZK
        QFwJiCsBOYmwcyjdwKgqrernN6vyHXqG3atS5++xW/tQrP60y2jOb/AjEkfKFOLE1VodJaIr
        2RqrHz2HC5TpxJSBGz2ht5fWmGjW9JajwsKwSjmx6sedOir18Zit0FvNLGu22/wIcEyZRgyO
        cBxRStfsZRz2GOZHClyozCSMeLGOIo20kyljmHLGseJuw3ElEI9GOVDmYIxMtcFsca7YyiwC
        JSUlURmJTuJaAS7xowI8hdv93hi/my2nrazZuIw/FcOplWkc/Q69hP9xIHoco4Q2u42RZxK9
        /BNIPmmqsD1+gXwVMVu0T0elJxjxW6bROOI6TCVe45encH95fDcQCr4u2fIwDm06yzGkVwJn
        msMIPJcfIDgw2iKE4BVXMsx63Dh8OTwige8/GyYgMlj/JPw+O0PCYkObDDwL9RSE/7mRClc9
        A2ng6jmbDpO+xgwIRX+SQzQQksOv/q8VcO1uQAHTi0NZ4LkypITJzs61sDh0MxtmBu9lQ7Sn
        6xkY6wivh/ae+fXQ6B/YAB11A/kw0+XSwAfBG1vhYeTRtmmuWAFXbHRkH1+sk3b+T7HL0/jX
        yetQbd+FE76ig/deHi6MLPhyHO/eD9LyTUfWJF0/YtAL8kqyj/4syFW/ecvXH3q131VwR1HW
        XBVpKFIX77SoPt/Rm9u6pfPjY+Nd3t9Wn874Ye521Sv7q6oLj71Ynv1N6K/eh63GnMCHOWXT
        e+ipN3blfrSx2/e6zPaOYa5aP15ctvsWtuULpZA10ep1mIOl/wM7LuNHfwQAAA==
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>

The tx_status poll in the rcar_dmac driver reads the status register
which indicates which chunk is busy (DMACHCRB). Afterwards the point
inside the chunk is read from DMATCRB. It is possible that the chunk
has changed between the two reads. The result is a non-monotonous
increase of the residue. Fix this by introducing a 'safe read' logic.

Fixes: 73a47bd0da66 ("dmaengine: rcar-dmac: use TCRB instead of TCR for residue")
Signed-off-by: Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
Cc: <stable@vger.kernel.org> # v4.16+
---
Note: Patch done against mainline v5.0

 drivers/dma/sh/rcar-dmac.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 2ea59229d7f5..b8afd7f4e07c 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1273,6 +1273,13 @@ static int rcar_dmac_chan_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
+static inline
+unsigned int rcar_dmac_read_chcrb_mask(struct rcar_dmac_chan *chan)
+{
+	return rcar_dmac_chan_read(chan, RCAR_DMACHCRB) &
+				   RCAR_DMACHCRB_DPTR_MASK;
+}
+
 static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
 					       dma_cookie_t cookie)
 {
@@ -1282,6 +1289,7 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
 	enum dma_status status;
 	unsigned int residue = 0;
 	unsigned int dptr = 0;
+	unsigned int tcrb, chcrb;
 
 	if (!desc)
 		return 0;
@@ -1329,6 +1337,17 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
 		return 0;
 	}
 
+	/*
+	 * We need to read two registers.
+	 * Make sure the control register does not skip to next chunk
+	 * while reading the counter.
+	 */
+ retry:
+	chcrb = rcar_dmac_read_chcrb_mask(chan);
+	tcrb = rcar_dmac_chan_read(chan, RCAR_DMATCRB);
+	if (chcrb != rcar_dmac_read_chcrb_mask(chan)) /* Still the same? */
+		goto retry;
+
 	/*
 	 * In descriptor mode the descriptor running pointer is not maintained
 	 * by the interrupt handler, find the running descriptor from the
@@ -1336,8 +1355,7 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
 	 * mode just use the running descriptor pointer.
 	 */
 	if (desc->hwdescs.use) {
-		dptr = (rcar_dmac_chan_read(chan, RCAR_DMACHCRB) &
-			RCAR_DMACHCRB_DPTR_MASK) >> RCAR_DMACHCRB_DPTR_SHIFT;
+		dptr = chcrb >> RCAR_DMACHCRB_DPTR_SHIFT;
 		if (dptr == 0)
 			dptr = desc->nchunks;
 		dptr--;
@@ -1355,7 +1373,7 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
 	}
 
 	/* Add the residue for the current chunk. */
-	residue += rcar_dmac_chan_read(chan, RCAR_DMATCRB) << desc->xfer_shift;
+	residue += tcrb << desc->xfer_shift;
 
 	return residue;
 }
-- 
2.20.0

