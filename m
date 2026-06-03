Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D0F3FC5C3
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 06:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469872; cv=none; b=kiNr+XmY4Hnw6Fuoyl5sBp/tnTTOXLYQUX7lyXYqWnydKHgIcxW7xXagHtxXPNzzIXhBa5/T2IWqn6z2ESupgs3oJBGOPeuwYuK/nmpPC9gsG/AyBoQ7gbY7MCuMldcxnrjbaCpuRCADMz5XH0/8zZOU1ujNbztf8rmx65I0jGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469872; c=relaxed/simple;
	bh=LseMLkZEXMJOYdq4wRN3qveriaTiowLZrwSg/ElO51g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dDUa03TzmmmfI73Isq/Oorj2iKNUzdDVWbVlyH6/Byj6OHhAPYO5hfHdjPqxWevSJPYizqu5ND9O4baSWnWsbFGuCGB5/s0Qc+bWrtUsSfoR3eQKZAX+B09Hh3Yc8ngiuYlfNV0a3O8P1n6saxjGOFImQ8Ax78WR6VWQ9gy5fFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LG1428mh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LG1428mh"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b9318997so1235745e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 23:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469865; x=1781074665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qq8d3CmI/c+R1GWLpjqkEumDcjIyvNSkYvx5EDBbsuE=;
        b=LG1428mh6CqMAPIR5jeWON2WqZW4Pf302wZXrKyOzlvVWcLoa1E+LbLHfGOKN69fL0
         2RGR23EwtvSweedYtrWn/wlZqcOggzTv4duXwSasHd34zvHMV6AeiwC2kTuVVkzG0NGa
         OqlgtNg78JT/9Gd4NLFd3b9rabQzf5rRPc3Go1IxplrfXCx4Beg/tVnfOb4X3RcLPCeZ
         v+w/n1sRIvRfDth1mBDUq3b0MhxjEfno8RUh5fn3myedgKlIyswSYk5VI8vn9xfquRNF
         u3u5xPwFLMfJDVQ6Yc6ajiRSLBU3g5OFz5yW3KbrqGB7j9l1q3uwJfJIMGwvMIvUD3x8
         DxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469865; x=1781074665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qq8d3CmI/c+R1GWLpjqkEumDcjIyvNSkYvx5EDBbsuE=;
        b=QC/V7rudqQPirv8Bnsy5/P7oANSsoNW3xFlB+uuBtwkIkCbMCodcb3Z9fQRePA9GIO
         M0dOoGBbP189bariLzHYcQyQG5qteK/zrcpPuEBjcaBTzMNKE4TsWswICbTNJna3NdrX
         XHOnsRDRJwAci0cwaeYgo5vUduoUzSj+8FoZm15RRTCRRCdKNC+WLHJERfFXHWScXWR5
         ox1DF78Acro8En8wUpFjEbydjV9Kch6K5PrJgTRPNTt3GHD6138nFj87ptDdPiweEzRL
         PhnaB3PrDADaKqYAAzgdaw+tX1WXaIKGlpbbhs5jB7yy+2yM738J7o+qCImjzDPV2QLe
         xJqg==
X-Forwarded-Encrypted: i=1; AFNElJ/TxGPDXnoJNqaXQYvC+tFEwRAI4Pjo6GyfNXWqxjt10+JUW9+aPVCBFdbccE770r6RCUgdP3XxlSXXCPMg7KXd4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhaBwlfRqVl46RZDPr8Lf/m62dJITrjxH4Lxi3s8Ju/N8/Iglc
	WNFR4LrMV+3TgCDza/0N6guejgESjNxhHsvz8/1oUiNeedzKYFYHENYn
X-Gm-Gg: Acq92OEFIpyzmI/bG3CCuPile2ynOpvqv8CLKDUpuQwp468BYxh3U9IsyL9sTT+U6V8
	yzsaXzEi9+W2U3Zb3HDMf7/6obHFpEYjFC+o+NJjosyDSy8BNn0VOC54eDPvkTz6vYAmDNBwXvk
	AchB6A/qEGZ2kFnjhb8KSo2ZgP1SRYaURruIZTCaDD28trw49BRXmFxDEAsyxcHIN8SNwtMNgmj
	BN/DiSwVCwNDUGE6Bs9AkTilJTyiOvpbUWeUD1MdQkhYAszo93ACZZPLLYtZ6t4sTLYS8g8gDEg
	XutFFQOJbbYgZSEhu7BqFj6qLJz6bYkVaZNCVHGj2+4ASVJ96Kfa4xHI3N2VB+Zzx42kJZbXhAi
	RWu9aDsQJqnmHHsKLMKdzaCJ3+eaK4jLiEE3JxYabqX0pRFz+9BRzDRqa8UxkfHi9me9uKWfjyr
	g0WEBnnrSHWu/tRZx82xWn95ficc8c9rB/e0EB7UJ3cgW+cn7ivVdROv5PPZI=
X-Received: by 2002:a05:600c:c4b8:b0:490:b591:b5a3 with SMTP id 5b1f17b1804b1-490b60e9af0mr30874395e9.32.1780469864749;
        Tue, 02 Jun 2026 23:57:44 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d90bdsm9001855e9.0.2026.06.02.23.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:57:44 -0700 (PDT)
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
Subject: [PATCH v17 09/17] mmc: renesas_sdhi: Add internal_divider hw_info flag for clk rate adjustment
Date: Wed,  3 Jun 2026 07:57:09 +0100
Message-ID: <20260603065731.93243-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has an internal divider for all modes except HS400 mode.

Add an internal_divider bitfield to renesas_sdhi_hw_info and a divider
field to the renesas_sdhi instance struct.

During probe, if internal_divider is set and the device does not
have the mmc-hs400-1_8v property, priv->divider is set to 2;
otherwise it defaults to 1. This divider is then applied in
renesas_sdhi_clk_update() when setting the clk rate relative to
clkh, replacing the implicit divide-by-1 that was previously assumed.

No users set internal_divider yet; this patch only introduces the
infrastructure. No functional change for existing platforms.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h      | 3 +++
 drivers/mmc/host/renesas_sdhi_core.c | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index a3c5fa368242..0ca8ec27c320 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -46,6 +46,7 @@ struct renesas_sdhi_hw_info {
 	unsigned int max_divider;
 	/* hardware features */
 	unsigned tuning_delay:1;	/* Has tuning delay */
+	unsigned internal_divider:1;	/* Has internal divider */
 };
 
 struct renesas_sdhi_of_data_with_info {
@@ -112,6 +113,8 @@ struct renesas_sdhi {
 	struct reset_control *rstc;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
+
+	unsigned int divider;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 868ba6a6919e..8e2fb19b994b 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -185,7 +185,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	clk_set_rate(ref_clk, best_freq);
 
 	if (priv->clkh)
-		clk_set_rate(priv->clk, best_freq >> clkh_shift);
+		clk_set_rate(priv->clk, (best_freq >> clkh_shift) * priv->divider);
 
 	return clk_get_rate(priv->clk);
 }
@@ -1223,6 +1223,11 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 	dev_pm_domain_start(&pdev->dev);
 
+	if (info->internal_divider && !device_property_read_bool(dev, "mmc-hs400-1_8v"))
+		priv->divider = 2;
+	else
+		priv->divider = 1;
+
 	ret = renesas_sdhi_clk_enable(host);
 	if (ret)
 		return ret;
-- 
2.43.0

