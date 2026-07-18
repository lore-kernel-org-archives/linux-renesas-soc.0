Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01A338BF70
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784381927; cv=none; b=pzOLamjA/MwjpaX+feqMRcmJeDWHXJ6wd2/h3SuBi2mXiq5Re2GC1A7ZDeHfLnXIzn0HoJjDiZEgITyUr1cvteDFHWX17UfnT0mhJftzdFWpOZNXBFVrXZSSzW1gjrbenaJso/Zf0oWvLTHbKRwj4bLklZ7RzI/5D6set1R2WJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784381927; c=relaxed/simple;
	bh=J1/u34GM5LC7wA3GpljbTU/xfSADH1ECgFbCs2Kc3nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SvA4zkGOrQ3mUP1o+/zI1i0wvBLVDCdk4TW80G/oLkNENDHtxwc7h0fotZExp0gyRiT2KN/Rmj5T4YWT9SYZrU5e/mVuMLdwMflt3SaaCQPDyfFUBIaHwrU8cPaKK3V7iUJE3SpfuLVmmfW0XZdWWj2yVKn+Nc8VaEqYr7QKzUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d71NKa9R; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d71NKa9R"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954aff6088so9480545e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 06:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784381924; x=1784986724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tlw78nAgqwC5/DawVPOfXhXYF3n7wrSGdlFRZqXr7Bw=;
        b=d71NKa9RvbpSjKkh0l1miiGYyYxiuNnfkveUFKb5bfLw8yoKShgejV0LcvYE48m0sI
         /9ozP+gTbvMGkYOuVi8/AqZnsMKrmAnVrluRW8JNgCQcxTEtjwHfcNsCmjRxOgqR6kba
         Uy9/Dwo2ygQ38s6KxZtPGtGZwOiHmgZpwrhEg7OW0apQhQSj0PEw0dUKJ0kLeGyCIjEZ
         tmLvEC36shIwMPCDE0QxkA5hTacA371YCCSg3oUY4nWCmMsuS1NVrPdLwA9CN3u6wCHe
         PS1y55VldDoR9Cahidu9BcIPuOLR4JRdKzSxkdqvB5OjYyoPuqSxiUnht5SiuHnBjr1q
         uiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784381924; x=1784986724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tlw78nAgqwC5/DawVPOfXhXYF3n7wrSGdlFRZqXr7Bw=;
        b=Ood7+YYc1jiNSZ2LHAmkPYgtdH8YuKhyQRakyDgDZqCUVcIkLKRfwx5BPC+AJzAOMb
         CkNFrW5NYG8I72AWDYZ15x1yG5dMkvlmfPSs8ViKw/U70P0M+gTnqnk/yv/eaMGsXEH9
         OnMqFBPdP6ELmRn5M5ukSGY/JHKbRri+VvhV/yOJzVxPdaSbapR7vH82dKaDfuKBzMWm
         +Nop84CgtdCFcsbB3EuemSGc17YbL+lXDeyiBTy4Halto4fdNNzoloPKJA2oJoquNVTF
         B3ik8T3EfJXDKqSJ37VlXk7cseuiW7wcpIYaRkQz9SiUp3XxIXGvVZ3szKq9dQFDzSRr
         3Nlg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+aReCa082hGE1gG2aUpe0tbx0joYyvHioK7D1MqbXet3bUFijSFNNFruxMVzBF8eMAx83QjvemZbyyCkAO9QO2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl+vI8eMhqGNIF+kZcF+L/f/OfC241eZ5tSy+qRs00AB0CYEzB
	Zt7BB4EXXPWhj/GnVOsjuJXd9/PLedCunr1aT8rpJqkL0OpAOyVSB7+E
X-Gm-Gg: AfdE7cmk786HRIXXppCIdWTULZ7ri0HzZ2tb1vFxHN7P2LdSLc5g3L6rLgJ43PZpS6T
	TWTLiOydT+bmknQw79h5DXYAzjC//2aSwQwkFlfxm1aLDEx1rvJuENXDFKuAI9Wm9d/0qP+1VOP
	3qq2JWkpdDfw8g1EJuwSFf6WAoGpGDoLt4Xu0gWdSTjxcNJbVR6qW0gIze/v+a3iTflbNwzNy0N
	KsZQj2ygbfbBDYsretCvlSzQch3hHl2JjFf53/23wvxVfOBcD8CoPlp/CBVUfdtyLeFE1THLkgJ
	B3G03HW1RDwQNkxF/6pq4jbRZ86QJOK9VU0WOOzKAUsp69ZJjlgSHGFHj2Cxcf/RAspltQtta/i
	ctCkEVupjZIrGiYlEuhVdYYaJAPhOgkIzSXwGgBMN0ryIetwIHhjzS2pJ9wtj1jOomNvxF0R9ND
	qAsqYzjsayWOwJWZ278RiZCvzyYyU=
X-Received: by 2002:a05:600c:c0c3:10b0:493:72d3:4a81 with SMTP id 5b1f17b1804b1-4954a3dc87bmr57740375e9.16.1784381923759;
        Sat, 18 Jul 2026 06:38:43 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:c53f:e1cf:6009:4c03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c96ff7sm121717845e9.10.2026.07.18.06.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:38:43 -0700 (PDT)
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
Subject: [PATCH v21 02/12] mmc: renesas_sdhi: Clean up whitespace and add OF table sentinels
Date: Sat, 18 Jul 2026 14:38:22 +0100
Message-ID: <20260718133838.152905-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260718133838.152905-1-biju.das.jz@bp.renesas.com>
References: <20260718133838.152905-1-biju.das.jz@bp.renesas.com>
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

