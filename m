Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1A73C0603
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360752; cv=none; b=Hn71HoRMmMnYHiAQBqagJErb7Ad+Pu9yH5Hp47ue7A0CQ7dD5a11xPpcobjQwT+kMiIEgPr26uTaUhLurS4gfT7jEWXxII+1b3Z37qrM8zAm3roNM9sqxZWGgX+kU7nMs02RuQA05/R+YAl9IrAxO9lHmvgPgBRPzUV49gDWLcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360752; c=relaxed/simple;
	bh=SRH7gmJxvEJfhL73w40/jCAW29CpNndY32IxKI+wJWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xcsd6LAX6iWpjJ3jMbhFp0VyWf8OpVBxzZaFBgVZQrA+HjannLkUwF+60WOG85MAn+QJPU0IRF4RazoY06VtlXwR0HeNBeqHpYmhMhJEdIbHsEVtn4TWibSWz8cd0QGtiOgXW3JBzcio0GEzHfEoeY6p0NKmFTMeeowh8nKJdNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhakDFjR; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhakDFjR"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1814901a91.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786360748; x=1786965548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDnTUkrh6OVBnHI+PdScQLYsi9xVJCaX4SXJUY886NQ=;
        b=KhakDFjRBeeY6sjyxMpIZ7lrnZeUXcwWWzDZ+jeLZi1bnP3CC7xTy9nRHAO22p5VP6
         fb+J90QfBq3ajImJWwPj3roV/0ALqXziybUGfZ9y1uQjqpHz51+V1jIfXk0hJ4IbZdfZ
         0lzexmekqCOt6570dT8HD60aUGVAhZ+zyZ57jbUckYMYBfTHjMLwuqX/XKeW2IJCvupr
         UcjRr4PmcW5SKKjsPjNnEbjyQ39Qd5iKjHshSQVuRInVLTy6IvFUd3FwRbYX4ETwa798
         QJL72Ad7+EemiMM8L9KvrSA0jZXjNrG9Q9GWNv+r62+ih9pi+JFAGXKanxDL4XZpSAlv
         xa5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786360748; x=1786965548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDnTUkrh6OVBnHI+PdScQLYsi9xVJCaX4SXJUY886NQ=;
        b=q/2L/6GNNh4fSi7e8bLOfD0xJ5R1653z8S/Ks9HwtPm9aRoYX3ba65f4+pt7rP3NKK
         U2HjyK+1gca41WEsz0eKrJ7MUlF78cYKa3EaCYu2cgBpP+eiTyH6WuEl6T4DphEZXBI/
         CQLsV27RlAuPKl4BR/qw9gYltDEoWsXLywrd/QUKt+HWe4Jhktiagb2VBidCfFmCeZzs
         C1tpvUcDuWfc8s62dRE/h4tyQORq5Bt4LXxGWtFpl4hBknIsZH3+q6LZM9BcQ7d5DxDw
         6tIuctcjWTLwv3/5ud8PeBtlZkrjhIIQrm9Fdc3/2aDiw0KIsYdD00/+r7sUrbjACZWR
         2HOA==
X-Forwarded-Encrypted: i=1; AHgh+RpmFf0Q2jd7TXXyw/hHhYK7+n9zECXduYfYVBRSrgiM178+4IT9R1XeGZnQ29mQWcc9d4/syjaa5sl7R24qnJrPQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqdIwJjWOsDfmKkC/uG6QagE9107WdWsEVLJlRgx4DvNPVFMOV
	vw5thQR+9HV8BkgANXredO2RSLzHAshDSGTJzg7MJx9XJQOz9UM3ExaG
X-Gm-Gg: AR+sD13fP3+gaOJF/vOY6jUVWPUjMsENp028JQONVMJuxd/WCTn3HCoFNTX/BddlqE/
	T+PMxBoVPHBBQmloQ32RRn9lNEKbiUi9cNtymM7ekAadGIxyd9ODFThHEVna4QOr0ZcPPLFaskK
	GjYDmMZ4xaFjnrBOQDaUPLNM+NHeJf7h+LAiHpqyRkXBZ5eVWwl0pPY+U5x+grS1YeLjRRDxMMY
	E9Nl7aflE/vH7dx9j5YmkhG2vd6UP8hm9DBJBbJ74/12yjJ24A0bj5zORs1GPvANSmnbzf6EHMS
	qbjD3GDlleaTy/CSykU/cO/MyopSnUlgarfeOwYfVabUmYYnElhk+zwiX7nWjAGmskz9LkZv3Is
	9kjIYscEnKc9bH0ajDabO6CYnmiu2zpHjzn0RdZ72GJb4aGfrC5hsuQsi41Lb/oyQaiO1tjyvFm
	4SLTKG/3KBp0nlW+Oxa5104Nig/EZ4FOdOBqS9hRECPvc73PBTdN7LgvDrC+OgDdgDa72GnBqQM
	Uzib4WPttyfr6mSntZBG35PWQtialbzGK9H8BHAQTbLejeWwDRSuTTdjYkyzw+3097CfVT94lfV
	sMGZ
X-Received: by 2002:a17:90a:e705:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-392cca1f44dmr579534a91.14.1786360748511;
        Mon, 10 Aug 2026 04:19:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085c393d5sm14798046a91.0.2026.08.10.04.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:19:08 -0700 (PDT)
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
Subject: [PATCH v2 1/2] thermal/drivers/rcar_gen3: Handle -ENXIO from optional IRQ lookup
Date: Mon, 10 Aug 2026 18:18:40 +0700
Message-ID: <20260810111841.77898-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

rcar_gen3_thermal_request_irqs() may return -ENXIO when no optional
IRQ is available. The caller currently treats all negative return values
the same way, disabling hardware trip-point support and continuing probe.

Distinguish -ENXIO from other errors so that the existing behavior is
preserved when the optional IRQ is absent, while errors such as
-EPROBE_DEFER, -EINVAL, and other failures are propagated to the
caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1 : 
https://lore.kernel.org/all/20260807093058.42840-1-phucduc.bui@gmail.com/
Changes in v2: 
 - Update the commit message.
 - Move error handling to the caller.

 drivers/thermal/renesas/rcar_gen3_thermal.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/thermal/renesas/rcar_gen3_thermal.c
index 94804816e9e1..04a57ff724f4 100644
--- a/drivers/thermal/renesas/rcar_gen3_thermal.c
+++ b/drivers/thermal/renesas/rcar_gen3_thermal.c
@@ -527,8 +527,11 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	priv->info = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, priv);
 
-	if (rcar_gen3_thermal_request_irqs(priv, pdev))
+	ret = rcar_gen3_thermal_request_irqs(priv, pdev);
+	if (ret == -ENXIO)
 		priv->ops.set_trips = NULL;
+	else if (ret)
+		return ret;
 
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
-- 
2.43.0

