Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6466416D17
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jul 2026 11:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411130; cv=none; b=YV+MM1N3AnOGoLSyqBKP9UFvIp2Nuj3Jzgo8Vitg3fl3uCeCttyYcKcgMd1Hd6trXCke62MPIZY4Ng3jaXiHkCaz5jGHEzsHpkWFqjotXB4Vc4UQItk+2WPu955Mzt9h49mBbDfWnevdhx3780XIPloNYrNfTl135zhwV9dwAzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411130; c=relaxed/simple;
	bh=whcyjtG0+hhh5KeRVkFYr3pGCx9D/bFoL0ggUWSo/vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RT+9sQ+ipDZ0EjeUQTEgO/lbw/4qneG5XWhAJdZFzFMygBIPRtJ//qVZKKvZrgCkzYVvKCUhCXNVyOErV67364n6VzvIBoVvy271kD1IfZxkiq1f6H75DQ57DKDBx9eBlgdaph7UqtaOZ/iXLcgQRQBFhbWbBFzG9pwrHbgsx9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rK40+098; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rK40+098"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-472326ca506so1430993f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jul 2026 04:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785411126; x=1786015926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=505oIgk72o91zMELTQZjenr02tky02BeZpzR3q2ANy0=;
        b=rK40+098PlxSnfdzumebx2h6ppGjX5Fu2t5gHT7M0I301oIyYTow9UBzYbdydyWVfB
         ApsXItFKmtoUgVUP9gAhnksIYOyKF5f6iM1/gWR3ydvOoC+BcZz2GkuP9FyHjAd9dAeh
         6351+OSSvmzUtXZDt7yKu/otlz/Dtv27gb9XLqlnwEIsfr34ZLNSUBuViDs8Mwlp0mTp
         FKfndQgJEVpSOckqek71Xl8EDz3K6eO+K4r4CZCGTd2gg7lMT7JqD6PvYoOrQcMFn2Jn
         21kfvPNeBbD+7sUNsOMiKM63ev8AJ+7TfZcbji/mS/7boQAqRyoBElNN6l76GIfvjpjN
         2qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411126; x=1786015926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=505oIgk72o91zMELTQZjenr02tky02BeZpzR3q2ANy0=;
        b=rPklvvqK5Gl+AqbW6c5UKRPm40gAZM3PyB3k5cqRydCjBFewDx969rlMtaaRKoT6y+
         QQMR8S2PxW5tndUpH5z+AHrpAl2oFEpkBCcxpqTeqeGgh4FsSp1sRmubXLj2mWJD9riz
         xV6ShV1aoX+PuWDmE0xioD/Y5F6totRA9uXeI4cTMAjK3ZwoUdYPCs47NIsuvN5IE2ds
         23M64STlO77g5E6qrikqjQ9Qw29OPdeVT7c5+Axg52aYNSj30PFREULK1L8/5EcSicJc
         HvU0HvRyN0aaq7SHXgnkG7eqi7tF0CB3TcL552NMjZAGKcqA+q8BFNjNzZfQVZYJgFZ3
         kz3A==
X-Forwarded-Encrypted: i=1; AHgh+Roew2O223KXjiWT32Feqhput6zxRPvh3fP3sZxB7pUvu7DDG0c1WcdpLR2R7kDQg0Ti5HFnO5MxJZ5VnzEt99Ey4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYVcSp30RxOkXgfItiIu2xXspVRBAk7jMuxFZ34mQUKloXMSXA
	D5+0WBk0M3cEb4uh+Ts906LqjMkM9vNvr0LktR87ZmhKk1jlBYgDo4YU
X-Gm-Gg: AR+sD10BssxpBUUsUqM5CqV8X/4z9aml8j2ZdfM7kH4vW2QfgXjPwuu3ukOiEyxy7eR
	dAhReVPaKxWgPYk/EgM4GwWahkzfutuL73P7s90s+GRnx3XuHdilIxdF6WgG+baOQZh6HbhH8jO
	uI6WX9or/8g6TXYq4+T4Zr63Hoxd3L6ohGKv7+ycxtWOt4km7nHUsOcLyfK8LGjenuJn8mWFbTH
	bE2IIPzF2tgqui64MlRTUij8TJJM00OwnZjnGAR7GKDFl0sWexEAwpljX92F+vUcdPcHqpDo9e8
	CHcVi2payGtpEm8SGRB1Q4JxuSqiPljx564bChUwH9WfvtMePa2Tcg3P3GGL0aVI+rPw4mfNwJc
	6FelFUwQtGsyQpwmyQ8EfSoaCR7vuoF7FGE8qj4iIxXJcOywL9S1ilMJZBbXFGERNAnzQbI9smo
	Au2UKkCg1aW108P1I8NZEkoRKFHhdbPRDiUmvPciJ4VdzcjCjLStH5ZQ00M6Fd2f2qsrLHPBCRj
	agV3jNY/4jrEBJzd46vXFH2
X-Received: by 2002:a05:600c:1553:b0:497:ff4c:246 with SMTP id 5b1f17b1804b1-49800e8666dmr29514525e9.16.1785411125880;
        Thu, 30 Jul 2026 04:32:05 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:eabf:a623:1e7d:c359])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc89351e3sm5737947f8f.29.2026.07.30.04.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 04:32:05 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v23 02/14] mmc: renesas_sdhi: Clean up whitespace and add OF table sentinels
Date: Thu, 30 Jul 2026 12:31:40 +0100
Message-ID: <20260730113200.36456-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730113200.36456-1-biju.das.jz@bp.renesas.com>
References: <20260730113200.36456-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Clean up coding style inconsistencies across the Renesas SDHI host driver
files. Remove redundant internal spacing in the struct definitions and
static initializers to enforce a single space separator or uniform tabs,
aligning the code with standard kernel formatting guidelines.

While at it, add a "Sentinel." comment block to the empty terminating
entries of the Open Firmware (OF) device matching tables to improve
code readability and explicitly mark the table boundaries.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v22->v23:
 * No change.
v21->v22:
 * No change.
v20->v21:
 * No change.
v19->v20:
 * No change.
v18->v19:
 * Updated commit description.
v17->v18:
 * Merged patch#4 and #5
 * Updated commit description
 * Annotate the empty sentinel entries in the OF match tables with a
   "Sentinel." comment for clarity.
 * Retained the tag as it is trivial cleanups.
v1->v17:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h               | 2 +-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 6 +++---
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index afc36a407c2c..09bf9b24a8c3 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -25,7 +25,7 @@ struct renesas_sdhi_scc {
 
 struct renesas_sdhi_of_data {
 	unsigned long tmio_flags;
-	u32	      tmio_ocr_mask;
+	u32 tmio_ocr_mask;
 	unsigned long capabilities;
 	unsigned long capabilities2;
 	enum dma_slave_buswidth dma_buswidth;
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 0c3967f758c2..b3f4a5f8dec0 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -271,8 +271,8 @@ static const struct renesas_sdhi_of_data_with_quirks of_rcar_gen3_nohs400_compat
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_rza2_compatible = {
-	.of_data	= &of_data_rza2,
-	.quirks		= &sdhi_quirks_fixed_addr,
+	.of_data = &of_data_rza2,
+	.quirks = &sdhi_quirks_fixed_addr,
 };
 
 static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
@@ -293,7 +293,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,rzg2l-sdhi", .data = &of_rzg2l_compatible, },
 	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
 	{ .compatible = "renesas,rcar-gen4-sdhi", .data = &of_rcar_gen3_compatible, },
-	{},
+	{ /* Sentinel. */ }
 };
 MODULE_DEVICE_TABLE(of, renesas_sdhi_internal_dmac_of_match);
 
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 426308b73b49..7ae488e5c1e0 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -27,7 +27,7 @@
 #define TMIO_MMC_MIN_DMA_LEN 8
 
 static const struct renesas_sdhi_of_data of_default_cfg = {
-	.tmio_flags = TMIO_MMC_HAS_IDLE_WAIT,
+	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT,
 };
 
 static const struct renesas_sdhi_of_data of_rz_compatible = {
@@ -89,7 +89,7 @@ static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] = {
 	{ .compatible = "renesas,rcar-gen1-sdhi", .data = &of_rcar_gen1_compatible, },
 	{ .compatible = "renesas,rcar-gen2-sdhi", .data = &of_rcar_gen2_compatible, },
 	{ .compatible = "renesas,sdhi-shmobile" },
-	{},
+	{ /* Sentinel. */ }
 };
 MODULE_DEVICE_TABLE(of, renesas_sdhi_sys_dmac_of_match);
 
-- 
2.43.0

