Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622483CF026
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 15:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143789; cv=none; b=AWoCd0P41n3zVJ2ctH69GRf44jRH50/+EvFmqfGpB76HRBdlXia7Wd/Srf0TwIVrb1zTHTDlp4yAF1sVNPBKXuVaaBkDRZa2733+3eAD1OIeR75GiqPnAVd/51BQ87pJFJxyXZLqQSgYA1UpMbjiGiUmimT4H91M2kj4obCXp6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143789; c=relaxed/simple;
	bh=2/LD1OatQJUDfHSnXpDX6TvGqBZHTTlPo9RrmADq2Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gbIL1E7wvERgIpcR6akyCSx18iWkQWVgydUJOtYyo8Vv2NlakfYamiov5FHqszVioM4QeJP7ZZsZBhU1KkfE9cDnIKsIZEAv90KOVRe/tUws3mB3Urppxp042PCEmT94L3tzbNUwRTrHQXAPZrkX/pa4NYsjPkD0nHhy0BmT3DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJTY/Sjn; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJTY/Sjn"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso482075e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 08:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782143784; x=1782748584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtBoyBOOZiGN1y5/NEeBQpM3YYk+AWxueD/rb/7AYDk=;
        b=eJTY/Sjnrf+jYrjr6i+Fsb22K6fXVJKa8p03GlkhsWzvXYgLg1Ls3SkZ+/ZXTxaSLs
         dJTUyW/FNesgo5yxlca15d9HKBX2x5e2ykgUvhvbl4sPYXVuUHXzfr+k84Jgb8PAmnLN
         uxRkOp3isQq1IGXv7Ku2WnbjzJbxr11p4a5lzY34f8K6EX1OFdis8xtAqWn7Qv2RM8yS
         iRSaVAnc4PGacwPTXcEna4DQ5Ofvkh4fXklzQcF2Na7tHvvFBfa25LBzF6rc7kOS8CZ0
         uDiACtTw2L386pL/VK4CZbIB4aqSB1OygchKX11vAj1N3kfU7lxnidZzaSPG1kGp66Zx
         akoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782143784; x=1782748584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GtBoyBOOZiGN1y5/NEeBQpM3YYk+AWxueD/rb/7AYDk=;
        b=XE7i4nlnqMrJ2O9dn71fPYgSi+fVfLegCV7h9+7ly+CJQbN8nWvugSs7bm+76ZOVlV
         ITeGl7tUKr9T3FagjTf1mICjeMR+S98p5Xcx9ZxKnyDjfdTab0t1qtfHeeHZcb5yZ3Pq
         2PCICR94HaJmF9TLK+/799xTWQYAotlk9CoaL54Wt8ZRP71fTKRAy/PXIlQ1F3UXReZX
         PULFkI9JqM6FyZc1HTjvpuCel7kc/nuLO5+UyVWm9zvotlMXe8uuWVDDSRbc0Seh88KQ
         wLD++oG7wlzxpcPrLaRlV8cXqrVaX2IEdTC8/HAouRWdEPFlV6T9GcWfXHB/yir6xq7o
         4fMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8piZhVpFQ5/9ptgF84Lp+fNAToQCS2X+NcQ5bSqU02hrnnYbzdVl7XUcOFx5NS0RdrOX7XI+FdZNpxmI8sItk7QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7cTclYuGMH7J1kyeJVIJ/hlw8tR+7pwVImk2Y2MdlzV7lqIHq
	Om7ZXBaC1TF5OLpHp3jlb8pCDZXV4gWsEqJxeGCKIHZeFzrejE9WXF/b
X-Gm-Gg: AfdE7clOmORwJ2oQZFfaHyIDQFb3x9r88WvGrmLmEve3e22RIuZptRPtY4/URNpTw9F
	uIpHOnemssVvktAtpFXH9OOp3BOtrSO1c+mSf+IXk2vHJk1Of8O1ENDX4xEgjEcqZczanADymc/
	IDcyK2lpbOsl+M+i32MDzQdORr459tskkG4y6qN5d8nTrKI6cmCSCKZWcZk1KNzo1BcXotUAK+e
	VGFTmPfjSodlmqne+vZYIIzS2s/EhyaR2YjRy/wRsHoKcsALjMQfBgrLG8vTRuJ6VE/hxPHhtLt
	bxn4mYiLXJG0xLJ1mUv8ilVoG678YfvrrZyO3ugWsGrIG05+7XnRmfmM/POqTNZW+vfHGxwRBzd
	HIypUwNC/OavjIp8lK8AO0cygdhpD3O8XgMmxOGjHpuMdxkKrlr88w71Fk9O935zFOez9TzWzIk
	LalwwrTVC8zswn2yv4ev06vU89w9Ad7EimbPL0zSuUWP4mLN9G
X-Received: by 2002:a05:600c:5287:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-4925a0a775dmr1408305e9.5.1782143783713;
        Mon, 22 Jun 2026 08:56:23 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:fdf9:c68d:5fce:b1ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff8a9e3sm331778025e9.14.2026.06.22.08.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:56:23 -0700 (PDT)
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
Subject: [PATCH v18 09/12] mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
Date: Mon, 22 Jun 2026 16:56:00 +0100
Message-ID: <20260622155610.184271-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
References: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
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
v17->v18:
 * No change.
v1->v17:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h      | 1 +
 drivers/mmc/host/renesas_sdhi_core.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 9ac5cb25ee98..9d5e591ef2f5 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -106,6 +106,7 @@ struct renesas_sdhi {
 	struct regulator_dev *rdev;
 
 	unsigned int divider;
+	u32 cache_sd_status;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 8e14ce3ca7ba..f77985d305c0 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1391,6 +1391,9 @@ int renesas_sdhi_suspend(struct device *dev)
 	};
 	int ret;
 
+	if (priv->rdev)
+		priv->cache_sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
@@ -1422,6 +1425,9 @@ int renesas_sdhi_resume(struct device *dev)
 	if (ret)
 		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 
+	if (priv->rdev)
+		sd_ctrl_write32(host, CTL_SD_STATUS, priv->cache_sd_status);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_resume);
-- 
2.43.0

