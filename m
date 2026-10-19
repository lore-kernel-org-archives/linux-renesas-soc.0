Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3E04E9C30
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 12:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411357; cv=none; b=JYu09sdhtfpoMU92LogRdld0aAWBvzBMKnebcxAQukviuZIIVqvO0hGvWiHbn5P3tPSMxwpSvNvOoeX0EFxgKfPaepKTQsf2+Z4nAOVbT4zFLIi3mXViiFuHq2oAv6SiSTZD2pszXRxviw/LVxDw1LrwsyQWM1vS89LN4HFKZlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411357; c=relaxed/simple;
	bh=uQVh0hH9LOiQFkWJAC47ZRmPalYF0Gm3+xtXrFHsiRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RsIZNKQO/gJsFx/F3gkc2w5RUT47oah5qUDdgqDWuLw6Blgeahu08ddS7WStPP2kbXioS9f5PMVlZTtVol5DGdxOR4fQodlPIZMVlmCrVBDYlMu5Vh3x6CXifpoeXzYs0TzG7RGdx6SlkhT/T8FQSb6jggsQYQuoO04V0ziTuMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQgwj9W8; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQgwj9W8"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab4354db11so4502771fa.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 05:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792411354; x=1793016154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+FzSQIUgeH/VfYQMyxj7ZxdUI60Nk5bXsA4TNJtqzSI=;
        b=QQgwj9W8gJjPPyM8JX98hYEUicFNI8FtzFM3y8YBgERSW3mMxL67Yd9ccDGOZSSzAV
         voHwThf2v9pGjNPyCiFKOFjj62Ik2nlvsftXxkwa3m46fSt+XAV07dOpyF9V6mgwIGQQ
         kE+zF1aFPjvahStIx6OLkwbIqgwJR3bVjlPMPKAYaQBqNX4YcDNTLZ+ZAspsq8SwukWh
         HCunsOTbYHQLqpYqZxvLwfv00XrluLYzHvMwEUTteEZv70LWIxnJMblpBCCFDt2blDjK
         uOYTuYSWrErYHjPHl3YZwPq6y7w92Gss7lO2o84DtcoXBi9P5pCR0pS2nEJdfQHB80kh
         iGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411354; x=1793016154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+FzSQIUgeH/VfYQMyxj7ZxdUI60Nk5bXsA4TNJtqzSI=;
        b=R73615SARvgTRlg9kQzorlV/JyzQdD6kK57xgmMmAWeQ0dodxFjIvlj/mNZyTVqwSn
         lWTZFE3KgXV54adVv4uEblK4t5J0Gv4JZqUIW6RojOwXQsnLhelaP6m5Ywo8miY1LPc1
         SRg6Bjac2AEyWHO3jdZ3uuGzivcQJuLlI4NFKInLYpC3qA12j4NOSFmioEzaxnysdLOS
         Bw/Roaq00Agtod0Pegr11UZfix8KyLe3kCYBn24LENUZtgX5ykfrypFYBhhpfowwGtgr
         /JBRK7l1KYOdlTbRdf0/+tGxZTXmqo//OvntpspkII6KYoWC0Om4TkeVBzyZQZS/tfny
         Iv/g==
X-Forwarded-Encrypted: i=1; AKwUvBxgJ1CLnHiz2MGXXLQpWjpo+YsxMS5qN0nb/msSFZhEGb2OQd2Mkr6PMFBPtMB5uNvTgml9yMS+/Iyec4LWJa98Kw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLS56dbN5Cl6YUwu8Lil5zraQsssF7CSFeRQJf+2YS3Y0kSoJj/
	YRapEPc6HmPthlQdfLKxT4/MW0o2Z4cHykZxlLF5y7dd+bgwdi43ME7i
X-Gm-Gg: AYBFou0f3ohBITLhuGL7Krbp51/hxcLsKjC4d2VfN58N6R5K7A/YKgEBgkw5YKM0SWF
	ZlnPIO9iSETlLPGKfGjRZzi8YowGK7vDEbotddrByj+X1BcEILrQzHKjCGjW75LvoDC65Fvk9LK
	x2FUZZ3/8rJf61X9axUsg/WoqSA9OVipnkfcod9hj8Zzmo2woKyzh26JXL+4Xec/H50Ccy2TLY3
	3qmx5PoaR8bhrbQOIgWpyuLYnBUUkX4S5b7NmhTyT7PNWoXPMDkmOMK2HCOI72siZqjKnBmMT3x
	Z4KBgl+Jq0auYJyU+99ORYjnP+ARY4k53nIPRvJQHI5Lv7i8IISE755unzcct3G9Iu5Ix+C3HMR
	md2zR0eMvmKv+m3EwJqTKv57vknrwv1+fGFC/c52f5cvZWDCwvkboYFSB+s5e2dR9cKsGyq8LER
	sA0KPbUMdmWIDPLhY2NCbcILSGJqpBeMcMaRNCkRQOzlFOERHabTVXWINL1W9yUKKludTqzD0ED
	NAmAFg/XkDE4jiXRZOWZB+vo3Z+Q7qnp/gJeEh+sJn1AWpwWvwGu0Y=
X-Received: by 2002:a05:6512:68e:b0:5bc:b659:2d94 with SMTP id 2adb3069b0e04-5be50a9ac85mr2378131e87.54.1792411353642;
        Mon, 19 Oct 2026 05:02:33 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:1439:c865:be43:6676])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfdc4eecasm22400720f8f.13.2026.10.19.05.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:02:33 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tu Nguyen <tu.nguyen.xg@renesas.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v5 4/4] can: rcar_canfd: Add support for Renesas RZ/G3L
Date: Mon, 19 Oct 2026 13:02:16 +0100
Message-ID: <20261019120220.166163-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019120220.166163-1-biju.das.jz@bp.renesas.com>
References: <20261019120220.166163-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for Renesas RZ/G3L CANFD IP. RZ/G3L has 3 channels and
11 interrupts, compared 2 channels and 8 interrupts on RZ/G3S.
RZ/G3L has 288 buffers compared to 192 buffers on RZ/G3S.

Like RZ/G3S, the controller supports only CAN-FD mode and update
the comments to note that Classical CAN mode is not available on
RZ/G3L either.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Dropped the tags as there are new changes.
 * Documented Classical CAN mode is not available on RZ/G3L.
 * Added r9a08g046_hw_info to device data.
v3->v4:
 * Collected the tag.
v2->v3:
 * Fixed the typo 198->192 buffers in commit description.
 * Collected the tag.
v1->v2:
 * Updated commit description
 * Dropped RZ/G3S fallback
---
 drivers/net/can/rcar/rcar_canfd.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 86fa88ccf63b..0da2fefb047b 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -6,7 +6,7 @@
 
 /* The R-Car CAN FD controller can operate in either one of the below two modes
  *  - CAN FD only mode
- *  - Classical CAN (CAN 2.0) only mode (Except RZ/G3S)
+ *  - Classical CAN (CAN 2.0) only mode (Except RZ/G3{L,S})
  *
  * This driver puts the controller in CAN FD only mode by default. In this
  * mode, the controller acts as a CAN FD node that can also interoperate with
@@ -247,10 +247,10 @@
 #define RCANFD_CFFDCSTS_CFBRS		BIT(1)
 #define RCANFD_CFFDCSTS_CFESI		BIT(0)
 
-/* This controller supports either Classical CAN only mode(Except RZ/G3S) or
- * CAN FD only mode. These modes are supported in two separate set of register
- * maps & names. However, some of the register offsets are common for both
- * modes. Those offsets are listed below as Common registers.
+/* This controller supports either Classical CAN only mode(Except RZ/G3{L,S})
+ * or CAN FD only mode. These modes are supported in two separate set of
+ * register maps & names. However, some of the register offsets are common for
+ * both modes. Those offsets are listed below as Common registers.
  *
  * The CAN FD only mode specific registers & Classical CAN only mode specific
  * registers are listed separately. Their register names starts with
@@ -681,6 +681,26 @@ static const struct rcar_canfd_hw_info r9a08g045_hw_info = {
 	.fixed_canfd = 1,
 };
 
+static const struct rcar_canfd_hw_info r9a08g046_hw_info = {
+	.nom_bittiming = &rcar_canfd_gen4_nom_bittiming_const,
+	.data_bittiming = &rcar_canfd_gen4_data_bittiming_const,
+	.tdc_const = &rcar_canfd_gen4_tdc_const,
+	.regs = &rcar_gen4_regs,
+	.sh = &rcar_gen4_shift_data,
+	.rnc_field_width = 16,
+	.max_aflpn = 15,
+	.max_cftml = 31,
+	.max_channels = 3,
+	.postdiv = 2,
+	.shared_global_irqs = 0,
+	.multi_channel_irqs = 1,
+	.ch_interface_mode = 1,
+	.shared_can_regs = 1,
+	.external_clk = 1,
+	.fcan_pclk = 1,
+	.fixed_canfd = 1,
+};
+
 static const struct rcar_canfd_hw_info r9a09g047_hw_info = {
 	.nom_bittiming = &rcar_canfd_gen4_nom_bittiming_const,
 	.data_bittiming = &rcar_canfd_gen4_data_bittiming_const,
@@ -2404,6 +2424,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(rcar_canfd_pm_ops, rcar_canfd_suspend,
 static const __maybe_unused struct of_device_id rcar_canfd_of_table[] = {
 	{ .compatible = "renesas,r8a779a0-canfd", .data = &rcar_gen4_hw_info },
 	{ .compatible = "renesas,r9a08g045-canfd", .data = &r9a08g045_hw_info },
+	{ .compatible = "renesas,r9a08g046-canfd", .data = &r9a08g046_hw_info },
 	{ .compatible = "renesas,r9a09g047-canfd", .data = &r9a09g047_hw_info },
 	{ .compatible = "renesas,r9a09g077-canfd", .data = &r9a09g077_hw_info },
 	{ .compatible = "renesas,rcar-gen3-canfd", .data = &rcar_gen3_hw_info },
-- 
2.43.0

