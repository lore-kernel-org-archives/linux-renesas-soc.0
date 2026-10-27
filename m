Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117511;
	b=NwAHL4KPYTTKcJaR8fw3bMgNT5ecxaHs4qr1i1LNPPZ+29D+sbyyeWDn2P6L/FrqKFsC
	 A4SwB817OzMVuxy6jq6paJAP5kcMc7/OrrAP3MFajreHxeT9Sa/FWQwRnrHPu3g1uKMH7
	 9ilZ7OdNUhPO3wUkTia91juGEVdkJdKqSWgE/EaIhp8KdZRqFCmTrl3jBkgmt4BDtefNe
	 V0L8130bSFbM5fmjWs7CCTDD589XZqKhv0iSo/wVCcrjAVtHrUl+95cLc03nT7gqrH0xs
	 nnXfNWyXAQi9OvPijTOKA+KjoKbzlfcNFvHeodDn3VueAx4npoXuzxNnDc3eMjYOxvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117511;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=dpiUd++w0gAxP5vedTc+KJwB9PGfVB7BmAKyC5YyLEA=;
	b=PrHyM0fZZ8HOG7B4b7BVWX1NlJusaBaAgRmcyXJA2+sgX7WrGc3Fy2sbfiHR+MB3nE12
	 nzfOLZHD9C+ZChnJDF6AGhCUrqA8JDWBQLya0KO8YixZIr1QskYwcAkDRKPjNb+UoH2TA
	 EalLytqhGNYeiuv2W34eqRa+vY62xWHQ0obRFg+2HKu6Rk8FuldeLyfy8cQ0B2UjXSHJP
	 GxYuMBZzx4o/RXroDOkTOQM2aFRTkyM0j2V4CZ4pCEcE4BA7Yk/69UqL86JYxYZWu97Bu
	 0xBuMpxrNSjFJMZBpZRvR6eDRGC8V1Ahjz9uipliOzhmaCcPRsgn4SzPnIV/9GWQ9Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bO7SkWJK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C68606A321;
	Tue, 27 Oct 2026 16:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bO7SkWJK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DAF71F01825;
	Tue, 27 Oct 2026 16:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793117511;
	bh=dpiUd++w0gAxP5vedTc+KJwB9PGfVB7BmAKyC5YyLEA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bO7SkWJKlaLGXjazONQHSqSSWjl0/xTEJQ1jnWF6q5KKYFqPIyl9rVqWhN1SrhB82
	 LRTZogkD3t9iGVWGsc8YEUM7+x38N2DcQoC46tGI9ULtEqAbfEi5vS6gHGcGhCeDGU
	 YaL9fKAKfWnaHgLRCaqL1FFuSneuElGsf32KL5SCQKqvlDm7cor8CPjZHnpmlN0P6I
	 F+vHuPTzuniWA2l1EyHgx8sxNy8GBQywpJlbQXHTzypH+nNpmgRn33ghnOgJHP4uYU
	 Wm0nuN/bn5hasESpV2hUSbUJjoSGIBV+R538gg2JpcpZRPSgoj2A9eUFQihhGz75IQ
	 rsWfVA4D0DxKw==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 17:11:29 +0100
Subject: [PATCH RFC v5 7/7] media: mali-c55: Sequence resets explicitly
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-mali-c55-renesas-dts-v5-7-51bbb43969c1@kernel.org>
References: <20261027-mali-c55-renesas-dts-v5-0-51bbb43969c1@kernel.org>
In-Reply-To: <20261027-mali-c55-renesas-dts-v5-0-51bbb43969c1@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Reporters avoid a register-access hang on RZ/V2H by swapping the first
and third clock and reset identifiers in the ISP node. Test the reset
ordering from that configuration without changing the DT assignments.

Acquire vresetn, aresetn and hresetn individually by name, retaining their
optional shared semantics. Deassert them in that order and assert them
in reverse order. With the current RZ/V2H DT, this deasserts 0xd3, 0xd1
and 0xd2 and asserts 0xd2, 0xd1 and 0xd3. These are the orders produced
by the bulk helpers with the reported working DT swap, since bulk
reset deassertion traverses its array backwards.

Preserve the bulk helpers' error rollback. A shared reset increments its
deassert count before invoking the provider, so a failed deassertion
must also be balanced when unwinding.

This RFC tests the driver's request order, not simultaneous hardware
reset transitions. The IVC can already hold shared resets deasserted.
The report changed clocks and resets together, so this ordering still
needs target hardware testing.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../media/platform/arm/mali-c55/mali-c55-common.h  |  6 +-
 .../media/platform/arm/mali-c55/mali-c55-core.c    | 75 ++++++++++++++++------
 2 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-common.h b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
index b1ac50d6b30e..f2cd4d4ef472 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-common.h
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
@@ -38,8 +38,6 @@
 
 #define MALI_C55_DEFAULT_MEDIA_BUS_FMT	MEDIA_BUS_FMT_RGB121212_1X36
 
-#define MALI_C55_NUM_RESETS		3
-
 struct device;
 struct mali_c55;
 struct mali_c55_cap_dev;
@@ -239,7 +237,9 @@ struct mali_c55 {
 	struct clk *hclk;
 	struct clk *aclk;
 	struct clk *vclk;
-	struct reset_control_bulk_data resets[MALI_C55_NUM_RESETS];
+	struct reset_control *vresetn;
+	struct reset_control *aresetn;
+	struct reset_control *hresetn;
 	int irqnum;
 
 	u16 capabilities;
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 0caef871cad4..47e26d85784e 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -64,12 +64,6 @@ static const unsigned int config_space_addrs[] = {
 	[MALI_C55_CONFIG_PONG] = 0x22b2c,
 };
 
-static const char * const mali_c55_reset_names[MALI_C55_NUM_RESETS] = {
-	"vresetn",
-	"aresetn",
-	"hresetn",
-};
-
 /*
  * System IO
  *
@@ -661,7 +655,27 @@ static int mali_c55_init_context(struct mali_c55 *mali_c55,
 
 static void __mali_c55_power_off(struct mali_c55 *mali_c55)
 {
-	reset_control_bulk_assert(ARRAY_SIZE(mali_c55->resets), mali_c55->resets);
+	int ret;
+
+	ret = reset_control_assert(mali_c55->hresetn);
+	if (ret)
+		goto disable_clocks;
+
+	ret = reset_control_assert(mali_c55->aresetn);
+	if (ret)
+		goto err_deassert_hresetn;
+
+	ret = reset_control_assert(mali_c55->vresetn);
+	if (ret)
+		goto err_deassert_aresetn;
+
+	goto disable_clocks;
+
+err_deassert_aresetn:
+	reset_control_deassert(mali_c55->aresetn);
+err_deassert_hresetn:
+	reset_control_deassert(mali_c55->hresetn);
+disable_clocks:
 	clk_disable_unprepare(mali_c55->vclk);
 	clk_disable_unprepare(mali_c55->aclk);
 	clk_disable_unprepare(mali_c55->hclk);
@@ -702,11 +716,23 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
 		goto err_disable_aclk;
 	}
 
-	ret = reset_control_bulk_deassert(ARRAY_SIZE(mali_c55->resets),
-					  mali_c55->resets);
+	/* Release video, AXI and register interface resets in that order. */
+	ret = reset_control_deassert(mali_c55->vresetn);
 	if (ret) {
-		dev_err(mali_c55->dev, "failed to deassert resets\n");
-		goto err_disable_vclk;
+		dev_err(mali_c55->dev, "failed to deassert vresetn\n");
+		goto err_assert_vresetn;
+	}
+
+	ret = reset_control_deassert(mali_c55->aresetn);
+	if (ret) {
+		dev_err(mali_c55->dev, "failed to deassert aresetn\n");
+		goto err_assert_aresetn;
+	}
+
+	ret = reset_control_deassert(mali_c55->hresetn);
+	if (ret) {
+		dev_err(mali_c55->dev, "failed to deassert hresetn\n");
+		goto err_assert_hresetn;
 	}
 
 	/* Use "software only" context management. */
@@ -741,7 +767,13 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
 
 	return 0;
 
-err_disable_vclk:
+	/* A shared reset takes a reference before calling its provider. */
+err_assert_hresetn:
+	reset_control_assert(mali_c55->hresetn);
+err_assert_aresetn:
+	reset_control_assert(mali_c55->aresetn);
+err_assert_vresetn:
+	reset_control_assert(mali_c55->vresetn);
 	clk_disable_unprepare(mali_c55->vclk);
 err_disable_aclk:
 	clk_disable_unprepare(mali_c55->aclk);
@@ -818,13 +850,20 @@ static int mali_c55_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(mali_c55->vclk),
 				     "failed to acquire vclk\n");
 
-	for (unsigned int i = 0; i < ARRAY_SIZE(mali_c55_reset_names); i++)
-		mali_c55->resets[i].id = mali_c55_reset_names[i];
+	mali_c55->vresetn = devm_reset_control_get_optional_shared(dev, "vresetn");
+	if (IS_ERR(mali_c55->vresetn))
+		return dev_err_probe(dev, PTR_ERR(mali_c55->vresetn),
+				     "failed to acquire vresetn\n");
 
-	ret = devm_reset_control_bulk_get_optional_shared(dev,
-			ARRAY_SIZE(mali_c55_reset_names), mali_c55->resets);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to acquire resets\n");
+	mali_c55->aresetn = devm_reset_control_get_optional_shared(dev, "aresetn");
+	if (IS_ERR(mali_c55->aresetn))
+		return dev_err_probe(dev, PTR_ERR(mali_c55->aresetn),
+				     "failed to acquire aresetn\n");
+
+	mali_c55->hresetn = devm_reset_control_get_optional_shared(dev, "hresetn");
+	if (IS_ERR(mali_c55->hresetn))
+		return dev_err_probe(dev, PTR_ERR(mali_c55->hresetn),
+				     "failed to acquire hresetn\n");
 
 	of_reserved_mem_device_init(dev);
 	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);

-- 
2.56.0

