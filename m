Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAC4391E77
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 13:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784381935; cv=none; b=mFF1bMKoVxxf45NSxw/V5KYoazq2JTiAfnpfWs7ADNp3Luv44g0qwg2vuoAmtJSabli9Q/Tr+PTh50/7B4f9lPgHd6t74eCs2kCXnes7ZQGkkgaaAjIY5OjWVZdD0L4MGokox8eSke2qNVtzVOzzakbqAidy1ZKwc1i05p6MiXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784381935; c=relaxed/simple;
	bh=5exsGCY/QAdntBzZb1PGM5ydMEHgf9wYpWxkIufUqqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CFKWNNi9Limt1OQWFnFIZ8tk7pE3q6TZxXzAh8imZnz2QE9hkQSs52vF84nIFSksF7j3FX/iTvQzToJl47HhM5aG10X5jBqMLreW89TmmBOn0ss7O86RfL87d+rLk6u+pMkiz/FlYXiYHoP0l3Tn8Z4+nH2NxbWM3XRf2H9zcBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RymZQgTg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RymZQgTg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso1863005e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 06:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784381931; x=1784986731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GwVBgYO9MGpUqIKGammrpigKOhLlm2sYqP19awJGrm0=;
        b=RymZQgTgRFyAl4KcfAW3ChrkCDbPQSurbpkgtb5ybiENJ+n6o3o0m6JweSL04ED2DP
         AeOU10h/lyRQfVMZ+gMBhaSZLLtLp3RUYNFra0CNPTzy88KD33jazV/psquBbkiTzHfE
         2kc2jVcaHC5cunwakP5wM/b+s+glDdwr0CCEbPEUZFNGBvIA+PhUOjXMnf6Ob2FHivOb
         GMfqhrAZYQgoCFfAuwPb0IcfOADDLp/xZXRtUEdonGH8nq97ox6COJWyq+gT/KwrNoOB
         XIe7roJ7goLsC/akKng11u3dTwJyJFnCMSuOIw9T+WZgsyiPzNbMRShH2p/letrOzAxm
         Jq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784381931; x=1784986731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GwVBgYO9MGpUqIKGammrpigKOhLlm2sYqP19awJGrm0=;
        b=beyjppE95rdArSjK2peXCON3DBsiDlHvLQMRTpUmM5hrMkyJHx2a7WQmbCDeZO6j73
         mDPCxDsD/ikI7k4fg3VSDRwdOueD6WMeVVX9c55uFEDYbkFG3+7A7odhlCEikcViOtjO
         rAblrsRrAXupROja1p6CHGD2XlE0FZUKsTj59Izru7c7uFM6LWhfDLKtpOdPoK/avB9q
         auAmXzhYsm+9ifRGwLJ57BaN4uchi3eb5x3a9faYgPdu/HNmSZaE7RgcaRMDFWR8ciEh
         D6Vnq+utvaIfOoVUOXjveicjkOW/8hffzX6qFzeKeblAndNFmgbYmKIp2yEZzO46YNjX
         GqSg==
X-Forwarded-Encrypted: i=1; AHgh+RrrOh1RfZX3ZjX61jcsCTPrTyLOHlCKVQsWWd7nLuFLICy8rsHNXwJIGQUjdrDHKuPteM3r6oop5ZkhL68rr8MTbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YysaP+qptbEBh2tXJ8qNb6USWm3WaoWzeTit4/pmeWVGCLxpeqf
	0FY50QHJqjr9KmS91GF0+Klifr4DtO0mG4Kg0oPVIowtnyK9PH+FfU8w
X-Gm-Gg: AfdE7ckmLEtx+lqQmJqmTMfsX7VWaO92QZJpEuW0FJiA4j3Jmj2tvYVGXXRrVUgQiDo
	dEopwLI9Q2DZctZxe5koGdEFIHu2m4DnebE2URt10s3gQk8pZxr3fjGnP8APbgdXesy8/UR5Gwf
	3zHWWCId97HoLVH9PPoc+bDhgydhVxOWY9v9jzzAqOjcWwPENh7unav607jrTvLUEn8NePyZM9a
	zJA8cUQz3KORCw9VtGyEWxx9pDJ8Nu0RSVc+HqnL78oqzwetSGqUAoAqpMTkD99G0Gx7snFGrOs
	2OttPEA/LQKgDLWlgXe6QqpyV2ehJTUDwkbd++1o4cPRR4Tmj3zqRa3HhbBQjZEKRgMQYHb/OFV
	0eIS+kjAu1xc75mO6JfOjUZAuCnplY55rEY7dkhtBAoSW0obdlLSS75KKyeQx1NJOwMShy3Apfy
	iEWfA9MkdsCZvPJBAUMMnElSLxJ1o=
X-Received: by 2002:a05:600c:154e:b0:495:49eb:1ccc with SMTP id 5b1f17b1804b1-4954a3eff56mr80040385e9.13.1784381930911;
        Sat, 18 Jul 2026 06:38:50 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:c53f:e1cf:6009:4c03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c96ff7sm121717845e9.10.2026.07.18.06.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:38:50 -0700 (PDT)
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
Subject: [PATCH v21 10/12] mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
Date: Sat, 18 Jul 2026 14:38:30 +0100
Message-ID: <20260718133838.152905-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260718133838.152905-1-biju.das.jz@bp.renesas.com>
References: <20260718133838.152905-1-biju.das.jz@bp.renesas.com>
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
index e3ffe790cb21..d5d8afde9bfc 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1406,6 +1406,15 @@ int renesas_sdhi_suspend(struct device *dev)
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
@@ -1435,8 +1444,23 @@ int renesas_sdhi_resume(struct device *dev)
 
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

