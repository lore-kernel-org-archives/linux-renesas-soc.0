Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD2823395D
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jul 2026 12:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784982880; cv=none; b=aKEqYWqbD6ygExtaFw/ajUlqsjcAhUo9xfBQag9+m9g2i+osqtjuzij7musChM/sw6mI1BnftMluIOx4BgiAl9j+7/RxgXiMe89q8Xwt/2rMqL4hjUsL8NhhMb9rTE4Q/dDmnTgQoi5jCurXahSb3sNQTiFM0OFu7tQaSTt7n+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784982880; c=relaxed/simple;
	bh=McVAKu6mFbuD3dEGTUIM/YOHJb7QWjMpAqBZOK4Ie/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ff1uk7dh9dX0PiFjJJeJLPlLoN78MhTHEKQNIx8wK/2HUyL2xe7AwB2PFGYIRS8m60TlPxIIbs8kEm3zwVLQQ7zBQHIRSAzWFZw4TYJ7FAYH6x11IGGxtcEjSss+s55j7jWHQRF5SZN1IRMFydmoHa8upQVZG01oxqlob6ednSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRSVefEW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRSVefEW"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49550ec592cso14846545e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jul 2026 05:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784982877; x=1785587677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsAnK5DezEs/ebRFMp93c7IyPTY5467fpvAwog8Ua7U=;
        b=BRSVefEWvitm2u+duTSeYQ36g3eZyMlqg55C5rQDDilKjkNgR3zYjwTyWlaviZdERm
         F/vqA3lOiQ9YJo6SuqaGa7nLdYlLwF5eieELKigZrnxt6PWvlzNHKIrs5JBaM7vkLZEn
         rYxeiaNh9+yaMmBs4DaJ05qN2Jvkhqq5sU5UrmV7D8flk9gJTh+4meYNleF0N6WI4aHa
         AWTB1u8mpBZE8bXUaIObTJdogo8HGc/O21gcsNKNnC0+AQVtmBfBas5Abju1tac5FTcA
         ymLeHPdvdwyJijOkcO3IdOpIJawPPUkISOt92WPPKIfwrhpi7bMa4jS3XxoTJCTR2e6H
         cP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784982877; x=1785587677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AsAnK5DezEs/ebRFMp93c7IyPTY5467fpvAwog8Ua7U=;
        b=EYOd5LOO8xpzmENtmtU7rBB3QXhGWdgvkNxbAPJ8HjtVLRsxhXHpDlquEIWPXpvs/9
         NiKoUBJtB52QerKEp8B0c5sSQwGFig0DgWaiZCxadzi1LMPHUIQdlM/k5lgzZXkTnFpH
         uxvAVPhyZ4z/su8JvUm8p72V6isEivDPzYjgnwd2toP/9e4Ckmtk9dwKG+epg/CeZNk9
         XhR2AYnxmaWCIaA4ZzrnInLqaQXEvNlMTQl5fd4eCMLr/udsSPENnZmeyytAt7YnRcwK
         5oOU8oKGgRhR/20IarHM3ipHeEi4HRO/ElLoXD7YBHhnFr3wT9IkzzYRt//irLDvOXmO
         Uv1g==
X-Forwarded-Encrypted: i=1; AHgh+RoM6l6DzvH7GAWlfpd6YpliecIDpktFrZoP4GZDg7vWOGV/K8byq9qQ3/BwuMu/6jGR/HJfou94V3Tjgw9lrUomrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkpKAYPFi3kItawzGtGGXEdLY9HGxKgmgC/vC0b57egaws4pKY
	jhuwfugS5iKOshuh71tL4z1vpn6WDsfhEMQ4/U5LexHTYzb8xcQ5xeSR
X-Gm-Gg: AR+sD13WRi95TjgeQjIc4wESJcQfspIyi/UIntB71kmRj1AsKbENA/CUQ+TPY8Lrn4f
	UbMnh35mAWfGaKR3sr2EDiKNSNrZ1xhPJJokQG1fqhC2+vk/X7oFZbL0amOpvRttTUekbJX6dYw
	0opPSqqsdabtwapUFRvdAcRL4LILD5P+cJ+QSeE/us/N3sx0xUseDRaczqkiG1u1ZMf68WCPb5b
	CnzSuNoC4qpB683TW3mHe31v+SMFXRVrD0jqwn11wX2rsPzM6q3vCFlksUTb+MPfqqQItqkBDPz
	MrisSsPHw1ffkWF4SBO7g4HQRFoJ/1ulgXhNw9VhSUUDywL7SloYlCwjaW47W8ySxG3EuOv+0CK
	SgUIdd4Kp/mwsGOWkp598bQsGKN6qdz7o+yNzQ54iJ4iEIRDeagoDLLoRX0vICXTGJvunsxAc0g
	niaPGAGdzM9CjFpIt+86v26IhBYRn54JIcxEyhAw==
X-Received: by 2002:a05:600c:1f94:b0:493:b698:9247 with SMTP id 5b1f17b1804b1-496b5c7d3d4mr27270215e9.14.1784982876598;
        Sat, 25 Jul 2026 05:34:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:222f:1bcc:b186:8220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4858e86sm44563295e9.1.2026.07.25.05.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 05:34:36 -0700 (PDT)
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
Subject: [PATCH 1/3] soc: renesas: rz-sysc: Register auxiliary device for PWRRDY power sequencer
Date: Sat, 25 Jul 2026 13:34:28 +0100
Message-ID: <20260725123433.162348-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725123433.162348-1-biju.das.jz@bp.renesas.com>
References: <20260725123433.162348-1-biju.das.jz@bp.renesas.com>
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
 drivers/soc/renesas/r9a08g046-sysc.c |  1 +
 drivers/soc/renesas/rz-sysc.c        | 40 ++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.h        |  2 ++
 3 files changed, 43 insertions(+)

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
index 161e8c38eea6..ea49ca51e740 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2024 Renesas Electronics Corp.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/io.h>
@@ -84,6 +85,41 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
 	return 0;
 }
 
+static void rz_sysc_pwrrdy_pwrseq_unregister_adev(void *adev)
+{
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int rz_sysc_pwrrdy_pwrseq_init(struct device *dev, const struct rz_sysc_init_data *data)
+{
+	const struct rz_sysc_soc_id_init_data *soc_data = data->soc_id_init_data;
+	struct auxiliary_device *adev;
+	int ret;
+
+	if (!soc_data->pwrrdy_pwrseq)
+		return 0;
+
+	adev = devm_kzalloc(dev, sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->name = "pwrseq-pwrrdy";
+	adev->dev.parent = dev;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, rz_sysc_pwrrdy_pwrseq_unregister_adev, adev);
+}
+
 static const struct of_device_id rz_sysc_match[] = {
 #ifdef CONFIG_SYSC_R9A08G045
 	{ .compatible = "renesas,r9a08g045-sysc", .data = &rzg3s_sysc_init_data },
@@ -149,6 +185,10 @@ static int rz_sysc_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	ret = rz_sysc_pwrrdy_pwrseq_init(dev, match->data);
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

