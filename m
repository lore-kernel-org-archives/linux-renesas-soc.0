Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B0A3B14C8
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Oct 2026 16:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565045; cv=none; b=gGYRPDyw9MGBtmbOiUrwxQ5MkE7SNXXVD7zPjga+fnPTYgoYrqhi7oPo65/QIoqi1IZRaPIOviO0VfU4RwtzPmOzgz0qxlYZVyzaFMR6owtKNikxi8c5KuxyL7jLsa02aiwj2X3P0RW2MlhwMLm+iqDPKaygVdg3vCEyJbYYUX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565045; c=relaxed/simple;
	bh=a4LEdI4zmYrsARTO6tm7elt3ct0CBuvgZr8Y+wGqMS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POKZY6//aJm3YSKq3cU7rbwvRHriNeXIXXcmphlvaf6+PSVM41cxM5gITf/XDEFWWS2lKHrXvScsyyfMwR8ZUjX71M/WuOJAk7uevODofoEF0dhSFAp7487DLdpdp3Opi5QLfKsCbl/C2MB8q5OpVkQ1RFTQBMur9UGwVrFh+5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhzBgdzX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhzBgdzX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49ff680331aso515325e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Oct 2026 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791565042; x=1792169842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0El2Fy00Oi5wjm6HinjFYLztqKtQYho+ZzRgbEJvPwY=;
        b=hhzBgdzXN7i2paxcOk6Uh2cFgLFkwmkiLN+/mptwRx/GtlA+IGu4QclPdeV91uwFjy
         HGqxOKSph3hzFQ0alB+u9a/O2psj1qVpBkSfIhlRq52etZ0T/ZyKSGLjU/EZR/lqNmWq
         oemEzWzzmObBcWbTqTS4QiJPJiMGtW+VtyYuqcvvC9G345quur0g3Krv1z2sTzhIUsKj
         0qoL93YsdXXmR7+IKyFGPZJf6rGolDF/Z65Mb+i8t/Gvq3ARx75++YEUzZgi4okxMoWC
         7h4Y+rweveAEpwrIkihBnSV/ODvR587k7Hdoywf13RmNQojeBPdwsgoIw+ifgBpHckFO
         qGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565042; x=1792169842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0El2Fy00Oi5wjm6HinjFYLztqKtQYho+ZzRgbEJvPwY=;
        b=Nv0sN+tMjWsacdETmtAbRbRSJIlW18xBm45+/X/K7YGNAfW7V2C5lopDtrFVGSzo6t
         cvPDdZRPwgzmReqk+/p3nRFOk+gzQsFgvPhxpECLWy1aEAsuS+37yGrN/aAG+Z7Mtl2t
         qMGd7156GgVCxuucB51v3HSL0bzljNZ0zeMU8Z/amPwBRb0VGCcz8knDsdlGQFH1Tc+k
         PRY3krU98Fp0f9Yx4kQFgnuyh2Nco+4yT/XE5vrVY3N21hNCY29Ga+rNWd384L/kR/zD
         e5ai9JA5iwz2dC2SBb+cbvKlU5xXYW5fYMfxSjRqI7oYQjBQAIb4arrgYJNJXHyqdog3
         pc6w==
X-Forwarded-Encrypted: i=1; AKwUvBzFeuencU8Z+MBhli98TX+xJx3w1DOpkGs3jwO8fu269DbpIDkXTy0BOg+iPTnE8lFQOXb/AROww4onIGDHIn15yg==@vger.kernel.org
X-Gm-Message-State: AFuF++kdFnmNKSRE5w09MeAjduWOzOJaKm8cON42yRndp+XuUPg/rJOT
	UVtoVkez0NkLU3ywWOxyeVdxmwXmaVZSp5B+NS2edqmzwkzA9Ee4Ttfw
X-Gm-Gg: AYBFou1+Hvs4BWRXu2wrnb4kBIM2krxTzb/WGlZEIyqlflJAPz7zcWyaeE/UQ8ljdNR
	9Nnr4pfM1KYisBx+IzLqoVmf3NgIyzlBoTyB2jto+pi1UotiQr3C1KYtA4TPYG14Ko0kzTnWDlN
	KxBO1XRJ2FrHaHLern2sM/aF4qL24yapvY23PPezQoHkgD3WD3eNo3vMyfvnOYZiDOnn1STOBMf
	0pJ3NP58KK8H3BeJVrEIZRsVXs53doCjlwK1hjHqUVAXEyKaXQ4H8z7ZqKQfJ5bv70w93Xzh/Bp
	Axtp10lvfjEInjV32bI8i/I4HUnvBYcSEitQQKFSJQJe6VYOCKUmXYXU1DTHqN0zvZ5X89kVyK2
	uR7ZcG8NPHFLxlFO2ghzJnPSf7dEKmh3QJkoYgQAKh/Ua0JzmXaLEMUMGvvw60c+WEJRdXCuE/J
	q76hgCKNn8vVZ4/xcas6/dd7fXu7Vjq9K8OvpOic8nkPAHKCN55dsOMfHzA2yqaudoxJZIGKCUs
	AKmHRMBj4G4LiQKyoFTuLZwltrPNUC/3k81H46IRGjQbuJBVais2GqUBKd5RI3ztfviWn4RSnii
	ru/E6RBpplIRv/XzTg==
X-Received: by 2002:a05:600c:6215:b0:49f:ff32:8044 with SMTP id 5b1f17b1804b1-4a18e47a88fmr41977265e9.7.1791565042227;
        Fri, 09 Oct 2026 09:57:22 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm70667395e9.4.2026.10.09.09.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:57:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/5] power: sequencing: renesas-pwrrdy: Add RZ/V2H(P) and RZ/V2N A/D converter support
Date: Fri,  9 Oct 2026 17:57:09 +0100
Message-ID: <20261009165710.1320233-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On RZ/V2H(P) and RZ/V2N, the SYS_ADC_CFG.SY_MSTP_ADA bit controls
A/D converter power-down. RZ/V2H(P) has a single A/D converter unit,
while RZ/V2N has three units sharing the same bit.

Add an "adc" power sequencing target for these SoCs and match it to the
RZ/V2H(P) ADC compatible, which is also used as the fallback compatible
by RZ/V2N.

Clear SY_MSTP_ADA when the first A/D converter unit is enabled and set it
again when the last unit is disabled. Wait 20 us after clearing the bit
before allowing conversion to start, ensuring ADCLK has been running for
the required time.

Bind the power sequencer to the RZ/V2H(P) and RZ/V2N auxiliary devices
created by the SYS driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Passed targets and match pointer info.
---
 .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
index 158ee5c6432d..40760977f7de 100644
--- a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
+++ b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pwrseq/provider.h>
@@ -15,11 +16,68 @@
 #define SYS_PWRRDY_N_DSI_MASK	BIT(1)
 #define SYS_PWRRDY_N_CSI_MASK	BIT(2)
 
+#define RZV2H_SYS_ADC_CFG		0x1600
+#define RZV2H_SYS_ADC_CFG_SY_MSTP_ADA	BIT(0)
+/* Minimum time with ADCLK running after leaving power-down mode */
+#define RZV2H_ADC_POWER_UP_US		20
+
 struct pwrseq_rz_info {
 	const struct pwrseq_target_data **targets;
 	pwrseq_match_func match;
 };
 
+static int pwrseq_rzv2h_adc_enable(struct pwrseq_device *pwrseq)
+{
+	struct regmap *regmap = pwrseq_device_get_drvdata(pwrseq);
+	int ret;
+
+	ret = regmap_clear_bits(regmap, RZV2H_SYS_ADC_CFG,
+				RZV2H_SYS_ADC_CFG_SY_MSTP_ADA);
+	if (ret)
+		return ret;
+
+	fsleep(RZV2H_ADC_POWER_UP_US);
+
+	return 0;
+}
+
+static int pwrseq_rzv2h_adc_disable(struct pwrseq_device *pwrseq)
+{
+	struct regmap *regmap = pwrseq_device_get_drvdata(pwrseq);
+
+	return regmap_set_bits(regmap, RZV2H_SYS_ADC_CFG,
+			       RZV2H_SYS_ADC_CFG_SY_MSTP_ADA);
+}
+
+static const struct pwrseq_unit_data pwrseq_rzv2h_adc_unit = {
+	.name = "adc-power-sequence",
+	.enable = pwrseq_rzv2h_adc_enable,
+	.disable = pwrseq_rzv2h_adc_disable,
+};
+
+static const struct pwrseq_target_data pwrseq_rzv2h_adc_target = {
+	.name = "adc-power",
+	.unit = &pwrseq_rzv2h_adc_unit,
+};
+
+static const struct pwrseq_target_data *pwrseq_rzv2h_targets[] = {
+	&pwrseq_rzv2h_adc_target,
+	NULL
+};
+
+static const char * const pwrseq_rzv2h_compats[] = {
+	"renesas,r9a09g057-adc",
+	NULL
+};
+
+static int pwrseq_rzv2h_match(struct pwrseq_device *pwrseq, struct device *dev)
+{
+	if (of_device_compatible_match(dev->of_node, pwrseq_rzv2h_compats))
+		return PWRSEQ_MATCH_OK;
+
+	return PWRSEQ_NO_MATCH;
+}
+
 static int pwrseq_rzg3l_set_pwrrdy(struct pwrseq_device *pwrseq, u32 mask,
 				   bool val)
 {
@@ -133,7 +191,20 @@ static const struct pwrseq_rz_info pwrseq_rzg3l_info = {
 	.match = pwrseq_rzg3l_pwrrdy_match,
 };
 
+static const struct pwrseq_rz_info pwrseq_rzv2h_info = {
+	.targets = pwrseq_rzv2h_targets,
+	.match = pwrseq_rzv2h_match,
+};
+
 static const struct auxiliary_device_id pwrseq_rzg3l_pwrrdy_id_table[] = {
+	{
+		.name = "rz_sysc.r9a09g056-pwrseq",
+		.driver_data = (kernel_ulong_t)&pwrseq_rzv2h_info,
+	},
+	{
+		.name = "rz_sysc.r9a09g057-pwrseq",
+		.driver_data = (kernel_ulong_t)&pwrseq_rzv2h_info,
+	},
 	{
 		.name = "rz_sysc.pwrseq-pwrrdy",
 		.driver_data = (kernel_ulong_t)&pwrseq_rzg3l_info,
-- 
2.55.0

