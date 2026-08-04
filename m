Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF657466AF1
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Aug 2026 15:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857080; cv=none; b=RWkb+Fep7Uno42ZQYPnHB/LSjsExEH4OQmR9xMq+ArDPqpVGnwT5Z3fiXdIxYctTmwAiqkYPeaGVgaSw5OCfp4vXneqBAEAVapM1t4rVC4BqbNlPjKl/ulas7hCV2UEeRN7sgAndyjz1dLzitS/2c5L7u6cCRej7KRa4HV2oTuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857080; c=relaxed/simple;
	bh=8N1KfRu3c/EnqBJdu7xl5UdInSkm8t3S/TsB4emkZQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DjwdmYlMi8bXBgEG/GAjRDYFmYF3CfZq9PLERaX0S5Yph6SOxJoAlvV4anLnZ/xwXnuFTDRR24X/UFc/CAo/SbpE4zqMdabr7smSkiQ8umNBYFMHlNXSyQl5DlEdesyGljG5v3uNnfHrp4F8zgyiu33aXW4IXL5uQxaBw16kdMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ct/HiA0k; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ct/HiA0k"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-848643382fcso4153979b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Aug 2026 08:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785857078; x=1786461878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sbVRLeDoCCW2STTQ73SaS5bPQTwsTGlS1LT09DSg3jg=;
        b=ct/HiA0k9oow8xg1Jub9wlcsEE4IRmeLRh+yovITJp2JIXCYTELgTOmughJB93uBgr
         H/jC8KOPKnQVHJnMOFK14hUbICBQ2m7rhv9NXDwJpIKXai5UhYar73y0CJs/L3HBfZwE
         2cnOTOuMNdZVLnqrj2f+G0MSvlnFy3gFkzW/SWsE1BqY9uFyHbcv2NprVAdzHz6LV8tp
         nGl/dYFVpw1YcEk9dpWPyXPDA47vlxj4b9FgyQ+dWJ3fwv9EwOpBt2LDsZgIUXpcdHlK
         9SdX+ak3fAUaohR1Q7PaOwKR8WFrYnOmywIr6RlGQx5t8bjRbzXl2H3KQkPLQ22nQ5pK
         Nfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785857078; x=1786461878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbVRLeDoCCW2STTQ73SaS5bPQTwsTGlS1LT09DSg3jg=;
        b=QREa4Plw5DVUYapTxT/g/1sWP+oC9sWMXwFwwcS8jXVZKQ5GxzWTWCocMvehAhgTFY
         1YqTHkMM+g9P5YERpLwMLgcOpkQgZbAmLGiceHwJDkQtftaQHotcAlNIcGJP62INxX0b
         oEYXUX+Kl7Zi4X7fhsX3z30AZY6b7Hdc/sTQLSHfrjozUXaxdndJ6OILZ0EEWK59h5Zy
         Wgh7sqyq60l1hvfILckYij0+zTEuOvNd21TRWYS1nz0TUhe8s/b4Yq+A6jYAcvS+UCV0
         5km0TsGc+mUVzjeXu5XHv0mg/OTcF9keoPIFyV1LBbch/Kba/ZKn2LigSRGixLMwdB/x
         K95Q==
X-Forwarded-Encrypted: i=1; AHgh+RrmVtxfTnzhPmGHE+c7x27lM5k5WaOmam2K4LQXX8kDLFDCHdaMDshyLscoK9/uQw+7RiHgjNZf5a00iTcI+PLI+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2BBmsp8DUhX74wkpXZPQJwvAViWU3CtOWKi1/pviSNQd7uuwk
	iUnrMSy2Uk8TdfOkYQyqLiBghMyAzL1rLij1FXxXp60RNXgBjqRLfjRz
X-Gm-Gg: AR+sD13LrPebZBXygYF2exSbP7U9aXn+Gn8Bnvhpucb0pGF7I2AgrxpDnIhmcQ8O22a
	vwQyq+F4KLzC80/ilgiS5IEmq1G9wEI55CA8aS5Gua3HqgW+SEzbQKq3g9M3jcjVgNiCrF9/WVW
	8DNGBCXRtwaPAkwupG/Dj4Q/JRKILtuclof/JGOv5WOikII5HgKZhZs9hCm3tOVWqu1129zUfQv
	87kUhw4aoM+ZdP/7TwZtnJfiiFIgKY8KsNAlw3nirzUE5ewy718JCJyBG9pIbgskkBmeQFMkG3Q
	j0UDu2F1ShbiBPePi0j+ihBCDEPDdsFFA5gJAtGtOcrmGEomuoB5/sARJeg5tWTte82f06NntLl
	IhtOBEbQcgE+8L9aqR47+tPHZFyRuqRly4eqVbRHCgjf2rJfnixVHccLCpH6Jz3Ilb06TSl5ItS
	uqSJrSgXBimNzlVRsUxg0jKYjKrxi0JDip1iGUCQPUhiS6P7GaqXHn8E6XObobENv5j7WRdzaF4
	AwJcBxoztH3v0fv03Cf09D6gnBgT6G9ABtBrA==
X-Received: by 2002:a05:6a00:cc6:b0:848:5f4f:2899 with SMTP id d2e1a72fcca58-84ee478fd67mr14141258b3a.16.1785857077965;
        Tue, 04 Aug 2026 08:24:37 -0700 (PDT)
Received: from [127.0.0.1] ([103.17.98.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe564b3sm5586778b3a.14.2026.08.04.08.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 08:24:37 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 04 Aug 2026 23:24:19 +0800
Subject: [PATCH v2 3/3] phy: renesas: rcar-gen2: Use dev_err_probe() in
 probe
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-rcar-gen2-v2-3-829cb84112ca@gmail.com>
References: <20260804-rcar-gen2-v2-0-829cb84112ca@gmail.com>
In-Reply-To: <20260804-rcar-gen2-v2-0-829cb84112ca@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785857060; l=2645;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=8N1KfRu3c/EnqBJdu7xl5UdInSkm8t3S/TsB4emkZQ4=;
 b=Rve/4xIJsDxKCs7TWRvKkUJiFC7y7Q8VnWFhUj6ehAGQibpGsY4JLqD9UGNLM96kyh7Z8XXPi
 OsJjqtds8o+B9P0N4r4GburlQvqrsUW3aaYQaJ/7fjSfZoHw1IAGVI6
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Convert the error paths in rcar_gen2_phy_probe() to dev_err_probe().

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/renesas/phy-rcar-gen2.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index b18727ed41a1..581f6768e2bb 100644
--- a/drivers/phy/renesas/phy-rcar-gen2.c
+++ b/drivers/phy/renesas/phy-rcar-gen2.c
@@ -342,17 +342,13 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 	const struct rcar_gen2_phy_data *data;
 	int i = 0;
 
-	if (!dev->of_node) {
-		dev_err(dev,
-			"This driver is required to be instantiated from device tree\n");
-		return -EINVAL;
-	}
+	if (!dev->of_node)
+		return dev_err_probe(dev, -EINVAL,
+				     "This driver is required to be instantiated from device tree\n");
 
 	clk = devm_clk_get(dev, "usbhs");
-	if (IS_ERR(clk)) {
-		dev_err(dev, "Can't get USBHS clock\n");
-		return PTR_ERR(clk);
-	}
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Can't get USBHS clock\n");
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -388,10 +384,9 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 		channel->selected_phy = -1;
 
 		error = of_property_read_u32(np, "reg", &channel_num);
-		if (error || channel_num >= data->num_channels) {
-			dev_err(dev, "Invalid \"reg\" property\n");
-			return error ?: -EINVAL;
-		}
+		if (error || channel_num >= data->num_channels)
+			return dev_err_probe(dev, error ?: -EINVAL,
+					     "Invalid \"reg\" property\n");
 		channel->select_mask = select_mask[channel_num];
 
 		for (n = 0; n < PHYS_PER_CHANNEL; n++) {
@@ -403,10 +398,9 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 
 			phy->phy = devm_phy_create(dev, NULL,
 						   data->gen2_phy_ops);
-			if (IS_ERR(phy->phy)) {
-				dev_err(dev, "Failed to create PHY\n");
-				return PTR_ERR(phy->phy);
-			}
+			if (IS_ERR(phy->phy))
+				return dev_err_probe(dev, PTR_ERR(phy->phy),
+						     "Failed to create PHY\n");
 			phy_set_drvdata(phy->phy, phy);
 		}
 
@@ -414,10 +408,9 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 	}
 
 	provider = devm_of_phy_provider_register(dev, rcar_gen2_phy_xlate);
-	if (IS_ERR(provider)) {
-		dev_err(dev, "Failed to register PHY provider\n");
-		return PTR_ERR(provider);
-	}
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "Failed to register PHY provider\n");
 
 	dev_set_drvdata(dev, drv);
 

-- 
2.43.0

