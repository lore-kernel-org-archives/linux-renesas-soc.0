Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B78841DEDC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 12:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576163; cv=none; b=QYe130+3BrQy5aleTCUZ/2b5lMocTpOc7wqA2Dry1fulzP2oMzr+TRLxj+otuellbe6ErbFeSMZOwkhH2Eii905XN7XpH2lpYtKIPcxXxn0mqNMmjnWv1GYPUvUgs9tbbIW8hY64z9rFX2oOCOKJH9ueqTk9edrVxgGn0ZCbhIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576163; c=relaxed/simple;
	bh=sffgno/gC67sZdNEFUdmg5sB/+7lWuFA41I2RUKvMOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XUPYXeNi2NZuQtOF4uuZEfxk4fw4nKh/J2EPklttqQblGZIgxagxYet7sd7f/1LFT84VSmugNjK/F1N7ZQie8Lw18sGoklz0yYxqI8gZK00YOdt6OdnO3cDixURPxxMhJeKNv7XUlWvK2pqSY7z8gsDBg+0OUhrB86iMiGJgYAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KbWcOsSp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KbWcOsSp"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1600d040e4so509897466b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 05:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576158; x=1788180958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lfMn5bcQJYdZF8OAr9fNY6Kn2fwXmO0B8zGw+NRHLnY=;
        b=KbWcOsSpeYpYxIstU0AneD/VuHiRpVbmF+Sit6SE0UqQO8LKC55QXKN5UQYWyKeJ6f
         8Ie9SmcF3e8wzLs3PWwU+JglaYCkTyJ2tASZhw94PX4zd5cm/rlDUjcqj+yVaX+xvJNe
         UamsuU607hE4NKN0OdDQBSm2FLbYGyogUEiWMseR0KS9/Mc9hyy8rPxHngGAIc4tvF/4
         bu8r128vSlXmTlgFZsDDffWrjxj/JQ3tzAeDrsspKpThgo/Ff2qjA28/yspvf2vuuQ+B
         XvbgSQ+p/ChYat7pT/Lhq0lwaNz1FWYKeCUu3YJDKMR0WoYCYjHi4y2k+RsmWCoN+YU6
         bllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576158; x=1788180958;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfMn5bcQJYdZF8OAr9fNY6Kn2fwXmO0B8zGw+NRHLnY=;
        b=OwrjtAtk0Tu+a4wsbGFkpuvYGgp5yM6O6KYy88gyhxsPeirpKdn4YoYKfVjthAuAxb
         wVJIKEBj1GIa1qO01awcUPzVUugwQnCAkPHuTRqgF5YD4scO0cS33GMTT5IjiCWd3ehJ
         uHwSJTgkyaFQJlJSIaOUyrnwXnsYcV7JvQX7ONSL9EuZzzHCP68kdwOWW4fjGiYgE5v4
         UNYLiMm/G0qQaRsSLuSwIaCnaNy0PaKwfqpKsAgC0OO/hCsKyzcqkkYw2ghMa+ZB3TZD
         0fbMJ7YHYiSnMMRutagi9p265L5gZajuFrLG/fZp6Sye6OlFcpzqJtxCV52R3juRvoYN
         IbWg==
X-Forwarded-Encrypted: i=1; AHgh+RrE71aUtMXvFR2b02ZUmV3uIpna+2iazPJkoUUU/b4t9yU3h5zRW5sWGp2SUAaIkiOl7VrEy+Kt7f+EwGGNYblwvw==@vger.kernel.org
X-Gm-Message-State: AFuF++ny+Y/l8jmi0yuPFXm53cVyhAH8tbpkyqXt02anuCBxojI7Y2xq
	UdpahcWWB6EZ0ePRZZtvlroCeFknl0Igajg03eg3QrG2iPhHWtFZ+qxn
X-Gm-Gg: AR+sD100Ss31gRxrKGcoBLjpj50ebBR/V8SCduWbG9H4Q4GvgRRZXTDGvVglWxc095U
	B0bt/NXSsgq6geA5xpPB6CfE3eg6cnEOpAzHcAkFe0S0Gc1E+WHVodSDSQk4/qmAkk3BrvNBwi9
	gi5cGYa5brLAzHqUn2XSigljJ6D+Gg7LVBWOI60gbw2tumTGomAnKT6koHi8YjqjtaBZGyaijkF
	FQdujObY0/XXjaQxI1rqFJmqvTqyKxFlt+iLqooqcJBVsMacIe7eJjtgUWPvBwAU6MLCf32DJUo
	ujE5yiQuhQq30yl6/bLgpt+OrANoIPMN5GwrbfZqNbzHiejC/AFAs8reY+/mtL489mZJXjXX9Uu
	urI+Nbu25und9rKniUFPLr3e2Tl3eY3oDs1ywG7DnlGmeh5eToAG8C+ZUq4mjbfKy6EKGodrYA+
	eAH+t9+gS+abIXtdDwTwhmeSuwI70imKIZlARUkJnBkbIGYO4bWW8dPrTvTXftrvTcGkq/cF7WK
	Pa08GFdzFifEQ==
X-Received: by 2002:a17:907:1c19:b0:c16:785:cfb6 with SMTP id a640c23a62f3a-c246d5b7ebemr2557044366b.3.1787576158306;
        Mon, 24 Aug 2026 05:55:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:dea4:599b:49a8:96f5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9c9fsm1245403066b.39.2026.08.24.05.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:55:57 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v7 7/9] pwm: rzg2l-gpt: Add RZ/G3E support
Date: Mon, 24 Aug 2026 13:55:13 +0100
Message-ID: <20260824125523.131762-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824125523.131762-1-biju.das.jz@bp.renesas.com>
References: <20260824125523.131762-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add RZ/G3E GPT support. It has multiple clocks and resets compared to
RZ/G2L. Also prescale field width and factor for calculating prescale
are different.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
 drivers/pwm/pwm-rzg2l-gpt.c | 45 ++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 2a1c5a22484b..c61c648f71a8 100644
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
+     operations (GPT0: 8 channels, GPT1: 8 Channels) and each HW channel
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
 
@@ -146,6 +153,22 @@ static u8 rzg2l_gpt_calculate_prescale(u64 period_ticks)
 	return prescale;
 }
 
+static u8 rzg3e_gpt_calculate_prescale(u64 period_ticks)
+{
+	u32 prescaled_period_ticks;
+	u8 prescale;
+
+	prescaled_period_ticks = period_ticks >> 32;
+	if (prescaled_period_ticks > 64 && prescaled_period_ticks < 256)
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
@@ -227,7 +250,8 @@ static u64 rzg2l_gpt_calculate_period_or_duty(struct rzg2l_gpt_chip *rzg2l_gpt,
 
 	/*
 	 * The calculation doesn't overflow a u64 because,
-	 * prescale ≤ 5 for info->prescale_mult = 2 and so
+	 * prescale ≤ 5 for info->prescale_mult = 2,
+	 * prescale ≤ 10 for info->prescale_mult = 1, and so
 	 * tmp = val << (info->prescale_mult * prescale) * NSEC_PER_MSEC
 	 *     < 2^32 * 2^10 * 10^6
 	 *     < 2^32 * 2^10 * 2^20
@@ -460,6 +484,14 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
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
@@ -498,6 +530,12 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
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
@@ -505,6 +543,7 @@ static const struct rzg2l_gpt_info rzg2l_data = {
 };
 
 static const struct of_device_id rzg2l_gpt_of_table[] = {
+	{ .compatible = "renesas,r9a09g047-gpt", .data = &rzg3e_data },
 	{ .compatible = "renesas,rzg2l-gpt", .data = &rzg2l_data },
 	{ /* Sentinel */ }
 };
-- 
2.43.0

