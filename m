Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271F54229BB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947978; cv=none; b=h1wx0+VviN3ui6vs3Rh+1C1C63hiIZGnRJ0JNzI0Ou93abqHK30Yml2E4gp91VLY5q+FTqpwOaCDT/+xg9wL6tE+0RLXjaeuJEkPC10zjM0HhQBiS2dyb/SJRKHJLalm2YfotxKSYfKG2l+O8ogdEzHQZSnNyfKxPrVvsLVNFIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947978; c=relaxed/simple;
	bh=UxiSDwh6jwXqegQul7XG9PxOZZkaNq9y4jb5agwGZ+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GdFPIv2/yvF3o7BYn95FW7244sS0moQDaDNaZRvhgKzOdvN34MQFmqonDE3vwwms5k0xh+4kL8YoCCwfeYy0l8ewU+vBQEt+eoPkWFT2IS4UsCUP+CJx3bt3wsstKzZJtURVhwIxdssUKhQjoK5tzyJG/lbos5a+k8LzEcHk/PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=D8Qc/5C6; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="D8Qc/5C6"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-475417f010dso1446885f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947975; x=1784552775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CyFiMTqW9DNKe50LmTgk4WYg6g3GKr2XXyXW7yrTRtM=;
        b=D8Qc/5C6GOL21ZbpW/KbaivZulZOWG8nzE0PA4ptGbUdbVXSJmd6vyHR2n/r6TLzKb
         mN8qdZiqBLITkBeDo6oqum9/5pOzspg/c+Na8DmKAy3TtcBuQH2c4ypA5+q++KniSsdX
         PQV5SKw/YIFa7I/C3mFPt1ttIC4V+dvd7Ya6IBvW3dqRRZjiiwYUPe6YJUGXyy2Urv5e
         4P4r5Jx5i5ULWev7SWL9fLe/bfQGaDPFSZFxDE7wiJqT1v9/sEXo6Mopvclzl8Hy3GEK
         tt6qlAGHOowuokvb6IwT63R1Naj+jJgZCBqTLysgC9GL1j58NdyQoY1Cyw0n9wkUXiNC
         ZnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947975; x=1784552775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CyFiMTqW9DNKe50LmTgk4WYg6g3GKr2XXyXW7yrTRtM=;
        b=PwOg/sMQpNOI2jidro2kIheDK3kB4VjuzNgtIvO4WNPrQnVmQBMZhFMlTOP/nDYdk1
         XdDg7BsZYDSIhoPqU+/lvxwaAzcjticYmbBt4GMg/IWDdRHbSLY2iCI/+21Su8q5NRQ/
         8xy64amp1eB/6do+rEAMtSS3Y2rbE86SXp7AdagXFX2pGwnuIHuf8Sk2yGInWVpa7tid
         mmsPsnowPQU0RJoc/kxskIk+3jlbYS2MbDo6Qnu20xbrKirAes7SUMAVt8fDC+nPcNV0
         so8ZlpW/p/M983O8TE9srkngoxUaOluWRgf5Pv4vpkYD1HDavALfw9dUlDsyJ3m8jEHa
         nu+w==
X-Forwarded-Encrypted: i=1; AHgh+RoaCmdQNiizits/JD64K3iAPOGnjvEYGSbtSPyhUwNK2I+VsqtB8BIeJAlxffX15gufUoYGVYBAGqYHKzpC7bzm0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmvdNPIZZp4VaE0Wovm7IqrrZ4Arjvjl2Uh6xYU5gHB9fVM+jW
	FRlxKfjNSAuiwhnuIXfP1RptJHSF/kPhsPzg6W42C/fLaKzjAeCBiTDvr2lU/tSEGqE=
X-Gm-Gg: AfdE7clw4+Ruf3tqWWVU0kKv15QNBKw5M98fYxNUZU6WplzLNMsbtT7CwjA801s9/Su
	i6/jU1zuNOsumjNIpvkSwbdlM02gKKHPc9mjNeASZjoDGEseWeeJMLvb8ayJX/WOWhAwqgTpTD3
	VmeYdlxsH6Wew1TjlLTU7fvXDf82PTdl1kq0mLFp0jrUtz7HfgddYagz8E5xgFX2ieGv6FNbiTz
	NWxR9Q6Jpq4DItE+WwOpv8C4TCEI5Js9hMb+DlQf8Ls700u9bkVU5DykU+yZgS1XqBxp4Meo5PS
	QcEBJQZ5shuGx18kMcgzckfQyt9I3slape0duvxwYCHZWD/d4L2GQnoyVWK6zcluXhAbVJuI3LM
	lmd7vsBD/1hebOZlytfHGYNcsgrX/ASZFQIm75QGyEOR96mCOc3YAszAl6/DKkVEtZ5S59PBqyh
	GoI6yYjjQRR63Z6SSU87d9r+C2kf8nVhuCz56QsVA3c+MUUCQlu+B856oKnXEJhDpOfnfSVs0=
X-Received: by 2002:a05:6000:2008:b0:478:9d9a:d515 with SMTP id ffacd0b85a97d-47f2dcf7f47mr9434967f8f.44.1783947975585;
        Mon, 13 Jul 2026 06:06:15 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:14 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 15/17] i3c: renesas: Use the "dev_name:irq_name" format for the interrupt name
Date: Mon, 13 Jul 2026 16:05:43 +0300
Message-ID: <20260713130545.568657-16-claudiu.beznea+renesas@tuxon.dev>
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

Use the "dev_name:irq_name" format for the interrupt names. This makes it
easier to identify interrupts in systems where multiple devices may request
interrupts with the same name.

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

 drivers/i3c/master/renesas-i3c.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index a54c20ef5f6e..f28e260dd166 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1409,12 +1409,19 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 		return ret;
 
 	for (i = 0; i < ARRAY_SIZE(renesas_i3c_irqs); i++) {
+		const char *irqname;
+
 		ret = platform_get_irq_byname(pdev, renesas_i3c_irqs[i].name);
 		if (ret < 0)
 			return ret;
 
+		irqname = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s:%s", dev_name(&pdev->dev),
+					 renesas_i3c_irqs[i].desc);
+		if (!irqname)
+			return -ENOMEM;
+
 		ret = devm_request_irq(&pdev->dev, ret, renesas_i3c_irqs[i].isr,
-				       0, renesas_i3c_irqs[i].desc, i3c);
+				       0, irqname, i3c);
 		if (ret)
 			return ret;
 	}
-- 
2.43.0

