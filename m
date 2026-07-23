Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BECC4570D7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 15:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784819454; cv=none; b=ODWcB68Hh9nkT/82SjUtUzTR70M0cWxgCJb3p5mJOrSk8f7eSd+GnWjo0RcoHkGWr9Zcd3ccNR3CHYXIiZ78wpx3SylvMLE/fugxyJ8a8PNYYkaaYjW/ITcEN+6JeAJGVum2HxBm019CeWaTbYcAQZWqZ7iaF2e2BVh12r8QYT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784819454; c=relaxed/simple;
	bh=AyAyY54zBoSivQOEiGp3ASyCdtZpU1hjqqqjen323BE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xo+96ClCltyxoa22TAAMMNe/ApQ8QPzvMG3UpjFmF7dloaBLy5vrJuSzo70bsGZBZTpA0p3MNouqzglO4L0qc33pAooJr+j1+ASry1Xgwz4aC6ad5g2LLbO/AWcHpP6CPSqlTaiT5Q2KeAw3ViI4L+2cXnWc1vR5mCk4AuamOz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+QBPiD+; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+QBPiD+"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f7854678bso298997f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 08:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784819437; x=1785424237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVeQmlhXu6vwdJqyFXFnrCGqyIeQoByrr/pflj+7TA8=;
        b=E+QBPiD+c/AP+GbH/1PyJQAJsFaul2XuOUr3vAZA2mY59GLtpn5kpwQ+c0kvwWcl1X
         Udv/GE0Kcb+D7wINGoE2Y8WLbYckxYjP0IfDx0amRzLbFRnW9Gvz0mZ2eoJLwu7C2fLF
         ioV4eNP8sOvU+QciaH/F79HVPhtdVe0aTN1IQF0TyZz8CQIz4TLymRo6GxaPruD9n+Yi
         CZ24mabHfb5dMW9PJgiWAyTQeAK3cGTmYCdtRuMXpZUGfS4Cdsyz6crLPnt2u7b6wpEL
         iZMlOWkp/xW+69jevcZ65A84Lcli8hrwQa/Lt2pXS9jgrFwJG6a0JKvRJssJ+o4ugq4m
         lbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784819437; x=1785424237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WVeQmlhXu6vwdJqyFXFnrCGqyIeQoByrr/pflj+7TA8=;
        b=hlhFeschbCLbuQqqBy38JxJPOHYaG4hs7fEjhqgu9y5Tfc+y3DLGa/PqTZEoVrpZPy
         QeVdRl4ltjYPu4hd/qsc9334tkiY14gMbrokCF/hmT2cBAYFa/w6rdy6V5FsOYIqcd9n
         QLebCzU2g4Yd5/ZBssvvYBAshvmv8VcWaG2Z0RAH/c2pwEww9fkEmIV6zzO9FNn9vfPF
         sGzWtRWYmRpZt582V0FYArWtQU7maVSxybAomUnkeSDrtCi5hEVs3V1kc9MLvlr3o5OW
         akZWE3Ag7Uf+EsMLknYqq/+Dx2J80KU8+IsW1YoDVQJhxI6Qcs1MWichoAauuvOLu1jG
         SexQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUa+pPhg6Ji9pYfTAWeH8fQCNG9MX0QnXuPhlMFy2JVF7kq/EkIpbwvkaPVejfiFukAZwZgJetXCY2iXsFAtcjyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf69gQDqUBi4nWTFQaVhMmXrhXhbYTsu9VSfvmv3jIl8fo3M4x
	9aAuRUw36txXJLIi4yBDGpCMtxTdea4LyhPXuRLzgeSxLQNVd9+J6K+c
X-Gm-Gg: AR+sD10m/NVZlU/CuKrz7DDonVfPiQC13X8oip2rkXcGs8ptoHRHRQFaTdZUGws4Faw
	4TjmNAxetHzO9xurZR704qpwL0scxjgr4v2jdg6M2i/uxm/I5v89OgKuBN9s/MLUChhtIEsVmfT
	FuLr/dRmPyRMVn2OJbK2T7lBPVEaTdEH0qfc51uzyUPddCtQdSthxuDMPDofGE+0fKviBwU1NQX
	9m1zbe/re+8xRXMXkFEGGmHTjGApiG2AbaSAZzFj+DZDJuWmi+gfk0SHl0yhir7A08FuZoDnyRJ
	e5TpiGxZUHPh1dr40OcN/xFslai+6zC8wRm60p61iz/AWzbXfeCJRAA/v2lV0gRut/XOLy1kUpZ
	/Z1bR6mkFvmZrNArwuEGbXlUr1tMEZKbesxCmOZwtdkBe063vMO8njwub1VengvStZXSbTW9L3w
	HcGKMEZlLYZ7PEms6635qw6ZiJ9NE=
X-Received: by 2002:a05:6000:2993:20b0:47f:8e50:93e0 with SMTP id ffacd0b85a97d-47f8e50956emr3651284f8f.39.1784819436709;
        Thu, 23 Jul 2026 08:10:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:f073:32ed:a057:cd3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb81dcsm15886823f8f.12.2026.07.23.08.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:10:35 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v22 10/13] mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
Date: Thu, 23 Jul 2026 16:10:14 +0100
Message-ID: <20260723151024.318918-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723151024.318918-1-biju.das.jz@bp.renesas.com>
References: <20260723151024.318918-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The SD_STATUS register, specifically the IOVS (I/O Voltage Switch) bit, is
not automatically restored after a suspend/resume cycle, causing the
regulator to report an incorrect voltage on resume.

Fix this by caching the CTL_SD_STATUS register value in the renesas_sdhi
private struct at suspend time and writing it back during resume. The
save/restore is only performed when a regulator device (rdev) is present,
as the IOVS bit is only relevant in that context.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v21->v22:
 * No change.
v20->v21:
 * No change.
v19->v20:
 * Updated resume() with scoped PM runtime call.
v18->v19:
 * Updated suspend/resume with scoped runtime calls in suspend.
v17->v18:
 * No change.
v1->v17:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index a085a4cb2e38..e2c26917b884 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -105,6 +105,8 @@ struct renesas_sdhi {
 	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
+
+	u32 cache_sd_status;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index be7720305d32..70ebe5902f6c 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1424,6 +1424,15 @@ int renesas_sdhi_suspend(struct device *dev)
 	};
 	int ret;
 
+	if (priv->rdev) {
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret < 0)
+			return ret;
+
+		priv->cache_sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+	}
+
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
@@ -1453,8 +1462,23 @@ int renesas_sdhi_resume(struct device *dev)
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+		goto err_assert;
+
+	if (priv->rdev) {
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret < 0)
+			goto err_pm;
+
+		sd_ctrl_write32(host, CTL_SD_STATUS, priv->cache_sd_status);
+	}
+
+	return 0;
 
+err_pm:
+	pm_runtime_force_suspend(dev);
+err_assert:
+	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_resume);
-- 
2.43.0

