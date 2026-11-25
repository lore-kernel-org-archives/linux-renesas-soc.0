Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575827;
	b=IrDtgby/1vlUQi1io3a2u7r3ZuoyS8wXdFoGH2vX6/zAQ88bwwfLbypmiFe7WKJLSkGG
	 VaJcYcMcfeRqbIP66sl0xddLIJqsBqUSL/M8ULgEmcmuB9xGcK1xFwNoxmGyF6+UKX9W5
	 roX3BtphEn6ea90rR1QCZ2fVVCmqrGiD5IerMw8vxLCxmv+uL9QNryuNTqnGYf1WEiKsE
	 5kFc2jPuwbwNOscCVF7iVvh+WFhYZpD+jpyKGZzWpZaLiBzQsMhLx+Emgq27PHpuvM33m
	 GpkBLuRyF1cbZrFjAvsTGRcMZ66IPburQ8wiZl+eiS1zPl6IbmQsgFf/S6/nCsvtyIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Zu3Yeo2OLQkh3UXmT7WR67CwGlfanLBhnGcJEX5N8h4=;
	b=tvciiOlPoV1Nd9NS69e39aJSJBROk5x/Vw5osBDLaL/tczfzYcJzn3VQtHhASGgPk56H
	 tsDz1VqZI8qfpn6t8JZl88/H5hpdJgdTvDPJtFviEkvQApf+qF4PqueZYFZ/RGJmRjbdy
	 DClCm744b8lBgHAssYaqtbBVnOv/o8N7qxpQ2tIaa59G7klmuVw01dlXbnEyY5s72IaTF
	 iaaklYrrEQLpjdo42kVjJZkGIx8imXChAR/sE+8n1D/mWaF4dqgIWZYsZix8g3AFDQMjf
	 zp5GZWIuZd5I/p6voqSURTke8IoEKC9erwHppJskXMFwFnOKX+4W15W5Sm3rt6pzKRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FEsg4als;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91659606A333
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 03:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91659606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FEsg4als
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso11299785eec.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 19:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795575827; x=1796180627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zu3Yeo2OLQkh3UXmT7WR67CwGlfanLBhnGcJEX5N8h4=;
        b=FEsg4alsigq8zQuBxvor29owXsrk3UL7lHGkrGfoP98bwya2+CG5WDD4PTJS6DfeYs
         AqVxAxYInZvn4JuW0oweFyU1yRT7Q7CRV1uvZ4zKGakKwMjr0DGdlp03GWAGByQdRSD0
         CmnjkjdUXabNkhx3cL6Y9/JW3zIlrOOg4vaTbVHK2z9VcPZZeb9zJgUD7sKikTU6vdTm
         EwsuiLXCJ0Hj+FJiXiTDqu+54kfWtiM+w+oLHdKQzurA2+uKdInIXnq0ypS9lHdEJVRU
         NCFWb+2x7/a8i0A3wTI5sZuWE3qKo5Nc+77wnkVzmgENdSCknAXdIu1s9/oq09RY0Odp
         8dbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795575827; x=1796180627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zu3Yeo2OLQkh3UXmT7WR67CwGlfanLBhnGcJEX5N8h4=;
        b=g1z1uQx3FWJtA/ZiHT4Uld1X1FtEezOZNFtoyjvXaeMW3H4XHWtgiijMDVuIptvS/7
         l+H6Hl+JgJ3UTozveCxeZGWyfV9rFI2H7XyZDdOx1hFnftGwKX/dS1rYYlG70DykKPvo
         GgMjCsA+KkjNNHCUf1gWTGePCEqmvbWCt1tY17yTlutKXmo6EvY5loEK0eejeJ5a07E5
         38EgwgvKpJntnebPz0a2Watc+ONAigR3L7//Pj7nVMLAOqzNO2upihMabdO5PlMxnsDl
         5VWQOK8KqjwKxFTBgkdTGNcF1O3qfXwn9Xzt9CUPrXpsf/sEm+8bDmP+hIkRuwTqiiYG
         pYRg==
X-Forwarded-Encrypted: i=1; AL+hErHEL0corq+1ub6Wh384KEs+uyLZgfpgElZZX6jMkLk05N6EuQlHnfv2NGB5vIN4IpQ4W9l6z9XEEPtFcYs9l44+OA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8uybcqKEdsEKXnvvXL1LjMCeZBUREDRdtce8kpQ9533166mQY5
	/9+yTlb7+dV4Cp5O/TpDG2804gu7HObrMNgvOVEV5PMPRFMNWYUWAHA4
X-Gm-Gg: AZFdTZdBMFPC046rLecoZHmlk9wOnG1IWZ6+0NZmlSgywH8dJjf5Lp72PANemJ12IF1
	fr+M14KuDiFOOZ5SDruR2uOVMae5Sl8DHnUHYEA+5w18XXAVA08vq5D3/mFfa+Sl6MR8vRpr1dZ
	TwASv6sKY5Jo/WZdYG4AKd0Np/LF4XDstL+krVjGLyPaMkjVzn0ss38Xuxb7eqb+/az0fTqeoaH
	Iwz0YqHGfrsXjLpoebPRg3IdAupqygTOCagZRPfDhbdKxf4ChCinUGWWQFHn2xAgbnznr1TuYvQ
	+yVF8+GNh/QoQIDvnmSZHleqgfPV1JnqtwvHpiMNneRyUNNkDailQeePjlv6SCYsjvf6JqnX7KM
	lq3oBcNGt8pWsjhE8rBpcId9BC8ptchnVUoSBXzPDA4Whpyuepguf/hV5foggQV+UglbR+mvFQh
	SBmyi2XXDny5mL2tjNXtpZhaNjvF27Ds8ZHbr/IaqF+MRj0tLv0S4hy2/iiNXM6rSyMi6C8NU3b
	GWhiJcDMnqAI78O872lrfElkiiS7j0Fu11NH/1WcF+HZ8CWZJ8ORwCSCefyoGWsvHHdBGd7yrfu
	KZFLJrF4X1vL+23sG5RxGxlFmhFFGFA1pgPardACcYAE4+meXzQaKJMrjQyeqf65KUSuI1k+98i
	zZ6LzH+8yx/CgtuciFmsqn4gva74iCJ+tlv3Uh/etBEliPl/k
X-Received: by 2002:a05:693c:41d1:10b0:386:9d4b:9403 with SMTP id 5a478bee46e88-3869d4b9723mr12768057eec.19.1795575826354;
        Tue, 24 Nov 2026 19:03:46 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm52243475eec.14.2026.11.24.19.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:03:45 -0800 (PST)
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
Subject: [PATCH v4 3/3] thermal: rcar_gen3: do not enable the interrupts before the zones exist
Date: Wed, 25 Nov 2026 11:03:27 +0800
Message-Id: <20261125030327.953450-4-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125030327.953450-1-shunsheng1218@gmail.com>
References: <20261124095110.131258-1-shunsheng1218@gmail.com>
 <20261125030327.953450-1-shunsheng1218@gmail.com>
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

rcar_gen3_thermal_probe() requests the interrupt handlers before the
sensors are initialised.  Once num_tscs is set, the handler can access
the sensor registers while sensor initialisation and thermal zone
registration are still in progress.

The handler checks whether tsc->zone is NULL, but this does not prevent
it from accessing the sensor registers during initialisation.  Masking
the device interrupt sources alone does not prevent delivery of an
interrupt that is already pending.

Request the interrupts with IRQF_NO_AUTOEN, so that the handlers cannot
run until the driver enables them, and initialise every sensor before
the request.  Enable the interrupts and their sources only after all
the thermal zones are registered.

rcar_gen3_thermal_resume() re-initialises the sensors and the sources;
the enable state of the interrupt itself is left to probe.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64, aarch64-linux-gnu-gcc 11.4,
CONFIG_ARCH_RENESAS and CONFIG_RCAR_GEN3_THERMAL.

AI assistance: prepared with Claude (Anthropic) as a coding assistant; the
author reviewed the reasoning and takes responsibility for the content.
---
 drivers/thermal/renesas/rcar_gen3_thermal.c | 53 ++++++++++++++-------
 1 file changed, 37 insertions(+), 16 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/thermal/renesas/rcar_gen3_thermal.c
index 37348f4413b6..e6682c5759aa 100644
--- a/drivers/thermal/renesas/rcar_gen3_thermal.c
+++ b/drivers/thermal/renesas/rcar_gen3_thermal.c
@@ -326,8 +326,7 @@ static bool rcar_gen3_thermal_read_fuses(struct rcar_gen3_thermal_priv *priv)
 	return true;
 }
 
-static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_priv *priv,
-				   struct rcar_gen3_thermal_tsc *tsc)
+static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
 {
 	u32 reg_val;
 
@@ -337,11 +336,9 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_priv *priv,
 
 	usleep_range(1000, 2000);
 
+	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, 0);
 	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0);
 	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
-	if (priv->ops.set_trips)
-		rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN,
-					IRQ_TEMPD1 | IRQ_TEMP2);
 
 	reg_val = rcar_gen3_thermal_read(tsc, REG_GEN3_THCTR);
 	reg_val |= THCTR_THSST;
@@ -350,6 +347,15 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_priv *priv,
 	usleep_range(1000, 2000);
 }
 
+static void rcar_gen3_thermal_enable_sources(struct rcar_gen3_thermal_priv *priv)
+{
+	unsigned int i;
+
+	for (i = 0; i < priv->num_tscs; i++)
+		rcar_gen3_thermal_write(priv->tscs[i], REG_GEN3_IRQEN,
+					IRQ_TEMPD1 | IRQ_TEMP2);
+}
+
 static const struct rcar_gen3_thermal_fuse_info rcar_gen3_thermal_fuse_info_gen3 = {
 	.ptat = { REG_GEN3_PTAT1, REG_GEN3_PTAT2, REG_GEN3_PTAT3 },
 	.thcode = { REG_GEN3_THCODE1, REG_GEN3_THCODE2, REG_GEN3_THCODE3 },
@@ -523,7 +529,8 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
 
 		ret = devm_request_threaded_irq(dev, irq, NULL,
 						rcar_gen3_thermal_irq,
-						IRQF_ONESHOT, irqname, priv);
+						IRQF_ONESHOT | IRQF_NO_AUTOEN,
+						irqname, priv);
 		if (ret)
 			goto release;
 
@@ -555,9 +562,6 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	priv->info = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, priv);
 
-	if (rcar_gen3_thermal_request_irqs(priv, pdev))
-		priv->ops.set_trips = NULL;
-
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
@@ -596,10 +600,20 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	rcar_gen3_thermal_shared_coefs(priv);
 
 	for (i = 0; i < priv->num_tscs; i++) {
-		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
+		rcar_gen3_thermal_init(priv->tscs[i]);
+		rcar_gen3_thermal_tsc_coefs(priv, priv->tscs[i]);
+	}
 
-		rcar_gen3_thermal_init(priv, tsc);
-		rcar_gen3_thermal_tsc_coefs(priv, tsc);
+	/*
+	 * The handler walks the sensor array, so every sensor has to be
+	 * initialised before the request.  IRQF_NO_AUTOEN keeps the
+	 * handlers from running until the zones exist.
+	 */
+	if (rcar_gen3_thermal_request_irqs(priv, pdev))
+		priv->ops.set_trips = NULL;
+
+	for (i = 0; i < priv->num_tscs; i++) {
+		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
 
 		zone = devm_thermal_of_zone_register(dev, i, tsc, &priv->ops);
 		if (IS_ERR(zone)) {
@@ -620,6 +634,13 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 		dev_info(dev, "Sensor %u: Loaded\n", i);
 	}
 
+	if (priv->ops.set_trips) {
+		for (i = 0; i < priv->num_irqs; i++)
+			enable_irq(priv->irqs[i]);
+
+		rcar_gen3_thermal_enable_sources(priv);
+	}
+
 	return 0;
 
 error_unregister:
@@ -633,11 +654,11 @@ static int rcar_gen3_thermal_resume(struct device *dev)
 	struct rcar_gen3_thermal_priv *priv = dev_get_drvdata(dev);
 	unsigned int i;
 
-	for (i = 0; i < priv->num_tscs; i++) {
-		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
+	for (i = 0; i < priv->num_tscs; i++)
+		rcar_gen3_thermal_init(priv->tscs[i]);
 
-		rcar_gen3_thermal_init(priv, tsc);
-	}
+	if (priv->ops.set_trips)
+		rcar_gen3_thermal_enable_sources(priv);
 
 	return 0;
 }
-- 
2.34.1

