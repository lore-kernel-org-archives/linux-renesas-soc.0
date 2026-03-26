Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DF53AE181
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774523217; cv=none; b=UAEQKXFSQBlv3L0/7j5U9PXTxSx1X7+KQzljThhObsnJKGsQapNwVBHmydFBhGr/rtggOBEuOX6v8QslBXOGMllmFtp86KFcynIf/AYAvr6OYwu5hLk41h7aJxQcnfwnHFue4ab4cEEslsf1I4+1Cq4dGJWgvqDp1Gi6LlckZ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774523217; c=relaxed/simple;
	bh=IBunreoW2Vz7TC5D+BTns8wsUPA87aNp96COj6e2e9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=myioa4rbaT7xhg7ShuuFp003xcISL7qB5Ef9c4kUbO75Nm2Cnu0V8JxFjirdUcXa9TLFeEasZhiiJtpCjG172MT5jd50lt4Sj8KvYd6HQ8LJF3q9i6X0EVj6Sv58BUnepxMZrxi23tjVbp9hj26Aanw5l+XixKdhY/EV6PnkI4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZyPF/cL; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZyPF/cL"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so562432f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 04:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523214; x=1775128014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKs+3rwoSUHeOFuDrt1zQk3ixT4LmadR536MQVAir4E=;
        b=gZyPF/cL+6OIo5HpkwRfh3DsNTJGopW6yC5o9wtV0dQtbAannNMtFB1VekDiafD8YE
         FH4HjmCzqti6pjLDis2+fgRaER2bTVKNTjTi0gnO3Fe82tcVyAkNyC9fZEV9WlVD7CvH
         G5GlhylBfYiNWu64IzP8XHPgkwLVxCnysW6o/Ye2BUapJxoJoUhoP+/jrXdn6BPkR7CO
         lt87uM/CNuRqOVt3/OTyo/Tyy6MAWbzn/lzE2qImf/0iiCm1nNApKnE0fhLDW5hyDwrV
         tbo9igEtHfxLzXdEfKwUJMEYpTvdOHBJDL6GPYQEvaDwhKPz28hDzs9cyGigGD3QuVj3
         YgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523214; x=1775128014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LKs+3rwoSUHeOFuDrt1zQk3ixT4LmadR536MQVAir4E=;
        b=b4w+/9RnpQbT/NShoAJ7R4FhmRMa3ZzWgtMhSQ8AP/RS3FDqMhNrMy04sa0QVCwJCW
         te7jM8s4Ylbk7dqWM2YPKNMaBmOIwtk3bEEUWZVi4tqZJVtOifglIAcA2aQj6nyiYJqg
         Jo8SbpSLKP8N5fnOpB5uKmdi2Ua8jLCoZ7+WDeDbPCjVRd5va/1otRBM3LtBUkv5R/q0
         LPneVAu2dyt1a5bud+v6tPONDOn1w55AME71lNQeYtAzjmBfdtTxSyHdpqtHglvoPVYt
         f4qaDjaywNEfljokzBRbcV1Y1pQfQiZxUDKE2M0UcbB7hjH50RkNiLs3UPsiCvhCA7nd
         VYAA==
X-Forwarded-Encrypted: i=1; AJvYcCXgeXcHqU2uvKr6vyHL0hNkMrlHSoLWFKOYoCEaPz0hO1ABc9EwDQqG07tTsmgDGjb57uGshfa625uB6jPhoXAB8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx086GGsFdReBsYlGh0HQrGbt7L4bfe1zXafGe0ptD61ZXOHw24
	zYPgv9SRJ6zGWDr3EveZoBGKcvnfRO05XL+yCaU9VUxLunra18SfA64f
X-Gm-Gg: ATEYQzy1dML318GzpaDhKqjrif2IUGemI1nwap9yd+5w8v0VBJ7cJX2rHK8GV6ds4bJ
	GV928654d/ox793zou7ewlGybuT4eqWJEOzqe+wotLwSjPZZ8JH5rNlaIERqj5orl+X2HJvGWWR
	+HHUzgqg2s9gAlvVisHi4JKENmfRYEIzLd6JPVBDsGBRbuoz5p//AmbMzydLWGkI8TfEawvUBtR
	HsLjbqUnXHru//PtMO0bD/yFtlD8cSlJSuYr9/vvt4zjssR6OzO+eVBIMzYqRGhI1xstKTAzuo5
	0fyZXokYp7+e4cYeQT06PsIFfUO1UleyHKvHdy1ej8XC8BtuzQknmqcnKDhdvajDuJCrOlW1Xi3
	sUGf7jNw9WbPwLYED2RqbBsPyOt3d+mXWsR6EUyFDhOGGeEHmEx7Uol8VAPFIVCljFeOgJA/s8D
	WWs28Ey1gaPXz9jfKQLgJq2Errk1j+5WCH0U21gKWtf0qm4C64
X-Received: by 2002:a05:6000:4213:b0:43b:48a4:a4d7 with SMTP id ffacd0b85a97d-43b97a1fcf0mr1791495f8f.10.1774523214163;
        Thu, 26 Mar 2026 04:06:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:377f:9a3e:6c94:560d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9194311asm8626084f8f.10.2026.03.26.04.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:06:53 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 3/4] clk: renesas: r8a08g046: Add support for PLL6 clk
Date: Thu, 26 Mar 2026 11:06:37 +0000
Message-ID: <20260326110648.29389-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for PLL6 clk by registering with rzg2l-cpg driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Rebased to boot series.
v3->v4:
 * No change
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 6c77afdd34ea..31d800e6bcda 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -29,6 +29,9 @@
 #define G3L_DIVPL2B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
 #define G3L_DIVPL3A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
 
+/* PLL 1/4/6/7 configuration registers macro. */
+#define G3L_PLL1467_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
+
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
 	LAST_DT_CORE_CLK = R9A08G046_USB_SCLK,
@@ -45,6 +48,7 @@ enum clk_ids {
 	CLK_PLL2_DIV2,
 	CLK_PLL3,
 	CLK_PLL3_DIV2,
+	CLK_PLL6,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -78,6 +82,8 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	/* Internal Core Clocks */
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
+	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, G3L_PLL1467_CONF(0x54, 0x58, 0),
+		    500000000UL),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
 
-- 
2.43.0

