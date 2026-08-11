Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F10380FC8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 18:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472862; cv=none; b=UwX5z7i6tSvlxANafjQ0wSRc1jehK0Irh6FGrkbzIdJz1pT4hsG6k5HicBkoxi05gN+XoaqcUOZq/c3We6GXYczQP+ZXKcrH2mKHzfmQHHMPUnbsVA7tojvJIJLGBOF1g7ST0dBfT3eQK5naTQbwOj5E71tfy+vd5r7K5XoWQHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472862; c=relaxed/simple;
	bh=y82V/y7wUGENbh+MTlJod7CIcKBdfucIx1cjreZViLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuu9s+6l+Mc/ikexQ27WU9xnpX7pmtdJ3FAsOBXPz/yqT3s6MgbAzoZaKUNyREwB6SU5Hqsb+DnumWe8rWx8eILLvE96oL+qdjX4kdzUrEcJRE9NXGY4cwrDY/lD2QxlbAJlJ6xhms9iPXUf7XRnwApHhY5byUXQ565x5/ycdA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1m7YLsJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1m7YLsJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49802c418b5so1074565e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 11:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786472859; x=1787077659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvgUchkimOkG9zLWcJshij/hNLupSa9WatTrjiEHw4g=;
        b=l1m7YLsJ46+JFQMgF+iTHndwP8kp4C6BIFjbYc0CT3xwzn0e1FEtynWwFn+bbI66Ie
         FX1gI3B2Ue9AB+IR54jBDgMIbkqBn+76kZI7AAsSR0EHaCz/dY8sE3akoDExhbjsdKto
         B43DsLRYiyTAdyQYg3J2fDVXOl4gnqSamiXUSESMbqmCOul7+oRCflasn2mdLBQPYKdd
         PJalx3DWQQ6hu8Zfc1ehPeFUZvDryEjGYCFFyVvTvpdgkOzZ6mXlPjVGKkCQ9UGfMqwy
         H95SLlzALtZguChtIOI6mmRYE6lu3gwfsudWfy0MUNnT17BLrlpbYRJ4KEroA0LyUiJD
         IEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786472859; x=1787077659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvgUchkimOkG9zLWcJshij/hNLupSa9WatTrjiEHw4g=;
        b=hvPo+NdZTfyWrLkAdAvGOxkna4R+Tv7SXA6q2CzoQnv7FEF9t7Re3GiaAdQJnc3azw
         EDthtSu8jx7BpeBO/Zerp1G7V8Tzs3gI9yQFsuKPTHfEIVyoBoJCHF3DZf7u/8a16d2j
         7acA5ggAb90HaDFwATp3Ek3Ud02Ay8MFqZKL9cmHEzHytFVtCDuVA095pqJWasD4B/Z+
         jlvas/YaIAlx4JNTmpo849Uo5S04ZDxipTO04Pn3MUzYwI8mv6I9bim5ax7RfznrQTYx
         M5uuQMX/FldLJ616qPmep48AmTSafUGf/sy8EfNBj7S7awPdcGERNIXUAxFqFf8UwULR
         HhbQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6HxL/T8EO0FPkl/9uNAu3pNa8ziBuiCHDeaOrf/cvizabneDcL7o/4ZXnPYsBZTWaZqPIxLyBQKHWuBaiO5a65A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5QpJGul2I9jwzFCRjTnDAQ6IeXJgWXoiZMTAhq2fkP5SKUdUo
	cU3d8DW+DzeAgVwrDfkmkJsCb5d+l44WV+IhNxyNmXbT1HLXS6/Zu8TE
X-Gm-Gg: AR+sD11AzCBLG4kyqqRUSN5vbG4XMHahTXxBW7PC+XkWAow+8bXn/Ne1J14C2NIUzRa
	15MLrFlfOIHsHmCi8d+g2R+Tll818OQFB5PeYn25hCnrQmLbQ5/fvY74Eae5CE7G2JRTMJJIMaV
	CGKCZMNc581huzWRGrrlsk4y5qaZVrkTsl9zfOFxqLDBEQ90hj0MAywrIUrK6GNZB+nrCObL0PW
	VAEkglN66cKs1Q6ftqVOGUxKuO2CMjhbkqnFGVZ0HCyLJ1fq1MyPKZ8Ba1ldn+C5RtGOPd20pjr
	rExfgDBQ1P2lu4z9NzACqSYdajeZPO+3qbaP7cwTqsBa5Q06JszG8l8ELIQTxFq81LvD6phmgN/
	UNUBj9H6zQpg0gbXXmfdZLh/w0wcsVYkYi2yg8U72y9sjf0datuqjjin8EtWIUYU6sU79VMCMc5
	9mQ4BgpdYLOFFEc+Gx+vGdk1q990NH6J750INPELRilAAzCTc4K9mOUJlctbjvKlDRJktufActe
	m25S7CPR5yi
X-Received: by 2002:a05:600c:35c4:b0:499:78b3:7b36 with SMTP id 5b1f17b1804b1-49978b37c8bmr106176575e9.11.1786472858658;
        Tue, 11 Aug 2026 11:27:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:935c:3ee:d543:9da1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aac8c47sm12499385e9.15.2026.08.11.11.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:27:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 7/9] clk: renesas: r9a08g046: Sort macro definitions alphabetically
Date: Tue, 11 Aug 2026 19:27:20 +0100
Message-ID: <20260811182729.360959-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Reorder the DDIV_PACK() and SEL_PLL_PACK() macro definitions so they
are grouped alphabetically by name, improving readability and making
it easier to spot duplicates or gaps. No functional change.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 drivers/clk/renesas/r9a08g046-cpg.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 4488bd1988e8..aaf329081e15 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -35,14 +35,11 @@
 #define G3L_DIVPL2A		DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
 #define G3L_DIVPL2B		DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
 #define G3L_DIVPL3A		DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
-#define G3L_DIV_SDHI0		DDIV_PACK(G3L_CPG_SDHI_DDIV, 0, 2)
-#define G3L_DIV_SDHI1		DDIV_PACK(G3L_CPG_SDHI_DDIV, 4, 2)
-#define G3L_DIV_SDHI2		DDIV_PACK(G3L_CPG_SDHI_DDIV, 8, 2)
-#define G3L_DIV_GE3D		DDIV_PACK(G3L_CPG_GE3D_DDIV, 0, 3)
 #define G3L_DIV_CA55_CORE0	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 0, 3)
 #define G3L_DIV_CA55_CORE1	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 4, 3)
 #define G3L_DIV_CA55_CORE2	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 8, 3)
 #define G3L_DIV_CA55_CORE3	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 12, 3)
+#define G3L_DIV_GE3D		DDIV_PACK(G3L_CPG_GE3D_DDIV, 0, 3)
 #define G3L_DIV_RSCI0		DDIV_PACK(G3L_CPG_RSCI_DDIV, 0, 2)
 #define G3L_DIV_RSCI1		DDIV_PACK(G3L_CPG_RSCI_DDIV, 2, 2)
 #define G3L_DIV_RSCI2		DDIV_PACK(G3L_CPG_RSCI_DDIV, 4, 2)
@@ -50,6 +47,9 @@
 #define G3L_DIV_RSPI0		DDIV_PACK(G3L_CPG_RSPI_DDIV, 0, 2)
 #define G3L_DIV_RSPI1		DDIV_PACK(G3L_CPG_RSPI_DDIV, 2, 2)
 #define G3L_DIV_RSPI2		DDIV_PACK(G3L_CPG_RSPI_DDIV, 4, 2)
+#define G3L_DIV_SDHI0		DDIV_PACK(G3L_CPG_SDHI_DDIV, 0, 2)
+#define G3L_DIV_SDHI1		DDIV_PACK(G3L_CPG_SDHI_DDIV, 4, 2)
+#define G3L_DIV_SDHI2		DDIV_PACK(G3L_CPG_SDHI_DDIV, 8, 2)
 #define G3L_SDIV_ETH_A		DDIV_PACK(G3L_CPG_ETH_SDIV, 0, 2)
 #define G3L_SDIV_ETH_B		DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
 #define G3L_SDIV_ETH_C		DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
@@ -73,16 +73,13 @@
 #define G3L_DIV_SDHI0_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 24, 1)
 #define G3L_DIV_SDHI1_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 25, 1)
 #define G3L_DIV_SDHI2_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 26, 1)
+#define G3L_DIV_GE3D_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 27, 1)
 
 #define G3L_SEL_SDHI0_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 16, 1)
 #define G3L_SEL_SDHI1_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 17, 1)
 #define G3L_SEL_SDHI2_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 18, 1)
-#define G3L_DIV_GE3D_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 27, 1)
 
 /* RZ/G3L Specific clocks select. */
-#define G3L_SEL_SDHI0		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 0, 2)
-#define G3L_SEL_SDHI1		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 4, 2)
-#define G3L_SEL_SDHI2		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 8, 2)
 #define G3L_SEL_ETH0_TX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 0, 1)
 #define G3L_SEL_ETH0_RX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 1, 1)
 #define G3L_SEL_ETH0_RM		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 2, 1)
@@ -101,6 +98,9 @@
 #define G3L_SEL_RSPI0		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 0, 2)
 #define G3L_SEL_RSPI1		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 2, 2)
 #define G3L_SEL_RSPI2		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 4, 2)
+#define G3L_SEL_SDHI0		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 0, 2)
+#define G3L_SEL_SDHI1		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 4, 2)
+#define G3L_SEL_SDHI2		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 8, 2)
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-- 
2.43.0

