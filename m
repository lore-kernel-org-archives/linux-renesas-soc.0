Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287D43AB496
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 11:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360757; cv=none; b=owWb1HpxfNaxpQedjpCxzrID7vXkiIFMd69dUtTIPypTsy09sp9Mu4F9qdsWGCs8Ub2FwwC7Zaa0XOUdNNYTUrHyu7BwtFU0fUB6qeVrQXhA2XhPNtteAVoHFIlslj0oEBbl3gaAyar31PNzViycEo7I+7eg1n0QO6ZCyuJbGIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360757; c=relaxed/simple;
	bh=odedB3UOGkPbBy0exjOKQa4siMdOu3wb6gH2pU9nf5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GUKZm7BDERuFuH0u5WfdnBh8WwT1V9KGOipqsVLfW6XuPybw1aXIj2BYVt6kCsPYk+frrI+sze45ZW+ySCYTuySckEGbL2gEtJdBfCEtIImbLFgerdE5c2cGQH9v31jdpH9t19VBswF+yusACIco0++2o512z4xSec/nLKSawgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0tMMYBG; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0tMMYBG"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1214314a91.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786360755; x=1786965555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbur70RJgLEFDEhR3vA+p5Aod61I3uq30QWhp7Vm+/c=;
        b=B0tMMYBGzvFqLVEsluvZQZ26HGBUdYE33JqT54mBvTElNUXWSjbVLV1aOiOrHDQRC7
         QH43/ldILoGxF520ppOLiqJa5hyWyUjT/t0Si2loeV33wbVGKBK++3ay4Oz37eTJsCjc
         6QRh59C7FGoBTM/fumVY23rwWUwfEQ+M0bt/OvX2xFC/pVueLll5AhHZPJXJnUMP24IL
         fbcgt46NLGhbwijsP3RTtEapbu+9hf/8dhwd+/T0rkQNbB1q/CbY4IN+74UP+1xv9HX9
         eVxyzEUBaPBKBlTmH9LXlN/kTEaVxN/8ubuq0rKP6WB3rKdbE9ro+3c2mMQ+wP2szpbN
         lo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786360755; x=1786965555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jbur70RJgLEFDEhR3vA+p5Aod61I3uq30QWhp7Vm+/c=;
        b=SvleSIwCPXdb95GaTXd2t36YJ4tXilW2XLWsTHJuS/kkbqpdwm1R4VD4dZFCVXZZoH
         t2oM5HZD6hHUzC0me0KRcgyE9Wp6rMtfRKYODd8n8742D/mMwsqRNPm7xqRPQg1Z0c2A
         NXKrxyxf0hdudbZ1flXKIyOtwOik0AtvB4a/dZr5+mCt0XUBXKrwDeczTXU7lk/7ngs9
         R/CPG+LR2KM851MeQ3nCLq1fxaJBXYn1uzIJIovXUcmRyegJgBNiaIAHVj3OpMHBNRDK
         0Qv0PlPEIfgB2STdKDnVfS2JoK5tXNsHo8d/2GQ0ITps02/4/oPS9x1frwbkUJIzyX2r
         v9vA==
X-Forwarded-Encrypted: i=1; AHgh+RqXGDNiLD7/viLayOI79gKa5qvZ398VFlfi8ijt4E0LHKf9IW4+Ilgw82gmhmmW5qJjkWVntGV3os5JJLgtKhamng==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa2GZD5GkGDD65/WAGLydAkTWF+Za8UJJj2A8i2SKIv3rF1Zkr
	ywVLNt0ObjQFfoVBuTbqRvjXJOLaiHZA510Y244ouwOnUc0w1euORgq/
X-Gm-Gg: AR+sD10B8vJlxJOqp3ym5MN8rQqN4BEpf1Jd7FSVcN6EX7BOCCO57Ce9JkyrrVCY1oD
	MKjffTQBAYvj6XNKHyvhXiRy984uh1ISPaD2AGqm38EAZDhP2aOVqZjIsxGxDOQHoMLZGxlBXmX
	YmC9hDf77RTOyuE8+JiZUYgVIfhu/NjcbgMLY3ZTdS+cB2RguW32CemXPb3IKM1IueWqdA2Z4ua
	Bck9+TMtu9DhAv340mllprMeDMw4CU/CY2WDen5+zZc5ilzfV2FfC7VnpKhcVMUL0w6dKPbcFGL
	DEaB7R4QEKKV5LCUgy1JfjcgWb25Wo+6TB2QDPGhjLLr2In5xbBBjekJG8hmJzA8NgGDAQTCOAD
	Ql+ai5Jas1h9fxv8jhbrQhMjiz0NTZ9x2vRSHoVQFtbYZUnOn1sNAhJ9ppynRax9bFUmvn080f7
	vU6UTEbM5f12bBgMPmHMphoSjKs+ovztSRkprAt/pkHHEvwLP+eyVmzc+/0Cm7uQz+LRSSslaEZ
	z9bQ6w9+Ow8kWew7RpiEwaTgvaoSqHYcSDQo+CL4IiLJqcLMmDOjJtAVIhBoP8DM72lEDYo/3Ve
	/VKs0FP8dEIFxMc=
X-Received: by 2002:a17:90b:4b91:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-3909d7a4839mr25823292a91.1.1786360755337;
        Mon, 10 Aug 2026 04:19:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085c393d5sm14798046a91.0.2026.08.10.04.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:19:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	rafael@kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	niklas.soderlund@ragnatech.se,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] thermal/drivers/brcmstb_thermal: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 18:18:41 +0700
Message-ID: <20260810111841.77898-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810111841.77898-1-phucduc.bui@gmail.com>
References: <20260810111841.77898-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/thermal/broadcom/brcmstb_thermal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/broadcom/brcmstb_thermal.c b/drivers/thermal/broadcom/brcmstb_thermal.c
index a9ffa596f7c0..477d078ce326 100644
--- a/drivers/thermal/broadcom/brcmstb_thermal.c
+++ b/drivers/thermal/broadcom/brcmstb_thermal.c
@@ -350,7 +350,9 @@ static int brcmstb_thermal_probe(struct platform_device *pdev)
 	priv->thermal = thermal;
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq >= 0) {
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
+	if (irq > 0) {
 		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 						brcmstb_tmon_irq_thread,
 						IRQF_ONESHOT,
-- 
2.43.0

