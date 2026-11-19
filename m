Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055353;
	b=p7UgTrgV8DUwTYgM58dMOcdH7pOSTBM4ynrWoIogTqSsMLCDFNfXnDiFxonmqvUyGIkR
	 JgYML9d7HFPcu1RMjZbTdsZsw4aFp5Vkb5j/ahnHkXGvzqVGlTk+6SyoxQHLjyN4I/k7D
	 PNbRh5HAWoLtZouCW8FGY44Km/fe9U3YxadZqXQJTV9JI+yq3sCk9VlM1b31HExt93Mey
	 YbRZd1O4XFmWRM0/b72htOmeWlyje985By3oNdoG+dZaC8bvJ59eSgM2k/Zz07awd+shN
	 +FeoZ22s1yHdU6UoPKkoDQUo8sA0+MB1M0rCM13pbBHX1OLJIp/n3BGFSOrPvL2ULcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jf4u6WrHRBEz+rPw92oXhHCCYEyYYwuCte9W9COqiwg=;
	b=DMsMp+BZ/b4QWynp5jWZemQ7wT5tsX9YTb4ruoOeSFr4MBdXvtoi/ZtuNUEfnzUE67go
	 Gt9fWrG2oBo14ffikvLzkpneYsObM2qJB2KcFT/TLArVE2uWh1JyrBhtrtm+7gwSdt6qq
	 oTyc9iI2fXBY/cP17m/jnUDK4kZaVGTwBVTtkAK9u2UUk273PMqPPOXG4AvDqCNMxkY6O
	 W0tXorY77UqMn//fxgjR295ZiN0ULX0EFYMpa44zYVDikr1aYJNi0euZ5BDuvn+s9sWHf
	 AI6oNJ6Tpa8YYS8gYvo29JG2MRkA2yK+yZwCQKmhOsSnmIBCGgRrwEliEXi7XTVm2Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDvcu9l4;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B86160A2605
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 02:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B86160A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDvcu9l4
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so2442250c88.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2026 18:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795055351; x=1795660151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jf4u6WrHRBEz+rPw92oXhHCCYEyYYwuCte9W9COqiwg=;
        b=IDvcu9l4Ql+lH7/tSPgv9W9HfcOc/IlSoDXSzqw2Ogvz67xObeBNwdANsGavByYeqR
         KLInUZZRA8fvMR5BH+qjegeycnrJnF2idXQf80J85vtVzSf5bv2kUVT0DUS82R6a0W1X
         mIIrlHVvcAOW0086g2Eg2jWaIyh1AY7je2ufJb19IJEkwnGHJ4WoAAZBAqxqO+Q09otm
         FAkm8yJCLPD0sbiGlKOfWcH4JeNqTM3/kP/BdSeg1kAurOcHfPvbfg8vid66HxuGrTUP
         CHFLXd6SuScxyvZTeO17Pu/hf3SVvU+6dOs2cuXvZ9EaBdfIgYPoVlRUYSwEtlhWnOoC
         pwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795055351; x=1795660151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jf4u6WrHRBEz+rPw92oXhHCCYEyYYwuCte9W9COqiwg=;
        b=MGACl2JV066w2XqmkJ8sybwElWpHs7CZseqoJ+6B4hoHoN5yfyRiTCy/QTMLgf/XVw
         KoFp43QlC5m78nUV9dkHICFowxHCA7kGMLpGYY/VYkCyCFPS5XH2qwkt6++5+xiTAfqQ
         1hsTSA3Kg7+IRs2uimoR7eyjfeEPut0+vE5n2ZM932sYrG0bFDL2EnTyoc5jJRW4+dpq
         kTB3syyCtW0f/DxH/nIn8yy+2/Vls5FXWoDURe1dX1kIsazJVza4RxBhu0pVhxtenebL
         5kAMKaA67MH1gU5DIOmjbWc1s/Uzfll2l2AkYzOQwfyEvW+dSq+LItOFLqOIDhM9epvW
         15/w==
X-Forwarded-Encrypted: i=1; AL+hErGvPserFejGxPJo907E16lZ47Iyq9LYKSW8nqmow4qStIS2Vpy2rypDPzreqyHXQuLUG7mz6J4SUG6kf7qwMG8C1g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9vqAtSS/WOl2b3T+yGAPI8ewIy9J+01EZ9JWJV1HpiHpVXS3/h
	iSebZOwVK7aJddQE1ll49sdvo00BcG3xzkgjvGDnnbQJ0qxqgVv/VbKB
X-Gm-Gg: AYBFou1URxJ+ANNJ+f8i/glMxhy5cuY+Y8MAF1TeKdu2Skap2pTsD0WrfYJ1qKX/ULU
	TqzjygVjz4CbBVZjNZnpPvRyi0UuZE607r7qDDuGASCjZVgMAH2HqkZ4tfFEerCgj/Wd6tHSlzI
	8gElvXBsryw9Q442gcizOpkXwbQxC6KB0aZM1YMXeeehqhErXaJylnmEV5dXrgJz7sa/AeNYOHU
	AyV536b6mJ57U+/7YwZW++NvdWnoHNRlnMutxT7bgSCUchEkcPCJ6sDAXHDNnLzTCFK36902PWh
	LwdOsc83VZIW9hBYdsc1StLo8tRKIPJccUGOKafdVI1GWQSPEIM2JIXEeITijY014D9hqyb/qAC
	STuL4a9YAQqKbr862xrMX3ts4/O0jqPs8dD7GoDlfvK4DAY9geemwF59RCgrYnXVDbGTrXdKyjN
	Wm8+qO6sCVRenH+SeMIJtemp+ishaEco+WLflRYHf7LSOZKavkxGpqo4GXqnbE0VVlSLF9v7aep
	RLjaQJtz1SWy6PX35KqZL2qvdYo16e33yXQNsSidrKsKlDRXVwPRtCpiRTIBTUYfiEkFFqd8AV4
	Kp5qHE+xcKoOO+89Nx2I7t7M5hgNoXR0feiq11bvx6TrJUNMKaguM+H1mUzZoFgg09JfAqYLe09
	WjHkaZBK4cAMFcDidpjV2tNltF0QtLJOFDBvrzauG
X-Received: by 2002:a05:7022:1708:b0:1b2:4b42:1870 with SMTP id a92af1059eb24-1b543cff066mr3748180c88.31.1795055351102;
        Wed, 18 Nov 2026 18:29:11 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:38a8:0:f6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b549e398e4sm5790186c88.15.2026.11.18.18.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 18:29:10 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	edubezval@gmail.com
Subject: [PATCH v2] thermal/drivers/rcar_thermal: disable the work before masking the interrupt
Date: Thu, 19 Nov 2026 10:29:03 +0800
Message-Id: <20261119022903.1493494-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118072321.1259639-1-shunsheng1218@gmail.com>
References: <20261118072321.1259639-1-shunsheng1218@gmail.com>
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

rcar_thermal_remove() masks the interrupt sources and then cancels the
delayed work of each sensor.  rcar_thermal_irq() drops common->lock before
it walks the sensors and queues priv->work for those whose status changed,
so a handler that read the status before the mask was written can still
queue the work after cancel_delayed_work_sync() has returned.  The work
then runs after ->remove() has finished and devres has freed common, priv
and the thermal zone.

Waiting for the handler alone is not enough either: rcar_thermal_work()
re-enables its interrupt source once it has updated the temperature, so a
work that is still running when the removal starts undoes the mask that
->remove() has just written.

Disable the work before the source is masked.  That makes the
queue_delayed_work() calls in rcar_thermal_irq() no-ops and guarantees
that the re-enable in rcar_thermal_work() has already happened, so the
mask that follows cannot be undone.

The interrupt line is shared, so waiting for the handler once does not keep
it from running again later; unregister it in ->remove() instead of only
calling synchronize_irq().  devm_free_irq() waits for a handler that is
running right now as well, and the slot is marked unused so that the probe
failure path, which also ends here, cannot release it twice.

Every sensor that the removal walks has been through INIT_DELAYED_WORK()
before it is linked into common->head, so no uninitialised work is touched.
The interrupt numbers are recorded in an array whose unused slots stay
negative, instead of being counted separately.

Fixes: 697ee786f15d ("thermal: rcar_thermal: Prevent doing work after unbind")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64, aarch64-linux-gnu-gcc 11.4, CONFIG_RCAR_THERMAL=y.
No hardware was available, so the removal path was not exercised and no race
injection was run.

AI assistance: prepared with Claude (Anthropic) as a coding assistant; the
author reviewed the reasoning and takes responsibility for the content.

Changes in v2:
 - Drop the shutdown flag and the separate IRQ count.  Niklas asked for less
   state, so the removal now disables the delayed work before the source is
   masked and unregisters the shared IRQ instead of waiting for it once.
 - Keep the interrupt numbers in an array whose unused slots stay negative.
---
 drivers/thermal/renesas/rcar_thermal.c | 37 ++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index af6d09a75bb6..3310ed4a8bda 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -39,11 +39,15 @@
 /* THSSR */
 #define CTEMP	0x3f
 
+/* .nirqs of every supported chip is at most this */
+#define RCAR_THERMAL_MAX_IRQ	2
+
 struct rcar_thermal_common {
 	void __iomem *base;
 	struct device *dev;
 	struct list_head head;
 	spinlock_t lock;
+	int irqs[RCAR_THERMAL_MAX_IRQ];
 };
 
 struct rcar_thermal_chip {
@@ -376,10 +380,34 @@ static void rcar_thermal_remove(struct platform_device *pdev)
 	struct rcar_thermal_common *common = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 	struct rcar_thermal_priv *priv;
+	int i;
 
-	rcar_thermal_for_each_priv(priv, common) {
+	/*
+	 * Stop the work from being queued again and wait for a running one to
+	 * finish before the interrupt source is masked: rcar_thermal_work()
+	 * re-enables its source when it is done, so it has to be gone before
+	 * the source is disabled for good.
+	 */
+	rcar_thermal_for_each_priv(priv, common)
+		disable_delayed_work_sync(&priv->work);
+
+	rcar_thermal_for_each_priv(priv, common)
 		rcar_thermal_irq_disable(priv);
-		cancel_delayed_work_sync(&priv->work);
+
+	/*
+	 * The handler is shared, so waiting for it once is not enough: another
+	 * user of the line can invoke it again after that, when the zones and
+	 * the sensors it walks are already gone.  Unregister it here; that
+	 * waits for a handler that is running right now as well.
+	 */
+	for (i = 0; i < RCAR_THERMAL_MAX_IRQ; i++) {
+		if (common->irqs[i] < 0)
+			continue;
+		devm_free_irq(dev, common->irqs[i], common);
+		common->irqs[i] = -ENOENT;
+	}
+
+	rcar_thermal_for_each_priv(priv, common) {
 		if (priv->chip->use_of_thermal)
 			thermal_remove_hwmon_sysfs(priv->zone);
 		else
@@ -413,6 +441,9 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 	spin_lock_init(&common->lock);
 	common->dev = dev;
 
+	for (i = 0; i < RCAR_THERMAL_MAX_IRQ; i++)
+		common->irqs[i] = -ENOENT;
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
@@ -449,6 +480,8 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 		if (ret)
 			goto error_unregister;
 
+		common->irqs[i] = irq;
+
 		/* update ENR bits */
 		if (chip->irq_per_ch)
 			enr_bits |= 1 << i;
-- 
2.34.1

