Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45948404BF2
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 11:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005191; cv=none; b=W+TIzGE5m/vpr9njP0vupS/1k8npY6TapdB/rOWeF4z/4GxqFU8YwejNHBAYrhrqpeMlqGp+rXkgyNZlxSfXp+be80livO7wUi0plo3RgK0po/czsrIGTkknxei1B8emkY09+09/XhvspOTPe337b1LaR7VeuK9TDBEQCzPlD7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005191; c=relaxed/simple;
	bh=nI5ECO865SLO/yR0Iz3efaPzhFXDP/Ze7Ooye8y662g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvhzMhMNKfuwGXT+u9RwzAKZEPMQHw+XYQ7Pf0+mPDSgqMGxKamuRZt4Wnjd91Rjh05+JzaAnAObZMZE3pU8VqdeFGbWLwEwfYa4q/Ma7KRvz+7bkkiBVC7itSVHc5Mq/nitSU/0iezKazv4VgYpB0gtaREr1y/yXXj0t4eqQpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SisWZCGk; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SisWZCGk"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0c35980fdso54647515ad.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 04:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005190; x=1781609990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZ/oe53fAvMnFVe28kFJYn/lJeWITuitrB7buiTdOTQ=;
        b=SisWZCGkRO0EKL/FIpqjtsu4ou3Gtsa3Sy0EYkuHKZtCHWqhNGFG0Vu5V+dVzrOHwI
         O5rSH2iuKw65eZMSg+uZTBWObfUR6AQY45gLLhjU2rrijKzKHtAxitnVWokz1gqP40Sw
         9mC32DR/GNiHlNyQePfE+TXCmXuNIwI7UpZbUn3kbRePtePAr0J+pe4LnhmJ4Vs9hmBO
         WRSHrYwfyf8Meb3V0tB3FOvEaAh+M65Zd5LjDpHLphHRM0EmHDfJc0D+BbHTLGcoA7FR
         Te8990Z/LX5Lj5whR7nxM2CjETUuTtqEuVsAnFAwx6F1C1GI0F3/OB8Z9gLw/vurFwoL
         i7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005190; x=1781609990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZ/oe53fAvMnFVe28kFJYn/lJeWITuitrB7buiTdOTQ=;
        b=bF7UDY7b+5FuRoQ4P/SiDdSuFsGqlkJXEwKGJKuvCdUTZ1bxjE+0WJj7x4LF7KLbR3
         SjXVQhS7MzRMDojw9KjYHvsmCjtV0eOBU4oqzkfBq7LoRRXxVbeKWr/S9wslEyjoKnty
         3J9OWxlZhBTYqwt3QXC6y5aSYzh/3+39GCiL51Olcagv8MJp1c71Z2idb9UG+MVi6aDC
         4F2XoYfPQiJAv9YcajTdDlqMs262kslGZxRfNK/TH8+31Rz26Silv1o0F2Y8XpRBWH5b
         Qe+87cKxLziaGEnhnsghFfL4BhvXNhJDXovKFb3LfiHSzuoNlINr1C8rAp0xR57O1JQ/
         sVDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xkj+JfCD+pmbqsl5NIXyYpjmsKfqJJXBt//+lk7P+1s+3dutshTlaRNpBhznsgWRx7GqdgtgTyyEMMxZYCDAKzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbuKFxaSa4qOfv3mxolCMn1eDuSI80NOaIDEOiymZDULaGR/n2
	H+2nmb2f9AMe03/LDqq5O7Wbpl3XvsgQ2yjPymi5Ov/hLgWz5zxwyp6r
X-Gm-Gg: Acq92OG/aYZ5Vqln1HcW+kGc5S+lCsQMghZVVLc69JCAfFWOa3/5Vj5UAyTqs0iFYSI
	eKkfRzewb/klJ95PWmQ+IWtfNyt+X60qDn2b9T4ePjHRIaMey/6GHEYKTtAvJ7k9xuCBZAbugys
	ixyX88yD8e3JUhlycbz911mA7WD0Q/dmRA7SUhz36BHDKXaQvee9iYHnTYPcH3dPUiFsXJ0LNbj
	ujV3s/fTn4i9FL/3NXAVtc1LFO3pGoi/UT2WbTSDS9/VdVYZgm5P4CWXv2U7+8Ap/5dUaUCP95l
	AAIZtJYo10k2FKx8gpgV1WI+vduCjoXmH+vj0r2jlSVwn+mVDAuVrAFCplBrNqfuYqI2h0mtSHx
	IFdSvRsluChQNCwhpZ262vEhAIGEFjN434s5uZw/KlWFejIqHbN9kJSJiX5iw/c8zOcZd0I3pby
	6R0OJWO7sl7zYp4luSMebj18UorhH8oVkCdsQSJ9MJD6VGs1+lsqsHGM2TdmOOHaXAk5zl
X-Received: by 2002:a17:903:3885:b0:2c2:245a:3368 with SMTP id d9443c01a7336-2c2245a3649mr194770575ad.14.1781005189646;
        Tue, 09 Jun 2026 04:39:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:49 -0700 (PDT)
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
Subject: [PATCH v6 11/11] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
Date: Tue,  9 Jun 2026 18:38:36 +0700
Message-ID: <20260609113836.45079-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable and disable the SPU clock in fsi_hw_startup() and
fsi_hw_shutdown() to ensure the clock is active while the
driver accesses hardware registers.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.
 - Minor refactor in clock enable/disable paths.
Changes in v5:
 - Drop spu_count and rely on the clk core for clock reference
   counting.
 sound/soc/renesas/fsi.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index e26f39dfe059..b72396b5de7d 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1560,6 +1560,11 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
 			  struct device *dev)
 {
 	u32 data = 0;
+	int ret;
+	/* enable spu bus bridge clock */
+	ret = clk_enable(fsi->master->clk_spu);
+	if (ret)
+		return ret;
 
 	/* clock setting */
 	if (fsi_is_clk_master(fsi))
@@ -1605,8 +1610,13 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
 	fsi_fifo_init(fsi, io, dev);
 
 	/* start master clock */
-	if (fsi_is_clk_master(fsi))
-		return fsi_clk_enable(dev, fsi);
+	if (fsi_is_clk_master(fsi)) {
+		ret = fsi_clk_enable(dev, fsi);
+		if (ret) {
+			clk_disable(fsi->master->clk_spu);
+			return ret;
+		}
+	}
 
 	return 0;
 }
@@ -1614,9 +1624,15 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
 static int fsi_hw_shutdown(struct fsi_priv *fsi,
 			    struct device *dev)
 {
+	int ret;
 	/* stop master clock */
-	if (fsi_is_clk_master(fsi))
-		return fsi_clk_disable(dev, fsi);
+	if (fsi_is_clk_master(fsi)) {
+		ret = fsi_clk_disable(dev, fsi);
+		if (ret)
+			return ret;
+	}
+	/* stop spu bus bridge clock */
+	clk_disable(fsi->master->clk_spu);
 
 	return 0;
 }
-- 
2.43.0

