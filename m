Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCE9416D0C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947957; cv=none; b=nUGyC1Ke4wLe3IuACYVGwGlSIVbaFt2mApxVstp2C5GR/rZOEalUOGiN0vhgqiD/KdvcFfC8B8AM6oX24gFpIvksIk+hg3nOUVcxa855HylysUAZdmIHsmD9M8fyznm2cotpcBfQCK4GGcL6o/H/nDMfduFSGFcYRClRI3I1T5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947957; c=relaxed/simple;
	bh=0qC7ujzOLaFd2s8Fn3l9j7PEA6FfGcqP1hFRcFudcsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eawd7pq9zLLIBwilEUUuNZZjlUSEI1seMzQX45cmgYfeiPKQzaIF5krkLWrisIM2cmr4WZ5z3706+9LfzSZ0DNOIA0mBK5DjRoWxSrMm5AgvzQ1u9Iew/hlcu9ox4U4ncbExUfd1VkyOAJC7/qIgLhgCbJDaAKKHq2flApHZvP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=b0n+Ye0d; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="b0n+Ye0d"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4759b4f0897so1693386f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947954; x=1784552754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUK3J4PNfu7w2oijinZPF7ASv5k/jbRTm1vrjO45FNA=;
        b=b0n+Ye0dhn+H621l7a85fSOJYvb3gmbLeI27l2+gzwNxc6wQb4ANdgg07mov1OcYoU
         cn1olCgWHLWKlQif4/jBRwrAyFVeFN8vv4wxe+vWq906F7ZX411Uom9YWp4zx/qMGT9y
         mmm5j9g6Lx0wlPK3Kdei8FD66gouRaflCVpKACIMalAGbGZdHSAvZ22i60/Cn1a9auUJ
         slLJe088ZO2/ptCA1ltHxppZ+pdlmvX96lKTMApUyHqzQQzmMMRCdE9avFlGW271BEcf
         omcDRnbK/QvvSPLKBhjMNtApWZeIfm89vXJewEYYHFzHX1Xl29t9Cd6SbSchv9tUMe93
         qv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947954; x=1784552754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUK3J4PNfu7w2oijinZPF7ASv5k/jbRTm1vrjO45FNA=;
        b=lU5oL0f6WADCmOswJsgj1M/c23FJTDsfuBVWVmcPvqVJBIhPbDD8z+avcpf70bbRGd
         OAO872i9k3CoAFA45R49UCuRzJPZTw7YEWkqHYFsoUZ2Ia1sOynxIzE7sp852Wo7PX56
         gT/sf7QRSXIPWO1kzy8zZhuo9qdCCu/L2HOWWdyfI8tX/XXuW2xCjLminZPIsDIuR19/
         fqu8nm+kBTb/XoNWIvn27kp7VvODf0t0iAKmJ6lYq6b1V6DcXXE3TGROgc/U3VmHiIUk
         3773MxmsV533VI9mX84d75aDaamTsL9hN1H5PP99LgXV1/SQdaFlA6NxVdiPWtPCBRyg
         pdbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7Mgg75Q2uEWZaXxwn9ZGXVye/nJALq43eLbt2lbdnVTfP+JmIFIL44TMp2S3i/Ib9cJSYS2sga9I/+iE+ms4EwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTZk69E8nMg8V0J5s+xepSWOa/lp7YLb7EKXr3GqdI++78W4zs
	H7ext695YCrGvV7SOVXIGMyw9TtikmF8EeaUCkhGv0iVNTcjwIESNOFHdxlHKnuySCA=
X-Gm-Gg: AfdE7ckap7aR2URLwamJNKvHSA1ax6ar+bS8/681UabsL85nrYW7jPo6xL7qFXA3cqM
	rhs5CIp8pXFGEi56+6p87mEF3Bu06ZNBr/1Ukc8R6fCWFb3mwV437Bk7k2ep+eH7ZM+r+Dryk5S
	T0/Oe/cmcK1by1yfzuW4Q9MjkZZSEgPZbvCnkAPK4YwTJvRtf+hjZJbjorYqKKSwJi8fndB92Pa
	//8EQpVquZLVQZ7kdj1zGi+NAbDh6IFNcM7DLaPYFqY4iBLS18HLuwsCB+SkP/5AIPOxwdfjraV
	U0p1m4GMNsCzvEN0H/Kxw0poSi6gMICN+ihbDqQQYGkFUeNXpHfiLsw7BERd+XWpvA+Wzx9pqTL
	Gcf3BSZszu2wZl8anNESz+t9E1euw317jdwBamBCFoyrfDtRE2t1P2vgIPBJj/Hr7Rs26lEv2MU
	P4X4xsbv6Z0VTsBiOsLvWYZCe/1HezVtgWVyo9WzZhdAJ92BQ8sjNBtfpl4t7cVE6HfxCnk0E=
X-Received: by 2002:a05:6000:420a:b0:47f:285c:9769 with SMTP id ffacd0b85a97d-47f2dc8d86bmr11100953f8f.10.1783947954635;
        Mon, 13 Jul 2026 06:05:54 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:05:54 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 03/17] i3c: renesas: Follow the reset deassert order used in probe
Date: Mon, 13 Jul 2026 16:05:31 +0300
Message-ID: <20260713130545.568657-4-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use the same reset deassert order in the resume and probe paths to avoid
potential failures due to ordering differences.

Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index cd9928649c7f..ccf55afcdedc 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1455,17 +1455,17 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
 	int i, ret;
 
-	ret = reset_control_deassert(i3c->presetn);
+	ret = reset_control_deassert(i3c->tresetn);
 	if (ret)
 		return ret;
 
-	ret = reset_control_deassert(i3c->tresetn);
+	ret = reset_control_deassert(i3c->presetn);
 	if (ret)
-		goto err_presetn;
+		goto err_tresetn;
 
 	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
 	if (ret)
-		goto err_tresetn;
+		goto err_presetn;
 
 	/* Re-store I3C registers value. */
 	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
@@ -1486,10 +1486,10 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 
 	return 0;
 
-err_tresetn:
-	reset_control_assert(i3c->tresetn);
 err_presetn:
 	reset_control_assert(i3c->presetn);
+err_tresetn:
+	reset_control_assert(i3c->tresetn);
 	return ret;
 }
 
-- 
2.43.0

