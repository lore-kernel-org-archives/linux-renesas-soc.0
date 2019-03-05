Return-Path: <SRS0=F/Q8=RI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F26C10F0C
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 05:56:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 023C920842
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 05:56:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="xAHg6EQY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbfCEF4h (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Mar 2019 00:56:37 -0500
Received: from de-out1.bosch-org.com ([139.15.230.186]:45646 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfCEF4h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Mar 2019 00:56:37 -0500
X-Greylist: delayed 79205 seconds by postgrey-1.27 at vger.kernel.org; Tue, 05 Mar 2019 00:56:34 EST
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
        by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 44D5k91jlxz1XLFjj;
        Tue,  5 Mar 2019 06:56:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=2015-01-21; t=1551765393;
        bh=uzfkAeBUABvAjefBm6TuwCwstgh+jM8v7OZAw7mZ6fo=; l=10;
        h=From:From:Reply-To:Sender;
        b=xAHg6EQYNz23Ytf8oKYHOO7rsHG77Bzmv+bb7IU245kOCYnWxRlNw+HvwiUKDcZDM
         dFmMp6wtRPYh3cHq2nbJLShE2t3C7nZGulKc7OxW9b1YkxR6Oo9FpXmiRJYmyj899l
         clzwMwMv4Y78HFOwHraytAynS1xZOgcNIno+nptk=
Received: from si0vm2083.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 44D5k91MSZz1Cy;
        Tue,  5 Mar 2019 06:56:33 +0100 (CET)
X-AuditID: 0a3aad17-68bff70000004a10-b1-5c7e0f91428c
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by si0vm2083.rbesz01.com (SMG Outbound) with SMTP id 5B.E2.18960.19F0E7C5; Tue,  5 Mar 2019 06:56:33 +0100 (CET)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
        by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 44D5k870DxzQn5;
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
        <stable@vger.kernel.org>
Subject: [PATCH 2/2] dmaengine: sh: rcar-dmac: Fix glitch in dmaengine_tx_status
Date:   Tue, 5 Mar 2019 06:56:28 +0100
Message-ID: <20190305055628.11826-2-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190305055628.11826-1-dirk.behme@de.bosch.com>
References: <20190305055628.11826-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.34.218.219]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Sa0xTZxzG+55z2p52HDw93P60ItmZ26JTB3hJozh3zRq/yDKzD0sNFjnS
        Zr2QcwqjNDMElSBKBkswaxs7ES8Iuk4IiThlsxtZywQvLDgERiQ6kRBM1iFrJrJzKNh+2Lcn
        /+f/e5/3ffKSOPNYqSUtdifH201WVqEm1FsvZq1vXHHAmHOxU65vb5qX60/4vkL6xupRQt/1
        eAbTj4XX6U9emkD67tEQ/rbS0Ni/3uCr9cgNHW1HFIZHg3MKQ6RjVYH8U3V+MWe1lHP8m2/t
        VZsHH84qS4fTKzyt26rQeaYOqUigN0Hg4RghaYauweBalasOqUX9PYKZm1dRzAggqP9zcUlB
        r4XuhlqlpFPp12F+7A4uATj9HEFzpAaXjBS6AIZ8x+SSJujVUFv1dBGg6HyYi85hseRsON5e
        t6hV9HZoavGILCmG5cN37XhsXQNhz4PFXFxcP9jlw2Ma4PrkJB475mW44O2WNyCNNwHxJiDe
        BOQkwttQmmDJKbfl5eg3buCLOKEyJ3fDPoetA8W6z7iMzg3tDyKaRGwSdejZF0ZGbioXXLYg
        2kxibBr1+a/iKLnIUewymwRzIV9m5QRWS628tdPIpLwYC2VFNosgWBz2IAISZ1OpI/IDRoYq
        NrkqOd4Rw4JIRxJsBlVC7jIydInJyX3GcaUcv+xuI0kWqIFkEdTwXAlXsd9idS7bbBaFZDIZ
        k57oJMZipCqINpJJYvY0JWULpSabYClZwjNjOLM8jaN96D3y/uHICZwh7A47p82gRqQr0NKm
        ucz+4gbalVT0A7eRSUsw4qdMoWEkdphCRaTwJPGLx7OB0kl1aZaGcSjvjMjQ91Vwun4Cgf/y
        LILxrmkMDt9tIKDvUL0S7lzxKiHq95Ew7H9CwuQfN1XwQ/+gCjp7jr4ENzr7KZjsqV4B49EZ
        GhZqmjTgf17NwMST2ynwo/9qKngDZ9Jg4G5/OoxGftNCJDyqhZHgTzoITYd18M9f8zqYWujN
        gtb5X7LBf6WXhQfNzathoffeqxAJnHsNfvdMvDElFouJxUYG3VKxTpPzf4pdmsZfp61ChXvW
        sJU8kVtwPvD1sb709vHjH/U8fefbdzf/HNTVKm5V7Mtfs4oiMlubt8x6MP6GrOV9PugOZdbt
        Kf3kWsiaJ1MZg+u25m66d7Tw9odYG30p/HFy9dDBv3cMnLJef/RlQXj3N/aWU27lWc3Iv3t3
        T9O9Zy/sCG2vsLoadr3ybEvUnc0SgtmUuxbnBdN/GjfSB3wEAAA=
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

Changes in v2: Switch goto/retry to for loop

 drivers/dma/sh/rcar-dmac.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 2ea59229d7f5..cceddc7099b0 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1282,6 +1282,9 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
 	enum dma_status status;
 	unsigned int residue = 0;
 	unsigned int dptr = 0;
+	unsigned int chcrb;
+	unsigned int tcrb;
+	unsigned int i;
 
 	if (!desc)
 		return 0;
@@ -1329,6 +1332,24 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
 		return 0;
 	}
 
+	/*
+	 * We need to read two registers.
+	 * Make sure the control register does not skip to next chunk
+	 * while reading the counter.
+	 * Trying it 3 times should be enough: Initial read, retry, retry
+	 * for the paranoid.
+	 */
+	for (i = 0; i < 3; i++) {
+		chcrb = rcar_dmac_chan_read(chan, RCAR_DMACHCRB) &
+					    RCAR_DMACHCRB_DPTR_MASK;
+		tcrb = rcar_dmac_chan_read(chan, RCAR_DMATCRB);
+		/* Still the same? */
+		if (chcrb == (rcar_dmac_chan_read(chan, RCAR_DMACHCRB) &
+			      RCAR_DMACHCRB_DPTR_MASK))
+			break;
+	}
+	WARN_ONCE(i >= 3, "residue might be not continuous!");
+
 	/*
 	 * In descriptor mode the descriptor running pointer is not maintained
 	 * by the interrupt handler, find the running descriptor from the
@@ -1336,8 +1357,7 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
 	 * mode just use the running descriptor pointer.
 	 */
 	if (desc->hwdescs.use) {
-		dptr = (rcar_dmac_chan_read(chan, RCAR_DMACHCRB) &
-			RCAR_DMACHCRB_DPTR_MASK) >> RCAR_DMACHCRB_DPTR_SHIFT;
+		dptr = chcrb >> RCAR_DMACHCRB_DPTR_SHIFT;
 		if (dptr == 0)
 			dptr = desc->nchunks;
 		dptr--;
@@ -1355,7 +1375,7 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
 	}
 
 	/* Add the residue for the current chunk. */
-	residue += rcar_dmac_chan_read(chan, RCAR_DMATCRB) << desc->xfer_shift;
+	residue += tcrb << desc->xfer_shift;
 
 	return residue;
 }
-- 
2.20.0

