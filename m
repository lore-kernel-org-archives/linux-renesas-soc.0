Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986612;
	b=ggNIxKigzvhFoxs0xk7l0OOk5y4KkRU4tYOlJWhwpMJbaLgwqpRL9T/9jqoYqBWma96k
	 eA98P7UVW1heOXpdttoAwIyGi9ILLYn+tpjeB2gkeJ6tMnIK/xdZOjSoZbl4UBMNst4GL
	 fgw3CwlcJsy/Sw6ryjJOQQVlA7uyZ3vUph9km3veDdoUS+AKTqg6V7SvkxAEp9AGgTLaR
	 YqhXv93L8Lbi3JDWdHF1gxWuoOcEJs4RyvVbCzwliYxaEd+Wn6F/4rRCaCrMfSPOWEYJY
	 YUnvUf9OFYaoNuGd6271QmFA9hRc6ZGHR0f5B9KYHqGK7m0AVktK9ZbasTM69bvp7Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cm9VR5YVqOxWxzzBkTFqVK4i/4UtJXohgo7zinGxSKI=;
	b=VMnecz9eL+r7+YnzTalw/4kzuK1mNyn8NP2+dF8j/0QQHxv8g065ouHSAabtU1OMqYEM
	 bCq0ZMTDj2D9G0Z5Uk0wIEwfQUPeKA5r/PY3nbptsPUz1GaIs4xP6QCt1q3+Ogr1Ymbi4
	 GTbUXBEosrf5m2VHvFgDi/XECMX1hv9PkZjm1A9VouDWAaGkkPoXUNyLXp5fO6KnyUtCh
	 zojeFUEP7W8+MB1W4WlN7+GPY2z9152X/Okn5KYOMdPGzAuSQDXCqg14frKWYZbHStecM
	 +H4KRo+KfpocsNnfW9tIqG9CWPH56/158FYxMN17KtMTGR6YqCIK4TWTanxTxk6c+FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EC5fitwc;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3885E606A32A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2026 07:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3885E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EC5fitwc
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-372bdb942dbso870859eec.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 23:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794986610; x=1795591410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cm9VR5YVqOxWxzzBkTFqVK4i/4UtJXohgo7zinGxSKI=;
        b=EC5fitwckd2jC1bvadV37uUn/SOpyyfLBhGFSwJnXSIp2N6odKE/Pv0Fq6K6W7f3pa
         qRTUXraxpqWKCvd62AmH/X+Kc3olKPu0ZzwR6V5w2svI1QUm8StZLwBmxrzdWDpoMfvL
         Azp6K3fZ30GEk6o9hhwyrCzgcPCCN59LOnBP1nLH9+MuvaFHKANCQ0PgA/wji/Eek24u
         XyHh5tHJIkpMduuL/ChPscOdh/iAAQJ7Uc12yWW/H6d3VkbHctEusc+ahhR9CbR9dgcI
         naZTKd3iSSU0i7jcM6GWsNp1BjUD4KvB6S6zF7M/fNlW/dfNSwiVwZb4zhuwtrXZMhd8
         Y9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794986610; x=1795591410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cm9VR5YVqOxWxzzBkTFqVK4i/4UtJXohgo7zinGxSKI=;
        b=o6NdDP5uFob3XZUoToEnJcwtSGnOISVHc+unLg/+C8nX5qLSiWwrQ7NFvSNZnNJVcE
         bPFukizDvQW3H/jiRSd2lj6QG1XLcB9AqBgJtAm0OBps9vBIaDWgDEM5pyL95MC1tD7j
         GJmouu760/TSGND3sDO/l37wJP/NH/5IKmxDE6spGTmYdGcOH9ezda4HmZIeS7XCf31W
         8BJ9knMt85djJqQgFWVj7KDCfE2OeghPhhxXpErD+Ffe1b+rFVS3xz4ZLU799PZTdRzn
         SghBCsMoVexqff9D6BtMyXtq/A8WBGki1bQFSDveoAWHDG4iL4CwdXDqt+lj1PeSSSK2
         0s0A==
X-Forwarded-Encrypted: i=1; AL+hErHbRnCMRQHU20F9XYYCpoA5hegkF4WVLkvm13UW5b1VqmCRUukL4u9UaoCE2d4aid6DFPjTSzO6Ih9pwgWeGjVcLA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+UY5E+dMBKPdRZmZruP0iCNTM50o9AR4K1OMduJOOu60a4dK0t
	q7SP9RqVWiosVGwsyxfUHWfobbA9DXD3LTYpXrdnYm5GC0O8PKp2tyCj
X-Gm-Gg: AZFdTZez6VqbYqgr0/u84NO26tgr8Vi/MI7wV2EZQqcbIzAoQZJAvolEjpvoA2QP7tC
	qz9R32dt9q7p1BiQKPoHwAkRXuoZVwMWX+OV5RUIZT/ursldd75uTgCBF3AD7PCUMbt1ZP5wgEJ
	/h9zS57ko3iFMu6KNK/ErAdjHucAg5WkNHWazZnMX0FcbJ8+HCZsGeC200/yUda9vqgP1LaXkhf
	wOs0Zz/YC1+8Pi205VkCDAuAJGCfNi7V9blAntp5A9J0ItG4VdbJ2tuawptZu8FbfHM3OrjCPZH
	tnENNZUwrZX70q9bqwzyOixrXO3s2JuW7DZv1lzzcqr/8Cyye8tnfthn4VQwCO84p0fCGBsGEQK
	p6zn/N68hifGIonvc5bnI/cSIIqVX8au1S5M3MwWImHQL7w3ysYy0Q/q8coj6vZp67Vs03VhD9Q
	QAA7t2lOctBM4Px/eO3unx29SzL04SGvBRqJiiCqgkFq0dzXTZP4YtP51p0a9FECY51KPkTSHbP
	xmKYj982IV83VAbCggjkkNPa27r9KQUhlwl+y6+m+je9BnfvG8Ce5Wg1nSGyQ7kM6Yn1BGw/Nbf
	KA0FyVz/KVVGwjkpUeym/i9VyckgzdUXcdCruaVbIaZ+VDO0tDSl/gzpyWCYWMkYF6KvDyVBjfb
	GlAhHfDr/X/YqDhg8uYlqUL8emPts1JD2k0Z1S0iL
X-Received: by 2002:a05:7301:228d:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3827d81f0cbmr2115527eec.1.1794986609991;
        Tue, 17 Nov 2026 23:23:29 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a73e0aa6sm4592661eec.19.2026.11.17.23.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:23:29 -0800 (PST)
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
Subject: [PATCH] thermal/drivers/rcar_thermal: wait for IRQs before cancelling work
Date: Wed, 18 Nov 2026 15:23:21 +0800
Message-Id: <20261118072321.1259639-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

rcar_thermal_remove() masks the interrupt sources and cancels the
delayed work of each sensor.  rcar_thermal_irq() reads INTMSK and STR
under common->lock, drops the lock, and only then walks the sensors and
queues priv->work for every sensor whose status changed.

A handler that sampled the status before the mask was written can
therefore reach queue_delayed_work() after cancel_delayed_work_sync()
has returned.  The work stays pending past the end of ->remove(), devres
then frees common, priv and the thermal zone, and rcar_thermal_work()
runs 300 ms later on freed memory.

Waiting for the handler is not enough on its own: rcar_thermal_work()
calls rcar_thermal_irq_enable() once it has updated the temperature, so
a work that is still running when the removal starts re-enables its
source and undoes the mask that ->remove() has just written.

Record the shutdown in rcar_thermal_common under common->lock and make
_rcar_thermal_irq_ctrl() refuse to enable anything once that state is
visible.  The removal then publishes the shutdown, masks all sources,
waits for the handlers with synchronize_irq() and only then cancels the
work, so neither a source nor a work item can be brought back after it
returns.

Fixes: 697ee786f15d ("thermal: rcar_thermal: Prevent doing work after unbind")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

Testing: compile tested only (arm64, gcc 11.4).  No R-Car hardware was
available, so the unbind race was not run.
 drivers/thermal/renesas/rcar_thermal.c | 43 +++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index af6d09a75bb6..1d6ee37968e2 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -39,11 +39,17 @@
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
+	bool shutdown;
+	int irqs[RCAR_THERMAL_MAX_IRQ];
+	int nirqs;
 };
 
 struct rcar_thermal_chip {
@@ -301,6 +307,15 @@ static void _rcar_thermal_irq_ctrl(struct rcar_thermal_priv *priv, int enable)
 
 	spin_lock_irqsave(&common->lock, flags);
 
+	/*
+	 * rcar_thermal_work() re-enables its source when it finishes, so a
+	 * work that was still running when the device went away would undo
+	 * the mask that rcar_thermal_remove() writes.  Once the shutdown
+	 * state is visible nothing may enable the sources again.
+	 */
+	if (common->shutdown)
+		enable = 0;
+
 	rcar_thermal_common_bset(common, INTMSK, mask, enable ? 0 : mask);
 
 	spin_unlock_irqrestore(&common->lock, flags);
@@ -376,9 +391,33 @@ static void rcar_thermal_remove(struct platform_device *pdev)
 	struct rcar_thermal_common *common = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 	struct rcar_thermal_priv *priv;
+	unsigned long flags;
+	int i;
 
-	rcar_thermal_for_each_priv(priv, common) {
+	/*
+	 * Publish the shutdown state before anything else: a work that is
+	 * still running re-enables its interrupt source on its way out, and
+	 * has to be prevented from undoing the mask written below.
+	 */
+	spin_lock_irqsave(&common->lock, flags);
+	common->shutdown = true;
+	spin_unlock_irqrestore(&common->lock, flags);
+
+	/*
+	 * Mask the sources, then wait for a handler that sampled the status
+	 * before the mask was written.  The handler drops common->lock
+	 * before it queues the work, so without the wait it could queue
+	 * priv->work after cancel_delayed_work_sync() has returned and leave
+	 * the work running on a priv that devres frees once ->remove() has
+	 * finished.
+	 */
+	rcar_thermal_for_each_priv(priv, common)
 		rcar_thermal_irq_disable(priv);
+
+	for (i = 0; i < common->nirqs; i++)
+		synchronize_irq(common->irqs[i]);
+
+	rcar_thermal_for_each_priv(priv, common) {
 		cancel_delayed_work_sync(&priv->work);
 		if (priv->chip->use_of_thermal)
 			thermal_remove_hwmon_sysfs(priv->zone);
@@ -449,6 +488,8 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 		if (ret)
 			goto error_unregister;
 
+		common->irqs[common->nirqs++] = irq;
+
 		/* update ENR bits */
 		if (chip->irq_per_ch)
 			enr_bits |= 1 << i;
-- 
2.34.1

