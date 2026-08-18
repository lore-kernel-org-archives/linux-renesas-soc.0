Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B173EC832
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2026 11:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787051387; cv=none; b=OafeT90905xIZgn0ySMWHX8+lUJPrAK8qKk4z4wI4iQhTGBsn1LHbMORTnAEK3bcEWBMblgeqUtCDvP5C0T+hit4GMjmn46LOp1tDQFWsFRZuGq2QJp3UdVDS8ui1XPdLDx7DYI5OFP2Vr+V/ug/yD07hvUkfID1yp4qAIYDJxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787051387; c=relaxed/simple;
	bh=+vpNuqJLudEtQP/MCYudLDnz/SNJfAiENNv4yl/P6tE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aN3mEttxbUQu0WQ3fCBu2PCP4kYvA0PcpeoSrfEzjl+fqTjEVhkuBvZ5mbhCo6yqmS7aCALvdsKWmds6DKUTkeS8Dk/RoV7n2gq7dUWeOOQW7GfbH0VcdHZUqxoo2oUQTmgP6qBC1DBdWZO8PAxul7GXeOtw4dbImj5u4hol0YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FphTnvMD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FphTnvMD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47de0093c42so3908154f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2026 04:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787051381; x=1787656181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKdp0dfaS1Jom5b/B2YfbAPuFDj1lET4abpkm+ARcl4=;
        b=FphTnvMDP/tCvYQs0kpk4n/nbL2Kz7yBl1UP5qUpRXjQ7TSkPynNvmranmVNB5Gmo4
         fRHkqHLz7uAkpENRqYr1kjiicDyvL5MeZ0JpU3r4hw12FmDbJrL1wk7xwyG9ZPNUx0mG
         ZJynQP+FLrfGbETy5SqFcS+7iSm9w5HOph7m5w9NxzAGQYgWrNiHZjJSCKsAYX8ky2uj
         Ni7V2zSwA1c7K/mn9kZ9IlnQZEw/dUY9FQ6Gn9I5bs5v2KIEd5HFDYRtfI5/K1waUUVf
         JvJHhZrblqI2D0PI0o/55BKwWR78PzNLlQ/QLOwtPnQ1X98q4fqN1Pb8WesHsoUZ0kQc
         cN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787051381; x=1787656181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKdp0dfaS1Jom5b/B2YfbAPuFDj1lET4abpkm+ARcl4=;
        b=gaO2AnGF0Nu+pdFUU9kkl2oVcCbl6qNTDzZZTH1h57MILMUqRu/8STeecsXPRQIzk/
         3QxSLmt023Omz90qVeZe3sQCdojMNWIVrCXjbuLG68Dwc2u5DMq+HOi9RVMn2t3rzhM1
         AWCDNlvzmVihUJ3awVkR+NFSQ9DJjZbsS5HlvVjtBJanK5uKU0wvkMkMYZAWBHhnFQMM
         vK46HF7xkIlKfi/xh49tiP8h19bl+WJ98oYaJS/WiCJz+llQBl+qbf2s1TfToVcTeIg4
         higbWZ6xkFXqehOqwuk/UX71KWuHnA7cwEe7+NqBHLuq1UIscY/RY5x5kz5v7lCPA58G
         kWJg==
X-Forwarded-Encrypted: i=1; AHgh+Rrf3IVejN/G3arMi8StLy7hmDp/YeSlkAziW4D1qlMEhmKDucG3jIjUk3t8076iFf50bP0IOQMmsLVr/pMKGuhQlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2cuBp6+Pt7361NrWtmZARLPeiyE1veap9l2aCTH6TnDyLfUCV
	p3jPs2j4sdNChKtp9e8Iqkg1IALZSm5SpGCh9vjq+HHQL4a/Kg5XSS8/
X-Gm-Gg: AR+sD116FBAc519bpbXgdxA8S6njv5MEnk57D5ObJqSEzShbq90/TyAVI/MbcetB9V+
	HHsRfgctLRiwMvZW6nAe13ISbZFNJeOZc6BlNPTuIuGtMDDaa19aVwVnqHbchi4x/3xI6uLWvlK
	eAcIvyj6c21ktRii/iF5yEOvy5ICIjw8C8Lh8yK3y0pee/6Gamxv9qxcFn8vj/pvS1FE5Vt/3Qd
	OPTGJ+3SZuF4zH5XKvlyBOiyaDJJV0akTNlQvz54+YG6vvqeSe8+ozCRQV6Va4N4PuHI6A7cU9M
	oYPrfOfGD+PVSWfB/pw9uJKp+2YNzv2sJOF/5Gx0fVEi42su6Ko+FE74E1j+CoiWgZkwJngff1a
	397j8v80buxOZralDjWOOXgndfJ11g8Cee7Fkv4zqmJnbiSKpZt56SAdDoJm8TevDmjkz+6+u7u
	azIBZ3r7c8YSbvUZeixHo+F0HiqoeN2A1LzqzOAPsaB4kXDkvjKTzCDIhwatC9N0KGOkAi+1rE1
	7/QmpU4gKysXA==
X-Received: by 2002:a05:600c:68ca:b0:495:641a:bd3f with SMTP id 5b1f17b1804b1-49987995272mr406218865e9.13.1787051381375;
        Tue, 18 Aug 2026 04:09:41 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:1a7c:1018:1649:4e84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b43dsm10939791f8f.12.2026.08.18.04.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:09:40 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Radu Rendec <radu@rendec.net>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] irqchip/renesas-rzg2l: Fix loss of interrupt
Date: Tue, 18 Aug 2026 12:09:33 +0100
Message-ID: <20260818110937.5816-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

rzg2l_clear_irq_int() and rzg2l_clear_tint_int() perform a
read-modify-write on the ISCR/TSCR status registers to clear the bit
for the interrupt just handled. Since these registers are
write-0-to-clear per bit, this is racy: if another interrupt's status
bit gets set between the read and the write, that bit is written back
as 0 by the software-constructed value, clearing an interrupt that
hasn't been serviced yet and losing it. This can be reproduced by
triggering multiple interrupts at once, e.g.:

  gpioset -c gpiochip0 355=0 353=0 328=0 352=0

Fix this by writing back only the bit being cleared, with all other
bits set to 1, instead of read-modify-writing the whole register.
Since 1-bits are left unchanged by hardware, concurrently-set status
bits for other interrupts are preserved.

Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller driver")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated the commit description.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index f6b2e69a2f4e..b3774f82855a 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -161,7 +161,7 @@ static void rzg2l_clear_irq_int(struct rzg2l_irqc_priv *priv, unsigned int hwirq
 	 * falling/rising-edge.
 	 */
 	if ((iscr & bit) && (iitsr & IITSR_IITSEL_MASK(hw_irq))) {
-		writel_relaxed(iscr & ~bit, priv->base + ISCR);
+		writel_relaxed(~bit, priv->base + ISCR);
 		/*
 		 * Enforce that the posted write is flushed to prevent that the
 		 * just handled interrupt is raised again.
@@ -177,7 +177,7 @@ static void rzg2l_clear_tint_int(struct rzg2l_irqc_priv *priv, unsigned int hwir
 
 	reg = readl_relaxed(priv->base + TSCR);
 	if (reg & bit) {
-		writel_relaxed(reg & ~bit, priv->base + TSCR);
+		writel_relaxed(~bit, priv->base + TSCR);
 		/*
 		 * Enforce that the posted write is flushed to prevent that the
 		 * just handled interrupt is raised again.
-- 
2.43.0

