Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4729747F2CE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 17:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246225; cv=none; b=OfuUQJfq32giAXfC1dOUVL4iSYJGojrFfCb3ry06foYOy59mwGqu2tY3FYjnTsNFB3pHoeS+HgSQvmVb+fVzvt+bkPJAT3G8de/p0OisYeze4MhwZaUilhI47PikAqsggD3rEd0n32OaEKfLMfp3/m5rLoAdkOXae9SdD3f6vbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246225; c=relaxed/simple;
	bh=ipr+MBhDJMbp5Zx5PlUAdWHCNAfdnVJiOsjptFpzaq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SyWmmYr/ojT7NBzuyVZ6MwawEGx7KiRyvSqriYGn6hKlsja36gBXsShPbinGG4eijOrAWb8511lCBonDd0QEKEc7IDncdV2ClS6u+9tuSbasEKQh+yBOBWaKeKgalWwO5KK6Y2f2ipnIa/Nz1IUPUb8g6H3S63jLriyoNFxsZYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKl7bFd9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKl7bFd9"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso663625e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 10:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787246221; x=1787851021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mu5nSbIV7ZVCPgjYekLBicE5GIjpuU6QCDUMJ/qyzLI=;
        b=XKl7bFd9eqmYkYGMe24uHacDeXKeNh1yMLHWAcXmcgUbsDDNj1BZ4qdSouR7kYo+GE
         QDZ7SGjgqGtmcxliprYe0vROB7QyjujfO99G+bVaUTK9zjbJmaqglyjsYhTih+vsM5gF
         aYnt876TCVShI6+TtOECRykGeCjkLEHEpj4rWZadphW/nYg1+spRS4xOpK1mIypAGAmG
         5QRPzKncpcs+KI1PbfUPSaCYK24dwNGB6FoVYKAg9uuWBOvYKQk+um9i23sAKqtsWxTG
         hi18cT2dlKyBwMA6J78mqjr+nSbGCrJeGYeYp6OP97OPqEhWwM9MKB7+HBNHWrb4EJTL
         9eiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246221; x=1787851021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mu5nSbIV7ZVCPgjYekLBicE5GIjpuU6QCDUMJ/qyzLI=;
        b=mo7sPa02g5d5x+mzW+N9VR9CvKa4hBAWaSjhG2Hclgqj38kc6zTQWYCt3xLmVIA8Oo
         swwc0ysSXiU8KcF5z2sOXrWHnQStfZAKNIkDLsOUg3GGFpP1QcAlWZWQzkn372THayaf
         slTiT/8zS6QppYKLKfaC9zZFQs//u5SM80gVbOPQYeVJI7J+K/1FLafpKK6jm470c6vb
         nQPuyEoj0yAA786x8Zms0jQRgtR/uiItgijvWK8KVFLYAgkpmqrMpGlGBX6qRR00Wx09
         CZsNkqpOtArVzhbIt38qLnHJR/e3GOTGH9Jplc8AdGDY0BBpKNjWY7P+fADiOi25ZRFD
         pH2Q==
X-Forwarded-Encrypted: i=1; AHgh+RpO20jN9b/NrcOv7qyzJ4FhNBp1qMb0otfh//ly4fFNX9sDbLXLTgc7RhZeL4M7Dw9xrFht/LoOCXIlKxFXTwMjEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz760YyDcJgCovIEagVG0SahQm2WQajGwD2Z4jyww3F/gaElhyL
	SA+36451NBETOIq35j2dzQjbF5MfsS/XbaQtHAV9P8yrWxWgTu49QpxgUUvxMg==
X-Gm-Gg: AR+sD11MVCzs60AFK3TCRo8TFbGtzc0l8X2okQuQes3orprJ49ECvg+HwquF/9y58DV
	zJzRB5odIhh0Ym/waueMQFwmPc6m4ieqSfVcKFHFiqBMdZlkUMndTHxHH0eNHpjmV0grNncHkFE
	8z2vvjAVfKBs6KuEvPXGUrSESmxJ54eLqQ//kWPgzhTps1oUHqdgV2QdItKnR/5GnsATAdd3p0P
	l3VAwPPSO1+Ygl43U1rdlrfTFh32BBQchjzCyixg0Xj+25eiAV6GTN07vTAHB72yAjWuYo2UVTB
	gfHf5vQx0aAboyWR0G/RJjnRg4mmPl9v7vTPWUiOvoas/+vWV2365LGEaBjpgEpiXG+Q7egURvA
	k9+nmRYQAOoCWsPVks2KflqcPHq11bET1I84XEpU1/ywhyRTw61VO+z1yB9IOiWdyA348Y4X3eJ
	Dx6QEyPh+kF/gVCtUmZ8OyzzhiVxLBq5QSJ9vl4aypgQsC6J0uIfZj9D63x0N3lRpKiLLM
X-Received: by 2002:a05:600c:64c6:b0:499:afcb:24c1 with SMTP id 5b1f17b1804b1-499b82e8528mr9852195e9.5.1787246221245;
        Thu, 20 Aug 2026 10:17:01 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:eda0:8ef1:e1ab:c2b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm219313495e9.3.2026.08.20.10.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 10:17:00 -0700 (PDT)
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
Subject: [PATCH v24 02/15] mmc: renesas_sdhi: Clean up whitespace and add OF table sentinels
Date: Thu, 20 Aug 2026 18:16:32 +0100
Message-ID: <20260820171657.62815-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
References: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
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
v23->v24:
 * No change.
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

