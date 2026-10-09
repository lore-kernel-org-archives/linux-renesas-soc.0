Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA65651A140
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Oct 2026 18:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571301; cv=none; b=asHH364Vuvah3Sn1DnLr+92TStTt5qfuoKIZkOyv895fx6Tej7t2CqQFOd5FGuzqTNaY/tAHbe+XXSncMKpf3R8/HotvErAXefWuEZUsBKV7c6Ec9vPBpJcau9VYSdIpGY30lGyOeK/7W2I1OE81N8K/wVMkc+iSYHPG4G/QbSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571301; c=relaxed/simple;
	bh=VZ9MFlUOyfdQk5w4IWgVhdMOncD+otSh5cbz9FDpze8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FIhOnJ44B4U4iYRSYaLXaayq0SgznMOXYcWK+4NpNbA00sxBz0Vj7DuXz777DPBvR6ngiu7Abw1TfdFe1OhEavE3u0KZxJocAXVrNG8OT50XjTKFzm622hHbC6DgkPSZ++LnnKaVTN8IkCP/zlDqGgOZk7cAAxaOalTpeV3pO6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4puQm4+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4puQm4+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so1143275e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Oct 2026 11:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571292; x=1792176092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQ/rPgu28+IKGXoI2cnUBCzKXJ/3423PKk5SsfjhJXA=;
        b=h4puQm4+0NQ5ch9J7j1VaIKCWI4rnFkCQR+e4eV+ebKIs0UstTfUctK2DEdmcU4JlV
         CxIBw6t64yqa8zbv3D93GCP2qa6I3tLXwV2QLvlQ6vNPaG5dLGu6slwBGCz91WYYlDxP
         SbCfU3GvcRWd0Yxp2VxVnTsYOX6dhNaAl5fjd6Iybs4f7y2oJzt+ma7/pt/Cf7BTyDtW
         aVuRTe1z5O0Avl95hKqd+wot9r0vT6cxTZ0t1P7mBXeMaf4FPbhG6YjvvMl2L7EDlMXg
         GvOm//RqBQtO+13mDP/XEp/XwFA22FjOPfsFTehR5t8xWU/9RDI9m6D6y0CZbPmlyeta
         xreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571292; x=1792176092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQ/rPgu28+IKGXoI2cnUBCzKXJ/3423PKk5SsfjhJXA=;
        b=l/F/7T2G9iRu832+s9Fx5tmnukvmtlEbA9N4msXV2xE/IKlYm9/H1Ei5s9hOEXg1ke
         NLPjtc5+GOKU/Ww+7YUIyBfS3lI887NiaLwRZ6c+Av+kvahgRo6efpFGyVtmeCYSdddE
         ZOUzVjMBpgUCaJnZcovrog5iSeQsUdti/eQOQ56rupRxN4gGcSr4yo3Nhr6WEyOJ5fpX
         byPFH9lh7Og8QLTM3+DrVubHgBUhTyC5n9CPhCQuDAlzS6FQlbiMqRi40JLbZxg3s1Kl
         N41Nt19mRb19MwDGRV1LQT3ZFSVxq7c3z+cyQ0ivB3XjTWCPsXDz9xV+JeLZ9weT6Y6S
         XWig==
X-Forwarded-Encrypted: i=1; AKwUvBzOj/7KAJVtfPMSltUI1B45B7Q7y3bvJlLo51E17IwFu/8/A5y/PxN2UIiXW7EcoVcK1MIfa+l9PiiwKdKF3HK7Dw==@vger.kernel.org
X-Gm-Message-State: AFuF++nhJfZeQwR5rJsWgff2GkSbkmgYgWdVfKMIFtQ/yhxbxdv9XrUZ
	n/mnpTALRjeQefw/KCxqfkdbtjYu7I75cnjFcLLio9BNm2BmG41VLNk3
X-Gm-Gg: AYBFou07QyAr0RUw1FtkD1Nw11wa6RExqqex/x0aBaNcpzWpdwz3CizZ4qqCXzijjz1
	RTViMGRsSn+spmMaAXXjIwUSbV2UPGqGD2vhteHAAbWkTsWWtcFzXILYIV+1SBbRucPa1ep1D6H
	PFhcHVoXd7krjlOkzRS5LS+ymTcWXgZjJIl3nt57FgSDUj6XevwDMfnedVrJaypwQADOhgkWQHK
	JZCHRiOXQ5Or0lnS5Gb3qwFHYCidhgHr24h252TMv6S0594mJEY+YgebwwrSV0aWGR7Hpen0L5c
	9H0Lb6nIT1/ltTU1NDX6/ZBh8F01zMGjq2qero9MWcANPLHx2UxyeeHAZ9fZwVDG1XUa6YSCkWh
	Sjdscm+j4SeqvkxmqqKRyA42STM2JENL2ftA/fz2MAgaFsrKh6k3XQ8ABidrrZhZH+A7T+YUQ+k
	77Qsf8/5DjB6QTGGCvYmC1A5J/simlxaynLcbihMm/ChuSoOIuwa9voUwiLDOG/p/QNFDaFzh90
	u2kCL+YwJ3Uo3zUw9/V5yiF4W0h8nBBcICZMK6ka3SUoCwJ12+mmeDolRKq+SwEQDXDwUPN19pe
	WVoUcxk2fRZA2S+/AA==
X-Received: by 2002:a05:600c:3b1a:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4a18e4b91f8mr52099645e9.20.1791571292496;
        Fri, 09 Oct 2026 11:41:32 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm91761705e9.0.2026.10.09.11.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:41:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/8] iio: adc: rzt2h: Add optional reset support
Date: Fri,  9 Oct 2026 19:41:18 +0100
Message-ID: <20261009184122.1378797-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver for RZ/V2H(P), where the ADC has a module reset line
that is not present on RZ/T2H.

Assert the optional reset when the ADC is runtime-suspended and deassert it
on runtime resume before performing calibration. Assert the reset again if
calibration fails.

Use a shared reset control to support SoCs such as RZ/V2N where the reset
line is shared between multiple ADC instances.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change
---
 drivers/iio/adc/rzt2h_adc.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 58e33fd0249c..62120d218515 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/reset.h>
 #include <linux/time64.h>
 
 #define RZT2H_ADCSR_REG			0x00
@@ -91,6 +92,7 @@ struct rzt2h_adc {
 	void __iomem *base;
 	struct device *dev;
 	const struct rzt2h_adc_chip_info *chip_info;
+	struct reset_control *rstc;
 
 	phys_addr_t phys_base;
 	struct rzt2h_adc_dma dma;
@@ -710,6 +712,10 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, adc);
 
+	adc->rstc = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(adc->rstc))
+		return PTR_ERR(adc->rstc);
+
 	ret = rzt2h_adc_parse_properties(adc);
 	if (ret)
 		return ret;
@@ -771,10 +777,22 @@ static const struct of_device_id rzt2h_adc_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rzt2h_adc_match);
 
+static int rzt2h_adc_pm_runtime_suspend(struct device *dev)
+{
+	struct rzt2h_adc *adc = dev_get_drvdata(dev);
+
+	return reset_control_assert(adc->rstc);
+}
+
 static int rzt2h_adc_pm_runtime_resume(struct device *dev)
 {
 	struct rzt2h_adc *adc = dev_get_drvdata(dev);
 	const struct rzt2h_adc_chip_info *chip_info = adc->chip_info;
+	int ret;
+
+	ret = reset_control_deassert(adc->rstc);
+	if (ret)
+		return ret;
 
 	if (!(chip_info->features & RZT2H_ADC_FEATURE_CALIBRATION))
 		return 0;
@@ -786,11 +804,15 @@ static int rzt2h_adc_pm_runtime_resume(struct device *dev)
 	 */
 	fsleep(1);
 
-	return rzt2h_adc_calibrate(adc);
+	ret = rzt2h_adc_calibrate(adc);
+	if (ret)
+		reset_control_assert(adc->rstc);
+
+	return ret;
 }
 
 static const struct dev_pm_ops rzt2h_adc_pm_ops = {
-	RUNTIME_PM_OPS(NULL, rzt2h_adc_pm_runtime_resume, NULL)
+	RUNTIME_PM_OPS(rzt2h_adc_pm_runtime_suspend, rzt2h_adc_pm_runtime_resume, NULL)
 };
 
 static struct platform_driver rzt2h_adc_driver = {
-- 
2.55.0

