Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714D234389C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 01:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968718; cv=none; b=K9U1SXLsAGLa84TbVfpzgOPscNCdpb3jUPB6bQoWyh/BdPEkVkiLwwXWEtxY3jEDC1+mr85oqYl7P7JwDvr8XAltxCuiPMwTBQ13/3CdsQi43upTIJfBOuVy9YVuMkub7SikjrZ1cCcy1r0Fg3otUCLA4HmbtLwEHMtURWchKEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968718; c=relaxed/simple;
	bh=MuXPX50lKPAzNlwpboundlyXapF7ai/VmXPDdxRmtqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEylK+JCqGGo8bwUMpu5XWgqNOMDjp/lV49sS369y5bCHj7VmCrr9ajr/TqC0vXIQAKAlzXoYcx/Vav5jYeIK5dg+A28ib0agEPNu7HYHVhJfYYvilT4oq2UMObbUEeY4KrDBHA0gsd5KIGDrlhedRvXBeu4/KxXGTA7OU1TkU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWhCArQX; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWhCArQX"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso2008843a91.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 18:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968715; x=1781573515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTbxMBmmKBq0qJ9h4eige5HKc/AYPyWT46wIah6eu3I=;
        b=eWhCArQXp0QuRtxyFCX4CW8s/0DUWrpla07mPa3mvpDa+oVpNjh6XWsHPEKdhz5t5V
         B6pk+HB8cFTquj1SSYJ17l6DX+sT4pwJTboGz5XSxVTiLoFuESe44veVB8zqwGQeBTZ5
         dJuqTEM9zVwGkrLdxvc6XvInkEEGu0FKy6vXl/uE1yJP0NsNEYRDdtdZ9mez+WJLD6nD
         6+IDnVgMn4H8ez3Y9C4Hinjyl6SiWwfaNbB5ZGKK+RnajH8GLj0MoakTUSGnzJFmc3u2
         0H9m1fZ4WkAecym63WMJziGChPQILrE6InoyhBPDKCFz7VTtEl8wjJdmfjuo4+2WG8G5
         mPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968715; x=1781573515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cTbxMBmmKBq0qJ9h4eige5HKc/AYPyWT46wIah6eu3I=;
        b=U8ZIosVXsaIn5RRLujxtqStPD8/+me9iVsrnva4P36I6EYF1ktZTrnjrIz9GB3shM9
         mEEffjcfs+axToPPiB5zNZUwF1tes4XQBJnfgD/k4ssO9iG8f65UOzZTsEsGbHOWKKMv
         3cxJr8mvI1WV/Dq0f4OvPNp5jLfNOJTQkI8ZtS9zHkSCWwcCInBUuk73zxNramB4uWHB
         /5CFFgC2T37CsY2LZ8qumot2/5nz5hTYT5BLrDBJqSwh1dbyAOARXih1xXAFKcWzfcOX
         wZZVvPN8KZSDrVxLit5qJGQFzVN0eTCirT5Mau5GICat3Jf6XiilatcmbA9QMNMyLQ73
         lObw==
X-Forwarded-Encrypted: i=1; AFNElJ94EVs6AdK6e+kN/WngEO79qYDuvQKnw7hm5x9KbZuExemJ8fJ3S0RXwMKlkor1msdCAgdtTBrTESo1/nvfp3nsPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUUsjPfO2TboaOPIn1HqFtKV5wYxx+VJVeWgXjd1215EtkYBYI
	sa6bCUyWpE3+3oSCRuDqivNc3WqaFExKAWUv0H4Yluu6Mw4y36I6i8z2
X-Gm-Gg: Acq92OGTkvyPwLPtNkVJKUZUJAJjMp1rghuckssxkqe4yXQCrQ4rxU/ySVeInqTptW8
	l2VbwOev6lrumRuvgd4XmD4qtyPlD53z6dS6gJXALW5lm+QStyFAEkcoBLUneU3M+QqaM8CNdwO
	+b/S39XjrmTNayab2UEQXF1CjLDyiczEayQ1Hv57xkUtq0tsO6XbB2Ipm7Q9dLdr7KGiLyYwTSR
	RWabLQ/YYfPQC/PaxxGDSuW7ddPNeGJC2FCd52HDSDgAkaTIJVN8FEAEpp2MlFI2a+JUjltpSB4
	RHZTfXP+WFwMNecwcenMyHrhcAjWn/BpI8BvldciELvR7NEpQdR5zImx9LHuYIOpNuV7rtDCUtL
	ZDd+xxNX2QCsd3XNpqbiFd17H1MA/3xkPbBjMpKvJ6j3ahTrmD4aItA+QvyRGANiS00m6py2WYm
	kSHvEML89yHoXe3v73WIxkF88I3vVq9FMJfl47t6S+eo+LhJWfnyCXUYVfA55Z3X7zHNJo
X-Received: by 2002:a17:90b:5583:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-370ef0eae62mr20642239a91.8.1780968714539;
        Mon, 08 Jun 2026 18:31:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v5 06/11] ASoC: renesas: fsi: Move fsi_clk_init()
Date: Tue,  9 Jun 2026 08:31:02 +0700
Message-ID: <20260609013107.5995-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_clk_init() after set_rate() functions to prepare for subsequent
refactoring.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 128 ++++++++++++++++++++--------------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 3e3c6fd7c56b..1df7dc014363 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -717,70 +717,6 @@ static void fsi_spdif_clk_ctrl(struct fsi_priv *fsi, int enable)
 /*
  *		clock function
  */
-static int fsi_clk_init(struct device *dev,
-			struct fsi_priv *fsi,
-			int xck,
-			int ick,
-			int div,
-			int (*set_rate)(struct device *dev,
-					struct fsi_priv *fsi))
-{
-	struct fsi_clk *clock = &fsi->clock;
-	int is_porta = fsi_is_port_a(fsi);
-
-	clock->xck	= NULL;
-	clock->ick	= NULL;
-	clock->div	= NULL;
-	clock->rate	= 0;
-	clock->count	= 0;
-	clock->set_rate	= set_rate;
-
-	clock->own = devm_clk_get(dev, NULL);
-	if (IS_ERR(clock->own))
-		return -EINVAL;
-
-	/* external clock */
-	if (xck) {
-		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
-		if (IS_ERR(clock->xck)) {
-			dev_err(dev, "can't get xck clock\n");
-			return -EINVAL;
-		}
-		if (clock->xck == clock->own) {
-			dev_err(dev, "cpu doesn't support xck clock\n");
-			return -EINVAL;
-		}
-	}
-
-	/* FSIACLK/FSIBCLK */
-	if (ick) {
-		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
-		if (IS_ERR(clock->ick)) {
-			dev_err(dev, "can't get ick clock\n");
-			return -EINVAL;
-		}
-		if (clock->ick == clock->own) {
-			dev_err(dev, "cpu doesn't support ick clock\n");
-			return -EINVAL;
-		}
-	}
-
-	/* FSI-DIV */
-	if (div) {
-		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
-		if (IS_ERR(clock->div)) {
-			dev_err(dev, "can't get div clock\n");
-			return -EINVAL;
-		}
-		if (clock->div == clock->own) {
-			dev_err(dev, "cpu doesn't support div clock\n");
-			return -EINVAL;
-		}
-	}
-
-	return 0;
-}
-
 #define fsi_clk_invalid(fsi) fsi_clk_valid(fsi, 0)
 static void fsi_clk_valid(struct fsi_priv *fsi, unsigned long rate)
 {
@@ -1034,6 +970,70 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
 	return ret;
 }
 
+static int fsi_clk_init(struct device *dev,
+			struct fsi_priv *fsi,
+			int xck,
+			int ick,
+			int div,
+			int (*set_rate)(struct device *dev,
+					struct fsi_priv *fsi))
+{
+	struct fsi_clk *clock = &fsi->clock;
+	int is_porta = fsi_is_port_a(fsi);
+
+	clock->xck	= NULL;
+	clock->ick	= NULL;
+	clock->div	= NULL;
+	clock->rate	= 0;
+	clock->count	= 0;
+	clock->set_rate	= set_rate;
+
+	clock->own = devm_clk_get(dev, NULL);
+	if (IS_ERR(clock->own))
+		return -EINVAL;
+
+	/* external clock */
+	if (xck) {
+		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
+		if (IS_ERR(clock->xck)) {
+			dev_err(dev, "can't get xck clock\n");
+			return -EINVAL;
+		}
+		if (clock->xck == clock->own) {
+			dev_err(dev, "cpu doesn't support xck clock\n");
+			return -EINVAL;
+		}
+	}
+
+	/* FSIACLK/FSIBCLK */
+	if (ick) {
+		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
+		if (IS_ERR(clock->ick)) {
+			dev_err(dev, "can't get ick clock\n");
+			return -EINVAL;
+		}
+		if (clock->ick == clock->own) {
+			dev_err(dev, "cpu doesn't support ick clock\n");
+			return -EINVAL;
+		}
+	}
+
+	/* FSI-DIV */
+	if (div) {
+		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
+		if (IS_ERR(clock->div)) {
+			dev_err(dev, "can't get div clock\n");
+			return -EINVAL;
+		}
+		if (clock->div == clock->own) {
+			dev_err(dev, "cpu doesn't support div clock\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static void fsi_pointer_update(struct fsi_stream *io, int size)
 {
 	io->buff_sample_pos += size;
-- 
2.43.0

