Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370722;
	b=Fmzyd1LvrEH2G48B2YuuLF7Lo6O9kZIvgF4n0GeXVnX3f8FWEun7XN9dW4daCzo658hD
	 6Zji3K5GPe1UQgGQaTG+DixTTJYUE0oUeBq9nKL9c+9Pd5uDg0zvtaE/yER7XIXxyrbfY
	 Ipp0v8JYSrLrOQ4G+200a9ADEvE5pnEtDPJEenu637RL/F/v7u0Z8p0rqSgWEeSofPbAU
	 GXng/vI9iMzOJV7ufwKPez3rSCB0KHazM5LiDiQz6I0duyKudD1AP61FOxbh2kBXS/Dtw
	 4+rGYmoWp9kkaEvNcIRERxtHtI+hG124kiNBCckE0RXiKAeNoGSz6DOvqWAiCr1rm5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=49Bl1zt6UwoVqWzxPK8W1b7lN0nB1VkYxdH3jRP5reI=;
	b=AvsrMsn7zDUE1aBkL8obK9+EPsQVbvC+nFL8V7Z3dL77up8yffDuYqvmi3oA4EkzN3Dd
	 oGIb1qQhyktt4apybOwfORPnjhGpezF0/+yEY/tf1GyvkXuu3AVpSQUcJMMYI6Y0so/mc
	 3O/+M6KXLxX10EuI7dwYUuH8SER8eYen5qnJ0A3QqZWIdzD/VuqrCMtoeCpVms+mgoAjO
	 2ludKQQE78xcAWSjUkc1ZziN2gfERsOp52Vn1vUkuRPyxMsQ1slN5VRrp1npGkdYrLnM9
	 39yRmNd9UubxCCyXpBPkk82/EEvlH1QTNKmqSmXVDB3Tjeh1gRa+CoYXVbQedQuwf7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZRoYqVO;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CD5606A31D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Oct 2026 14:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92CD5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZRoYqVO
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1450277eec.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Oct 2026 07:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793370721; x=1793975521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=49Bl1zt6UwoVqWzxPK8W1b7lN0nB1VkYxdH3jRP5reI=;
        b=GZRoYqVOzFQ9NKugWeeCfemabJywoYT1e4+ri71JacGwHc3z1S7aCKftP9etDPCRQ8
         +wHucdQGaXt8YvGFWcyUy4GPb1wia6wOtfPZkF2Yosk8Wco37sEfNQspU27j8c+m9Rv0
         hURd6+hSjjjwjKpUN4IPSBbtYuzwrIhbDfCj9PNO2R37a5f16NvC/+n5Gw9zaRLR5vyB
         729CnX5XFkEbJ2WlaRxWNhGhXA1O9JEvu9/tRGbsUIauhqROT+5BsXNBbz4d+7Sl1FY7
         lQGAbSPIXspb/EeYgu4rVco+KjZLQx5yIzQgCj+uo8ZFgdNuav6tktWtj4LhxtFJ/ijB
         ju8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370721; x=1793975521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49Bl1zt6UwoVqWzxPK8W1b7lN0nB1VkYxdH3jRP5reI=;
        b=jYCNh5qoasq7DvQakfsL9xefk5pIJ0rCvegwPzkWNSPlM557bckSjdOAg+oF6R9tVp
         S2PGO/ZW+ltgGJObuNUyfhN1frYOdD8jdn48s0dLRl+mSzAZgOv70YsT6KSwnZW6Qg7i
         Zr2wfJo9AlpeFHF0hqTO4/Eh17ypotCP0yedZXeAPpYx+llfGi2Mshmdh8bVAwaWZkKm
         xUlaL9z9n+opWFIQFa3EMcd8W679LSbUJAdnDkIP94UgdvBv9aKNQtq3Rw8725mcLX0T
         BiiF2x+XThE6GgGD2j7mgPrFmYSN2IMpD6BfESWfymYiAshGUgtO2WNnbpCe/ifuOVhH
         dKUw==
X-Forwarded-Encrypted: i=1; AKwUvBxOUc9bR8PsIy8kLoQ1ptVXjPsUpufHIcu4g2CzW9PVzt3kGjYp1LOwFXNSFlUHcMpqSQxZoAHvF+NJ0z92sKlQCQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJdNa9DEfJ04q9PrQhvDFQE1VVZDU6P5Pa30BTsn/eLoH0ydEcy
	1P06En3P9xRt2m7VQ/FwivI25VpCIG+kdG+9EuMIVilY5ffsjwkuAHd0hfd4DuoYoKQ=
X-Gm-Gg: AYBFou361lz5LDFf1QfeUarXFeP6olFIUYvueFX7dMGhnqpXlRmw4kR3dG2Aw4h2ki6
	JXuzTFDyzQQxsiuEDEH4elofeFpVjc8b7zkJboekR3NPa6+7qi1JGXZlDu6//COmvAbWIPUC83j
	MOILrpyLQUu91L+bpjxAo9xFoWlrA/8wxlOXa5CbreIZvL6b65HiakxDBUhtRoZ50x9ioXcW3A+
	BmFAtwwv+uWvbc36qXgnGkJZarf7/ywX3NKCDXCGRe+qkHOTQqjS7t/HBt1uuBgrT+W9LTwjzKF
	7F3A7xzMVSSBdOUmsQvabeVbtp96UtuihdmigCbiEQeb6crTkwNU4VpjY+jhOXb96SYXL/M2FQj
	wKZQU0UVMsQCnRanLzaJuuM/7xgMW9Zx3kJ3sLJVn7GNBlruaEvDDLYn6asVhH+WdbrYwQmtGFD
	Ibt1cX2wswV8jXrGUVEPzwMePNxLcMBoD7mcvHjtq1d93ijtuhwVZQ09VfwhAOl9RfnjQ0iLA/B
	6wSlRodOGWnNI0VKNK55W2+IUqP92pyqler3oIOODEaxsf6agaGLHTgPwonfeAZjv8T8aSCzbqW
	nXufaDiyE0fAuan4fNLwgSouA79Q46J993tw23Bg3yQLaqnLhRUc8qW7jyRHuFGKjREToCzGo1+
	VQuOIQimnKuG+QUy21/zoZXkXggXSUMEO+14MI8ENiDJ17VEk+9NqTVY5rO90jmZ40FjfBkgwKq
	pkxdsupg==
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr5397671eec.28.1793370720407;
        Fri, 30 Oct 2026 07:32:00 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm9438146eec.26.2026.10.30.07.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:31:58 -0700 (PDT)
From: Codex <samarth.colleges@gmail.com>
X-Google-Original-From: Codex <codex@local.invalid>
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH] mmc: sh_mmcif: unmap DMA buffers only after the transfer has stopped
Date: Fri, 30 Oct 2026 14:31:51 +0000
Message-Id: <20261030143151.2916788-1-codex@local.invalid>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samarth Narang <samarth.colleges@gmail.com>

When sh_mmcif_end_cmd() is woken by a data error interrupt or a DMA
timeout, the DMA descriptor may still be active. However, the function
unmaps data->sg before clearing BUF_ACC_DMAREN/DMAWEN and calling
dmaengine_terminate_sync(), potentially releasing the mapping while the
controller is still accessing it.

Since data errors can be triggered by the card, a faulty or malicious
card may cause DMA accesses to continue after unmapping, potentially
affecting reused IOVA or SWIOTLB mappings or causing premature cache
maintenance on non-coherent systems.

Move the unmap after DMA termination so that the mapping remains valid
until the transfer has either completed normally or been terminated
synchronously.

Fixes: eae309836509 ("mmc: sh_mmcif: Terminate DMA transactions when detecting timeout or error")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified through static analysis of DMA lifecycle
ordering and has not been validated on hardware.

Since the request pages are not released until mmc_request_done() is
called after DMA termination, direct-mapped pages remain owned by the
request. The potential exposure is therefore limited to the DMA mapping
layer, including IOVA or SWIOTLB slot reuse and premature cache
maintenance on non-coherent systems.

The fix also relies on dmaengine_terminate_sync() stopping the channel
correctly on both MMCIF DMA providers. However, shdma clears CHCR.DE
without confirming that the channel has stopped, while rcar-dmac polls
the bit for approximately 1 ms but only logs a timeout if it remains
set.

 drivers/mmc/host/sh_mmcif.c |   23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
index 8bd9cdeda..7b33f832b 100644
--- a/drivers/mmc/host/sh_mmcif.c
+++ b/drivers/mmc/host/sh_mmcif.c
@@ -1173,15 +1173,6 @@ static bool sh_mmcif_end_cmd(struct sh_mmcif_host *host)
 	time = wait_for_completion_interruptible_timeout(&host->dma_complete,
 							 host->timeout);
 
-	if (data->flags & MMC_DATA_READ)
-		dma_unmap_sg(host->chan_rx->device->dev,
-			     data->sg, data->sg_len,
-			     DMA_FROM_DEVICE);
-	else
-		dma_unmap_sg(host->chan_tx->device->dev,
-			     data->sg, data->sg_len,
-			     DMA_TO_DEVICE);
-
 	if (host->sd_error) {
 		dev_err(host->mmc->parent,
 			"Error IRQ while waiting for DMA completion!\n");
@@ -1208,6 +1199,20 @@ static bool sh_mmcif_end_cmd(struct sh_mmcif_host *host)
 			dmaengine_terminate_sync(host->chan_tx);
 	}
 
+	/*
+	 * An error IRQ or a timeout wakes us up while the DMA transfer may
+	 * still be running: only unmap once it has completed or been
+	 * terminated above.
+	 */
+	if (data->flags & MMC_DATA_READ)
+		dma_unmap_sg(host->chan_rx->device->dev,
+			     data->sg, data->sg_len,
+			     DMA_FROM_DEVICE);
+	else
+		dma_unmap_sg(host->chan_tx->device->dev,
+			     data->sg, data->sg_len,
+			     DMA_TO_DEVICE);
+
 	return false;
 }
 

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
