Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513879;
	b=dj5cypwKKFCSkoPfBUHNAr+pumC7AqcKFiI+rnRQQMFZ4RnV79s2w6FRwmK1o5nKpZDj
	 Ga/Tqbv0Z64dRIlflEuJCwZ/6Io08TEipB+wiV69S3NSd0kUnbi+CCuz9xjcuc9DbB71j
	 bA8VPvNll64ywdJAVc70lKMZeNuL9jAdjkszPP+NbEdkjD0wofb38zYzmQ4eECbX4RdST
	 j56A00Ma3A5whGHqf6mTsVEC9cO/Cxo+47k2220Fg4j+hvLvjcR0/lmA4gG9t3q13RhgR
	 YbJhGQmfoIQEa5pjILjkZHIIwUdrhGLAy3pue+U5Li+SZhOVEJCBfEIHC4iubOHmkWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2Vy8nDysf0gG5nitapv769ZmBQFKPLbgwqMQGCwtAq4=;
	b=eeGL5Ar3u8HA5/6iQfPFX8xzvSCu3xSXQsSWfhWzoWWickiS9ncgC/9rrC9vKj3LeTg4
	 VUPvbn+ZSpqIxLwQ4lCqPh+fcT1AoOrzYMFtg43JUOS3N+46RNV7mKqWWAQPoGjRbJcB5
	 +jNqLOH11KrP4SnRpQ0p7CCa1M6bklt951VoDfq+78pEpOnLrRB8dK6hIs/I/K4axbQp0
	 aiwmV9jeVX7hdj6J9QVjUqo8uKZQjSD5EzDPVOzrINhFrcL4Q9hfeeGOLYpsPDNl1Tg8J
	 T4wGj9aJDEVrWUl+2XCZJq9mX44k8XLDnJZj1BlT/fjPY79uqvvOOG5c2UYIkBC5QpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pE07mgBK;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B169606A699
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 09:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B169606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pE07mgBK
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f048476ab9so29883775ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 01:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795513878; x=1796118678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Vy8nDysf0gG5nitapv769ZmBQFKPLbgwqMQGCwtAq4=;
        b=pE07mgBKpIeXdgPOYDVjcLkPnZpH/mltnR36JpioAQPTCpcnqbRkv9eiVklkPPad21
         CUnjpHNIY+dgW81MgiaQBPilCL2w1s1afHpGZTInVOsxVseUMIqt62ULk0v+hvNhUVWk
         0bfwXoZpvwxgxwzoWacbMhi8vLViXlPhxF/x3GiRHCVeF8R/a/vO6S/hve3hVv59CM1K
         5jmJ3wZX4zvLwOAIQDLHgyuZFJ7hadpMbjqqMakFlCdlG22KRwlqwTpOSpBLl6sSJIHM
         FDpMQkaafAEuJ+9R4b1AFJGlGhygXC+rQ6O9Iwx+vZr0jU+C33eHK7ZBoTWdIoTBE1CW
         Dkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513878; x=1796118678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Vy8nDysf0gG5nitapv769ZmBQFKPLbgwqMQGCwtAq4=;
        b=neF9EqkFfs3sCZWa6CLPZ+3LzC/kINqcZa1b1gFsHBfiw/pPjsPzEtLnkqdc4ug3UG
         a2VJCiSFu+leIs8s2J24mLSu0PfFRsT1+5ZIJtFbWBUynPZ/AjCRIhKkaPZXIMfOP7gZ
         LE0JcaYbUnZ3ibBfNa1PKLRzCgxoTifnyoNEyg338narb0OSaIh4DbVTBBz32LoFy9+y
         +Qypa+Yj6m+idOTtS+Y/huUFDEH1Rrj6t9n9tLpoguyIUGTAdNu+7hpfkkY3ixULa4vJ
         R9M4FtPwWU2qbDWy7ntAIGZUjxVokH5kVeFosiDuPP+yguaHxuopOAJz7ok81UB9gM65
         dzFg==
X-Forwarded-Encrypted: i=1; AL+hErGju80GDw5UgdBwC+efcaLHxmnbK72K2fdOSgDpVQvhM5e6nNJ9gM8qCg+QGD7iIDEE3gIUSxaD76WRLEW+KGDuww==@vger.kernel.org
X-Gm-Message-State: APuU4Z/DtCCwXV+OCv8Y6/r9Lt/5X746x668l9XfLbnyDmyrjqgldud8
	CRJ2rsnvRPNTLYH5I4uZ5oGv4k0tHGoHcvyr/WtkoXvoZ3KP4wn2y+gz
X-Gm-Gg: AZFdTZeOeYQa4ZqtjKxE5Je4/aFr7DCU0HuF068RguBnyu+sIbi3z3ifoul22cUW08s
	EshiDhMMjGyuslAonZMiiyZFZw/+MTfsOTnPunABiDNmfPqLAoM1iJyFFXTPd52Ocobhqx8JvBv
	pJ1Ry2Adszcb1uJJXJE9MbTsFjbSjytBt7FM/Et99dLoRwpXEfM6vLFtShY4nUnIwgm0a+NNMax
	A+1YRMTqr6cCc4vy5DTNtQvZo9EjqEewS5Au2fcJvbdI2zs+pY7kTj3RC3522mpZhY1/2LmhE4U
	DMqIqpW71yGsR2J0qGmtjVQr3DkwOxLOELl1tLqukNHctGdbs5Ugpv5KIgyCFlxMALcO7O4jr/P
	r2AYlBRADFTOyGiq/RStOuX4/zmyKEHG98hFxTxAiDg8zkltbPAdgWNGiqdXouYnoq7kbOFysur
	bY/mKVJ+6TXs9L8GPGsRTRVusnzYfvHn+di9gH93T+W4X3aL1fefkG2Y/S4aMhbc+hqzhKzlANm
	j+cH1UttQDW5g7m6Q3VnINxiMqQRADkv4ulaMJZgK/mV6UOKihdtke69MsNorHstHQ1fwz3VqKy
	po9hKgZNnLdZ9QTyOcyWmztZE1k5LeUisFjjXK1XmursErJFOpvG7Il/JFt4N3UQyklveSUnpKv
	hVF/NW45LiqLVbEaqAdZN7r3xesr/3CyZOxA8By5Zwa+XWA==
X-Received: by 2002:a17:903:1a68:b0:2e9:4175:3077 with SMTP id d9443c01a7336-2f03f0fdaddmr133520425ad.15.1795513877597;
        Tue, 24 Nov 2026 01:51:17 -0800 (PST)
Received: from lwq-server.. ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc0f8sm66003555ad.27.2026.11.24.01.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:51:17 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] thermal: rcar_gen3: register the interrupt handlers after the zones
Date: Tue, 24 Nov 2026 17:51:10 +0800
Message-Id: <20261124095110.131258-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119022926.1493582-1-shunsheng1218@gmail.com>
References: <20261119022926.1493582-1-shunsheng1218@gmail.com>
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
registered, and devres releases resources in the reverse order.  That
leaves the same object exposed at both ends: during probe the handler
exists while part of the sensors and zones are not initialised yet, and
during teardown it outlives the zones it reports to.  The handler walks
every sensor and calls thermal_zone_device_update() through tsc->zone,
which is never cleared when the zone is unregistered.

Fix the order rather than the removal path.  Look the interrupts up
first, keep the source masked while the sensors are initialised, and
register the handlers only once every zone exists.  A devres action
registered after the handlers masks the source again, and the source is
enabled last, so the teardown order comes from devres itself: source
off, handlers, hwmon, zones, MMIO mappings, runtime PM.  ->remove() has
nothing left to do and is gone.

The thermal core copies the zone operations when a zone is registered,
so whether set_trips() is available has to be decided before the zones
are created.  Registering the handlers last moves that decision after
the zones exist, so when the interrupts cannot be requested the zones
are released and registered again without set_trips(): the driver keeps
the polling configuration it had before instead of failing the probe.
The zones are created and dropped once more in that path only.

rcar_gen3_thermal_init() clears REG_GEN3_IRQEN as well.  Nothing but
rcar_gen3_thermal_enable_irqs() writes the register again, at the end of
the probe and from ->resume(), so a source that the firmware or an
earlier bind left enabled does not stay on while the zones are being
created.

Check the sensor count before reading the fuses, because the fuse
reader dereferences tscs[0].  Return -ENODEV when no sensor resources
are present.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64, aarch64-linux-gnu-gcc 11.4,
CONFIG_ARCH_RENESAS, CONFIG_ARCH_RCAR_GEN3 and CONFIG_RCAR_GEN3_THERMAL.
No board was available, so probe, the polling fallback, resume and
teardown were not exercised on hardware, and there was no way to make an
interrupt request fail on a real device.

Changes in v3:
 - Register the interrupt handlers after the thermal zones and let devres
   own the whole teardown, as suggested; ->remove() is gone.
 - Look the interrupts up before the zones are registered, because the
   thermal core copies the zone operations at registration time.
 - Split the sensor initialisation from enabling the interrupt source and
   re-enable it from ->resume().
 - Clear REG_GEN3_IRQEN in the sensor initialisation, so that the source
   stays masked until it is enabled on purpose.
 - Keep the polling fallback when the handlers cannot be requested:
   release the zones through a devres group and register them again
   without set_trips().
 - Check for a device without sensors before the fuses are read.
 - Drop the has_irqs() helper.

AI assistance: prepared with Claude (Anthropic) as a coding assistant; the
author reviewed the reasoning and takes responsibility for the content.
---
 drivers/thermal/renesas/rcar_gen3_thermal.c | 197 ++++++++++++++------
 1 file changed, 145 insertions(+), 52 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/thermal/renesas/rcar_gen3_thermal.c
index 9c64cbc2ee67..7e4d6aa6e5dd 100644
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
@@ -324,8 +327,7 @@ static bool rcar_gen3_thermal_read_fuses(struct rcar_gen3_thermal_priv *priv)
 	return true;
 }
 
-static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_priv *priv,
-				   struct rcar_gen3_thermal_tsc *tsc)
+static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
 {
 	u32 reg_val;
 
@@ -335,11 +337,9 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_priv *priv,
 
 	usleep_range(1000, 2000);
 
+	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, 0);
 	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0);
 	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
-	if (priv->ops.set_trips)
-		rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN,
-					IRQ_TEMPD1 | IRQ_TEMP2);
 
 	reg_val = rcar_gen3_thermal_read(tsc, REG_GEN3_THCTR);
 	reg_val |= THCTR_THSST;
@@ -466,9 +466,9 @@ static const struct of_device_id rcar_gen3_thermal_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, rcar_gen3_thermal_dt_ids);
 
-static void rcar_gen3_thermal_remove(struct platform_device *pdev)
+static void rcar_gen3_thermal_pm_put(void *data)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = data;
 
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
@@ -481,25 +481,66 @@ static void rcar_gen3_hwmon_action(void *data)
 	thermal_remove_hwmon_sysfs(zone);
 }
 
-static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
-					  struct platform_device *pdev)
+static int rcar_gen3_thermal_register_zones(struct rcar_gen3_thermal_priv *priv,
+					    struct device *dev)
 {
-	struct device *dev = &pdev->dev;
 	unsigned int i;
-	char *irqname;
-	int ret, irq;
+	int ret;
+
+	for (i = 0; i < priv->num_tscs; i++) {
+		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
+		struct thermal_zone_device *zone;
 
-	for (i = 0; i < 2; i++) {
+		zone = devm_thermal_of_zone_register(dev, i, tsc, &priv->ops);
+		if (IS_ERR(zone)) {
+			dev_err(dev, "Sensor %u: Can't register thermal zone\n", i);
+			return PTR_ERR(zone);
+		}
+		tsc->zone = zone;
+
+		ret = thermal_add_hwmon_sysfs(zone);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev, rcar_gen3_hwmon_action, zone);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int rcar_gen3_thermal_get_irqs(struct rcar_gen3_thermal_priv *priv,
+				      struct platform_device *pdev)
+{
+	unsigned int i;
+	int irq;
+
+	for (i = 0; i < RCAR_GEN3_THERMAL_MAX_IRQ; i++) {
 		irq = platform_get_irq_optional(pdev, i);
 		if (irq < 0)
 			return irq;
 
+		priv->irqs[i] = irq;
+	}
+
+	return 0;
+}
+
+static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
+					  struct device *dev)
+{
+	unsigned int i;
+	char *irqname;
+	int ret;
+
+	for (i = 0; i < RCAR_GEN3_THERMAL_MAX_IRQ; i++) {
 		irqname = devm_kasprintf(dev, GFP_KERNEL, "%s:ch%d",
 					 dev_name(dev), i);
 		if (!irqname)
 			return -ENOMEM;
 
-		ret = devm_request_threaded_irq(dev, irq, NULL,
+		ret = devm_request_threaded_irq(dev, priv->irqs[i], NULL,
 						rcar_gen3_thermal_irq,
 						IRQF_ONESHOT, irqname, priv);
 		if (ret)
@@ -509,14 +550,34 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
 	return 0;
 }
 
+static void rcar_gen3_thermal_enable_irqs(struct rcar_gen3_thermal_priv *priv)
+{
+	unsigned int i;
+
+	for (i = 0; i < priv->num_tscs; i++)
+		rcar_gen3_thermal_write(priv->tscs[i], REG_GEN3_IRQEN,
+					IRQ_TEMPD1 | IRQ_TEMP2);
+}
+
+static void rcar_gen3_thermal_disable_irqs(void *data)
+{
+	struct rcar_gen3_thermal_priv *priv = data;
+	unsigned int i;
+
+	for (i = 0; i < priv->num_tscs; i++) {
+		rcar_gen3_thermal_write(priv->tscs[i], REG_GEN3_IRQEN, 0);
+		rcar_gen3_thermal_write(priv->tscs[i], REG_GEN3_IRQMSK, 0);
+	}
+}
+
 static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 {
 	struct rcar_gen3_thermal_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
-	struct thermal_zone_device *zone;
 	unsigned int i;
 	int ret;
+	void *group;
 
 	priv = devm_kzalloc_obj(dev, *priv);
 	if (!priv)
@@ -525,14 +586,25 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	priv->ops = rcar_gen3_tz_of_ops;
 
 	priv->info = of_device_get_match_data(dev);
+
 	platform_set_drvdata(pdev, priv);
 
-	if (rcar_gen3_thermal_request_irqs(priv, pdev))
+	/*
+	 * The interrupts are looked up here but their handlers are registered
+	 * only once the thermal zones exist.  The thermal core copies the zone
+	 * operations when a zone is registered, so whether set_trips() is
+	 * available has to be decided before the zones are created.
+	 */
+	if (rcar_gen3_thermal_get_irqs(priv, pdev))
 		priv->ops.set_trips = NULL;
 
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
+	ret = devm_add_action_or_reset(dev, rcar_gen3_thermal_pm_put, dev);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < TSC_MAX_NUM; i++) {
 		struct rcar_gen3_thermal_tsc *tsc;
 
@@ -541,22 +613,20 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 			break;
 
 		tsc = devm_kzalloc_obj(dev, *tsc);
-		if (!tsc) {
-			ret = -ENOMEM;
-			goto error_unregister;
-		}
+		if (!tsc)
+			return -ENOMEM;
 
 		tsc->priv = priv;
 		tsc->base = devm_ioremap_resource(dev, res);
-		if (IS_ERR(tsc->base)) {
-			ret = PTR_ERR(tsc->base);
-			goto error_unregister;
-		}
+		if (IS_ERR(tsc->base))
+			return PTR_ERR(tsc->base);
 
 		priv->tscs[i] = tsc;
 	}
 
 	priv->num_tscs = i;
+	if (!priv->num_tscs)
+		return -ENODEV;
 
 	if (!rcar_gen3_thermal_read_fuses(priv))
 		dev_info(dev, "No calibration values fused, fallback to driver values\n");
@@ -564,40 +634,64 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	rcar_gen3_thermal_shared_coefs(priv);
 
 	for (i = 0; i < priv->num_tscs; i++) {
-		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
+		rcar_gen3_thermal_init(priv->tscs[i]);
+		rcar_gen3_thermal_tsc_coefs(priv, priv->tscs[i]);
+	}
 
-		rcar_gen3_thermal_init(priv, tsc);
-		rcar_gen3_thermal_tsc_coefs(priv, tsc);
+register_zones:
+	group = devres_open_group(dev, NULL, GFP_KERNEL);
+	if (!group)
+		return -ENOMEM;
 
-		zone = devm_thermal_of_zone_register(dev, i, tsc, &priv->ops);
-		if (IS_ERR(zone)) {
-			dev_err(dev, "Sensor %u: Can't register thermal zone\n", i);
-			ret = PTR_ERR(zone);
-			goto error_unregister;
+	ret = rcar_gen3_thermal_register_zones(priv, dev);
+	if (ret)
+		goto release_group;
+
+	/*
+	 * Handlers last and the source enabled after them, so devres runs the
+	 * teardown in the opposite order: source off, handlers, hwmon, zones,
+	 * MMIO mappings, runtime PM.
+	 */
+	if (priv->ops.set_trips) {
+		ret = rcar_gen3_thermal_request_irqs(priv, dev);
+		if (ret) {
+			dev_info(dev, "Failed to request interrupts (%d), polling instead\n",
+				 ret);
+
+			/*
+			 * The thermal core copies the zone operations when a
+			 * zone is registered, so the zones above cannot be
+			 * switched to polling afterwards.  Release them and
+			 * register them again without set_trips().
+			 */
+			devres_release_group(dev, group);
+
+			for (i = 0; i < priv->num_tscs; i++)
+				priv->tscs[i]->zone = NULL;
+
+			rcar_gen3_thermal_disable_irqs(priv);
+			priv->ops.set_trips = NULL;
+			goto register_zones;
 		}
-		tsc->zone = zone;
 
-		ret = thermal_add_hwmon_sysfs(tsc->zone);
+		ret = devm_add_action_or_reset(dev,
+					       rcar_gen3_thermal_disable_irqs,
+					       priv);
 		if (ret)
-			goto error_unregister;
+			goto release_group;
 
-		ret = devm_add_action_or_reset(dev, rcar_gen3_hwmon_action, zone);
-		if (ret)
-			goto error_unregister;
-
-		dev_info(dev, "Sensor %u: Loaded\n", i);
+		rcar_gen3_thermal_enable_irqs(priv);
 	}
 
-	if (!priv->num_tscs) {
-		ret = -ENODEV;
-		goto error_unregister;
-	}
+	devres_remove_group(dev, group);
 
-	return 0;
+	for (i = 0; i < priv->num_tscs; i++)
+		dev_info(dev, "Sensor %u: Loaded\n", i);
 
-error_unregister:
-	rcar_gen3_thermal_remove(pdev);
+	return 0;
 
+release_group:
+	devres_release_group(dev, group);
 	return ret;
 }
 
@@ -606,11 +700,11 @@ static int rcar_gen3_thermal_resume(struct device *dev)
 	struct rcar_gen3_thermal_priv *priv = dev_get_drvdata(dev);
 	unsigned int i;
 
-	for (i = 0; i < priv->num_tscs; i++) {
-		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
+	for (i = 0; i < priv->num_tscs; i++)
+		rcar_gen3_thermal_init(priv->tscs[i]);
 
-		rcar_gen3_thermal_init(priv, tsc);
-	}
+	if (priv->ops.set_trips)
+		rcar_gen3_thermal_enable_irqs(priv);
 
 	return 0;
 }
@@ -625,7 +719,6 @@ static struct platform_driver rcar_gen3_thermal_driver = {
 		.of_match_table = rcar_gen3_thermal_dt_ids,
 	},
 	.probe		= rcar_gen3_thermal_probe,
-	.remove		= rcar_gen3_thermal_remove,
 };
 module_platform_driver(rcar_gen3_thermal_driver);
 
-- 
2.34.1

