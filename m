Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3EB486E77
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 17:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246240; cv=none; b=YfclSe9/cyjUrh6myL7IEbkzVDauTeyEepdBduObRb4yAxjm3UF2MXqa6zglPffNax2mQRJC/V8HexsSa7F69lK9VL2bJwIrlwIM+ZDLQ9glXeG/hCKdrv3f8xym7aXmqkDHmn/2cxy37KsHEU/f7wXNAYK5rlxctev4GEWNJLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246240; c=relaxed/simple;
	bh=T0n2OcsY7D0hezKJLYQT/Joj73872z/OFhoCfzbHJbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=APfzviYfiEDIAqzrREx7+SH0YgL7FPm0eU/tL3sqcfFlMK1PJycWaWC6RqD40GgB86wpFxf6x5qjm2QfdG3VElPKtUNcoZCB2ZILAzWzRn+BWp0aiVS+htaoB04UMpIQGvtUM6lP4sNenjTsg6MZ4BVXMVa450FwfODP4Domwrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=If7Upj+b; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="If7Upj+b"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49800c6a846so617855e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 10:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787246233; x=1787851033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqAj7jZF26Xz35brabY95dCAhY9r9WKkIDnDRdXuljE=;
        b=If7Upj+be4xOyS3urgky5bu73EJiusa7ZaE0bGynowLUE62LpxKJSlaY06sP5JYPmp
         sBNWSwiFlsc+WBf4qwzHTZLvuNoMPXCbJdw97KX+GAn2CDeHOXDhcMnZg+br7qcukZyR
         SeUR50P9KUNjZ36Qoql7KMcdjMRASonqa3j2DEMVLmx9y/rV2b+LXc8qEHMK8sWnc8JW
         uXMrOqw6hj+3gTIfJ88gXpGgVGJvqmWEHKd0xqO4BvO0Lch+Whrilsn8Sf/Lkp2fBSNH
         q1JBY4DdT6reniq5CuVD/mgd9W82op8Lh1tu7rI7TbVenQ4uBi/QPnSqIdafJwsc3pSa
         AEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246233; x=1787851033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqAj7jZF26Xz35brabY95dCAhY9r9WKkIDnDRdXuljE=;
        b=aB4OtvuXYyT05yFCjouckbksoCeArFRz5I+RSz5OMeYLpc4WtFr8FFvX1k+yEB4ZVF
         /40IFfcG7QKKuxCMwnpDGlKqnUa27qa/gbvNdZT4ATicovC5TpEwz0GybGnumIyAHvEX
         e+q5NAsIBeh3OxyxofPlOrucUYeem5/b44MPMjDKMr5R6kMWIWUxIBddUPZ1i8XplTlY
         BhXrt4TMhDGFCVYkfoJMrxmEqYFX583vsuiUXa2xY82o10tNT6fTxfeqTJX6eTxkW6aO
         gEkKrWauNVuVLgA9Q9KbIEF4llPdhRCwgD/xXSDDSX7AvWJNYPl3sfRchvKKMXs6sE4x
         gqbg==
X-Forwarded-Encrypted: i=1; AHgh+RqgU7GwLPbP41bBDeTIkzvjujoccMlP3TPpOgkNzIbQY3LJt7xpZfwwJb8MhhIiPK7OlYo3V73zjZMu4TX40oRrRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+21GFqT1w2Ohk8a1nc48iYaoiK4PhN4yzV2E4OoEx1ADVfKuS
	EwiZROzhr8N7yyboWgjkX7jFqhxFr4pRJC227SKkmJyHcOBfZORxXi91
X-Gm-Gg: AR+sD12q9g104F5yHAbVVetcEfRRge+OH2xfFERtbDzM9NCDjVcQPobYkoahTu+jllL
	vHHqVXcHcPxfZ65lpnh7meLdTFAGCFDKwehAxB6Bqe53cqLx4XmOMGH2L8Kb9TFDCUo/7Wafgfp
	4H9aHn0uiexfQFuCDGtLUcyq/uLd8LVYBCecQKRHDHEZkOUtWSEmcyVjoJadDSJyhN/duVnHI2x
	rrL2Q+nHBdIkkcCHNSZ6VVB/GGyuAYy7sQNFmD4tuxdu+CoMvB4mo4DVMzhsarzJUzZHcLAdQyZ
	KbycHxsNPYzZm9CXKZi/YgSnPqkxToy+C004zEL2G+BU7CkcgvaOK6sPTTNBBPnfJSgdw4TPWgr
	rbFNN5dCQS4WndrJQ9dfnkWAt5WHANrTuMGPdIgb8tpHbDclDBk7CchorOiHs6Bi9LAUjCuleIn
	2NjNE+7RQCGiFtBjWU9Q51QCWvr0Ie4bVDU49TOFeUbB0obSR5FkBcSd9fSi94dBAmcSXr
X-Received: by 2002:a05:600c:a00e:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-499b830d384mr9327625e9.4.1787246232707;
        Thu, 20 Aug 2026 10:17:12 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:eda0:8ef1:e1ab:c2b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm219313495e9.3.2026.08.20.10.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 10:17:12 -0700 (PDT)
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
Subject: [PATCH v24 12/15] mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
Date: Thu, 20 Aug 2026 18:16:42 +0100
Message-ID: <20260820171657.62815-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
References: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
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
v23->v24:
 * No change.
v22->v23:
 * No change.
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
index 25a313e9e7ac..dd650dd24b27 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -106,6 +106,8 @@ struct renesas_sdhi {
 	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
+
+	u32 cache_sd_status;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index d85db4541160..2f5e02537a94 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1437,6 +1437,15 @@ int renesas_sdhi_suspend(struct device *dev)
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
@@ -1466,8 +1475,23 @@ int renesas_sdhi_resume(struct device *dev)
 
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

