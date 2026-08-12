Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB69431482
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 11:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786535418; cv=none; b=lv51fpymRt2w1jLjvaGeqiLNLlOnNTiPMCHYtHEoWuaKZdINw/+cuZv6b05LJgpLmMYlLyfGuZJMIROyktVwZ6Jds3jWwRiP+ZeGlzEWmccZrLO8Gnh08nPVvOQeoKXr+9CxhO7bJeSaU0daMUBYioP2kCmiw4cDbdFetTquhM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786535418; c=relaxed/simple;
	bh=jys8N0hUwUVeAUkFqIdQ51u8KxBuO4eoF7NBhgLhAOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eziXysigalREz2K9g8BcbxuRHNjWTcirbfgODKxJBdPpm3CUR5gU79S2gb+OYOoSmYnhizWAwa7ZiO75GwyaLRzRIXNVRiFNGCnn6JRJsM42ry8YIf0xmP1sX6D09zmgNY5HjUEjGwpNhu+QlzzY6deOz1uEaKcibTP1R//K3Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHGRCHeg; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHGRCHeg"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-476a130c138so647936f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 04:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786535415; x=1787140215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8DDq0fVkxOtQVJNzx35SQxIYx/lIrWJxfyXx2kLXPU=;
        b=rHGRCHeg5342TzbLOqrVqsmCk6XsJGYN8z781vw1ebWQbG51pNJZh3dU0uulF9M9iu
         4rk8w9xfW7ZsZNhqtdgWfqzj7dLl0MgdXBbBlm50PR3EyQiPjrWMLWST94LbaRw1R7j0
         xoz+B90B4L/GLcBvf/KzH+XHZG/NN1M2ayUs9HVWUK6FZJqRi3VCZPGfEw96jd4m6f6k
         ILBpGAhUlOy7ar/Vwy4ZRAUMW6eJtoabXfbX9pRpMKK8qXj+O1sxtstOWBmcxljhfF9H
         BsdQmoxLm1vnIK1F6Gf1ycYt7Luk8SOOFX92AP75F2NtZj15l5MOluuBht2y3003L1Y9
         a9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786535415; x=1787140215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h8DDq0fVkxOtQVJNzx35SQxIYx/lIrWJxfyXx2kLXPU=;
        b=GTsK44FE4HalgNH0EnwtYv06uPsB22+jEjCDix+raXZvdIQnT6biSJp6UURYsHyX8T
         mmDdOJG55zn4PxeNQlsxLplK/C/8urL3kyFBXyh8zRW2PgE7A9suwqhkSoIPt50uSDJz
         9DuywgxwmBHcMcxugBhYAU+IusBkOH4RdTM3m0YvTD+pTB1IeuYIgxMBYYNkWCqSTUxO
         KeQx5C/99qYGAA66rf7uzlN0ZaUh+IMH5eReH+0lvGOuFjvh3uKZsVpQOk87K9gtyZBS
         NeOb0dVWprH/Zv6r9ubSMNW1XbAIIweyRxdt7nowWm7Tl3qMjTbgz/HqBlJ4EbapBe28
         YemA==
X-Forwarded-Encrypted: i=1; AHgh+RpGiToBVYS7Gf9L6uMxHYJNV54sEl8FEUXh6CZw56mssZXrgQSoB0bN9yAlVQxtS+/5JhQIor2sI8OVFtPFPdlgCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBN7ctUkDKRyYp9W35zzBB6C8qs3lKv8OTPWq693I5aG/U83+K
	j/3pDAi4dxnQX2W9xC6wL1AjczfOBzDca0PlEgxkXpSiKZv2RjxTCADB
X-Gm-Gg: AR+sD10WOTZhJYWJAJY5foct2E3cA36sJD5nn2gVSXh4yiNLo/gOl9TscBLFCXGROzV
	kL8pAAp9KU3kFUhC9/8dtn0Ie2NrYGw4jO47tpK9qRjSa7hvFaZKOdciN07VWQ1GMJUmTyeP1hj
	tM5xRtQuO5Fuc6aKE6kFzajsbg88rfTUV3gmFIHfQqQfKn2C8T3FZK/x/llOQJLRAvzil/NjAPw
	bL7xqD5yQczVEIxKdC4NTegX7kcGqybEQFhZzp9D6x8DnRzHuOPhPj2HVwhvFkgF4/iSeKON9wP
	vpgkzvUh9AfqEr9eNL7j4XPDMBewj0T4JG/cIFc9z4t9R+gx9vaYEkx6I1SdawXamhwgheoHVpV
	dXV/BTrfr7LoWpP8kaL/9iLwQj4bu8EJoJxfIlfO3uQjLRx+1kA7Rv+Hmdo6wsdZq0K5Vf3FhE+
	7uZA38WPQI2T/h4bJPddB+rAplHUGRtDJ0eYvIjHgFaINosNKUZk/bAHKbDBYkTzfzUzlCT8uRy
	26Y9kCeKBuSExd3EEuAlkTI
X-Received: by 2002:a05:6000:41c6:b0:47f:f3f9:ae37 with SMTP id ffacd0b85a97d-48152b20e63mr6663056f8f.7.1786535414517;
        Wed, 12 Aug 2026 04:50:14 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815231c308sm6219090f8f.11.2026.08.12.04.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:50:14 -0700 (PDT)
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
Subject: [PATCH v3 1/3] soc: renesas: rz-sysc: Register auxiliary device for PWRRDY power sequencer
Date: Wed, 12 Aug 2026 12:50:03 +0100
Message-ID: <20260812115010.108322-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812115010.108322-1-biju.das.jz@bp.renesas.com>
References: <20260812115010.108322-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated commit description by dropping devm_add_action_or_reset().
 * Config now selects AUXILIARY_BUS to avoid compilation issues.
 * Dropped the cast in devm_auxiliary_device_create().
v1->v2:
 * Switched to devm_auxiliary_device_create().
 * Added regmap parameter to rz_sysc_pwrrdy_pwrseq_init(),so that regmap
   can be passed as platform data.
---
 drivers/soc/renesas/Kconfig          |  1 +
 drivers/soc/renesas/r9a08g046-sysc.c |  1 +
 drivers/soc/renesas/rz-sysc.c        | 21 +++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.h        |  2 ++
 4 files changed, 25 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index fdf18ed2dfc2..ab1c25fc2656 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -485,6 +485,7 @@ config RZN1_IRQMUX
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
index 161e8c38eea6..79c6af934721 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2024 Renesas Electronics Corp.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/io.h>
@@ -84,6 +85,22 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
 	return 0;
 }
 
+static int rz_sysc_pwrrdy_pwrseq_init(struct device *dev, struct regmap *regmap,
+				      const struct rz_sysc_init_data *data)
+{
+	const struct rz_sysc_soc_id_init_data *soc_data = data->soc_id_init_data;
+	struct auxiliary_device *adev;
+
+	if (!soc_data->pwrrdy_pwrseq)
+		return 0;
+
+	adev = devm_auxiliary_device_create(dev, "pwrseq-pwrrdy", regmap);
+	if (!adev)
+		return -ENODEV;
+
+	return 0;
+}
+
 static const struct of_device_id rz_sysc_match[] = {
 #ifdef CONFIG_SYSC_R9A08G045
 	{ .compatible = "renesas,r9a08g045-sysc", .data = &rzg3s_sysc_init_data },
@@ -149,6 +166,10 @@ static int rz_sysc_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	ret = rz_sysc_pwrrdy_pwrseq_init(dev, regmap, match->data);
+	if (ret)
+		return ret;
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

