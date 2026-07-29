Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F7B40EBB2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317479; cv=none; b=BjE2ryy2Lf+dkiBs0GhE3czj3wladsjXHyQfHTdSvQ82J+X1m7XPDZq+QFkMdho976e2GHi14ZhrTSnlGcQNMXJZlo5Ck0GbN3o5JCcwzUJbsW88mbzizNFGeibQq3YlNUcLecXUjqaQSp0X/GtJii2Y/yaj1OgJYx9aU+U1E7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317479; c=relaxed/simple;
	bh=lBJnjZOIoqfHNgRTEJVl20G4Z5DWj5Glw0YxJxzTj2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MnGzbPq/AIi8TuzO8g0vHrr13CfMCgitH+CEwaqWkT679PjiAPI1UvJMCM2WgfoBOl/ci8DBy80X85Qo2cxk8MV6u2tYB6Uvzuk1EpvcbF2VGF2kYirhhWDTZUpo/MY3CG/llf0RZZnhsVherjgbOxqXka9LLl5YFqguwEXbYLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+AO8b5H; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+AO8b5H"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso502937f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 02:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785317476; x=1785922276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lMVRMhHVsqsMHhfQ0Ig0eaSQNZFCZZxejipqjbA5Tks=;
        b=i+AO8b5HKW6GNICc+SyQZI/k9MmLvRU1GrAdZHCpSyTeEJmFdhc9UAOVxAbLtcv4Vi
         vt/gERrZgn5BJj82eMpswZ/lxFzMKPs40hMzHySM2rYc8OD59NL5KefIQF76OBt0U9c0
         HczcDUMV5Je9/k+zMW3h0AsdJsnMF2WtF/A4dFl92WzsQJWyzES8GAr4huN0OxLB2URs
         g3v7H2/qRzVlzPe25nrPkj12Qv/Eu2ofWKFzTkfQaqfQozN6hQJZ+r4Wt79auyExRoE/
         HNazQjgPpZ10m2e2f7z5HiWGg68kbmZh3ZBZyj9tgOFUlEkPDVQi7gR6WxDtUm1+ECnJ
         5ohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317476; x=1785922276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lMVRMhHVsqsMHhfQ0Ig0eaSQNZFCZZxejipqjbA5Tks=;
        b=T2Wpf8sn/AbX1t6KoCfzs9lVz6Xz6DBLJ/5M3avb8ed+hnVy1ofnSQpk+Z81v66PPM
         CDVF/jZWBdY/vFkfH4tLfHMQ2yhk2TdYfC8j6GrE29yob8rsmAvwa/KgPIoXJN4wWR+c
         0aeAVjwe5Kqij/rZq6xwSLI+ZsQhduqpCAnl9MEiTG6+q26Qbxb2lfTffw3G8zl1NFx4
         hrlL2GVW2+zxCzjOQOUerBMb0hk5Q3U6muy1uvWa2VkMebQn780Vqi8gYJNHvAygw9jY
         EqjNxJyB6czoKjV3KBUFrAuGgpqsSChcMzxPV2363xZYOqTRkMyF1Whqn+TbouDjMD63
         7jpw==
X-Forwarded-Encrypted: i=1; AHgh+RrIKqWKyPBPTg6A7n8V7JaeaN3M6EEqq3V5EW5Uxpa2fq5mz9+mHw7n80z8XHt+1qmjcpz3S4LC080a4lpiJKG+iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg8f9hthJkAhfBmUjInylkqipw/bBAEbMfyEVbDWpZtH+bMTWi
	SDw5bplx1MR6zJl75rYtUSOCi7N9Wq8TJyiGFlmDtLeEzKpV71sjTk8M
X-Gm-Gg: AR+sD13G/Ge3LIvPJ42C1woVUfQI3DxbPru3S1L8ePqfBYPv82yEu1CU7DnzeyzjPui
	ZaGjTg6bMMdFpEX8V+t1vkj0AIwfkZAWQcma5uVN0bL9lLoU5dwetfDv1Pr2peWKvscDJOGMKbB
	HBdqrs+okS9Af9582FiW0VGmqv/R4LKLhL3H1ZIBB0H9Edl7luDMYJ0bMXZVWfUUYd/OL0Hcw90
	7RAfA9wDSJaoz5b9HQ4rFWV0a4KAJnCtpZLHbllheVLlzKFy52lhIZnJjZnjqZXSY4Nds4M1y9M
	Zm/Rd4aBS1oTsQxR2/gsxiQuTYLD+3ZS3EWmLVlA8rcFZNEsj0RmfQ5dQAR11MpBlmqEYVKLEsP
	lpwFpXhZ3LWRTgu1y8JKCGSutgWLS3zfWqxJFKGhKhB1/EfA7dBamrSB4XqTLHE+izuwFTz7t7o
	VFVVAj94XjQxnG16t0PcLfgV/pcUHVTE40FGJhKLdDxHb2rraWzOXxrGGb05WMzkLjakM6yeI3e
	WB5OuBy35iC9A==
X-Received: by 2002:a5d:6f05:0:b0:47e:8e7a:90a0 with SMTP id ffacd0b85a97d-47fb1ee71d9mr7595455f8f.52.1785317475854;
        Wed, 29 Jul 2026 02:31:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3935sm6766388f8f.4.2026.07.29.02.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:31:15 -0700 (PDT)
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
Subject: [PATCH v2 1/3] soc: renesas: rz-sysc: Register auxiliary device for PWRRDY power sequencer
Date: Wed, 29 Jul 2026 10:31:06 +0100
Message-ID: <20260729093112.98324-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729093112.98324-1-biju.das.jz@bp.renesas.com>
References: <20260729093112.98324-1-biju.das.jz@bp.renesas.com>
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
dedicated driver can handle the PWRRDY sequencing, with automatic
teardown via devm_add_action_or_reset().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Switched to devm_auxiliary_device_create().
 * Added regmap parameter to rz_sysc_pwrrdy_pwrseq_init(),so that regmap
   can be passed as platform data.
---
 drivers/soc/renesas/r9a08g046-sysc.c |  1 +
 drivers/soc/renesas/rz-sysc.c        | 21 +++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.h        |  2 ++
 3 files changed, 24 insertions(+)

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
index 161e8c38eea6..88df3327f38a 100644
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
+	adev = devm_auxiliary_device_create(dev, "pwrseq-pwrrdy", (__force void *)regmap);
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

