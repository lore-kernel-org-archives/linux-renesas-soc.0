Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1077941D23B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 12:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747274; cv=none; b=DhUnGEn4FSn4kq/0fJ5LYLbwFg0mZM/upy53Cj8cH8RHagV3q6kSEh7FUGtmAWZWyWo4WDr80qoMkApliZyuJiCTNDXdUUwE0qv7LBF5MUZxnyxiQWqX5AqMYhf78heHdpIwtn22CDjIhHmhFEN5rsxwm12O0PfCmTbSFNdVqqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747274; c=relaxed/simple;
	bh=kLep75XBnL3i/Ei9F8MoKLFD1Sx77zBAZwJCo4HxQQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+d0oVvx4nFb/wLlnhXQgG7pqeULmI3vt63zBMf6uirdhHKNt4ILyQWt4GfQCgmNDavlQr3cZhjwCvZV1bmla4jeaayGR2YYrVNZki56UyoF0Z/FJFQc7noaYcZJXQHEKSEPnHWfRlhbTXZp7nldmaM0ZQOEUU02PNdwL87TtXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJsqwb6o; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJsqwb6o"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15f020a223so123697966b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 05:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747268; x=1788352068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5Sv3VdClhAOxmXrt7XCOwNKm8XsGEuxpoo629p6y/0=;
        b=eJsqwb6oWZMUzjX85QbfemmFBK5Dil4Nz4wqEqQQB6PKuFogp+WTE89u3EULOID/Ma
         65ebq+RaVWHcilcI4of2HisY6UCJg0PQSrmFjQkPVgbZaeen6IWDeJN73i4lj+Ve2dY9
         KwcdC5FITinIVJADS7iM3kKwNm5WGJOe4k+fAhPuAqR3uLcpC7qLxP0zTkdAo/eCEdM1
         YcM2A22sWDC6EbNInKT28HIZDZv6csa3/wy+F2fXeEaVCX2WXx1EqanpE0e7esGJtPGR
         I8mYKnvoMJO3wMVm4fAQBQFTa+uIr6TZqkK/e3PH6ANGTLLRWY1WcnZYcfUvMcm7OwyA
         WNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747268; x=1788352068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z5Sv3VdClhAOxmXrt7XCOwNKm8XsGEuxpoo629p6y/0=;
        b=rr8RiVuZNfesMMG0rLKvle8uhzudB4tVmToGLhLsmF1rm8rCD4pxaLUH4m/sQ1WSIU
         +cuSjiRJG7kskrkcR0UI5Ga2TNs7+0GxMOuEwssgEJaueOhmT3BANPCbJwu6rBX9Cy6j
         la1iEVO21OsxxPjowZjrtmW4BBn9fjwMicdNbIJ6M6MIPlhefbq7I2t190wF1JX7wxKD
         n939Zr6kybUIhAupiAVbSH83NnB8HxAOI/6RyiFUTtSZDtY+/NHkvdLPj+2X/3PYbEm9
         OFtZ0VOI32FF413tZ01DF7FSGHFima45LbBK8xO5aZ15RTs/UP5QKAjr8V+bipGO3wOQ
         6gAg==
X-Forwarded-Encrypted: i=1; AHgh+RqtSlebJZuUSAwJgjs3tk4+/SwtRz88mXkSi+tdAXXA4qVbORmZlk5HkrTxG6IeeYQO9wLF4e1Q6+bZGwz2mB/bsw==@vger.kernel.org
X-Gm-Message-State: AFuF++m455ZRqK9bDrkEGcnV6hg2bbfHUh7F34BFxYc4B1KkbiIwQtEl
	r25ygK5e6tN/yjQv88veghVuLdjxN34W+uDqOTjZPnJHXzZmc9o71tG7
X-Gm-Gg: AR+sD12BWJXYBrKf/5O8/ikWypikiuPXtd6DsyzHN0MtSGMSgD/GwUomRsmtkeeyExg
	OFgiuFKkjI5QAKiPHFA0SvKH2q2cTxd2M/gyV1vJKprm7J+pVBhWtdk04N29IDR1jyoYF3ARLw3
	hzoOuiAwCAshy1u72DYPZAq/RVAuhvlC+ZBNL3FrZmMenmgUf2munJ+KRLbGT4Vz1iCELYJ0Yy3
	t0JzQZHpXrrHR11vsad+VCiHOPX24sVrIpmy5LvqexxvD20P77zDjF0No3PKSlv+QB/yWmVy3Do
	KvFfDI9Boh+rb0pm/JkoDf+/JTQgtIvm4h+UjO6Rl7upSg4JRfUeF+0TsxKKvZU2PK5FbXZtIUx
	T2sZTzDJ75hTWc6CbDW5qwskoHuKtV1lC/UxAeb8FK2ft0xZtj39dU0RwiI5228WdmyFmixX1Wu
	9OdTHZTjOnPyNxDsNYCmHVtOA45H3eRfeM/xvz8F3FYsqs/BqrpxtmL7eYWAb0HA9hMFxzzasld
	aZCS2FsyxQiYg==
X-Received: by 2002:a17:907:9617:b0:c24:c0f4:899d with SMTP id a640c23a62f3a-c250c351468mr807824766b.22.1787747267262;
        Wed, 26 Aug 2026 05:27:47 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b4e9csm504890266b.54.2026.08.26.05.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:27:46 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 1/4] soc: renesas: rz-sysc: Register auxiliary device for PWRRDY power sequencer
Date: Wed, 26 Aug 2026 13:27:23 +0100
Message-ID: <20260826122742.153643-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
References: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Some RZ SoCs (e.g. RZ/G3L) have a PWRRDY register that is controlled
through a power sequencer rather than directly by the SYSC driver.

Add a pwrrdy_pwrseq flag to struct rz_sysc_soc_id_init_data to mark
SoCs with this property, and set it for RZ/G3L. When set,
rz_sysc_probe() registers a "pwrseq-pwrrdy" auxiliary device so a
dedicated driver can handle the PWRRDY sequencing.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Dropped rz_sysc_pwrrdy_pwrseq_init()
 * Collected tag.
v2->v3:
 * Updated commit description by dropping devm_add_action_or_reset().
 * Config now selects AUXILIARY_BUS to avoid compilation issues.
 * Dropped the cast in devm_auxiliary_device_create().
v1->v2:
 * Switched to devm_auxiliary_device_create().
 * Added regmap parameter to rz_sysc_pwrrdy_pwrseq_init(),so that regmap
   can be passed as platform data.
---
 drivers/soc/renesas/Kconfig          | 1 +
 drivers/soc/renesas/r9a08g046-sysc.c | 1 +
 drivers/soc/renesas/rz-sysc.c        | 5 +++++
 drivers/soc/renesas/rz-sysc.h        | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index eb8ac0d47d9d..4929ea350cec 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -486,6 +486,7 @@ config RZN1_IRQMUX
 config SYSC_RZ
 	bool "System controller for RZ SoCs" if COMPILE_TEST
 	select MFD_SYSCON
+	select AUXILIARY_BUS
 
 config SYSC_R9A08G045
 	bool "Renesas System controller support for R9A08G045 (RZ/G3S)" if COMPILE_TEST
diff --git a/drivers/soc/renesas/r9a08g046-sysc.c b/drivers/soc/renesas/r9a08g046-sysc.c
index 90db9d383539..cd129c727461 100644
--- a/drivers/soc/renesas/r9a08g046-sysc.c
+++ b/drivers/soc/renesas/r9a08g046-sysc.c
@@ -76,6 +76,7 @@ static const struct rz_sysc_soc_id_init_data rzg3l_sysc_soc_id_init_data __initc
 	.devid_offset = 0xa04,
 	.revision_mask = GENMASK(31, 28),
 	.specific_id_mask = GENMASK(27, 0),
+	.pwrrdy_pwrseq = true,
 };
 
 const struct rz_sysc_init_data rzg3l_sysc_init_data __initconst = {
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index 161e8c38eea6..0e92c415d4be 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2024 Renesas Electronics Corp.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/io.h>
@@ -149,6 +150,10 @@ static int rz_sysc_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	if (data->soc_id_init_data->pwrrdy_pwrseq &&
+	    !devm_auxiliary_device_create(dev, "pwrseq-pwrrdy", regmap))
+		return -ENODEV;
+
 	return of_syscon_register_regmap(dev->of_node, regmap);
 }
 
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index 921ee0d26c47..e55f3258d703 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -20,6 +20,7 @@
  * @revision_mask: SYSC SoC ID revision mask
  * @specific_id_mask: SYSC SoC ID specific ID mask
  * @print_id: print SoC-specific extended device identification
+ * @pwrrdy_pwrseq: has pwrrdy register controlled through power sequencer
  */
 struct rz_sysc_soc_id_init_data {
 	const char * const family;
@@ -29,6 +30,7 @@ struct rz_sysc_soc_id_init_data {
 	u32 specific_id_mask;
 	void (*print_id)(struct device *dev, void __iomem *sysc_base,
 			 struct soc_device_attribute *soc_dev_attr);
+	bool pwrrdy_pwrseq;
 };
 
 /**
-- 
2.43.0

