Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB54648BD54
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 12:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808239; cv=none; b=gl+NhqL2by1hWjYABlU/wYIRp2Ums6wMeKgdnHM07zeFkJWgsA/tJ/GaGwIyoL0VgzOmqN0ftnLL//Dn1fZAOkhoKsCfmcK5KO+50u58z8+0YUC2B345LshIo2jXObsMHLIbx3yaev8xHCTWvWG0TB8zCMCV562q0zGVWV4GEKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808239; c=relaxed/simple;
	bh=sBM82n3BaQEVv38ugFGo56kDen6v8W363kiJGIXBMWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nmldmiud6kVWNjG+X8K1bmS69cu3TJux5kX1RobUvoFf1C8KAWMC7FCL9UGPtAVNm7IttECCr7dCFpm0nRzvTdrqtH1aYTAF6pKvnPQyDtyiJwPenlmhp9SoRuBReSEmcC+DTI2zDCZp/67wgKHMJG7e+1JOPetl7QWdS1TgfIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Gtu2DTGm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Gtu2DTGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=NS2aXUtPeXUe+UkqbC5KnSEB5oR396uceZ6N4DpKnck=; b=Gtu2DT
	GmiqPVQWSan21NhDVEvEeA7DNaiWIgLNdAqD8wf6sNCJMAc3+CPZJq2za17Kc7VW
	OGh6ipVEIqLLxaqdF7GKC53MdcVslw7g9RwXzoKuwAk+qp2OyZ6fUSMgfXFbRNLu
	9ev1YlhaKbjyUtkEe6mwGRJkkSTC2hnOqi1gLW2SzyvPpDKFUK0mGLDdbAaqvRdp
	VG5esCEOMzt1XOP0z5Lza2OMphxmQyog1ZRMWOu5+mfcCiQ4E1EsUax8a5kTBWYx
	jZWXPfyRHClLhPU0yjsjWoyyxUvuAuekV5qFtxfhTgby+9Db+Cb/StNFgWnE38gq
	klwMtKACJPCHwbyQ==
Received: (qmail 2248170 invoked from network); 12 Oct 2026 14:30:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Oct 2026 14:30:34 +0200
X-UD-Smtp-Session: l3s3148p1@HPNH3aNd4MUujnuu
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Pan Chuang <panchuang@vivo.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Frank Li <Frank.Li@nxp.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	dmaengine@vger.kernel.org
Subject: [PATCH v2 3/3] dmaengine: rcar-dmac: Remove redundant dev_err()/dev_err_probe()
Date: Mon, 12 Oct 2026 14:30:23 +0200
Message-ID: <20261012123020.11320-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012123020.11320-5-wsa+renesas@sang-engineering.com>
References: <20261012123020.11320-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pan Chuang <panchuang@vivo.com>

The devm_request_threaded_irq() now automatically logs detailed error
messages on failure. This eliminates the need for driver-specific
dev_err() and dev_err_probe() calls that previously printed generic
messages.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1:
* none

 drivers/dma/sh/rcar-dmac.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 78a913c4c0d8..73b15045ad92 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1797,11 +1797,8 @@ static int rcar_dmac_chan_probe(struct rcar_dmac *dmac,
 					rcar_dmac_isr_channel,
 					rcar_dmac_isr_channel_thread, 0,
 					irqname, rchan);
-	if (ret) {
-		dev_err(dmac->dev, "failed to request IRQ %u (%d)\n",
-			rchan->irq, ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
-- 
2.53.0

