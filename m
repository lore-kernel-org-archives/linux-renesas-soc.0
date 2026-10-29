Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300328;
	b=Ade1kFe+ADEGOlhfmkkO29TOKo2AAApKOLN6SSpL5/GMS6ZQN/erEUUEcd3Qdwv7f/44
	 6jqfZwbVO4mEuur5T7snwNsyA4Z/gbjl7vW5JsbQt1qKpEgU0Dioipb3Gu3F2wSJ3BCQm
	 IB1Rl/ves97wcdZHS+FPqJVLlcCanNi5yH54jL73ns84fu1ipNuiwo/xkIhlDpsnKznWE
	 Dykn4Z0QOCzSIykvAI5fAO8q46RBrcp8ICyDFdqw8pJVQ+hoh6uTgPUaG5R647gofc389
	 ga07tG0GJvhHVA2HySoyKcJk5unMWMScVi7fljunA7q7dgsSwtrS3SnBMgPqO5xsUsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=9tJApL13jYD80pBp1MzydfMpvJBp4BlcldlOMSU105M=;
	b=YquXxVa3rsjxD8rA8oIJ/12JD1IRN7KHki6iKBNkcBE5fhL82Shw1PhXc4rIZRwZglTV
	 c5XBivzT8FBkDR9yLsczzHSR6oeIqCeDwUWz5mXgrda15zB1GuJcDPBrvcl25XM9X21WS
	 tJCN2WJaxfsAbKNhWI4S8uth/vD7w1bOqL1md8yIltoIO2+6n+/nffYQioLBvm9JtsCJK
	 yyUrRjA6xJJicR/JkvhqzmoMwuxQU3HbQB93iuY/6P7xOxxWpwCJVlvX4oo/P/q1O3Uca
	 uUqugznwkG2HHD6b7Y63jxlegpwXjYnIP7F3SiVsT1gkOzQvNqvXSslnyVNo60u/nEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROAa1Dd0;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AAE606A326
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Oct 2026 18:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70AAE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROAa1Dd0
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso23314745e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Oct 2026 11:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300313; x=1793905113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tJApL13jYD80pBp1MzydfMpvJBp4BlcldlOMSU105M=;
        b=ROAa1Dd045ooc7vRm7+fs8AEm4NbqvkKt7xrNMxkXeL5nrPzcY9TL2+t1ItP41Bj1h
         Gj0Yw+2kJ8l+kNSemYW2kESFfoEU8UMMacjqSSIW0bRFCNfz+Lg97csRo9ivybDKCx6b
         cpbEwu0jXyZr8ncG/j/5+cnp2WBt+SllE1qPUvK8h2/pez0d2nC/ltA0Fzb4kJ4coydJ
         PtGenoP6nkCrUHXTffi0WTzrtc4jcqZTiYNy9Wt8Pq5vm2GDHA99cb6G+ciEU108Ua7M
         /EkqG2KUYwMMnVXEb/aZ/6F3jJD+2ZTqNtV7cNmVggCU99JqaA8ai/SvML8G+PW4/+Ld
         VPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300313; x=1793905113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9tJApL13jYD80pBp1MzydfMpvJBp4BlcldlOMSU105M=;
        b=BDscyGM1pKoH3BzhMPEHPHB36SlonTYZbvaJsCbwbKGtioijN0KKnkWN/iIfJGtrDk
         fW7vwkBF3B3oBZSTIvpOnNXKJNInW8whZzoB/zWpUcz02pYgj8gEbJukxquA15OOtINY
         4uyEARypqerdt096ExqrduvLnFqRPPQDXF9TNs+Ue2nluvBaY+3ywS5xnKtb2F61sDWB
         k9nWQTvrFr2hgnIqco74f7831oZxcoEHTCey1tjeu3YCQ9b+fUUtfVffU90GF6bYJ9ZU
         OXGIc+qgxaqtOKbFSuh1t9G6f3MN+DQOs+utb+wUH4PfzYuxGqsoxA68SxzkuGnBJs8T
         6jzQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2BIASOWq2WesZB4axfjm3ynakrv5TL5P5qWQ1vH00DUmz0javMzHlD2upAGsrVMvYXFxoOthmWk6xHCLhjsc4ew==@vger.kernel.org
X-Gm-Message-State: AFq9FYLpLzjiCZHYBe3q6Fzj8ADeEXbOMwdtiltPG5qetC1KC1zIavY6
	qbxhIFKprSQjxpJhKNRc0qQbaMukJP8ykoJF1QgqfAM6AiVcdkxNQY+S
X-Gm-Gg: AYBFou2N58Jjsn1l7IweztFk8ylSypqOQxNycCNORKcmvffX0PuVjOexqBvknVnBk7Z
	/2pmFPHoVHgao0OQmWXmoC9l2LbrpJsVXbsuSPRy3S5IkaBJgbYtk7YFi1nD/zH2mUew2gwT1cP
	bURTY1aYHoZx6roggldmj5VX5VEgKmRpyBnTmQzPIy11Sngrxri/BmxQNFvZwss724eFnCu7fdr
	qCooItriJ6iHqanG1Vf16eZUd0cWS9d0wPOmZM6DuZ5g2o+IVmPtt33Trxr2sufHqLyDl5kzYFr
	x/x4ZA1CI+ZpzgEcIfenYoTT0FNu+lw8XXiRn64kJvN2+chaZdecZ0N48ipG0PUFlqVYv9u7aoh
	SnMfUTJOgyw7kq8s9ktD5iAqkpUqRgOA6PVz2XEf0lFkhP9kh4vN2eUFm6na29oE6PsPJ4Ls758
	wfXgBkGazNfU/Ii+4rHhkVqiYO+Wh+lClAn7sxgIx+BUFE4BBdak58W9DcVI8alnExVFaoN2aNC
	4sa7RoQsKKZ5iv1xWVCGjcj7JwOCdMxsXhPRPE5WgbAT8Ofcjcz2HtSAqqYiHrBOjiIg4Vc7tGW
	eLBDt6IqXJGcJYpiiB262ShWTAKhAokDv3tzxGjKbsEhyCyQTAhroelmbGR3yarXvrvDXHDb7yh
	pEYOtUXkzEt0=
X-Received: by 2002:a05:600c:8183:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4a9677c92d0mr123815985e9.35.1793300312779;
        Thu, 29 Oct 2026 11:58:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:eafc:6fb2:6c68:5ae0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm94291535e9.10.2026.10.29.11.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:58:32 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Thu, 29 Oct 2026 18:58:28 +0000
Subject: [PATCH v9 7/7] pwm: rzg2l-gpt: Add RZ/G3E support
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261029-gpt_rzg3e-v9-7-f3a5520388d3@bp.renesas.com>
References: <20261029-gpt_rzg3e-v9-0-f3a5520388d3@bp.renesas.com>
In-Reply-To: <20261029-gpt_rzg3e-v9-0-f3a5520388d3@bp.renesas.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793300303; l=5197;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=rMti4nVWaXcqMBwGhXa7IT8v4yzgTB4dEpyc6qkRjiM=;
 b=MPzAnHk+d4TjXb6vN0vwjaqQCFI08wtO+hhJ/GBLBNIu4YFoESZUfTHGDuJ8KuU5HgAzDQTtj
 VL0IZpo1idQAMsc+lcltoqN5JKsbqXl5cxXaThMr+PUwBuPuYMHS08Z
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add RZ/G3E GPT support. It has multiple clocks and resets compared to
RZ/G2L. Also prescale field width and factor for calculating prescale
are different.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * Updated a comment in limitation section '8 Channels'->'8 channels'.
v7->v8:
 * Updated rzg3e_gpt_calculate_prescale() with >= 64.
v6->v7:
 * No change.
v5->v6:
 * Updated rzg3e_gpt_calculate_prescale().
 * Updated comment in rzg2l_gpt_calculate_period_or_duty().
v4->v5:
 * No change.
v3->v4:
 * Added RZG3E_GTCR_TPCS bit definition for RZ/G3E and added to
   rzg3e_data.
v2->v3:
 * No change.
v1->v2:
 * Added link to hardware manual
 * Updated limitation section
 * Collected tag
---
 drivers/pwm/pwm-rzg2l-gpt.c | 45 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 488839e99464..5ce662559263 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -6,15 +6,21 @@
  *
  * Hardware manual for this IP can be found here
  * https://www.renesas.com/eu/en/document/mah/rzg2l-group-rzg2lc-group-users-manual-hardware-0?language=en
+ * https://www.renesas.com/en/document/mah/rzg3e-group-users-manual-hardware
  *
  * Limitations:
  * - Counter must be stopped before modifying Mode and Prescaler.
  * - When PWM is disabled, the output is driven to inactive.
  * - While the hardware supports both polarities, the driver (for now)
  *   only handles normal polarity.
- * - General PWM Timer (GPT) has 8 HW channels for PWM operations and
- *   each HW channel have 2 IOs.
+ * - For RZ/G2L, the General PWM Timer (GPT) has 8 HW channels for PWM
+     operations and each HW channel have 2 IOs (GTIOCn{A, B}).
  * - Each IO is modelled as an independent PWM channel.
+ * - For RZ/G3E, the General PWM Timer (GPT) has 16 HW channels for PWM
+     operations (GPT0: 8 channels, GPT1: 8 channels) and each HW channel
+     have 4 IOs (GTIOCn{A,AN,B,BN}). The 2 extra IOs GTIOCnAN and GTIOCnBN
+     in RZ/G3E are anti-phase signals of GTIOCnA and GTIOCnB. The
+     anti-phase signals of RZ/G3E are not modelled as PWM channel.
  * - When both channels are used, disabling the channel on one stops the
  *   other.
  * - When both channels are used, the period of both IOs in the HW channel
@@ -47,6 +53,7 @@
 #define RZG2L_GTCR_CST		BIT(0)
 #define RZG2L_GTCR_MD		GENMASK(18, 16)
 #define RZG2L_GTCR_TPCS		GENMASK(26, 24)
+#define RZG3E_GTCR_TPCS		GENMASK(26, 23)
 
 #define RZG2L_GTCR_MD_SAW_WAVE_PWM_MODE	FIELD_PREP(RZG2L_GTCR_MD, 0)
 
@@ -147,6 +154,22 @@ static u8 rzg2l_gpt_calculate_prescale(u64 period_ticks)
 	return prescale;
 }
 
+static u8 rzg3e_gpt_calculate_prescale(u64 period_ticks)
+{
+	u32 prescaled_period_ticks;
+	u8 prescale;
+
+	prescaled_period_ticks = period_ticks >> 32;
+	if (prescaled_period_ticks >= 64 && prescaled_period_ticks < 256)
+		prescale = 8;
+	else if (prescaled_period_ticks >= 256)
+		prescale = 10;
+	else
+		prescale = fls(prescaled_period_ticks);
+
+	return prescale;
+}
+
 static int rzg2l_gpt_request(struct pwm_chip *chip, struct pwm_device *pwm)
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
@@ -228,7 +251,8 @@ static u64 rzg2l_gpt_calculate_period_or_duty(struct rzg2l_gpt_chip *rzg2l_gpt,
 
 	/*
 	 * The calculation doesn't overflow a u64 because,
-	 * prescale ≤ 5 for info->prescale_mult = 2 and so
+	 * prescale ≤ 5 for info->prescale_mult = 2,
+	 * prescale ≤ 10 for info->prescale_mult = 1, and so
 	 * tmp = val << (info->prescale_mult * prescale) * NSEC_PER_MSEC
 	 *     < 2^32 * 2^10 * 10^6
 	 *     < 2^32 * 2^10 * 2^20
@@ -482,6 +506,14 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	if (IS_ERR(rstc))
 		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert reset control\n");
 
+	rstc = devm_reset_control_get_optional_exclusive_deasserted(dev, "rst_s");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert rst_s reset\n");
+
+	clk = devm_clk_get_optional_enabled(dev, "bus");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Cannot get bus clock\n");
+
 	clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "Cannot get clock\n");
@@ -520,6 +552,12 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct rzg2l_gpt_info rzg3e_data = {
+	.calculate_prescale = rzg3e_gpt_calculate_prescale,
+	.gtcr_tpcs = RZG3E_GTCR_TPCS,
+	.prescale_mult = 1,
+};
+
 static const struct rzg2l_gpt_info rzg2l_data = {
 	.calculate_prescale = rzg2l_gpt_calculate_prescale,
 	.gtcr_tpcs = RZG2L_GTCR_TPCS,
@@ -527,6 +565,7 @@ static const struct rzg2l_gpt_info rzg2l_data = {
 };
 
 static const struct of_device_id rzg2l_gpt_of_table[] = {
+	{ .compatible = "renesas,r9a09g047-gpt", .data = &rzg3e_data },
 	{ .compatible = "renesas,rzg2l-gpt", .data = &rzg2l_data },
 	{ /* Sentinel */ }
 };

-- 
2.43.0

