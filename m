Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17E146AF08
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Aug 2026 15:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857070; cv=none; b=qzmTBnnKK6Uv3BsSFgKcUVqCeXQB7+2/03zLJFkYp5JbQBLJmiQ6+8MO3Bg6etvKN4olApGDubRxPsaQ/8ZU84C9fixLMxgUdJpFpFI/cSU43bCC+4j4u2DZzZQLz1ugmgPqKjea3udo38llYrFsEU9uGGhClL/AevzJu6IVQyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857070; c=relaxed/simple;
	bh=f3dBut9WSJ6O3srcSvXsdGYa6Ngpl9cC3b61R3xBFnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3AcnsWYHTpYnvepYCrVU9E2Rk2uyGnnxPl0uD2DL6vCGz3omBhPahwIi0FAEEaTY5a62fJQCXgFqZunhFj0ZcAdsI98pD+USdRnsTWUFY/XWJ6JZ6V137yRpp3iGE2Er/JDtCekB5Fwq+8U76F2gfOLjttuH3OwMDGCBSdZ+kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h32Yhpw+; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h32Yhpw+"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e04df8c46so4320882b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Aug 2026 08:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785857068; x=1786461868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjMEIKou8AZx5p3jNLvJo9ap4iKsldeOQJzsD8DXaLs=;
        b=h32Yhpw+NQ5PhmmPgQNTfdAvfartX4hjGOTtVA4KYmn1mBqRxO9P5IcAZzja7MK4Ur
         VNB4SoCU2xYBvq4FWdeDwTMgC56Df6uyst5Se+E5wgjnnTm62Tz7OJZ7cgjHblXgNQaX
         ZMJsHhaS1dnGtUDAOxna4MPud4wYqZLXNh/m+YmehZDABDI0KH6gWnc7Kq4utQymBlFp
         53Bpf38ospgO7Ydraxi7Nd+K2lAgA2NLqE4gc+hJGzt+W1Rf6vrPNwO9FNoFdbHGCLgs
         gIoCL+FENTZnlzSJacF1+YShl/ybziq3vCUlMVks3jRhdae3haV/FlHTd1YTxkZZUy/C
         qqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785857068; x=1786461868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjMEIKou8AZx5p3jNLvJo9ap4iKsldeOQJzsD8DXaLs=;
        b=ba9nRxRKDmuFaiMtxsY9kdZJzs+XSQzsORtAKaJloNSLR5JfMOtbv+Ns/+5aHZ/Q6m
         ZRPsP56ZXwbJ12EKEacMlLFvp09ziGJUUE7LKYq5TeAVV0hc6a22stKKwjO22L/hjtfy
         0jjb4B+rvatx4Ov3AGTPUe2ln4QqLEl+P61RYSYzLdKyAuYYuNDso3458DBMftn8DYJ9
         m0AVg+CvLAl5+0ZkWZ3n/3GhUzh5n0cQMTpCy/BVQeN3z38SI8A5ZYq008Q+grQJY5z9
         FJuaSdgInxXzZXQUmI3mHq23jBOxVHE2NQhuLesbDFJyMy9chlVqnqUopOSVzlJ0EVF0
         SWYA==
X-Forwarded-Encrypted: i=1; AHgh+RqfDRM00TN9XzHUjV4Mg6q39qYCCzP/3eVzm5h7l9cbKt7r++huqp74qwT8b/xaCGB4mdbhPOWSMYschCd/7yzqxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqzBj9LFR/bINDyeVGE/c/5JT+khG2U7pIjxA3unBcfw9U53Nc
	Lk5YtkcK2axhxIl1iCgCzMCG3FJ8947vI8Dk0l5ztKYTn8h0dOukODfN
X-Gm-Gg: AR+sD132eVJTxfhrQPwEGJ45AeZXjcpvY+KKANC9kIkeDWXPt+31Q3V8IyxJDGCgSlR
	cUMv9M0UkeY1YXyKGEFKpcpvrC0023YkQDiY1ktAEvyRND2D6F1yWtyDMOG1DR6v0ARBz8bpcGP
	m3xUsE/JIIyCVkowqBwYZfuBp3NARLiIDisIsBcP9fSFXIAhuTv5/9x/8OR1k7+TG754AId2JJF
	Ea7HKfYipxuqSBRVbve3DwYWBaSAPDMNbLPnwPKS5kGzyxcXyvfDHY5X1LMpbxHCAuoB8S3oR9u
	1Whzh/Xa0+3EzzW5mYow39zvXQbPTO8XjMznZMIrIiv8ZOT+xYeU1EjA5KcpwaVLeQjDQX9Yto/
	32ODy/prDMROUW5NLM2J5bAPuXyMu0dm2wASrSlBBA552JQxgTjD4xWBPqUYdvbPKEDj2gdCvC5
	PmMn2+S6LhJKgfp7Z/r/Ad/s9wXH8t++Z3XRJkzb5Cv60ibjTo2103PlhbZb9qkZUu7loOgWweX
	lAbUV00x2OMvts0lqEMCz2Q4o55uB97/Mz6oA==
X-Received: by 2002:a05:6a00:12ca:b0:848:4424:2b8e with SMTP id d2e1a72fcca58-84ee47e39cfmr13869162b3a.3.1785857068002;
        Tue, 04 Aug 2026 08:24:28 -0700 (PDT)
Received: from [127.0.0.1] ([103.17.98.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe564b3sm5586778b3a.14.2026.08.04.08.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 08:24:27 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 04 Aug 2026 23:24:17 +0800
Subject: [PATCH v2 1/3] phy: renesas: rcar-gen2: Fix double of_node_put on
 phy creation failure
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-rcar-gen2-v2-1-829cb84112ca@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785857060; l=1051;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=f3dBut9WSJ6O3srcSvXsdGYa6Ngpl9cC3b61R3xBFnU=;
 b=gLup/i0APDsOHIFwtl+FN3WpFHapDtHlYLsmr8oH1S5EVBCSC7MGJ7idmHzl3X3W4/ya968LP
 6WC7TgGO/jyCsczkUgS0s2PIUTZyfRacwyMWkXw5eP9cG7cqew1hMDY
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

for_each_child_of_node_scoped() releases the node reference on scope
exit, so the explicit of_node_put(np) in the devm_phy_create() error
path drops it twice.

Drop the redundant of_node_put() and let the scoped cleanup handle it.

Fixes: b64b32791fb5 ("phy: renesas: rcar-gen2: Simplify with scoped for each OF child loop")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/renesas/phy-rcar-gen2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index 6c671254c625..5a272e25e051 100644
--- a/drivers/phy/renesas/phy-rcar-gen2.c
+++ b/drivers/phy/renesas/phy-rcar-gen2.c
@@ -405,7 +405,6 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 						   data->gen2_phy_ops);
 			if (IS_ERR(phy->phy)) {
 				dev_err(dev, "Failed to create PHY\n");
-				of_node_put(np);
 				return PTR_ERR(phy->phy);
 			}
 			phy_set_drvdata(phy->phy, phy);

-- 
2.43.0

