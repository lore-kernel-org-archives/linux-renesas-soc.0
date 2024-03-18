Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A780024A12
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Mar 2024 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710751862; cv=none; b=OZ2KFMDMj1QUaFZIpQvbSnXdttNf3NlkZRjOGICIDUDb0gpjkgqyOlDZOuSKvc2UKC5BP9IoShs13BoUujDphxwmPKx5z6ETzsbzxwZa7UYDVqEnI7SOvHa8D40dbtVimoxmuzT4G1DJaOYLFnxNWlnQbD8KMjMIgLPKzHThz08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710751862; c=relaxed/simple;
	bh=xBlOvBKC07NNl1Rj7/XWCweSWN8jr+tEx2qjZpryD+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sJDRROuNulsbsP3S/CphaTakF5rI89bwQkOSKfpB9deSpeQIwlQBwnn4BU2J4t9cbOUk7iCKcvq0JQ6324t9k+KxxIo62CAZcsnzVAOZnvJLPn7cdu7KiyK6nkEf/4a2HxMenZUHFOqeDl2HUUK5o1EXa/4iYrzIYlfptLNBSwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,134,1708354800"; 
   d="scan'208";a="202121952"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 Mar 2024 17:50:51 +0900
Received: from localhost.localdomain (unknown [10.226.93.20])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D955C4004482;
	Mon, 18 Mar 2024 17:50:49 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/2] irqchip/renesas-rzg2l: Simplify rzg2l_irqc_irq_{en,dis}able()
Date: Mon, 18 Mar 2024 08:50:41 +0000
Message-Id: <20240318085041.3150-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240318085041.3150-1-biju.das.jz@bp.renesas.com>
References: <20240318085041.3150-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify rzg2l_irqc_irq_{en,dis}able() by moving common code to
rzg2l_tint_irq_endisable().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Restored the patch from series#1.
v1->v2:
 * Dropped the patch as it is merged with patch#5.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index ae67fec2ab46..f6484bf15e0b 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -138,7 +138,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
 	irq_chip_eoi_parent(d);
 }
 
-static void rzg2l_irqc_irq_disable(struct irq_data *d)
+static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
 {
 	unsigned int hw_irq = irqd_to_hwirq(d);
 
@@ -151,30 +151,24 @@ static void rzg2l_irqc_irq_disable(struct irq_data *d)
 
 		raw_spin_lock(&priv->lock);
 		reg = readl_relaxed(priv->base + TSSR(tssr_index));
-		reg &= ~(TIEN << TSSEL_SHIFT(tssr_offset));
+		if (enable)
+			reg |= TIEN << TSSEL_SHIFT(tssr_offset);
+		else
+			reg &= ~(TIEN << TSSEL_SHIFT(tssr_offset));
 		writel_relaxed(reg, priv->base + TSSR(tssr_index));
 		raw_spin_unlock(&priv->lock);
 	}
+}
+
+static void rzg2l_irqc_irq_disable(struct irq_data *d)
+{
+	rzg2l_tint_irq_endisable(d, false);
 	irq_chip_disable_parent(d);
 }
 
 static void rzg2l_irqc_irq_enable(struct irq_data *d)
 {
-	unsigned int hw_irq = irqd_to_hwirq(d);
-
-	if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ) {
-		struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
-		u32 offset = hw_irq - IRQC_TINT_START;
-		u32 tssr_offset = TSSR_OFFSET(offset);
-		u8 tssr_index = TSSR_INDEX(offset);
-		u32 reg;
-
-		raw_spin_lock(&priv->lock);
-		reg = readl_relaxed(priv->base + TSSR(tssr_index));
-		reg |= TIEN << TSSEL_SHIFT(tssr_offset);
-		writel_relaxed(reg, priv->base + TSSR(tssr_index));
-		raw_spin_unlock(&priv->lock);
-	}
+	rzg2l_tint_irq_endisable(d, true);
 	irq_chip_enable_parent(d);
 }
 
-- 
2.25.1

