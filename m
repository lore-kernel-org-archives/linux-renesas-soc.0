Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEB548D872
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 16:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639726; cv=none; b=ajONK03zcWhjTZAEgs7i+wR3rD4Jj1R26BpWS9+L29kbKu8+7OAgIyLjkK018DjQjdJ4E6PlvMEPP65KhSlNm1TB4YXyoO7SYjSRjUfLYV+d43wvb2vT7uxZZjWQNuV5Wn9kJVkI42DN6KB1bZJlHv2kwrGUgtFYx0Ht9bIS7m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639726; c=relaxed/simple;
	bh=qwDUj4+15bXny3vE81t4xJfojfrxR4IYhJWK2NNHuME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mywPs7kutDIbPAvYcd/fFpfNMDVh8aGleMcECZ2uGHdmUi/QhZpPZVB9zA7wDv0zXvllmwpjQPOr+ttFJAbf9VBGYjaRUsfQIqYuj5aQo5cwgnkgNEoTNyKPC4O3i8kovjLsHgPxOqB/2khBHxsDmgCKFc3iWMH08UTUl+gcMrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSLcCmtv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSLcCmtv"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so1164885e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786639723; x=1787244523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxXBkcey+corwbU4RFHxVYgs/fXIM/bb/etjoRIzs8I=;
        b=CSLcCmtvuPSe+K941+fIeyzOvy8szMDKSdVzo8faJiHw/6DEbSakwrJa6wjqosedfh
         4wgWm1hUCOprXlrwbszFhnPlqIkX1ziZoxcFfvWgoXdSKe8SG7yXQBioZ5SVEHwPs+71
         xVx2wTl7DzAPxA9GwgkxyeZncVChi6zc8PNDOGH1+vCJDAMSATIIZIl0KlAyvWMXiy2q
         CYCPP+3g5rsWheTgRDGmjmPbZMBN4YwjHtXiB8ZEsLt6emPZPx1cQmd5/WFgToZYHB8x
         S61WvZeXWM9IAP4LW0dXe+y+rfTC/gu+gBzfKgVMsIXgG/U36ZsWVP2XsBcxFRz3Guqx
         C3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786639723; x=1787244523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxXBkcey+corwbU4RFHxVYgs/fXIM/bb/etjoRIzs8I=;
        b=MLhM5RrEsjg6KQuvL0Z8YRfXFDpgcBTlFQ3zXhERkR2DeWa3XOkxAmzf7H8POwRQok
         BON86pIYqjHzCEXmkn7jfIv3/HgnDM22f3DV8D2i2yoZBWlfwZ/I4VneqjTjcZ648GRG
         r5r/+ZXwDqezYxxzNhjCd140gDMxPHZGH4JiSCyL8vLD4sBfgEP6htbRdzJAE+qnZMIo
         zo/q2b/BsYQtivC8edd7wWYxYSjX5GOMkBh5IUbGz4Yqk22TvxnrWaTeU7PMxVeW7lRb
         XUVJKnUf8J9ctAYv6O6Nw9wq2m/EE/PCdPfbzPcbDgw7le5JEn6J2CdTk+s9YQVZ9oHd
         NtXA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4GWk+31Jas2z3iQrdZlpyHxmmz7GSaRpoAW53MRFWCZ+pS/JicMjzqjrYeyTvUOKT7MSFuVWipC5III6cpyiu+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaRBr9BR9ryzxwlBdB7whvO8jUtXZcaYyXU04oI/yvKknS9dyy
	99Zi36F7NEKiKl61lxW2bbGFwwBEjbViR8bRlKQp3VaYDK3OcjBh/fjR
X-Gm-Gg: AR+sD135zz/+8ROt03FKDTHksx+bNjJpSuScQQRFwOUm88mjb3Piy8d6gYETM8gp2gW
	tDDsDlqduRdCZW0LdEMtmajXZkR1cnlsGxEhg24ETK0F0/o8+4huQG+iOoBFiNq3fcVPmK83SNv
	gpo6kT/lMtCSVCrmGE3iGobOUu0vlqSndnMz6O4c/Rx2CId7goGpY5ejjXupAnZ6BviCcj2xkmj
	9XTYUHTeEJSzVvfyOjrZ5Hiz/b85vvbnYD/ouxluunp1hwWlpGodT9lK8uZDYYqeJcfg5ZfAGy3
	hpSiIRm1esOGlxYtR5gqnMwNAQ10qh42tQFhxCAjyqXhGvGApDuZwtu0fe7KSuPwKTsFx6CTj7N
	NpO/q9gqMT69ML/LeHlOn98F5tjyg0qjaD4JnKcF7nlvWRznLoTm/xQIokonA7uW5ny3ErfjABF
	QLzk0ilvbSoPM4oBs5ZvOnYSD96hGX/JhFWnoX3aL7zSvUePk2iZPSF4cOvUcEUKbBx3co9YigG
	XZHNhH/q8aDAA==
X-Received: by 2002:a05:600c:3f05:b0:499:858e:de42 with SMTP id 5b1f17b1804b1-499858edec0mr45227115e9.6.1786639722571;
        Thu, 13 Aug 2026 09:48:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:15c5:4b13:a9a3:1fda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f20058fsm721259f8f.4.2026.08.13.09.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:48:42 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Radu Rendec <radu@rendec.net>,
	Marc Zyngier <maz@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] irqchip/renesas-rzg2l: Fix loss of interrupt
Date: Thu, 13 Aug 2026 17:48:09 +0100
Message-ID: <20260813164839.129777-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Read modify write on rzg2l_clear_{tint,irq}_int() is causing loss of
interrupts when multiple interrupts are triggered, for example with:

  gpioset -c gpiochip0 355=0 353=0 328=0 352=0

The ISCR/TSCR status registers are write-1-to-clear per bit, so any
bit written as 0 is left unchanged by hardware. The current code
reads the register, clears only the handled bit in software, and
writes back the whole value. If another interrupt's status bit gets
set between the read and the write, that set bit is written back as
1, clearing an interrupt that hasn't been serviced yet, so it gets
lost.

Fix this by writing back only the bit being cleared (all other bits
as 0) instead of read-modify-writing the whole register, so that
concurrently-set status bits for other interrupts are left intact.

Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller driver")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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

