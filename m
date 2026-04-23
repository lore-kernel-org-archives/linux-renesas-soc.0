Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55A92BFC8F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776952262; cv=none; b=LtFu01HTGVjMchh2eoRiMI+p25juJsg61VkpYkY0iBiI0kH5qePRCrFy3dVo3Ga8zw6VVmnkkyEbzGArIbOdedKfxW42bTsh3sbjCbOS2pFkEm4JggFMf1sDlvRVRsNejbWjm207fybv8/ND7RrNZJViRoCe0PgYnzK8OCXqwY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776952262; c=relaxed/simple;
	bh=5wTnhObAgPuPoQVvH1SJarmU20nNvDLvu1wr42afUuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rD1qVU014YND3UYOqsSk1/M2NHeKR0cLaw71vMGEsuUVITQezhWyHPAHmoDh00nifdzTO58V3SmrQHMBWPnnuCoSoKzNjVO6chemAWy77GXzUp4VQDFmqZNMycqX6fCT9ruogixhbWY6jlVEX6mlozNTt5A2PYjAoHscsFkXSJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blV0tnyl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blV0tnyl"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso73799645e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 06:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776952256; x=1777557056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClbUnDx7cL/cY/tkUoHImXX4Jy/87lG9dAwUJcgMD1k=;
        b=blV0tnylRHPZk4Drz4TFOTmZW3y3UJ60IezaXiM0xRIJ6JIdm5bCr3PrcwLiRNvTcq
         4VryLojRdxgdrFnLVDC7Uf5fzXYY/icmZiJJMV9srDUvod8sgCkKaqQedrBCoku2s5b/
         RxAJPBBSJyzZWmKVy8KUr1ai0C7gVKEp0pJM8sdLsbR76FxtCI0n3M8T1uQV8f2UqVqW
         R3p9Hkwc69jOt+Y7VwRBcFULOQiAp4/cT/P4mgz3VOztTHdG6KFXbL/38mB1SBS9uUbf
         8sTEoCaqDAd/OT/VRDBo4f4/GF7TJja6Y+unsfdIxB4V4jJX1UXaWaRe+163Hs49svcx
         WDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776952256; x=1777557056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ClbUnDx7cL/cY/tkUoHImXX4Jy/87lG9dAwUJcgMD1k=;
        b=ockNfUJ26NUM9n2R+5oBoaLRKhawwmh3eZ92lsw9nuteQeO58gPsJkR71D43oZjEim
         wqqiqCSxCj4QrZujGx3MaGsOJel1rk2gF+lTiUPB7AL6dEBeDDYjHssgb5hH4U/5pHR/
         8T0Z14fkSnrGePrmkXPe1p+VEqNs/5VSCBYzkW1y70CLt4ke3LE/UdmrS4LXj78Imsr0
         iQIzbFUOKFNYOruEIu9imSimWD6pdm9GhoDuvkDCpADaT6NxZiak9rlJRV1PdBIZckzd
         Dr8n04UyFe1+lxzdrFfjlXans/XOISSHZz/nvTcvC2PFFBEMrLetlgqwv76iRSubIWm8
         TjZg==
X-Forwarded-Encrypted: i=1; AFNElJ80caV/gTyZXQWwjrFDbxL+q+J91jchkk+LZ5ngs1UlkVeiaVUao5f5BERNgRN4rpvj6Qd9YUGOO5dJA7kad00UDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1zRGPCgcDA4jUHPuO2CoXSCW/qm993B0/a/QWn0RCRIGYL9+J
	vlBwHJgzsmrc1KGG+3rAj3MaQ2xU0N5uPKVAZLjs2H9EBJZhx8mtBPOP
X-Gm-Gg: AeBDieuQ9ClTFZL2PvzyfKoCOFs7+2bmVotVdZgWMBjAgu5OGavFV8R6pubkAJyA7OV
	TYDLR5wNicaYo1iIS4ZDVZWmCBhUHgcXnafJ1TWt3IDmRG2giZ7RLmZTzK0z+yizBlrg22pkDrj
	/CfY0TnrSaV/dbrz7rjiqsHqnyuJthBwVla0f4g/S9bDT9uoYXFaTlSU26626uWHrZrNSP/4k3o
	FsWLe6s/mGjgHnH2PHxuBMq5XWhuEx7Ui/kPNNL5ba8nCPc1zaMvSPk6RxuMOCQDY68hzWtRCFw
	M6930DZqMNJ0dJVAfJNZ1qJ9HnZcYsk0NidSN1pTWRZUqrpgVu/CWwTouu5npgqhE4D+N5TJr/z
	CUNi5TXhVTh8+GqW1M63PR/qc/uSXorBWjZ0R4ClWeGu35GzXGuQTQ4RgUfzix1Vdu/q30CCD+G
	8B9JM6NugTBIgCwCIo9bVWMYvf2kmAMjVN2rD9N8+DGyCURazEPdsZ4o8lCoo=
X-Received: by 2002:a05:600c:5246:b0:487:219e:42d with SMTP id 5b1f17b1804b1-488fb750a1dmr383325315e9.11.1776952255969;
        Thu, 23 Apr 2026 06:50:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:c2c5:eec8:9509:382e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52583fe7sm228134335e9.13.2026.04.23.06.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:50:55 -0700 (PDT)
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
Subject: [PATCH v6 2/3] clk: renesas: r8a08g046: Add support for PLL6 clk
Date: Thu, 23 Apr 2026 14:50:46 +0100
Message-ID: <20260423135050.238400-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423135050.238400-1-biju.das.jz@bp.renesas.com>
References: <20260423135050.238400-1-biju.das.jz@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5->v6:
 * Collected the tag.
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
index 6759957980f2..fed9607af216 100644
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

