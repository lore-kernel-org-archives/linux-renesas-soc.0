Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4240C436351
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 10:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606711; cv=none; b=EXVsLEMQkxwx5Ns6b1CQdDcs1KQJmEvgVKIMZWlp0T4JCdcmcD5G/XE8hAu2c2CONTBALWO+h9OrJNAIuRGRq0oERBrIqJHB0XT034JTRYw97jqP2Tlz+V5pmJhrPHDNuzyIzw0V6Y1ViqftbA0YM06+BFNB6/zegYUSoxr84mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606711; c=relaxed/simple;
	bh=t5CIgY95rxYCayQNLWO3S0qmEVMbAOGNG1nKBuHmhAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttrec0PxjLLoAxe/CUx7SxP8gfIOMREwomNKM3ZVnPRoDilF5e4JecTst0gdgv1WhjZUo9fFFhyopJHhDYOxmnfIoy/HUuOIG+63QIthHPZX23v7wr7FBLmWkAmTmEWEXedOjHcGq4chCLf6tDWKjtifnY1kbuwEBBdpBKTVLNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFKbzBM4; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFKbzBM4"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45eedc94d37so2440634f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 03:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606709; x=1782211509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UheMcRsmt/7syIiztM9/tG4GEzcMt/LfQFqtbUfauh4=;
        b=CFKbzBM4l5aIFgleaVHxcLEqjJnCQyKzBwDU9jUwEioTzcLJxOLCyzGzvQhAGDnHaL
         Y0WxYCy6L0tEfxp/Cu7ExTkMGwQiFn4f7NOLIG9lQbBqm9bwVy+xfCyhzi1D/3IxcVe3
         mf5QIW52CrNp7nTeNrdYHKIIyUmu8MZk5ACR5Lc+XdvKy9scTWMzdczzesGf/f+UD9rI
         BpDDqQPrUBfKYxw/zwxOfxD6heQv5Qd5XzwX0uqw3fmzcd/kPuspIfHTRHxhKJxmDsW7
         mlndHe6O/yyyvUZpZ4qL5E9kE0WuYFdZVGmD1puZ+mTJUmZPCmIPGWYgSZN+pEmGPLpx
         pXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606709; x=1782211509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UheMcRsmt/7syIiztM9/tG4GEzcMt/LfQFqtbUfauh4=;
        b=qxA9QImauvJh6dhC9bbL0kc5Zm9+2RyRqNQwq+rkUhg120tXD2EsrftxLhX0+KwX7R
         BCC0CemrzLxs+1KVY4O3yfNSpuFaM6kpAbEAOiK/MVCMFAK77YSwPDaVUhAfLMSfjLG1
         k/3VuG2zZnJJv6cEz8tYDVnaAdMUIBxrqZvl3EG7lqnLCeoULLvqsWz1hMIB2WvYBwE/
         rj0mi+z5rKd28yQi+1bXMF7qT0EvZTTo3cClVQHU8m8qpNjXBsTLB7Djt5mSyuc6DD/5
         +Yz5bJtnGNqyREx6UvdItgpJRhoEqCpqprE4JQ1tIE/ifefQrFXZcFNLNrypCSO8Czfo
         PbuA==
X-Forwarded-Encrypted: i=1; AFNElJ8ggzzN1h/wQi5mvCqQJNKuXimlp/v7WqupfFykbMEsW1uTumlhX7wIi0zCVGL3s2Zk7Tq2H3ZkfHTXkTkwo3v7/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ghjeZzonZI1U+MtqZeulYjFWRz0qPFeFtcfjElFSGdYMZvWu
	50bAFWWBcVpuBdJV5nISUYFdovPGRN/VWBe6qYnQ8gMMuSxtSd+aXOF9
X-Gm-Gg: Acq92OEEX2Gfjw7jiikP6AbSsNM5jQccC2FzIjt2YcyUTqJr8U9m8JfmyRN1Usibgy3
	ngHvLPuTzexsSePRHxPmwaawZt0jKyqgO8PP4aUliGhL+mWEVbzE2vAb68ztjhK5B0C/CgPcmSw
	yxDJR7UdnnpkT+qCDHYp/4XOCITewFlk+gDfR2jgTWogvAYynehgTDVAMHu0Di+E3MQMXosoPh7
	totea3qPIzA5HC2erWmgQLwuO7qP9BAhBeUcu7XwUYcrRqfOMLwuJlO0ByJ6Pb7grGKWbaJVID8
	pc2VJ7e2nr6Rad7vFa7cpNuZ7hpQeGxC6AIYTHrEfp6riID3ls2BWdQphGw3hzdzw0BtHJ4U+e8
	ULEiuT3vYUW9ZG3ldBRfnVj/VZPVO8srniLOKjcDt8VKyX203JcHzYPHEdJzHq1MWLU7L4bNtYB
	4xeZ63cV+xKJhiMohG9pGjn8nktm1JKe+jPlZDbQGB56r2AhUw
X-Received: by 2002:a05:600c:810b:b0:490:9df1:f0d5 with SMTP id 5b1f17b1804b1-4922ffb82d9mr46482525e9.28.1781606708340;
        Tue, 16 Jun 2026 03:45:08 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:7499:34c3:598b:e20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm82458485e9.5.2026.06.16.03.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:45:07 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 06/10] regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator support
Date: Tue, 16 Jun 2026 11:44:48 +0100
Message-ID: <20260616104459.410743-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
References: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
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
and registers both regulators using devm_regulator_register(). Register
a separate rzg3l-usb-vbus-regulator platform driver backed by this probe
function.

The existing rzg2l_usb_vbus_regulator_probe() and its platform driver
are unchanged and continue to handle the single regulator-vbus case for
all other SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Passing pointer to an array of regulators to make it scalable.
 * Updated commit description.
---
 .../regulator/renesas-usb-vbus-regulator.c    | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/regulator/renesas-usb-vbus-regulator.c
index 9ba791bd72ec..902834000874 100644
--- a/drivers/regulator/renesas-usb-vbus-regulator.c
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -55,6 +55,50 @@ static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
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
+		if (IS_ERR(rdev)) {
+			dev_err(dev, "failed to register %s regulator\n",
+				rzg3l_usb_vbus_regulators[i].name);
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return 0;
+}
+
 static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
 	.probe = rzg2l_usb_vbus_regulator_probe,
 	.driver	= {
@@ -64,6 +108,15 @@ static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
 };
 module_platform_driver(rzg2l_usb_vbus_regulator_driver);
 
+static struct platform_driver rzg3l_usb_vbus_regulator_driver = {
+	.probe = rzg3l_usb_vbus_regulator_probe,
+	.driver	= {
+		.name = "rzg3l-usb-vbus-regulator",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+module_platform_driver(rzg3l_usb_vbus_regulator_driver);
+
 MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
 MODULE_DESCRIPTION("Renesas RZ/G2L USB Vbus Regulator Driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0

