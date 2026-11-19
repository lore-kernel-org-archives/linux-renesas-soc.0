Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055378;
	b=VVMVsTNKn4rZX/V/Q4HpH3yKJhGDJzskCdyu+XnfrPFaczsAnRDWDhAFcNYoVcO5o5l0
	 p7eJ8Dv4oppCfZJWKrr4Z8fw/tBtonAR6RCEEEjrF5BQg2xAs/YgkEJ8dJ/rBCENGJ1dh
	 YkXmjCV8VbUUsMoxpF1AS5EEEn+QmENLjaarKMnIJvWPwreCJW/4JnDgQdRCxNvB2IHzf
	 ZwtiEeo9iVNpx4HelxxZPDisK2m5XSFkD8SMrCJgsnl5NqbkkRpB1wGpXw6UsNBWFIOY8
	 tmrO6Cfq2PJFiPFtFN9+jmnJ8dkgeqFmCiOA8xxLr/pKTsoXZSu28idgpT150uMlDEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4Mnuux0cc/mWzzrRAAMjmQoIcIIOPkgjuAFisMHgz18=;
	b=3Cz5LrZawgxXz0PeFiJNZ28IOT+fFgWLtOx300V2tMOqPSGmnoRkOEi2K/ku6Va/us2U
	 mVTFihEIfYw2sIN9RJftPT2WBuLvceq+O+bvIctnO7IOdi6bA+yEIVM5yrS8QCoOBZH+a
	 QaZD2RfUF5U5cqaH+SiJO7Y8DAHiM1kV7R0Bii11DnWMFoZfPlr08IPHYn8OUKKoCLzcH
	 7y0XtLyoJGXcKhLKqd5BC5/9BAMS0yIMHH5XwrJeDFaVK5MCI7t/pJfILXQIwRa73zifP
	 599S9BthPYpboDrXqKaoYt1ltqiCOd3PpblS01YEli2qmEtVWbEciiVxm9bpQwK8ssw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E8yGNY+Z;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517F6606A33B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 02:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 517F6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E8yGNY+Z
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-382ecd5cf2cso494910eec.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2026 18:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795055375; x=1795660175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Mnuux0cc/mWzzrRAAMjmQoIcIIOPkgjuAFisMHgz18=;
        b=E8yGNY+ZWel7/ZWIP1jEW7g++qTkzRkkw1sdJVelkSay6lAizpTDkIGdvck7sO5gdu
         sXjhYnIH89TRuP7ZLEhOSrrNJstE5TYGoK8YF0nbhP/JJyOvl5rlUKA4YcMmryl/SmQc
         EKYd2ul2pabZr83NGIEba5uVEUC/xuAfpq7HaNlIOoH+ZzFPpPFjYkX7UPeVxUH0RbhC
         aSbU8ZzlNK7C4fKdoiBmmoZkrKSV5nJRR4QrbJY4wHwv2WBn1G3THPmbP/bJtlHUzCSQ
         LWJi1YOnX+t/0Ogw+BlCy3kusyqr7w04Zh6R4S/E0xy9AdrZfR7C+Vax5JrVAFXUiS2X
         twKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795055375; x=1795660175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Mnuux0cc/mWzzrRAAMjmQoIcIIOPkgjuAFisMHgz18=;
        b=pbEnc3AWIdDwArbBrvhNaBLs5ojnWkAGm4t9z/KBvRa6PSvCyN7znZYC9KocRCUOFb
         AnHnDX3MI9wDpGgSIHmQQly2S+ux2yk4pcKY7UnftMm6geVjMLGO55n6vlYjEffOWKGo
         +myrqcMbhrzrwvkZWofWA7edGYDjIXxu8F7fd4Tgedgovsz3bjfLJt0bukgo6x1x3an1
         Z7x+8D08TANhT/uxL7QF1zDdM/cF3cUmD6fNm+/CWQhMVrVtGSk1DH28MYMterxIwr6r
         4Yec8AAdphS1rAOjzRTepijRXV3VoNtSAeLg5CyVqrvvhToobSJxIxpHso2HGh0/VL9B
         7Bfg==
X-Forwarded-Encrypted: i=1; AL+hErGAWpx3iRKuOmZZ62IBE/n+04vSqQL8M3/VaGoJ2TisxOIxt2UPBddihHz9LmspiQinxj+Z7Kp1KOsyTSgIeXuTvw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9mioCP5kgh987VysC+m9DN5Hbh0XMK6Oc/QtUcI8W6xBwf7LTx
	ZQZIuzko5BawVb0ANlQvg8EgcSd1wRRhoY3ijakGXzomFiJwgW+aU5cw
X-Gm-Gg: AZFdTZe2ehHiMJeCTXte15QyZWkp87qIo/EYp1pzmQStV8bQHL2ccsGe1gzwkRqWC+w
	NRvieWHffMy9nhE3ifpSG0KHKNalCWqotKOPB8XULsLdwdG3NeVQgEgI/A0+FCeRcI2U58YXBKt
	LxKdoRz4w6aX+v2DTTcqNrKbXfRAj9T1UkrPjYU8hYxlhlI9D8vCz0Eiy9ptt3J8uxYMhTPajhQ
	aVKttotkwBfYns193hbGq2nyZxwxFpByojGX/Z9m1kx38ZLyb7ajUb0roYtcdd8fy1P3UQO2650
	M2Q3XO1QndmrvjW9X31DfLlNT1K9aFA/MfwkpTYIio9JOPA8j9Smm316Krepfbvtkdid2nKJfEi
	Y0vDY3DABuHUkqNiN5UJt1iy+NvBz3w0P/WcqsPowzjbEZ+2Nt0Oi4H1kDx1fC4h7/4VGYeRGcS
	qwkVqktJ9LPStRf3eaoPpB6vOwHltU3+98ue0VkqerUvpBNG8Bi2kneXQxSExONo7qgPWMPOEja
	eKmMyMPgXoQppdEQe4C34x8U3iBAz1y0NdESzhFswJ7aWrPldijFCoEn0hu721PrCaFC/EtkGPD
	islDYsyDu7BHbvOYzO7z9u6DzTupbkPwBRd3c/d5V2GfZk3Kq8GXc59/eM9ldWGznJJvnnBn8MQ
	JQugEVtRdg4idIT9uIOuVZwKmU3qhn1wEIwHDBgKKpw==
X-Received: by 2002:a05:7301:1701:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-384447067damr572794eec.10.1795055375250;
        Wed, 18 Nov 2026 18:29:35 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:38a8:0:f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a172a0a8sm10575722eec.0.2026.11.18.18.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 18:29:34 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: niklas.soderlund@ragnatech.se,
	rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: rui.zhang@intel.com,
	lukasz.luba@arm.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] thermal: rcar_gen3: release the IRQ handlers before the zones are freed
Date: Thu, 19 Nov 2026 10:29:26 +0800
Message-Id: <20261119022926.1493582-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117145348.1092528-1-shunsheng1218@gmail.com>
References: <20261117145348.1092528-1-shunsheng1218@gmail.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt handlers are requested before the thermal zones are
registered, so devres releases the zones first.  When ->remove() returns,
the zones are gone while the handlers are still installed until devres
gets to them, and a handler that runs in that window walks priv->tscs[]
and updates a zone that no longer exists.  The source keeps asserting
because nothing clears REG_GEN3_IRQEN before the hardware goes away.

synchronize_irq() alone does not close that window.  It waits for a
handler that is running at that moment, but the zones are freed before
the handlers are, so an interrupt that is raised just after the wait, or
that is still pending in the interrupt controller, runs a handler
against freed memory.  Removing the handler is what actually closes it,
so ->remove() masks the source and calls devm_free_irq() for every
interrupt that was requested, while the device is still runtime
resumed.

The interrupt numbers live in an array whose unused slots stay negative,
so the partial probe path - which also ends in ->remove() - releases
exactly what was requested without a second counter to keep in sync.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Compile tested only: arm64 defconfig, aarch64-linux-gnu-gcc 11.4.  The
board was not available, so the removal path was not exercised and no
race injection was run.

Changes in v2:
 - Mask the source and release the handlers in ->remove() instead of
   relying on devres plus synchronize_irq(), and explain in the message
   why a single synchronize_irq() cannot close the window.
 - Keep the interrupt numbers in an array whose unused slots stay
   negative instead of a separate count.
 - Use a loop-local index and a named maximum instead of literals.
---
 drivers/thermal/renesas/rcar_gen3_thermal.c | 33 ++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/thermal/renesas/rcar_gen3_thermal.c
index 9c64cbc2ee67..2a6890d2a5da 100644
--- a/drivers/thermal/renesas/rcar_gen3_thermal.c
+++ b/drivers/thermal/renesas/rcar_gen3_thermal.c
@@ -103,6 +103,8 @@ struct rcar_gen3_thermal_tsc {
 	int thcode[3];
 };
 
+#define RCAR_GEN3_THERMAL_MAX_IRQ	2
+
 struct rcar_gen3_thermal_priv {
 	struct rcar_gen3_thermal_tsc *tscs[TSC_MAX_NUM];
 	struct thermal_zone_device_ops ops;
@@ -110,6 +112,7 @@ struct rcar_gen3_thermal_priv {
 	int ptat[3];
 	int tj_t;
 	const struct rcar_thermal_info *info;
+	int irqs[RCAR_GEN3_THERMAL_MAX_IRQ];
 };
 
 static inline u32 rcar_gen3_thermal_read(struct rcar_gen3_thermal_tsc *tsc,
@@ -468,8 +471,31 @@ MODULE_DEVICE_TABLE(of, rcar_gen3_thermal_dt_ids);
 
 static void rcar_gen3_thermal_remove(struct platform_device *pdev)
 {
+	struct rcar_gen3_thermal_priv *priv = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	/*
+	 * Disable the interrupt source while the device is still runtime
+	 * resumed.  REG_GEN3_IRQEN is only ever written by
+	 * rcar_gen3_thermal_init(); a concurrent set_trips() writes
+	 * REG_GEN3_IRQMSK alone, so it cannot re-enable the source here.
+	 */
+	for (unsigned int i = 0; i < priv->num_tscs; i++) {
+		rcar_gen3_thermal_write(priv->tscs[i], REG_GEN3_IRQEN, 0);
+		rcar_gen3_thermal_write(priv->tscs[i], REG_GEN3_IRQMSK, 0);
+	}
+
+	/*
+	 * Release the handlers here instead of leaving that to devres.  They
+	 * were requested before the thermal zones, so devres would free the
+	 * zones first, and a handler that runs in between would use a zone
+	 * that is already gone.  free_irq() also waits for the threaded
+	 * handler that may be running right now.
+	 */
+	for (unsigned int i = 0; i < ARRAY_SIZE(priv->irqs); i++)
+		if (priv->irqs[i] >= 0)
+			devm_free_irq(dev, priv->irqs[i], priv);
+
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
 }
@@ -489,7 +515,7 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
 	char *irqname;
 	int ret, irq;
 
-	for (i = 0; i < 2; i++) {
+	for (i = 0; i < RCAR_GEN3_THERMAL_MAX_IRQ; i++) {
 		irq = platform_get_irq_optional(pdev, i);
 		if (irq < 0)
 			return irq;
@@ -504,6 +530,8 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
 						IRQF_ONESHOT, irqname, priv);
 		if (ret)
 			return ret;
+
+		priv->irqs[i] = irq;
 	}
 
 	return 0;
@@ -525,6 +553,9 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	priv->ops = rcar_gen3_tz_of_ops;
 
 	priv->info = of_device_get_match_data(dev);
+
+	for (i = 0; i < ARRAY_SIZE(priv->irqs); i++)
+		priv->irqs[i] = -ENOENT;
 	platform_set_drvdata(pdev, priv);
 
 	if (rcar_gen3_thermal_request_irqs(priv, pdev))
-- 
2.34.1

