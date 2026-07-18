Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C17390CBA
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784381932; cv=none; b=IN/B5WYFwVMLryE+4dGOuAZGEYDmCw6eMNMhhnKdnynI/vtbuJTmpNWuDiyLXQFgcYoTldnTobm8Z91m8kbdJB1OmBoYorgQLWHyylqjavtr4vmSHThCy1MgnV2zv+x4pLo9g9NMvkgEHiBLhkUId34gBW34T9anCxk2MclHjpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784381932; c=relaxed/simple;
	bh=dYo9FKDRCB4K7n5y+rKmgO7EDTJp/lIMUaRHj8sTZRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCIvYPvQ7Pfq4Zq64RFR2S2FZTdr9YD+ouGH7YyOlr1ixE6DmMkHtmh2CIrMGOvsKqOwYz26NSuwZe0/OoxCwBt38VpHx72JmKlyLYvNQdiG9c0ZERdyNwpzCCDYqBx7DnoTDVxPf3sZdatUcqKElGyz02lAEYF1swQoGvYh5SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7A0aRN1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7A0aRN1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47d70879764so6427395f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 06:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784381929; x=1784986729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHNZzuYPNrUsKIj/JY3ysvghN9YMlJCSYF0jtF0u5bY=;
        b=R7A0aRN1tx5KwMnPi0YsBnfewZUC7CHSCh8Oc+VpSQOVwRDa7aSO3rmpfubhP038Ne
         bvqHn3Bo5oVUxGD0oBIEhpavuBC64zQ4MB61tJEuC1RynHtvNtaIGoGMXmfWRWfaPPDD
         3ChE8IvluS/qds4jBG1STgw74X2kZs+XN7tCEbZemlq3c2elNvTe4Bytwoc+LgnNGyHK
         03eKtohLJQkgBxpcy+z0Kh89QJ8Hy3Yu13cWuQlBKIeZbPRabFnW5BY7D2bggMzrnK+h
         ByfHrDcc3x3Diei50JkPKcSvd00M1xTRCo1NndYYOf4ghhBPh6Ix7EKzWkPyZqZL/VBQ
         OmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784381929; x=1784986729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kHNZzuYPNrUsKIj/JY3ysvghN9YMlJCSYF0jtF0u5bY=;
        b=q50GRk797gnte6ZfnI0aOos8lkPFyaAgQCjSvAs7/TUJin6HWcaepaluT6kcMvuQ4T
         dgcfr81bAioQsJ46jPcTSpB0oVsiwkOcAmj2v//oUqAZHTWrRuDnqDvWAWH8V3pI59qK
         5S3M9kJ6S20wDDQFK8qoJ9XabU/vait5GKVPVu17x7T8HHvQZ9APkT9g486SE7e3NZGH
         Nft0plUR3Oe2xirtUUlsSVKL4bCF92SDpE3Y5U48vNjL33rw8avhTerTY/yuoXU4Z+5Y
         h/l8cY/GyLZCrZqwHzmD2vGpykavRldcuUOPrW6WZYHQlmfFPw3qTorBm9PkXH2P6E9y
         8RlA==
X-Forwarded-Encrypted: i=1; AHgh+RqnqMdgMd/jUXp0EaWPrhkevT/SvO4uhDtOTAkR6Y3pWp/13q4nPK2B0iRel1GNgl88wkD28w4HIQR37jvQdbbFLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1VXJAr7EZ4SGoc6oJNq6bqZ7/UKpmAX2stOEO2da478HsOhae
	dC2dDtjAPgDzP5mCg3CGEunLzpbFSm9MrePa27MRL/5+Xwy+g8+qoHyeHAIJsu3v
X-Gm-Gg: AfdE7ck6BJTHmIImNEXRbUWoygHeaJDLYZ2AqQ0Sw/ngncTG1olybmfjTu8cEDr0aRF
	eiDuhCnnBCJaIjqDhDNHIBrU0MLz1p9OZJGH0JCKzo4SlG7xqx+z/FVOsU2GaCtzUCDbM2MhAye
	kACFLdw3ZKul9hI/83Lsf4/BoUn88yb7vhr+0Gq9lj+6ehXGuRot/0aNC1Y6LzfO/PbLE5PtJdW
	2MIqGEny3HtuNfoomCzBVZj3yCQgHkV21Z3Td8Yjh1zFB6748BwHdoT98eaC/aIk32Bdi9me4am
	uzzWw4K2tD7JGp4PSBLUHlXv5o6FOQVSsyZXtqFtGgQ/oeE7sEKj1kxaj4FRI5I+JRPMYTDL4EM
	7h9UW4UQLrwiK2Co7Z7+ipNxztTVz9kdJSamNWpTA1F2KURrY5deARYWDtnz1aMSlVeg77/PxX+
	yle9BDh4Qoo8Dq2iokTvvIugh70GA=
X-Received: by 2002:a05:600c:45d3:b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-495503fd2a0mr29744115e9.9.1784381928604;
        Sat, 18 Jul 2026 06:38:48 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:c53f:e1cf:6009:4c03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c96ff7sm121717845e9.10.2026.07.18.06.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:38:47 -0700 (PDT)
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
Subject: [PATCH v21 07/12] mmc: renesas_sdhi: Add TMIO_MMC_INTERNAL_DIVIDER flag
Date: Sat, 18 Jul 2026 14:38:27 +0100
Message-ID: <20260718133838.152905-8-biju.das.jz@bp.renesas.com>
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

The RZ/G3L SoC integrates a fixed internal /2 clock divider that is
active across all bus timing modes except for HS400.

Introduce a new feature flag, TMIO_MMC_INTERNAL_DIVIDER (bit 14),
inside the TMIO platform headers to mark hardware profiles carrying
this integrated divider scheme.

Modify renesas_sdhi_clk_update() to inspect this flag when setting
and reporting clock rates. When the flag is set, the function
bypasses the standard base division logic via a modified clkh_shift
adjustment, then factors the physical /2 division step directly into
the final calculated frequency value, provided the current bus
timing is not MMC_TIMING_MMC_HS400.

As no existing platforms configure this newly introduced bitmask
flag, this patch delivers the underlying operational infrastructure
with zero functional impact on existing supported chip variants.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v20->v21:
 * No change.
v19->v20:
 * No change.
v18->v19:
 * Updated commit description.
 * Dropped divider variable from struct renesas_sdhi.
 * Updated renesas_sdhi_clk_update() to return rate for HS400mode
   and nonHS400mode(uses 1/2 internal divider).
v18:
 * New patch using flag.
---
 drivers/mmc/host/renesas_sdhi_core.c | 13 +++++++++++--
 include/linux/platform_data/tmio.h   |  3 +++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 9c0062865866..456d52f5fbe9 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -184,10 +184,19 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 
 	clk_set_rate(ref_clk, best_freq);
 
-	if (priv->clkh)
+	if (priv->clkh) {
+		if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
+			clkh_shift = 1;
+
 		clk_set_rate(priv->clk, best_freq >> clkh_shift);
+	}
+
+	freq = clk_get_rate(priv->clk);
+	if ((host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER) &&
+	    host->mmc->ios.timing != MMC_TIMING_MMC_HS400)
+		freq /= 2;
 
-	return clk_get_rate(priv->clk);
+	return freq;
 }
 
 static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 77d3dc91c828..09b3411a59c9 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -53,6 +53,9 @@
 /* Some controllers have tuning delay */
 #define TMIO_MMC_TUNING_DELAY		BIT(13)
 
+/* Some controllers have internal divider */
+#define TMIO_MMC_INTERNAL_DIVIDER	BIT(14)
+
 struct tmio_mmc_data {
 	void				*chan_priv_tx;
 	void				*chan_priv_rx;
-- 
2.43.0

