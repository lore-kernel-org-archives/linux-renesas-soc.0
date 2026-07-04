Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C232C273D77
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 20:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783196131; cv=none; b=JJbRPAvScyZ94OK1VidnHHiETUSuF7BaRsTQaxUcej7EA5GCuRwPwMcpCklyBuz2wwG8C5yspTxDCw5WGHQC01mc9KvUC+L2SzwFwzAdd7/13YBsDbN2uxglMC7E5p/bnIv5Ys5BoV+pfbZXIO5qDNJ+IPqGzDB60JU2UyB/u3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783196131; c=relaxed/simple;
	bh=0T0s2KEAyDUgRB59BVz2JqfhgvfpA6ltVwhFxlbKuH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJZ/8y4QT8kp1y8MG8PXSi0PAR24EoQr2atjzJpMl8cXy5i9sqlMCmS0pfdy8hP46Q0ynB8PjcHD66WM1UXpLanBnoTrjEtgizwyLmcmmYpoUxVXUTzu42x17B0ZoEXyfT6//HPmAWmXnMieN7LRGHgzFDNIxP1jGtnYADmfJj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcWHix3I; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcWHix3I"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9e2489e117so875894a12.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 13:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783196129; x=1783800929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkUo32eIUSWMW8/5ZIqDJyOfbL6ZzC6LAJQtfPU+j/s=;
        b=kcWHix3I5EeqXUoxM4HIpron7qX8XpL2hqr73LUFJVy6VDPJU/07nv4OFIevuIF9UA
         Ub9mViViZ7VCClpQtPPtsakoyihtR0bWkcTbtDpq3xjV5OQ9qfAiSbqbspC+CDIYmLMN
         1p9E9blYjpkf1+ehIUGjruXXHWX8OO2lKur/VSh+ZEAYXDJ3Te9WbeaZbha82D9x7YzK
         C23R6+dWaAepkkHD2AI56P5w6bl9clJF/KbDlbqUFTXTk3rlRgCJs98eqwRqap5hW2xr
         QeGYY+JdWRXYHI/E2aw4CV29XedQ9g8Rs0irq7bQkDGztin5aEOvhvw9DuCyRs8/ZapG
         iO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783196129; x=1783800929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xkUo32eIUSWMW8/5ZIqDJyOfbL6ZzC6LAJQtfPU+j/s=;
        b=hX2TcUkMGqJzZag/qO1U4B6ZHSATeYoGhRu5cuh0iQimM0x/82UgPrs7S+QlZCSo4i
         Th1AUx8ySuClPji2YyTQynv88jRnBNlIOg0glpCD47cgLcofd+1WpciyDXxQrLdHdEv6
         A7DzVXnyUyVEIX9uY+FU1y6BvnSQePggcJAWKhUvHQSZN+RA1pKjKLChVNY0TbwpRtyn
         t+SuOAcyDic4waqda6zsK43RTUHpk0DdjdAETURRIQRGhVLXpRM6gBq18axl1DYRRAzy
         1Xqb5fCJgrbG62DYMHCZz+PpSE9KGdWUHhMMJND/4G4A04z8o/L6WlFypw1Q04ft2Uqb
         11+g==
X-Forwarded-Encrypted: i=1; AFNElJ+BGkh0udO6+qdk6m4IV7wULn56pgj1Rbi33SHKTIKBPw9UsSxrZr1lmFz4ZVXtjrBazehreBv/y1QD4YK8Gq/tFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiURVzLdSu8m+kpPX8t/COGKOznHQgWK0/J9xP2O91Lf7KSEzE
	YfK+h0/X74vGYnq7CRa/eaVZrcP1Kc2KJYySi/sCeDxg5tlpBKul/Yx+
X-Gm-Gg: AfdE7cmMEPDRdJHn1I9d4AHhswG0rEYEE+t71KFkZC1gf92TI1rJxif84eqs1y4ZkuQ
	a+v56WvdWBUzRbg5kAQkRWytnABzFVO9NSXEhIGG9Xu0APZmcgnbz4/kVf2uhsLKUqn/mERro8A
	JWMO1PWNI+nOxVKQt25pmrF55Ng0lh+wvOA0R4kX345mqGtxB2Bv+SScON50YnnYWJcSqZG0mQF
	HPNsc5OhlgMCdKYCzh1v41UXna3FTymPprttUlaM36kVdE0/XJjUd3jQnFMxhVhUrk+qbHqhYYT
	PUggq9a2fOgcBVHCRcn/pfuMI0wzyqkyLVxzegk2/0dYOT3AXIu81q8bUFXYBfbq9rLnJaava6s
	c3wmelAfjauaiOumojnFeOx5/b93xTqIHiXrWCuSMbc+lLQnB/oxtJHRoISxod4Q4Y39zqXKWdQ
	894hy0XM4Da0c+bnFHwN6tds9vw4bYdHaFsVAT45Qb1yA=
X-Received: by 2002:a05:6a21:6e48:b0:3bf:6c04:a816 with SMTP id adf61e73a8af0-3c03e4da45cmr4491922637.55.1783196129054;
        Sat, 04 Jul 2026 13:15:29 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ffdd292b0sm6341930eec.2.2026.07.04.13.15.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 13:15:28 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v4 3/4] media: renesas: rcar-core: Add missing media_entity_cleanup()
Date: Sun,  5 Jul 2026 01:45:10 +0530
Message-ID: <20260704201506.82524-9-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704201506.82524-6-birenpandya@gmail.com>
References: <20260704201506.82524-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe error path and remove function are missing calls to
media_entity_cleanup(). Add a dedicated err_entity label so the
cleanup is only invoked when media_entity_pads_init() has actually
succeeded. This ensures that the teardown logic properly mirrors
initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba8..5bae8eb0ee19b 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1211,7 +1211,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	ret = rvin_create_controls(vin);
 	if (ret < 0)
-		goto err_id;
+		goto err_entity;
 
 	switch (vin->info->model) {
 	case RCAR_GEN3:
@@ -1246,6 +1246,8 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 err_ctrl:
 	rvin_free_controls(vin);
+err_entity:
+	media_entity_cleanup(&vin->vdev.entity);
 err_id:
 	rvin_id_put(vin);
 err_dma:
@@ -1270,6 +1272,7 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	rvin_group_put(vin);
 
 	rvin_free_controls(vin);
+	media_entity_cleanup(&vin->vdev.entity);
 
 	rvin_id_put(vin);
 
-- 
2.50.1 (Apple Git-155)

