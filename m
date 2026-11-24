Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486948;
	b=38orsEYLp7YgCeVOL9poTVxZd9odxE0dPHFJCMHGGo5dR3ZTNquHj3iQWe8oKR8oKzb1
	 ax5spJJ/e/Nqj0zNFzTVxeIIsjTO0ApXFiA0lyIQVHC63fTs30/VC9YXkJbKGdmb1MFS0
	 KXY3mVttVY0XT2NA76vJTiFmAO4i00Dx+EmfTChh3GEh0E8F12MjT7W8qARPBd6JgHVYQ
	 M+sqSnbeNAKVRWokLKsfxRrrXgRY735lwiYPCi8F/PP+9PKMl3J4Kg6IVhfwvMv3O36Ik
	 86u1TmqOHVI5HxF0+sipif8u8PmN0F4QIKmVIcbxo7Bma+GnaaT2876YwyxwC1A3uUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fChudSS+GMscnTNQH5lusxdbEKIsc2g9AYrb14IcD68=;
	b=LrPZ3uOhpiQGsHfV/KH/vRg4wZGEHoVBSqmqqxwAi7AVFXQjGkRq/Kdoyv7ThU8JBqvm
	 95EbSBOHkAtWmDyPOEnmunpGtozh1bUcg2xHMbonk6Fzy5tUlx3ApHlefGJNsO2MObCMN
	 csBkW6mFhBxNAwUu6biddUriT2C3IMvf2qycUYhOMAg2i7Dsu/R1ZtLgibkn3b6Ivx14l
	 GHNHqCLfDbDL8kJbGtpDP0xA2FFG7l8IlTVebxpqbEwlVBRye+hxaLsZPW2SlLPj25EDK
	 iVMBpX9VuIPppnDqYpDx16E2jGD3JJwu8DCMeUroGU56W/+oNEKEOXQsPA4/3q8P23w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2qOhPiA;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5CE606A322
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 02:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF5CE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2qOhPiA
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cde5a7d7849so1687071a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 18:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486947; x=1796091747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fChudSS+GMscnTNQH5lusxdbEKIsc2g9AYrb14IcD68=;
        b=s2qOhPiAJaFEQ7mFpB0amw4oRwesRpeagCjJpzjoW6ozdz2ajRiH3kXJD5weg47+3j
         OLelbcYnmzUIPOPAZb6fogmWtIRSDwQDsHVkEZdukSS5wwZSF6/zmgd9NNHURspk8ahB
         bmL7HBa7dFP3/GmAm6baRVHXVX+M05VcTrCJSM/3Zd2YeVNzLbTC6GTVYlddLO5gLnYT
         NSOo2AfFo1n170PoT6/txYrM8SaPi6oB6O2K0w0yljgGeA7FIUG1KskHfLF7bl9ewgBe
         3h3ATIPL7zzkI8LeNIHg/65GlXyeLH7VuIhS6NeIAydIxzGxgMKyVv6M0MoeYffzTV3L
         oDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486947; x=1796091747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fChudSS+GMscnTNQH5lusxdbEKIsc2g9AYrb14IcD68=;
        b=Tx35HpSm7H5SWUsPyBrXazMpO6z2eOie7ZlFxiEt/P1bG+dSI1aRZsiemNWuRREV+t
         +QX07PDvL94Su2P1OBCyersir86Blskb2qZsgQNZ/f3a1gS0z7kYPUkwWBDjpvZlgxV3
         Tb4A+8U5e1xmphJgCjrT6gPUNd+HxooWbCgy6mzNr3c835xPXB2XdN4wHKaD7vWlsosX
         gLj5Yb8OAsO0HLrKVvTZ9Z52HLVXHCIYO4o/obNJUZ+mESnzoCyQM6tyIqBpy1olzZBe
         E3Mx0fQWAImltDXEFeRRftZYBP68uLHYnUgdDh6/2w/1LgqynZDNHG8+/CrmHXeDdZ9q
         vF2Q==
X-Forwarded-Encrypted: i=1; AL+hErGqYVL0AEsNvGxqXsqTesD613Oxc3AfhxcbyzKGTaniswfgh0Tw+OnoCX7H1MSS5arC7oE/YMrV6CHVWxhdrNFgIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8qzuZpYpI6Bu84iBah1DerQW8/gEwFHJipTpJ2Xvl8WYejvSQ7
	NsM628SkQSXG3JC2ahB2tlxgx0QfIEI75jyPXY41IaSguIsn1M52XyvZ
X-Gm-Gg: AZFdTZcvY8FxM7/8gsatECiB+ECL4pEn4m0yNy/tuqb9kXNzGkT+WmLAQpU2hkkMr57
	OTpGBvR9PtFrdwZ/BJ7CP2NbSL6jyalrBQRlg69wXDpG5snyuGXXqBk6RoG57gzV2jyN3tKkLhk
	YJD8S+buaVXw2IT1y8y+ZOqGpH6TBuSm5OCWfU3kW92URmCvdinKxjumIlSdlOOFIWHTZU603u/
	wKVU+NATRdK6JfoJS9GFpXtF7H4xMoPoqT0iJAzCmlNFp/6vB81uO24XbuNEYTfamaDkx6SznG0
	M0FNSPDz1y4c23rGV8/OpwtSmJHe1QRBt6cy2J7C1tBDhW5oHJkqLWBT3QIjVdMUNOYbJ/h+TmG
	IFhtw8ZyJM1WHuVK5AoxRypAvE5odalAb1NpLax4bvwtBkBGfmwDhiMep0G8RbJDz3q8RLzrsUe
	wlqvc5NYManYK+WhZSc4ANR4oPSQxlIyYm1LJ6/KshmR93t1EgUOIyOVZ3XtLWytQxZGnTVxPSp
	ga0ZNMNdNGQL1GAOysT49gGZJU56K94BBh/lqfMv2MsVumfMMcxDWBn4LN/hhB8FVMLzBFGed9r
	xb8SmYlA56Pe5D9G5/Gromyz048EyX0CyoTXJM2fYf5nCjFCEuba8L8Wa3A/Pgk7ylwyBQf+BvC
	gKurkVoapLarem6jQYA8NJGtIHKQxM5EwOsu5KiD667N/lBw=
X-Received: by 2002:a17:90b:390b:b0:3ad:eb38:9778 with SMTP id 98e67ed59e1d1-3b41c93e5dfmr11355114a91.48.1795486946762;
        Mon, 23 Nov 2026 18:22:26 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7d36bcsm8210837a91.3.2026.11.23.18.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:22:26 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] thermal/drivers/rcar_thermal: disable the work before masking the interrupt
Date: Tue, 24 Nov 2026 10:22:19 +0800
Message-Id: <20261124022219.1834499-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119022903.1493494-1-shunsheng1218@gmail.com>
References: <20261119022903.1493494-1-shunsheng1218@gmail.com>
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

For the handler itself, synchronize_irq() is not enough on a shared line:
it waits for the invocation that is running, but the line stays registered
and another user of it can take the interrupt again afterwards, which calls
our handler once more - with the sensors and the zone already unregistered.
devm_free_irq() removes the handler from the shared descriptor first and
waits for the invocation that is in progress second, so after it returns
neither a running nor a new invocation can touch the driver state.

Every sensor that the removal walks has been through INIT_DELAYED_WORK()
before it is linked into common->head, so no uninitialised work is touched.

Fixes: 697ee786f15d ("thermal: rcar_thermal: Prevent doing work after unbind")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested: arm64, aarch64-linux-gnu-gcc 11.4, CONFIG_RCAR_THERMAL=y.

The ordering was exercised by a controlled test on a KASAN kernel built from
this tree (x86_64, QEMU/KVM; 17 checks, all passing).  The test uses the real
delayed work, workqueue, wait and signal machinery and a simulated interrupt
line shared by two handlers (irq_sim):

 - a work queued after cancel_delayed_work_sync() has returned is accepted
   and runs; the same queue attempt after disable_delayed_work_sync() is
   rejected and the work never runs;
 - a work that is running when the mask is written re-enables its source
   afterwards, so the mask is undone; disabling the work first and masking
   afterwards leaves the mask in place;
 - after synchronize_irq() returns, another user of the shared line raises
   it again, our handler is invoked and queues the work, which then runs;
   after devm_free_irq() the handler is not invoked again, while the other
   user still receives the line.

The test re-implements this removal ordering rather than compiling the
driver, which would need a real platform device, MMIO and a thermal zone, so
rcar_thermal's own removal path was not executed.  No rcar hardware was
available and no race injection beyond those constructed interleavings was
run.

AI assistance: prepared with Claude (Anthropic) as a coding assistant; the
author reviewed the reasoning and takes responsibility for the content.

Changes in v3:
 - Reword the RCAR_THERMAL_MAX_IRQ comment without referring to .nirqs.
 - Declare the loop index in the for statement and make it unsigned.
 - Reduce both comments in rcar_thermal_remove() to one line each.
 - Explain in the commit message why a shared line needs devm_free_irq()
   and not synchronize_irq(), and point at the test that exercises it.

Changes in v2:
 - Drop the shutdown flag and the separate IRQ count.  Niklas asked for less
   state, so the removal now disables the delayed work before the source is
   masked and unregisters the shared IRQ instead of waiting for it once.
 - Keep the interrupt numbers in an array whose unused slots stay negative.
---
 drivers/thermal/renesas/rcar_thermal.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index af6d09a75bb6..374c953471e0 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -39,11 +39,15 @@
 /* THSSR */
 #define CTEMP	0x3f
 
+/* Maximum number of interrupts supported by any of the chips */
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
@@ -377,9 +381,22 @@ static void rcar_thermal_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rcar_thermal_priv *priv;
 
-	rcar_thermal_for_each_priv(priv, common) {
+	/* Drain the work before masking the source it can re-enable. */
+	rcar_thermal_for_each_priv(priv, common)
+		disable_delayed_work_sync(&priv->work);
+
+	rcar_thermal_for_each_priv(priv, common)
 		rcar_thermal_irq_disable(priv);
-		cancel_delayed_work_sync(&priv->work);
+
+	/* Unregister shared IRQ handlers before releasing the zones. */
+	for (unsigned int i = 0; i < RCAR_THERMAL_MAX_IRQ; i++) {
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
@@ -413,6 +430,9 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 	spin_lock_init(&common->lock);
 	common->dev = dev;
 
+	for (i = 0; i < RCAR_THERMAL_MAX_IRQ; i++)
+		common->irqs[i] = -ENOENT;
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
@@ -449,6 +469,8 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 		if (ret)
 			goto error_unregister;
 
+		common->irqs[i] = irq;
+
 		/* update ENR bits */
 		if (chip->irq_per_ch)
 			enr_bits |= 1 << i;
-- 
2.34.1

