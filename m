Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EFB421F1E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 14:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201008; cv=none; b=K0XoNckY3fQEwvX1FlOAbhA28pQ2CBMoshYKcl3BOV2f4QG/YbpGiMN3OLm75ysaykjzSnjFSPPrJCj69vHIHvXTwn/Qg1+Qlnump3Jltmlz0eWngVW4HawVh4idriTWEeCYlin0xaCmGRrhLKA0xktf/D37bGj0mFw7T1D1P90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201008; c=relaxed/simple;
	bh=TZ0Nhq9pboAkoeLu9YpOxbUkj3FPRhIy0on5upn3npE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWzTkwQRqz2DlYff5tXF42pXTNT0wLAsCOfqZtOi650Sc6zeZa6q827zWw1C/PeGN9kGBdH+zN4g4lZnw1sBfv7oFl8METcG0EalV44tT8SYbzClJyuMDnm/X1pUs6c1cwN3L9w7LpbpwBPKftUZL9YtjiowIaSwh6crzjc5bOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+PFeZdS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+PFeZdS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43992e14638so2062442f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772201006; x=1772805806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtfwJFU2C3F6SuqP8t7kDFFN/csxu26OVZQtc7hGK+U=;
        b=B+PFeZdSZmqb+lrLGF+w/6NVmgEDhhHhqiOt+JmocmVsC9xpSvstC/0k7p65hq2zRy
         gLs5Lv5mmRr1SDQef1A1CEvgCr2ieZm7VqX2RjxgLGrgS/W3BeiP/rRyJznkjMJyrNMZ
         LY2xMARLKWLU6LrL0PoyBKMijiicnU6Jsy25WGpZJj+dNBAex3l1fHArQ/rrn9j8XycF
         HMsGFJ4c5y/SnfTY0kjS6BP0hUDl/Mlb54uBD8t5uGS1ucHJ+eFXsi1U2p+hXzPY57J7
         ZExQEjVyhN5yRzRS4OlHYH2UegYtm/C77VRNIJFwrK40IYpqsPWcw0K0R4+lFeWqlZZR
         Go0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772201006; x=1772805806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CtfwJFU2C3F6SuqP8t7kDFFN/csxu26OVZQtc7hGK+U=;
        b=UZSx7neSl22OaA0HvHvlsfIUcQua8pCfgryofpj6Bqj9yDH1fLme/5y6xE5WWI677Y
         3KVPKmg/MUDw38Jk6DMXIbVjyqCuohv76o1yNHWnn9mIl+16bLY28rSpAKmucipgKd1X
         FfG9c20drT8P5Sj1XiTi4CvndTTLnVKIWG+Spb1ZTWmxoEDha4j9nam/iWwNKVX9KCii
         XG+AtC36mYQA9S4sX51ZnyufHJRa0QYKKYnkbn0w9Uq14mgCwR2kCo1kk8MDdPXodiN/
         QZi4uxK5xc7hwmz9LVhIgLWoj9ib5zo/Z3RQ9K+YLHJNPixI0p7ZwbNVmmHEOrjUq+6E
         dgYw==
X-Forwarded-Encrypted: i=1; AJvYcCWgnAh4s95uSCGy5HnerOSUMBaQ/tPxdTW3panLH7t/0ZvtwrTmlOgZRv5WrIKr3j8PWq0BI9CIOGAiBxyPYMYsmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPudFiBtlAnsqrgbCvnVJVXhUgp3Qwak4dGyarer+PVGZ+A4hi
	c6bMHb8lo1K2p3ikzGywmgYKLe0AqN3D7qFbK56FAW/phi7dksNhWcoj
X-Gm-Gg: ATEYQzzu0UPP6vdehyrAjtd6piqp4J8WVo1pgscwZUB/ROO26gr62d4uC2BiUUrCD3K
	5Wu15ISbktpyG7Z9MUkzz4eHXAiMDLfcPrdAWdiKTiRkpuKCUz9neI/o6pzopK10apz3IQtUXvO
	C/mRKlw/7Mp1e2DjXKkuTU6zKEEwdiN2dbuUpYrtoE5pF44FmLUgH0H1MnH/fC7JpKerzOhH2Bp
	xkTSecUDas62G5bGubH8p/YWkdlE+jl66p6X9TIfdo27CatV+0OdbtS2Mh0kluOkEah9gEtwxrG
	q0bje+Bz1305jd62Xb8QXkGOVgEse+KlTpEB8MUGjDx0SmMOAOfk6Hakof7/hfDY43nHKIw7Ypx
	clvANOZMyr9Yg3FM2tRL9JdUiqwzNOGr+OFasnMlCZPEP6W7zjaKR1L/b7Bqmv5Hu8lMbtVJUOJ
	p5xw4PxAFTiuiUVgBf9JumQUhDMUQHjKip8utJyWDxAQ==
X-Received: by 2002:a05:6000:290a:b0:439:98b8:6479 with SMTP id ffacd0b85a97d-4399de2c1femr4802368f8f.45.1772201005620;
        Fri, 27 Feb 2026 06:03:25 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:4d8b:fefb:26cf:1906])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60feeesm7658811f8f.1.2026.02.27.06.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:03:24 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 6/9] irqchip/renesas-rzg2l: Drop IRQC_IRQ_COUNT macro
Date: Fri, 27 Feb 2026 14:03:06 +0000
Message-ID: <20260227140316.308106-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227140316.308106-1-biju.das.jz@bp.renesas.com>
References: <20260227140316.308106-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of external interrupts in RZ/G2L and RZ/G3L SoC are
different. The RZ/G3L has 16 external interrupts whereas RZ/G2L has only 8
external interrupts. Add irq_count variable in struct rzg2l_hw_info to
handle these differences and drop the macro IRQC_IRQ_COUNT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated commit description IRQs->interrupts.
 * Updated variable type of irq_count from u8->unsigned int.
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 6bd20aedbcea..5e30dc2328e0 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -21,7 +21,6 @@
 #include <linux/syscore_ops.h>
 
 #define IRQC_IRQ_START			1
-#define IRQC_IRQ_COUNT			8
 #define IRQC_TINT_COUNT			32
 
 #define ISCR				0x10
@@ -68,10 +67,12 @@ struct rzg2l_irqc_reg_cache {
 
 /**
  * struct rzg2l_hw_info - Interrupt Control Unit controller hardware info structure.
+ * @irq_count:		Number of IRQC interrupts
  * @tint_start:		Start of TINT interrupts
  * @num_irq:		Total Number of interrupts
  */
 struct rzg2l_hw_info {
+	unsigned int	irq_count;
 	unsigned int	tint_start;
 	unsigned int	num_irq;
 };
@@ -144,7 +145,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
 	unsigned int hw_irq = irqd_to_hwirq(d);
 
 	raw_spin_lock(&priv->lock);
-	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
+	if (hw_irq >= IRQC_IRQ_START && hw_irq <= priv->info.irq_count)
 		rzg2l_clear_irq_int(priv, hw_irq);
 	else if (hw_irq >= priv->info.tint_start && hw_irq < priv->info.num_irq)
 		rzg2l_clear_tint_int(priv, hw_irq);
@@ -190,7 +191,7 @@ static void rzfive_irqc_mask(struct irq_data *d)
 	unsigned int hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock(&priv->lock);
-	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
+	if (hwirq >= IRQC_IRQ_START && hwirq <= priv->info.irq_count)
 		rzfive_irqc_mask_irq_interrupt(priv, hwirq);
 	else if (hwirq >= priv->info.tint_start && hwirq < priv->info.num_irq)
 		rzfive_irqc_mask_tint_interrupt(priv, hwirq);
@@ -204,7 +205,7 @@ static void rzfive_irqc_unmask(struct irq_data *d)
 	unsigned int hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock(&priv->lock);
-	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
+	if (hwirq >= IRQC_IRQ_START && hwirq <= priv->info.irq_count)
 		rzfive_irqc_unmask_irq_interrupt(priv, hwirq);
 	else if (hwirq >= priv->info.tint_start && hwirq < priv->info.num_irq)
 		rzfive_irqc_unmask_tint_interrupt(priv, hwirq);
@@ -400,7 +401,7 @@ static int rzg2l_irqc_set_type(struct irq_data *d, unsigned int type)
 	unsigned int hw_irq = irqd_to_hwirq(d);
 	int ret = -EINVAL;
 
-	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
+	if (hw_irq >= IRQC_IRQ_START && hw_irq <= priv->info.irq_count)
 		ret = rzg2l_irq_set_type(d, type);
 	else if (hw_irq >= priv->info.tint_start && hw_irq < priv->info.num_irq)
 		ret = rzg2l_tint_set_edge(d, type);
@@ -500,7 +501,7 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 	 * from 16-31 bits. TINT from the pinctrl driver needs to be programmed
 	 * in IRQC registers to enable a given gpio pin as interrupt.
 	 */
-	if (hwirq > IRQC_IRQ_COUNT) {
+	if (hwirq > priv->info.irq_count) {
 		tint = TINT_EXTRACT_GPIOINT(hwirq);
 		hwirq = TINT_EXTRACT_HWIRQ(hwirq);
 
@@ -607,8 +608,9 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 }
 
 static const struct rzg2l_hw_info rzg2l_hw_params = {
-	.tint_start	= IRQC_IRQ_START + IRQC_IRQ_COUNT,
-	.num_irq	= IRQC_IRQ_START + IRQC_IRQ_COUNT + IRQC_TINT_COUNT,
+	.irq_count	= 8,
+	.tint_start	= IRQC_IRQ_START + 8,
+	.num_irq	= IRQC_IRQ_START + 8 + IRQC_TINT_COUNT,
 };
 
 static int rzg2l_irqc_probe(struct platform_device *pdev, struct device_node *parent)
-- 
2.43.0

