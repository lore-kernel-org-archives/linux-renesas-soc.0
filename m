Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC713A9639
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Oct 2026 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199146; cv=none; b=TMOIKfDvnMmVAKt2ZluqlqcqYXDx6wWGQMAvMNPrCOTYo6qhPAG5WZOsx+zz2wPwOnOvF6CG2/OUoITcSizueNGLMk2rjNn6ju1nrcdmKpIveF96BYpVLUwhuvav3XB+MR8NV8T6PY+LT/lJomzza6cviI5yy9L+PSOz0pvohHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199146; c=relaxed/simple;
	bh=/ZbSUdwpV48ZNs7jgbwX0X/UopChOClfTe/duGKze2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gY3xiAOsbdxjWaiduxSvGY6UIqxDrVqZ72DACyO8HtAXa35xRejW3Tpec+jSRIkobfZpcK5aIWpSeoTQfw/71x4gVnFLTyzFSAj8C4VNQUxfwM78GZAk8FwerfAk7XmFA9aB1M876TlpqKEVxqLtmQUnoGMnnnI/yoTduSeScF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAnT3vhW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAnT3vhW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so14011325e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Oct 2026 04:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791199143; x=1791803943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OIeG7oYgHrMUat50/G4UEBP0LTimpfjYyHpWae96MHA=;
        b=QAnT3vhWGygngo1S4svB+CzHP5S7W8FndTXH9ytw9WTn5EVFAKAARsOqEqQH7ncycF
         JIhkt0KevTmt3J9s9KuCtHEpslKgBdBemN3RDpR52qqqY3zNpHAGn6iNvQECKhRDNhd5
         TVWhyNiEH2u+G2QqPJwmFzJoEJeAwFrgOksg6Su7rGAmDkcJdG8YhaMFcFrqqnmrs7U6
         f4tU/2E0cc8N55NrCmx0UGagkEsTY0aWiDBuSMR3jwi0vFDq4MSLPEVVThtqb8x6lQlk
         ojPuHS0OaigaJ+ZdeWaMTQLqwo0cFG7wxY5rW8oniMJ3Z8zHDxEJDBPnXFgaaVzve7Hh
         MK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791199143; x=1791803943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OIeG7oYgHrMUat50/G4UEBP0LTimpfjYyHpWae96MHA=;
        b=ymc1+7a9lIp3olUAVHmHQc+T+LLJSGIhqqbXu8r9rnZ/AkYXatJtyWMgfxpTFahOPN
         xQylcetkZ9mGmG9pIkmoqJfDTF6TsPhNaE31KuGE1fjFOps5HmjGM3Jf1B1jIg98lRKK
         85jWIWSgKCa0ZCJTBhJoU3sggJAih6k9Zxbsf3g7kUyFAioiif+PabP64JkBQ4IewNf8
         EDhBGzs45qhxHc8AGUgHwnYdCXKeLA4PTUBy3XBqeoFpJyAYKUH6oqgyLfW64CbL9nf/
         rREilCj8PPTAI6l4tRjcuADRvX4cmNPOutzKgT1WlAh4t+wIjDpCHaN/Zy6mf3JFMfMq
         GSBg==
X-Forwarded-Encrypted: i=1; AKwUvBxZlGxdc4/0pFzM8cztEVwoQw58NxPOT1w6BCgUQBiauFlMJxvpBU8Bsj0IrmrdgFcvmifWyG0dBrgJOD6dfE7QnA==@vger.kernel.org
X-Gm-Message-State: AFuF++kKEAsmivzbFA5ar80nqFa7r4RCvSeLQ/el6uo5IPb1RHMA9bsl
	sVIilEOSEERNdf6rj3MeXp0xPxBO5oxR4uegJaXg3/xKC+pmYHmghp+A
X-Gm-Gg: AYBFou0YIMTRYoPUvuR3Ryai1zbDEz+6gh1msWehK7LwLSuNrZP5q2RMLCevV9qaUef
	sn1p4xbtdn8XtUe3kSD9mQGJV4noUcQrfg75D5WLHK483lxqbOwHpazzRjhHv/LgN4ANAO49JcG
	5+53psha2QU6y9pcRgBLmqMHuu8ROiSv6iOfqvEmCQ26taVj5G6m3M/6kX4/0iCiWv215e43xxs
	buQQAQns+W0Urmj1K5iMvSAXMKlLtkWOIvQsIz2arKKpt8eC9uY0vsoQB5Ncy/fDp5mW5UDuPod
	2JzwWLVhLsyHRRcALOoNNGbQWha/S8vb6Vtac0/oCsAbyVzLraqXpGhvWPiofkYKZ7m5O4O3uTk
	yzFA4NgC2PSvVHB3k2bIUOfaAmH7wLBkzIFWpDvnxNgYb4phb2kvd8kFO0vdiFSOKflZQpFsXG6
	GrjOGYvWhhUpYIR5Rg/bThY5FK7Tb9Xf/i9/8R9k+ui00GGJ7nVzw3U6VdkXUHiNVmnU022FbVu
	ldp/KuD/9PXXi3xoMBOTQemBhQkM7BcTQ==
X-Received: by 2002:a05:600c:4e13:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4a0274565e1mr196326195e9.0.1791199142635;
        Mon, 05 Oct 2026 04:19:02 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:ddf5:4eec:313c:43f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bfafasm355884865e9.8.2026.10.05.04.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:19:02 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v11 5/5] regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator support
Date: Mon,  5 Oct 2026 12:18:31 +0100
Message-ID: <20261005111854.275120-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
References: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add dual USB VBUS regulator support for the RZ/G3L (r9a08g046) SoC, which
has two OTG controllers (one per port), unlike RZ/G3S which has only one.

Introduce a RZG3L_USB_VBUS_REG macro and a rzg3l_usb_vbus_regulators
array with two descriptors: vbus0 (BIT(0)) and vbus1 (BIT(1)), both
sourced from a regulators sub-node as defined in the binding. Add a
dedicated rzg3l_usb_vbus_regulator_probe() that iterates over the array
and registers both regulators using devm_regulator_register().

Convert the existing platform driver to use an id_table, allowing it to
dispatch to either the RZ/G2L or RZ/G3L probe function based on the
matched platform device name.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v10->v11:
 * No change.
v9->v10:
 * No change.
v8->v9:
 * No change.
v7->v8:
 * No change.
v6->v7:
 * No change.
v5->v6:
 * Replaced dev_err->dev_err_probe() in error path of
   rzg3l_usb_vbus_regulator_probe().
 * Retained the tag as the change is trivial.
v4->v5:
 * Collected the tag.
v3->v4:
 * Dropped rzg3l specific platform driver.
 * Dropped the tag as there are new changes.
 * Added id_table handling by introducing a common probe().
v2->v3:
 * No change.
v1->v2:
 * Passing pointer to an array of regulators to make it scalable.
 * Updated commit description.
---
 .../regulator/renesas-usb-vbus-regulator.c    | 73 ++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/regulator/renesas-usb-vbus-regulator.c
index 22fcf0d10c85..050820a30efb 100644
--- a/drivers/regulator/renesas-usb-vbus-regulator.c
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -55,8 +55,79 @@ static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#define RZG3L_USB_VBUS_REG(rname, en_mask)				\
+	{								\
+		.name			= #rname,			\
+		.of_match		= of_match_ptr(#rname),		\
+		.regulators_node	= of_match_ptr("regulators"),	\
+		.type			= REGULATOR_VOLTAGE,		\
+		.owner			= THIS_MODULE,			\
+		.ops			= &rzg2l_usb_vbus_reg_ops,	\
+		.enable_reg		= 0,				\
+		.enable_mask		= (en_mask),			\
+		.enable_is_inverted	= true,				\
+		.fixed_uV		= 5000000,			\
+		.n_voltages		= 1,				\
+	}
+
+static const struct regulator_desc rzg3l_usb_vbus_regulators[] = {
+	RZG3L_USB_VBUS_REG(vbus0, BIT(0)),
+	RZG3L_USB_VBUS_REG(vbus1, BIT(1)),
+};
+
+static int rzg3l_usb_vbus_regulator_probe(struct platform_device *pdev)
+{
+	struct regulator_config config = { };
+	struct device *dev = &pdev->dev;
+	struct regulator_dev *rdev;
+
+	config.dev = pdev->dev.parent;
+	config.regmap = dev_get_regmap(dev->parent, NULL);
+	if (!config.regmap)
+		return dev_err_probe(dev, -ENOENT, "Failed to get regmap\n");
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(rzg3l_usb_vbus_regulators); i++) {
+		rdev = devm_regulator_register(dev, &rzg3l_usb_vbus_regulators[i],
+					       &config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "failed to register %s regulator\n",
+					     rzg3l_usb_vbus_regulators[i].name);
+	}
+
+	return 0;
+}
+
+static int rzg2l_usb_vbus_regulator_common_probe(struct platform_device *pdev)
+{
+	int (*probe_func)(struct platform_device *pdev);
+	const struct platform_device_id *id;
+
+	id = platform_get_device_id(pdev);
+	if (!id)
+		return dev_err_probe(&pdev->dev, -ENODEV, "No ID match found\n");
+
+	probe_func = (int (*)(struct platform_device *))id->driver_data;
+
+	return probe_func(pdev);
+}
+
+static const struct platform_device_id rzg2l_usb_vbus_regulator_ids[] = {
+	{
+		.name = "rzg2l-vbus-regulator",
+		.driver_data = (kernel_ulong_t)rzg2l_usb_vbus_regulator_probe
+	},
+	{
+		.name = "rzg3l-vbus-regulator",
+		.driver_data = (kernel_ulong_t)rzg3l_usb_vbus_regulator_probe
+	},
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, rzg2l_usb_vbus_regulator_ids);
+
 static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
-	.probe = rzg2l_usb_vbus_regulator_probe,
+	.probe = rzg2l_usb_vbus_regulator_common_probe,
+	.id_table = rzg2l_usb_vbus_regulator_ids,
 	.driver	= {
 		.name = "rzg2l-vbus-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-- 
2.43.0

