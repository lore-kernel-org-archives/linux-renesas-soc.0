Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FEB48C8D9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 15:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672943; cv=none; b=IyQasnv/8K5PBr/qjjzJ3WCKjINhkmtZ1+GA5Z1ktJ+KSBjStNhVVbptrV5R4B4szHsnpNqUN9iO6GV6GmVETruAPHdEzPSXCqKsQBGlXvefbBzJH5Gn9ddAK5hA2dRYKj7oM4QEB6StsC9O3qlzMZOfi8h80pTSO0FV3I12K2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672943; c=relaxed/simple;
	bh=Fr6vZ1NVUY/ybNbFnbE6lWd5PnSaqK+am3TZW/YW1RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H1uTJ6K2ldX3J+VHb/TLB6QVxU98t+5ERC1B2zrOdqrNHpQGTWLlEaGVuwCp2PnaqPJviiHBJ4GqaYar4I1mmEHxYpB+jas2ukkFwHjkRv3rDU9t+SL4dDecE1RSx6eGFqc0lLa3YicDut01PE9Z1p/kb5aXzNRhtzrJg3Rj3hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=raaf8iqW; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raaf8iqW"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c197eaaab00so822458166b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 08:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787672938; x=1788277738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VNEW08Lt7wc/0z32MZRrbpAxfkdBvCnakXic3N1PQJE=;
        b=raaf8iqW+TN9l7+s5QcDe2BRQj9x0cBHhQcbnFfaZ0pZle+kuYGCJSrrpSpmwJ/c5B
         9guxkSGZDCTxncVRa3N94TZAUUrgBuVO57gvGaHM+pIMt2dbQmKGZnOO29v2HArYON89
         XS6okDmJxUguRIDWVcUe0t6TzND5XTkEPiSATxKLhL4hv2U9lzkWo4/xGoYBlskLL7cO
         S0fNFPxD+x4/X92RJq9Fq1vd1jqVXdZmFGt7wuHDNOQqIrDADS6r1pzkL3en6WR6uSU3
         G3fYMjymZHs0ZfVRRsmgnt1GhuiaSNoX0Q6sViyNVjM6g8AlSxvlp8mYNp6krB1b08nk
         z55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787672938; x=1788277738;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VNEW08Lt7wc/0z32MZRrbpAxfkdBvCnakXic3N1PQJE=;
        b=OEYNQIYT7QitASnnDXLuilpGTZnw/Oe6DBrJ5sxhsZSgMkyVCeY5Vtjb+TgfCv/hY5
         W+tZGGi62zLXRNTGa1BUU1IlRic4S68F3MNICoaS6xyk/VmoUGMfBjqLi4MvR78ogi2h
         hdpspxtEOiNus3SOntm+A7bf6M+QRs5tB00yDIjVXrCL+zf7rLtTD7zmO8vMH/3FmMcG
         xgHrwLNdDN7SuXYkVzCsjDpoiYq17x/iSLrikkVPhIorDRnRfLH5wApjiM21CCdNTrpo
         IvyLxkoZqA1OVH93Iv90NKJW+nmsrg1xGHOMWp0bGKMHnso12TKfdlTW71UVMJQEV2wa
         kNOA==
X-Forwarded-Encrypted: i=1; AHgh+RqCEqUUM8FAH6spRu8yIbUv07r/sesHydXDWXVb8UND9BSEfs7hHmr3PudEbgA+QD/L1PavVSsTRiiQtjaVvz/kiw==@vger.kernel.org
X-Gm-Message-State: AFuF++mLDU/qGQ0lXK3wcmw+rdr6pwRV2Uy/a4vCf37SQiW88ExkfwzG
	enKS1ga6pOYnDeSEeCMHNAWdsSbV4/U+L8aAvsoHqaRPQ3iBWH9MZj2I
X-Gm-Gg: AR+sD12WLbR3do+nfjmPIXMvxNqj903TJGW9x7N2GffwVwsFkQjTDGo4wcHXwbDSB7/
	lZxngLf7tMWIQsip2r8bHj0yCGXMMp6aMIZhAebhDqCVSaT0HNAGRLAqDBGWBOUrlfxfAn4YfQp
	m/SByrlCsJEHMtNnH/rInshS9FvPNuxySn8HcqpHq6uE35djc8BbLWZ+OzSvngGjSsEapiLuiRz
	vgvRvrEot9bxhM7MANYJdeCsqGopSAHgOeqPnn227E285esr38h2GNtYLCKqW7SXlR8N5Pj7Z/c
	WO0Fr2rUB6XYZ7I5yPdUp2X1msj8RCjiw3tNGHhxwhGZft9or/kQwzcPe9TJpROwLFO/6F3VUUQ
	L+bUqn8znhsxac8CXLyAvbZ/zywK6N8ERFjhjqhKR9rlhuzhYgBkrcgwsRwhfNo+AT9SPjA2OmZ
	E3CroAkncQW/v/QiBtHNNTzTHXldYS/PpfNsaQQiGmtGGVPKH6gShbvcUZHgzYPyIBndDfG5sL2
	V7khqSAbIEh
X-Received: by 2002:a17:906:f591:b0:c24:6045:2a94 with SMTP id a640c23a62f3a-c24e5c8ad60mr1042925466b.4.1787672938487;
        Tue, 25 Aug 2026 08:48:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:81d:57c0:e4cb:959c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a6fd69asm16682066b.18.2026.08.25.08.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:48:58 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 9/9] pwm: rzg2l-gpt: Add support for gpt linking with poeg
Date: Tue, 25 Aug 2026 16:48:37 +0100
Message-ID: <20260825154847.197948-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825154847.197948-1-biju.das.jz@bp.renesas.com>
References: <20260825154847.197948-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The General PWM Timer (GPT) is capable of detecting "dead time error
and short-circuits between output pins" and send Output disable
request to poeg(Port Output Enable for GPT).

Add support for linking poeg group with gpt, so that gpt can control
the output disable function by adding rzg2l_gpt_poeg_init() to parse
the renesas,poegs device tree property and establish links between POEG
groups (A–D) and GPT hardware channels (0–7). For each valid, enabled
POEG phandle entry, the driver:
 - Reads the renesas,poeg-id from the POEG node and validates it against
   the supported range
 - Records the GPT–POEG association in a per-chip bitmap (poeg_gpt_link)
 - Configures GTINTAD to route the output disable request to the correct
   POEG group
 - Configures GTIOR (OADF/OBDF fields) to set both output pins to
   high-impedance on an output disable event

Non-enabled POEG nodes are silently skipped.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * No change.
v6->v7:
 * Added rzg2l_gpt_poeg_link_channels() and used __free for deallocating
   device node pointer.
 * Replaced dev_err()->dev_err_probe() in rzg2l_gpt_poeg_link_channels().
 * Replaced local variable cells with num_poeg_pairs in
   rzg2l_gpt_poeg_init().
v5->v6:
 * Dropped extra space in poegs variable assignment in
   rzg2l_gpt_poeg_init().
 * Updated the comment sections of rzg2l_gpt_poeg_init() with POEG and GPT
   in upper-case and replaced configure->configures.
 * Format specifiers in dev_err() changed from %d to %u in
   rzg2l_gpt_poeg_init().
v5:
 * Updated commit description.
 * Replaced return type of rzg2l_gpt_poeg_init() from void->int and
   probe() checks this return value.
 * Added more error checks in rzg2l_gpt_poeg_init() 
V24 from [1]:
[1] https://lore.kernel.org/all/20250226144531.176819-1-biju.das.jz@bp.renesas.com/
---
 drivers/pwm/pwm-rzg2l-gpt.c | 92 +++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 6f47e14cceab..ff28ad0ba75f 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -45,6 +45,7 @@
 #define RZG2L_GTCR(ch)		(0x2c + RZG2L_GET_CH_OFFS(ch))
 #define RZG2L_GTUDDTYC(ch)	(0x30 + RZG2L_GET_CH_OFFS(ch))
 #define RZG2L_GTIOR(ch)		(0x34 + RZG2L_GET_CH_OFFS(ch))
+#define RZG2L_GTINTAD(ch)	(0x38 + RZG2L_GET_CH_OFFS(ch))
 #define RZG2L_GTBER(ch)		(0x40 + RZG2L_GET_CH_OFFS(ch))
 #define RZG2L_GTCNT(ch)		(0x48 + RZG2L_GET_CH_OFFS(ch))
 #define RZG2L_GTCCR(ch, sub_ch)	(0x4c + RZG2L_GET_CH_OFFS(ch) + 4 * (sub_ch))
@@ -62,12 +63,19 @@
 #define RZG2L_GTUDDTYC_UP_COUNTING	(RZG2L_GTUDDTYC_UP | RZG2L_GTUDDTYC_UDF)
 
 #define RZG2L_GTIOR_GTIOA	GENMASK(4, 0)
+#define RZG2L_GTIOR_OADF	GENMASK(10, 9)
 #define RZG2L_GTIOR_GTIOB	GENMASK(20, 16)
+#define RZG2L_GTIOR_OBDF	GENMASK(26, 25)
 #define RZG2L_GTIOR_GTIOx(sub_ch)	((sub_ch) ? RZG2L_GTIOR_GTIOB : RZG2L_GTIOR_GTIOA)
 #define RZG2L_GTIOR_OAE		BIT(8)
 #define RZG2L_GTIOR_OBE		BIT(24)
 #define RZG2L_GTIOR_OxE(sub_ch)		((sub_ch) ? RZG2L_GTIOR_OBE : RZG2L_GTIOR_OAE)
 
+#define RZG2L_GTIOR_OADF_HIGH_IMP_ON_OUT_DISABLE	BIT(9)
+#define RZG2L_GTIOR_OBDF_HIGH_IMP_ON_OUT_DISABLE	BIT(25)
+#define RZG2L_GTIOR_PIN_DISABLE_SETTING \
+	(RZG2L_GTIOR_OADF_HIGH_IMP_ON_OUT_DISABLE | RZG2L_GTIOR_OBDF_HIGH_IMP_ON_OUT_DISABLE)
+
 #define RZG2L_INIT_OUT_HI_OUT_HI_END_TOGGLE	0x1b
 #define RZG2L_GTIOR_GTIOA_OUT_HI_END_TOGGLE_CMP_MATCH \
 	(RZG2L_INIT_OUT_HI_OUT_HI_END_TOGGLE | RZG2L_GTIOR_OAE)
@@ -78,12 +86,17 @@
 	((sub_ch) ? RZG2L_GTIOR_GTIOB_OUT_HI_END_TOGGLE_CMP_MATCH : \
 	 RZG2L_GTIOR_GTIOA_OUT_HI_END_TOGGLE_CMP_MATCH)
 
+#define RZG2L_GTINTAD_GRP_MASK	GENMASK(25, 24)
+
 #define RZG2L_MAX_HW_CHANNELS	8
 #define RZG2L_CHANNELS_PER_IO	2
 #define RZG2L_MAX_PWM_CHANNELS	(RZG2L_MAX_HW_CHANNELS * RZG2L_CHANNELS_PER_IO)
 #define RZG2L_MAX_SCALE_FACTOR	1024
 #define RZG2L_MAX_TICKS		((u64)U32_MAX * RZG2L_MAX_SCALE_FACTOR)
 
+#define RZG2L_MAX_POEG_GROUPS	4
+#define RZG2L_LAST_POEG_GROUP	3
+
 struct rzg2l_gpt_info {
 	u8 (*calculate_prescale)(u64 period);
 	u32 gtcr_tpcs;
@@ -99,6 +112,7 @@ struct rzg2l_gpt_chip {
 	u32 channel_request_count[RZG2L_MAX_HW_CHANNELS];
 	u32 channel_enable_count[RZG2L_MAX_HW_CHANNELS];
 	u8 prescale[RZG2L_MAX_HW_CHANNELS];
+	DECLARE_BITMAP(poeg_gpt_link, RZG2L_MAX_POEG_GROUPS * RZG2L_MAX_HW_CHANNELS);
 };
 
 /* This represents a hardware configuration for one channel */
@@ -468,6 +482,80 @@ static const struct pwm_ops rzg2l_gpt_ops = {
 	.write_waveform = rzg2l_gpt_write_waveform,
 };
 
+static int rzg2l_gpt_poeg_link_channels(struct device *dev,
+					struct rzg2l_gpt_chip *rzg2l_gpt,
+					struct of_phandle_args *of_args)
+{
+	struct device_node *np __free(device_node) = of_args->np;
+	u32 poeg_grp, bitpos;
+
+	if (of_args->args[0] >= RZG2L_MAX_HW_CHANNELS)
+		return dev_err_probe(dev, -EINVAL, "Invalid channel %u >= %u\n",
+				     of_args->args[0], RZG2L_MAX_HW_CHANNELS);
+
+	if (!of_device_is_available(of_args->np))
+		/* It's fine to have a phandle to a non-enabled poeg. */
+		return 0;
+
+	if (!of_property_read_u32(of_args->np, "renesas,poeg-id", &poeg_grp)) {
+		if (poeg_grp > RZG2L_LAST_POEG_GROUP)
+			return dev_err_probe(dev, -EINVAL, "Invalid poeg group %u > %u\n",
+					     poeg_grp, RZG2L_LAST_POEG_GROUP);
+
+		bitpos = of_args->args[0] + poeg_grp * RZG2L_MAX_HW_CHANNELS;
+		set_bit(bitpos, rzg2l_gpt->poeg_gpt_link);
+
+		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTINTAD(of_args->args[0]),
+				 RZG2L_GTINTAD_GRP_MASK, poeg_grp << 24);
+
+		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTIOR(of_args->args[0]),
+				 RZG2L_GTIOR_OBDF | RZG2L_GTIOR_OADF,
+				 RZG2L_GTIOR_PIN_DISABLE_SETTING);
+	}
+
+	return 0;
+}
+
+/*
+ * This function links a POEG group{A,B,C,D} with a GPT channel{0..7} and
+ * configures the pin for output disable.
+ */
+static int rzg2l_gpt_poeg_init(struct platform_device *pdev,
+			       struct rzg2l_gpt_chip *rzg2l_gpt)
+{
+	const char *poeg_name = "renesas,poegs";
+	struct of_phandle_args of_args;
+	struct property *poegs;
+	int num_poeg_pairs;
+	int ret;
+
+	poegs = of_find_property(pdev->dev.of_node, poeg_name, NULL);
+	if (!poegs)
+		return 0;
+
+	num_poeg_pairs = of_property_count_u32_elems(pdev->dev.of_node, poeg_name);
+	if (num_poeg_pairs < 0)
+		return num_poeg_pairs;
+
+	if (num_poeg_pairs & 1)
+		return -EINVAL;
+
+	num_poeg_pairs >>= 1;
+	for (unsigned int i = 0; i < num_poeg_pairs; i++) {
+		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
+						       poeg_name, 1, i,
+						       &of_args);
+		if (ret)
+			return ret;
+
+		ret = rzg2l_gpt_poeg_link_channels(&pdev->dev, rzg2l_gpt, &of_args);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int rzg2l_gpt_probe(struct platform_device *pdev)
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt;
@@ -529,6 +617,10 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	if (rzg2l_gpt->rate_khz * KILO != rate)
 		return dev_err_probe(dev, -EINVAL, "Rate is not multiple of 1000\n");
 
+	ret = rzg2l_gpt_poeg_init(pdev, rzg2l_gpt);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to link gpt with poeg\n");
+
 	mutex_init(&rzg2l_gpt->lock);
 
 	chip->ops = &rzg2l_gpt_ops;
-- 
2.43.0

