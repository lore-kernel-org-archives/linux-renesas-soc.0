Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6E5395AE3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 08:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781770781; cv=none; b=GIgtJJwt9cNt4XuWCBMOMtoKKRfs6XYikQgxtnPyB7niJJEra8j6vTfJoQCw654VgRyq5G+GMHQY9ONX5qUxmn9ZcPs9OOfvCMhupX8Xj9zzUjvdAPhTWu1Ld8+fyCmQXB+1ausYn1GPKxIcYVfQUKo0xJcJkAyMZl2PMPOG1nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781770781; c=relaxed/simple;
	bh=Xzt9rXmi2mIhjT9h0euihHrxiLZwMnVlfFfCMypqG6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YXTdXboPgajVjeIcMD4h85FVdmq86bOmabchDhvGmKgZLqWRamzTgJxXz0Cj2cBLmhU/4UhnntK3ffLTBHQniu597uRzqFiEJzjZMMb2T8ZBPuJM2I3mvyqkj6Ood/qBX0gC8uOfoPhAI4klY6vK2mSAu7oQ8plMOVQVDspoMu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nagWTIae; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nagWTIae"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so13564465e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 01:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781770777; x=1782375577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gHLUsMyTg74XhoXorVOA2VOwiCUXj1JJGkjU8JYr5ww=;
        b=nagWTIae4H08mWh8FGfhU2MK/LhMRC1vEd3sdQAR3cYPwO51L5OmznMexDpHi8LOMv
         wJPwgqxq1DAo1sdHoIsm3W34u1NJjerNBLj0lVOndI+gl/9Yk45aji72ei3WKylR32sx
         Us+zYsIiQ8vtTMt20Bc8/zN4Zg++cBNBH+qEbpLcL66D0X5gXY6vGmEu9l6VGvzuf3Gy
         2QwCpq9NdGrGZvBSnxJhe4qr9h5l34/ytEnshUy4pux/KtRgQ5KDdllj7BnTpbWBgq+9
         oacBtTudHJ1WZtKZjp7QZDJUUhTkhcu4CHmfWdjB7v3VYXSZb2J1j6E90ETQqriEHdyi
         4ZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781770777; x=1782375577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHLUsMyTg74XhoXorVOA2VOwiCUXj1JJGkjU8JYr5ww=;
        b=fI+2v0+KdemDkI/iwYNxxrHmKJMp4y9gPiHS4+SXhxQPNnTOebcLgENOeib9TXmp3b
         CcG3Q1BSTuAGJn+Ws5pejpguYlm5+ULe6GsGFgxRED7k44PikMFU9KAlRBw1v8oAvi0q
         pw2izCYDyd8F7AhZzkhsvcZjs/yC40gKU69gGJHDAGhU5R98ZXsP3BtQ0FD32z9YcR2U
         hWdiNTk861TEwFizHBvC1y7Z9SEXQrY45lLjNqNA7+ZHX/Ra+zP0P5Oeqn+LWNGAa5sr
         HSvLLDidPN/FewvSN1C3g82DToNdy8T1Y3ZHS9t/i9rf4URA6vOwNzCDL5TzfCCFIzwX
         7+jA==
X-Forwarded-Encrypted: i=1; AFNElJ8SfqBQDpwSIATdKyjBJo12l0irXzOygGYGY1cezMs37cj9aPZmGVCzpTNynedO5D1zSDAyeVBaJ0G77sHIBxDP2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Ql3Ko2b9zzsbHQgZvoYdtM6qQwtqLRPc7vF0c0rUgDClDl3e
	4KfRD+tGtgao3gAjWo/mKT2uV5MK0xAj/LM3SPztMss71OMi03/Xl3fd
X-Gm-Gg: Acq92OHcuyD13VpMPy/S5GTYKbVh1vSE0Dl+O6YWEqu3RmUOadbyG1b2WgO/IbhFZ/8
	kwRnee+Tl9s9NLsODke/aKah3evjTCgIKi173sKCJ23p8Evr3r3W0Rj5KbYUaUXLgFR7Bee7Ukk
	7E9W9wFB3Z/B17SM9K+JHnncqKO7nK+GghEE1rd7RgWbp9JdaH+6jD/vkZgpB++SIJZTyI4JXjP
	hFP+ko8+SPXX2Hw6UmM57EY0M/fmMu/U+VdIYcj/A7q4bXA7VcK/1DVjRhL2RxTHjJREDruAPNW
	JtgeNz3BE/1la+1/o+nUiRXDlf5rbloGziWTbpLMbWULEzVbhEgOqciVefA9hVxxIpxWXUy1GLj
	1g58gKdKJ+OTC4IgJJEp4prR9LN6q+29Erhz83EWP+cEprYZzlU/O7jlNq7C8n3lxMMPDILWjbi
	IGnetHBWM9FBz/xu1W6XrLBRba9p20EUvXwWgo8w==
X-Received: by 2002:a05:600c:e556:20b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-49238193273mr26940905e9.14.1781770776284;
        Thu, 18 Jun 2026 01:19:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:3f21:ea76:cfd8:a8b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923a1d3fcdsm25451445e9.1.2026.06.18.01.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 01:19:36 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Quang Nguyen <quang.nguyen.wx@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] spi: rpc-if: Use correct device for hardware reinitialization on resume
Date: Thu, 18 Jun 2026 09:19:30 +0100
Message-ID: <20260618081932.172168-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Quang Nguyen <quang.nguyen.wx@renesas.com>

rpcif_spi_resume() currently passes the SPI controller device to
rpcif_hw_init(), but the function should be called with the RPC
interface device.

Retrieve the rpcif private data from the SPI controller and pass
rpc->dev instead. Also propagate the return value of rpcif_hw_init() so
that a failure during resume is properly reported rather than silently
ignored.

Fixes: ad4728740bd6 ("spi: rpc-if: Add resume support for RZ/G3E")
Signed-off-by: Quang Nguyen <quang.nguyen.wx@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/spi/spi-rpc-if.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-rpc-if.c b/drivers/spi/spi-rpc-if.c
index 1ef7bd91b3b3..b63c7856e758 100644
--- a/drivers/spi/spi-rpc-if.c
+++ b/drivers/spi/spi-rpc-if.c
@@ -206,8 +206,12 @@ static int rpcif_spi_suspend(struct device *dev)
 static int rpcif_spi_resume(struct device *dev)
 {
 	struct spi_controller *ctlr = dev_get_drvdata(dev);
+	struct rpcif *rpc = spi_controller_get_devdata(ctlr);
+	int ret;
 
-	rpcif_hw_init(dev, false);
+	ret = rpcif_hw_init(rpc->dev, false);
+	if (ret)
+		return ret;
 
 	return spi_controller_resume(ctlr);
 }
-- 
2.43.0

