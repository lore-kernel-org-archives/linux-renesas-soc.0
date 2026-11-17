Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933291;
	b=b3X2RXrarBkOOZsQ8T464W1ZoWFmBGSemztIl1aYOpng+FQgvxksNBha69jA5v+JO92V
	 VBDEuTuy7Mh+5P7X4KLMhLxpKzTI/hYOnCeXbr3Iln5reoiiWD9OqyimdhdBMa+KXskDS
	 YWINNgj/qce6xZYqlQOrK6dc+xHTH7009uX0qFqfypjJB9mRVzWgTCl1dt21LIhF32EfS
	 g5QBqoxdxgf98Q+jkwvsxTK/XnTnqjCIpX1WK4TH1BbMW0ELg420ggjPM+6djWlD9Z4y3
	 DH7J1dRQrfsNRiBLMbHqcCCjk8GXR0p+m5x3Dy0o33ktgyZiuwCGmaKy+yiuGLEH9Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZBaSreAQQFD38eDt5XDYtncmNV8/eCgCLVjMti31nAc=;
	b=wM7BByHkaZ9IFksZ+3rEWCqCZO8LNmsXqnFX1Xw6VqEBhzScxhFudqxu3fGOiqA4ZaWF
	 SWuSD9i4fufg6vl1Yl3iID/6h+fYf8FDg5NytRYLIFvCuFSpCtpsJn538XPk5lHOniGhR
	 e7nF04Jf8SP4EFw+VhmaYQrCRiVNGqUxje2b4gXcS1b2Qo1FnHcitQEfdYpbbWH/TgpIY
	 uIranh3h3L2TancGhKUcLR9+BVyDTZ1o4VqQRyPAys2iiYF2KvXSON8ONbpj+dR0wBshE
	 yWrxSFDzwHRwox7zHTI0OViNRAdi+WUMwDZkJ+PBLj0sOYxHgpJEGsU0e7OPp9/eLjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vaUlETB+;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F98A606A32F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 16:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F98A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vaUlETB+
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-498f5fa5103so2287558f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 08:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933289; x=1795538089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZBaSreAQQFD38eDt5XDYtncmNV8/eCgCLVjMti31nAc=;
        b=vaUlETB+vOEJri81xxcqpDV7o1gmBwNoKIll1yEKbUzDZfcOE4GFtlHnxjJkxluxuX
         rIMqVyrNZzIsZeQbSVmQ+ATuofnYLJGbmAWHndWqcfdFPGqRKqtg4qUYgGQ6LP38WQ4U
         AYEBXj3AI0/jRwz/6QLQoQmMFH1jS18CfpQHa/pc7CFNNbfoEQyaRi6sx/RjJsUSv/sg
         DqoQf2/oasIQWrZzBs+0OGZHw9Lg05ckzP9MbdoFjTbe06lczKWzMScHYTD1cduf45Yj
         L7Kxz1Se3NVZta9XMbDKbFazmiKsS3wZAC2bfi0KYyWlkFWBc2YAJn1EhTA5KtPoWMgY
         MkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933289; x=1795538089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBaSreAQQFD38eDt5XDYtncmNV8/eCgCLVjMti31nAc=;
        b=SVXqipTNGxqGWECvG+l91nRcXThoY2As6OVHeKjJEyGiGDK3un94Pt11KB61t9cOUh
         Sm3sraiDPjxU5EhzdD++2V3jyCmdXlTvSXwhw02aQ/ERd9a1t+5Pq8oYRuG2gZBTsxhI
         2jPxAlAtaVmpxjxAqyV2YNJlKy6+16KNEe7Sx0IafuztKYQIrH20FiAqxcfBBStYgS1/
         LoRkxX2LrgwyCvv5x7LQXbbP0s3sw7PGXdQBuZJ2+llamNEhQqhc4Wf4hp27TvnNl7S3
         ck+uQhfHhMF/Gao+GMNhcU6iLF/kDhFoVroer1Ztv4m+vbNFY0sOKYwFbUGoV1CrnHAE
         Wa3Q==
X-Forwarded-Encrypted: i=1; AL+hErElfCk4DRPCY1VmfeK9+BcWOf6Mct3eZ43ZE4pkz77HpSQZsrRiH6rUrSqM14FGIqLZiplZBuPx0MfcaEuFyMEokw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8mpNbtoLKFYwFjp/1Don8FqoQqqtKLeUiJ/dfqOD9VfDe8eJmI
	EquR6pKX4Y12p8rt1J1w7dGceflmFFiAW8H1QZCh3OA8dGEW0b39JM4PLOyryQ==
X-Gm-Gg: AZFdTZdFl4Ar83MyclvV3t2c8y+n/3U0eyXYxUw3I+z5N2/vhEc7wR7J+vulcdCO1sA
	S5UIKMs9hU5NFAcUBChsoL2loUQOqQTb9fln708ZzuedjbN8lXtGQbGZJNf3NBWaUvRVv0M25CR
	mRo7v6flZlVlNoJLBhc8ZwRvqji+kup3MKH1tW2bHTWupqLTua0thPEgahBM95iZdI2uBHQyVU5
	2m7Gy5FUQ4iI49AMxgiIqVFbbQGFHXFtXxzSRLbD0M5cbUawz7Y5O7WUOLljpV+IX3C1Dste5wm
	B+KBwa+9wfGcvf9pDpJb6JKa7asN0JjoIOC41Xa4VTMqIcEhxNl3+rHPqh9rAxGMicZ82hxTa8T
	kOHMcmUq7TiEIRbGDBnhgKDIfXdH4EqVEK0GcDSEVmKIwy9x0ObEU0EoCbKPm7n78ucaCzm4L0m
	HZVbwMyK8eZPpViGrN8muyFLYdZrSlGqkfYJFo3CJnfmp49nyoCnf6a9fyBNCLt+uKcosqdtM3h
	QXw12JPCx4S5XuYdX80axnktzPrN0CB52YpXmhuDlHc9Mc56WJfWbaoGOUbOwqkGlFBck/KbYEy
	Pg4GjdbAVb+D5RwCRhxK5tV3nIWU5GPtwr92enEE3jEyrfTtIkn00h730EzqDSNazw==
X-Received: by 2002:a05:6000:26c9:b0:497:bd30:8df5 with SMTP id ffacd0b85a97d-49c6dbfff6amr32598597f8f.2.1794933289343;
        Tue, 17 Nov 2026 08:34:49 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:9260:9c28:f0f5:e091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm26672248f8f.16.2026.11.17.08.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:34:49 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 17 Nov 2026 16:34:46 +0000
Subject: [PATCH v3 1/3] mmc: renesas_sdhi: Save and restore IOVS across
 suspend/resume
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-sdhi_hs400-v3-1-b4659189db69@bp.renesas.com>
References: <20261117-sdhi_hs400-v3-0-b4659189db69@bp.renesas.com>
In-Reply-To: <20261117-sdhi_hs400-v3-0-b4659189db69@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794933288; l=2532;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=7LlFxU+mY+aa3FL65wAmN2QrH54fIPpf65zJ5XplIvw=;
 b=5yeqRCbIbTitgunEBm3UNWIii168HroDOpVc20vDDV2VAgNMfsum2AMbBy4Ep4qKGIISbBd7t
 aLTf7kPvpLDCpheJinJ9+9EYrkx0eMV018cY1wgONeRUYs9ZFVwjbAp
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

The SD_STATUS register, specifically the IOVS (I/O Voltage Switch) bit, is
not automatically restored after a suspend/resume cycle, causing the
regulator to report an incorrect voltage on resume.

Fix this by caching the CTL_SD_STATUS register value in the renesas_sdhi
private struct at suspend time and writing it back during resume. The
whole register is saved and restored, as IOVS shares it with other bits.
The save/restore is only performed when a regulator device (rdev) is
present, as the IOVS bit is only relevant in that context.

Fixes: dcbce328d3a2 ("mmc: renesas_sdhi: Add suspend/resume hooks")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
- No change.
v1->v2:
- Added fixes tag
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 4f8ed1d8efee..a93e613e9821 100644
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
index 5e649ef20990..56286431fd2c 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1465,6 +1465,15 @@ int renesas_sdhi_suspend(struct device *dev)
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
@@ -1494,8 +1503,23 @@ int renesas_sdhi_resume(struct device *dev)
 
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

