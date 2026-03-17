Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB287349B06
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 19:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777420; cv=none; b=VxDBYOREEIKHCQjAk4oeZtb8c4ikLf9t2OPUe6F2q2IkAR+L0tepJdgBT5d4WI0xP8BT+lP96wUJ1gt538tthhEx2xW+hTK2kurBU+2zoHW3IdX6SJzMpbXV9veoCVoXOCFDszVZ+nJFbqM413PoWPV6wbg/P6ISTIns1AUB2RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777420; c=relaxed/simple;
	bh=rvcl8x70hBsjnab9fTtTkQT29M7rkPtwI3LOdVMcKIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wh2RGQl+dg7lVRyJRRsvk/OJWWc4zbvzDUDtIuIyU1E8v1YL5iYru46mkcxoukT9vR8qhOMb5OZDyBvfw0G5OndVpincRH5sJYk9JdeVa4xBOdSHK0SOxIx4jB7UslcYn400yZg2T80dd7sD4FCpevt63iJLl2YH3HXuPA3E/uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoxfTzpy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoxfTzpy"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b4d734678so1014256f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 12:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773777417; x=1774382217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeK06cR2Nyk++6NOuplshRyefztocvFnw4c5j63Tkko=;
        b=SoxfTzpyzvtlrrrKeHEXxpEkya5UaltApG27Fn+p7oI5sF7A811z8ACxpdOm0Y7q80
         t2xyyXNkWeAa8TNK1zqYrJBt8z2JQLMlYyCQ8KXu6FgucGNtvqOUtMp0B3CcQb3xIzcW
         EZE9PiWTTBcwRVwQhrlfbuqpE+3cDuthSpVQh2HJJSxlYO7+Gc9RzpbtjGdP8bcZVnfW
         tl8FTI/V8NjsXwtwOiVmfiJWyOMjKjNquJ3bvmB60zmjd500yKPheePbzvdcGEsSgELM
         hfQAvscuKUWbwObv1DwrFqfAdlWGO8oNtTcmIZo1cKle52Jcs/oIS1de1slrrScBk9vE
         5hzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773777417; x=1774382217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jeK06cR2Nyk++6NOuplshRyefztocvFnw4c5j63Tkko=;
        b=i7yrxn11pGO+GAd8Xav0DnLFLAgbAZDqn4LDvLhdsbHpPePrgKmcLen/EebpedafZh
         mDAM2CABnuu5dqAlUhz4z5qF0u+GbrUrYR9eSECYef9zEpg8zfathpP9IsFpLvCfh4ZV
         7f2+XC8ktcZCKSJlqnknqBCTxziDxmqAvIy89m1aYfrxYB6W/2SKuba9VD0sxPxn+aFJ
         M14zwFIM3VN5pvJxF/uxLvLCdxAzWvhcU9USuNb43k38u1HwuBWLpu9CIHYOO7ogZsNZ
         aJo1zCr4rZzwRixc+kLWj4hj8LDLNukArJ8KTYx9dYtYOUyq8sJIyl39HN0ttsU+/Blq
         rKMw==
X-Forwarded-Encrypted: i=1; AJvYcCWSebFMCG+mLJ/HyZX0psEdNNC7ZKTc2ZV8zumRW57Ug7CtxtI6M59XIGLyP20Byu0Hnm4bdGFLDMqeXtTUH+XG3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaD5hMuabaMWFCnrapOEbCotBln4qFXXqh2zHMQkmzTZJHgJ2b
	MP+2xQarReJEVSZHpv16X4Tnq9pcevR3bFW9XnYZV3a7MaXx2ZdFIfmo
X-Gm-Gg: ATEYQzwzr5Ely8p83jsjXkJUkcdm4x3ZgsKM6owuSlzTGelo7qMBvJj7cw/hkM1ruXb
	j8SJUKkuo5PwIJS/Mrx6ZvlFSBmm/HJ/0rd0DNf8yraIXA9rxC7M2B1BKxGhWhkp0Bli6srgsN/
	Nru2JG4S9TR6PE6LXcePyghsROyD+9MeSlmCiN3gZ7sbi0zcwCOUwl5004P5KHYNmXb9qNoX/fa
	gdhvE/pIXdXuVlgCOQ3b40smQAjufFYAyE5dGlgWGkoOh1lR1lUAF5CkCsYod6u2gqEK+rg8LI/
	hd4QMNbPjbzDlNX1a/ioZlcYJC9mMInO38RedGFioVS2UW+8yLvPdUnc73PnLgSxNpB7NjlQWVc
	IQnygXjvGTxCVLNfsd4kSZ8Y84mbetUa4czAZzwBuvckAfFnaoNNVnmEntVhqlKAsxxOrs1qX0G
	0dGRE2FyJ06M2I2A/Bqpx45U0O3lSePf+RucWUz/Ck7u0SKscQ
X-Received: by 2002:a05:6000:2403:b0:439:b991:5c07 with SMTP id ffacd0b85a97d-43b527c812amr912021f8f.40.1773777417160;
        Tue, 17 Mar 2026 12:56:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189221dsm1339217f8f.23.2026.03.17.12.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:56:56 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 3/9] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
Date: Tue, 17 Mar 2026 19:56:32 +0000
Message-ID: <20260317195650.468330-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
References: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L SoC family requires DMA resets to be deasserted for routing
some peripheral interrupts to the CPU. Asserting these resets after boot
would silently break interrupt delivery with no driver to restore them.

Mark the DMA resets as critical by adding them to the crit_resets table
in the SoC-specific rzg2l_cpg_info for r9a07g043, r9a07g044, and
r9a08g045, preventing __rzg2l_cpg_assert() from asserting them and
ensuring they are deasserted during probe and resume.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/r9a07g043-cpg.c |  8 ++++++++
 drivers/clk/renesas/r9a07g044-cpg.c | 13 +++++++++++++
 drivers/clk/renesas/r9a08g045-cpg.c |  9 +++++++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 33e9a1223c72..01d741ed8dc5 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -379,6 +379,11 @@ static const unsigned int r9a07g043_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G043_DMAC_ACLK,
 };
 
+static const unsigned int r9a07g043_critical_resets[] = {
+	R9A07G043_DMAC_ARESETN,
+	R9A07G043_DMAC_RST_ASYNC,
+};
+
 #ifdef CONFIG_ARM64
 static const unsigned int r9a07g043_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A07G043_CRU_SYSCLK,
@@ -420,5 +425,8 @@ const struct rzg2l_cpg_info r9a07g043_cpg_info = {
 	.num_resets = R9A07G043_IAX45_RESETN + 1, /* Last reset ID + 1 */
 #endif
 
+	/* Critical Resets */
+	.crit_resets = r9a07g043_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g043_critical_resets),
 	.has_clk_mon_regs = true,
 };
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 0dd264877b9a..7f1405cab9c3 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -489,6 +489,11 @@ static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G044_DMAC_ACLK,
 };
 
+static const unsigned int r9a07g044_critical_resets[] = {
+	R9A07G044_DMAC_ARESETN,
+	R9A07G044_DMAC_RST_ASYNC,
+};
+
 static const unsigned int r9a07g044_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A07G044_CRU_SYSCLK,
 	MOD_CLK_BASE + R9A07G044_CRU_VCLK,
@@ -519,6 +524,10 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G044_TSU_PRESETN + 1, /* Last reset ID + 1 */
 
+	/* Critical Resets */
+	.crit_resets = r9a07g044_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g044_critical_resets),
+
 	.has_clk_mon_regs = true,
 };
 #endif
@@ -548,6 +557,10 @@ const struct rzg2l_cpg_info r9a07g054_cpg_info = {
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G054_STPAI_ARESETN + 1, /* Last reset ID + 1 */
 
+	/* Critical Resets */
+	.crit_resets = r9a07g044_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g044_critical_resets),
+
 	.has_clk_mon_regs = true,
 };
 #endif
diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 79e7b19c7882..87ee43f9fe18 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -361,6 +361,11 @@ static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G045_VBAT_BCLK,
 };
 
+static const unsigned int r9a08g045_critical_resets[] = {
+	R9A08G045_DMAC_ARESETN,
+	R9A08G045_DMAC_RST_ASYNC,
+};
+
 static const unsigned int r9a08g045_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A08G045_PCI_CLKL1PM,
 };
@@ -389,5 +394,9 @@ const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	.resets = r9a08g045_resets,
 	.num_resets = R9A08G045_VBAT_BRESETN + 1, /* Last reset ID + 1 */
 
+	/* Critical Resets */
+	.crit_resets = r9a08g045_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a08g045_critical_resets),
+
 	.has_clk_mon_regs = true,
 };
-- 
2.43.0

