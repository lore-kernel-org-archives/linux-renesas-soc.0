Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117508;
	b=kpFXSLsda/rV4DGGHY+y6uCwZsPdkEcI3vw14UrTaAj7LpusAggqZ58aOIOdNaQj9LjC
	 0X4V5yIYy4coECG7+OgqKRVmzSCNqLsnDNsgGdUGnClDrm4MlMVKsBRpAnTVXEhp2mKKL
	 GQ4wPbflkBzoWVJ9oEPjWQomzBTSccbnzknmgBv9AkPVFN9/FpdQ97WcDpeDXRZ5VfYZR
	 S+8+Gl6r5wzlf1F860Y1oBG7D3LJuJUGFROJwin+afozcOznHBrGndDJR1ZwIVcTSRRDT
	 tw1l5XlEFlFinS8TDaVDaZQ4+rBK2VDY+Ocnqi086VUZiTad2KUZzMO3j1D3LEZ+Llw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117508;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=8rZ5yGrWp1dl4AtnWdtal5EGRywwPc08IAgIauG15qI=;
	b=PvQsTpUmbq4oFC7/v2SPsMR0aewdjaR7HKvM8wx/XZlvwk+uxs9a8skCTmgGn60xpj5G
	 aNODvn0Gk/ZfOiTnI38VnbuCjFVQxS5sjfR1IMoSX5SAGJeaLG2jddR6dnvuxU2pjTyRJ
	 7FZ5CVrLUE4ycqtvnzi7CeZfFYrXgsxpwx5WuperWV+8bUULpb7qL34tRSarldtvv5kWt
	 IXdUjXh6JLTFNk/sWrEgkTChcFq3LDtnxffpmJBCT89mzbCOZ166A8vo8dFMcEfXEwz7U
	 s7f7WilMM0SwNDOdkdHRjnZpZP2CrSq6LQvDRe2oJm5h0AE3DwcXzzHQwhn+F0QEYgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SsLyJXRJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516D8606A33C;
	Tue, 27 Oct 2026 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SsLyJXRJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C03C1F01829;
	Tue, 27 Oct 2026 16:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793117507;
	bh=8rZ5yGrWp1dl4AtnWdtal5EGRywwPc08IAgIauG15qI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SsLyJXRJd71VzIuMmqAfKCLI1VlK1W4wyFlG+R2t4FYEAVQSc4v8VP7x7FTU3Tl3m
	 1NzsUfH6rYSktgDxBaT8WFwdWrYHRrxoRVR6sTgbj8hantNxBFmqZOUXscEtS+1egz
	 wd5xi1/1qclEhjsc+kF7QpnMXWMR/ey4AKFg7BRIhfLuHBhEGpKGvnOXpZe3pUddu/
	 hfqxlMftfqTl9gMc726sb/AgfvKF8XpeF2zkhKYZNc7rcaDe8g5TvKqrXFiB7fZb8E
	 n2FICjGaEPxfWG7ZHl3SKxsi64Y9yZ1JLGaexHsYkdh5fqmjS+5+LCD/5FN9FRAotK
	 UBCWZ3LxGclEA==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 17:11:28 +0100
Subject: [PATCH RFC v5 6/7] media: mali-c55: Sequence clocks explicitly
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
Message-Id: <20261027-mali-c55-renesas-dts-v5-6-51bbb43969c1@kernel.org>
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
and third clock and reset identifiers in the ISP node. Test the clock
ordering from that configuration without changing the DT assignments.

Acquire hclk, aclk and vclk individually by name. Enable them in that
order and disable them in reverse order. With the current RZ/V2H DT,
this requests clocks 0xe2, 0xe4 and 0xe5, matching the reported working
configuration. Unwind successful enables in reverse order on failure.

This RFC changes the driver's sequence only. The CPG power domain can
enable clocks in DT order before the runtime-resume callback, and shared
users may already hold clocks enabled. It does not guarantee the same
order of physical clock transitions as the DT swap.

The report changed clocks and resets together, so clock ordering alone
has not been shown to fix the hang. Target hardware testing is needed.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../media/platform/arm/mali-c55/mali-c55-common.h  |  5 +-
 .../media/platform/arm/mali-c55/mali-c55-core.c    | 59 +++++++++++++++-------
 2 files changed, 44 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-common.h b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
index 13a3e9dc4243..b1ac50d6b30e 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-common.h
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
@@ -38,7 +38,6 @@
 
 #define MALI_C55_DEFAULT_MEDIA_BUS_FMT	MEDIA_BUS_FMT_RGB121212_1X36
 
-#define MALI_C55_NUM_CLKS		3
 #define MALI_C55_NUM_RESETS		3
 
 struct device;
@@ -237,7 +236,9 @@ struct mali_c55_context {
 struct mali_c55 {
 	struct device *dev;
 	void __iomem *base;
-	struct clk_bulk_data clks[MALI_C55_NUM_CLKS];
+	struct clk *hclk;
+	struct clk *aclk;
+	struct clk *vclk;
 	struct reset_control_bulk_data resets[MALI_C55_NUM_RESETS];
 	int irqnum;
 
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index f28e9f4354ac..0caef871cad4 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -64,12 +64,6 @@ static const unsigned int config_space_addrs[] = {
 	[MALI_C55_CONFIG_PONG] = 0x22b2c,
 };
 
-static const char * const mali_c55_clk_names[MALI_C55_NUM_CLKS] = {
-	"vclk",
-	"aclk",
-	"hclk",
-};
-
 static const char * const mali_c55_reset_names[MALI_C55_NUM_RESETS] = {
 	"vresetn",
 	"aresetn",
@@ -668,7 +662,9 @@ static int mali_c55_init_context(struct mali_c55 *mali_c55,
 static void __mali_c55_power_off(struct mali_c55 *mali_c55)
 {
 	reset_control_bulk_assert(ARRAY_SIZE(mali_c55->resets), mali_c55->resets);
-	clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks), mali_c55->clks);
+	clk_disable_unprepare(mali_c55->vclk);
+	clk_disable_unprepare(mali_c55->aclk);
+	clk_disable_unprepare(mali_c55->hclk);
 }
 
 static int __maybe_unused mali_c55_runtime_suspend(struct device *dev)
@@ -687,20 +683,30 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
 	int ret;
 	u32 val;
 
-	ret = clk_bulk_prepare_enable(ARRAY_SIZE(mali_c55->clks),
-				      mali_c55->clks);
+	/* Enable the register interface, AXI and video clocks in that order. */
+	ret = clk_prepare_enable(mali_c55->hclk);
 	if (ret) {
-		dev_err(mali_c55->dev, "failed to enable clocks\n");
+		dev_err(mali_c55->dev, "failed to enable hclk\n");
 		return ret;
 	}
 
+	ret = clk_prepare_enable(mali_c55->aclk);
+	if (ret) {
+		dev_err(mali_c55->dev, "failed to enable aclk\n");
+		goto err_disable_hclk;
+	}
+
+	ret = clk_prepare_enable(mali_c55->vclk);
+	if (ret) {
+		dev_err(mali_c55->dev, "failed to enable vclk\n");
+		goto err_disable_aclk;
+	}
+
 	ret = reset_control_bulk_deassert(ARRAY_SIZE(mali_c55->resets),
 					  mali_c55->resets);
 	if (ret) {
 		dev_err(mali_c55->dev, "failed to deassert resets\n");
-		clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks),
-					   mali_c55->clks);
-		return ret;
+		goto err_disable_vclk;
 	}
 
 	/* Use "software only" context management. */
@@ -734,6 +740,15 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
 			   val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
 
 	return 0;
+
+err_disable_vclk:
+	clk_disable_unprepare(mali_c55->vclk);
+err_disable_aclk:
+	clk_disable_unprepare(mali_c55->aclk);
+err_disable_hclk:
+	clk_disable_unprepare(mali_c55->hclk);
+
+	return ret;
 }
 
 static int __maybe_unused mali_c55_runtime_resume(struct device *dev)
@@ -788,12 +803,20 @@ static int mali_c55_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(mali_c55->base),
 				     "failed to map IO memory\n");
 
-	for (unsigned int i = 0; i < ARRAY_SIZE(mali_c55_clk_names); i++)
-		mali_c55->clks[i].id = mali_c55_clk_names[i];
+	mali_c55->hclk = devm_clk_get(dev, "hclk");
+	if (IS_ERR(mali_c55->hclk))
+		return dev_err_probe(dev, PTR_ERR(mali_c55->hclk),
+				     "failed to acquire hclk\n");
 
-	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(mali_c55->clks), mali_c55->clks);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to acquire clocks\n");
+	mali_c55->aclk = devm_clk_get(dev, "aclk");
+	if (IS_ERR(mali_c55->aclk))
+		return dev_err_probe(dev, PTR_ERR(mali_c55->aclk),
+				     "failed to acquire aclk\n");
+
+	mali_c55->vclk = devm_clk_get(dev, "vclk");
+	if (IS_ERR(mali_c55->vclk))
+		return dev_err_probe(dev, PTR_ERR(mali_c55->vclk),
+				     "failed to acquire vclk\n");
 
 	for (unsigned int i = 0; i < ARRAY_SIZE(mali_c55_reset_names); i++)
 		mali_c55->resets[i].id = mali_c55_reset_names[i];

-- 
2.56.0

