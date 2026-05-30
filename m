Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05BB33F8AD
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157322; cv=none; b=eJUGSJ3o2nvj+gIORwAOQ1gl4yWyfOxhcTs6MEtno4OPlDXMTwF6GXJyLBzE4TunnKSzbX60p0mb+naDWmrC9Wjf7GX7n30CKvc9OIuoMR1nG0bEeElugoFFf/6Hp7watdi/6BsqqYWDfoJsj798dtttBvXX4W8a+kWvln1ioF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157322; c=relaxed/simple;
	bh=exckQMlZ/u+O/0cBA/4TqB8+3criseIEav9mHAy9QEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VCreQxLxW0CArjjLTLWgr/npE4JCcNTeB9rA/qz28T3PIhFh91EM67BxcEnG1gJwwhcgFA188NgohCM+VTxogsLtvM7S9KAr0HJ/PR6ia2gVv5prcu1YhAZvUH/Yq+N9m7MJgqsXtTfjlGJDa5iHHq0kyasMDSzSPmEm3rpnWno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQHjT4TQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQHjT4TQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4906238c62eso66635685e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 09:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157317; x=1780762117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XifpLOD/NaOk3+V0yx4T5RO6a4Xi5bAca3yF/Sujksk=;
        b=LQHjT4TQTJvRb1nd00kD4hpIOOQz4cE4Fxu7A+2L7XWN/PFtCzTUlOwXdXO5Shfy46
         LHtN2NyUMPVthA42iHbkDzy6fzCPjdjlRVKTTNTC75R+NHhoEVC7Mi0V4HVwwRDQs+c7
         zUjWG/V/AK17E3MA123YnCpXL6kaxwldBRqGCSpS6URYGA+tb/llvyj83yaYug999E6Z
         Eb9aY8TWsGA4uAU0//YXyEELWcoHUrgfgp0WQrQlrdXeNz/HKiRd3yPeEy+jUk4QqqnR
         coFoG0W7jrauUkNLNvDbvYHledA1iidI4TyFYEYfZTT7Kayhll3I59qO2ApEaXn4aL1/
         s5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157317; x=1780762117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XifpLOD/NaOk3+V0yx4T5RO6a4Xi5bAca3yF/Sujksk=;
        b=Ls3aZxhj+WXeR6ArYW43Ac5A95n7Aq6n3T0WKXXCUIiCtl99Xn8kfXFqqPte4w6oaS
         ArbqZRRW83UjMAiscg3k6o5sagN9YiObnypb5Zk8CF6GdyEC+aoXlrsd+anpNwWTDcZU
         FwK21wbuKU++QeTkM5WSH52SS2ZMRTK6EhKMyehLfI/g5eYsHnxQgiclwIeM0gO9DH1I
         NPLd8PGHJcrP22D8dUy8dBgFkl3jvruyrvO2O3wnmxNnydwWqi6REVfEDUjikDSFgaP9
         0Qq/Jr+Q2O52tac/e53DybsMXaBsN8kf7lXKbrf6FSGIybEv60xVyqIvV5hqtwOcAl4P
         YoQA==
X-Forwarded-Encrypted: i=1; AFNElJ+9WRTa5mxLGqh4YuQVjbjg+MzwafXIyXbxZ3K6Tz//2w4z9JkyWJk9UQYvj7WoGMy3VkRgxUThwDGjOE7tyRgTkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI/gZ/sMq0/QSO+HOC0o7MqPlfMjjeLxucR+9y+yr6pKleRYL2
	2HE9oEcM4mNbF3TikoyIFuusGrOgZFzr2Z06ezKXlqFerA5RAsIulea1
X-Gm-Gg: Acq92OHwfoBMRfti0ZHmkfPEG/M9M+gNDLL3fsDTttmqhhcJmBZpVJV9lT5Mfbr5L8D
	ZYJVoJ4Hsy3mcelW1l0uc/aeIKeaGVw4qbrBgJRVKfkO1izYD5hPFGxJsfM+ghuIu1VOKrNp1i9
	q6OZyDGLKtttfNsORLgR5YzROf3JingN3LnEeNg4g466CmuXUs34YkuEdGUPXryjKndjWp0pe+G
	rNtUOKTStK7c3RcWrV6HxOiuniz1ZdU3Q1f9wqaR0+jibMYZrJQ/AT8CB/6kFPwtK2EpnPrHNBx
	qazsJP8pTqDUUppzCkvKsW2CU+UZrbgrTS4rP5smAjleCD2D5q/H6MBYo/83c7dgEDR7SCSxgiR
	IoawWYi087IlIHUalD3BNXjxnq7VpS86P81g6l7Oz4pRKJMsx754vmM4DF/Q48QH1kb2/B4Qera
	dOzBdkCPsN0axmi7P3VLhDjkaR2p7p9oAYnUmfSwG1fsacRMp6teUo8G9JnwM=
X-Received: by 2002:a05:600c:4ca3:b0:489:e126:b757 with SMTP id 5b1f17b1804b1-490a2945dadmr45400885e9.25.1780157317063;
        Sat, 30 May 2026 09:08:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35874b7sm12170799f8f.35.2026.05.30.09.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:08:36 -0700 (PDT)
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
Subject: [PATCH 09/17] mmc: renesas_sdhi: Add internal_divider hw_info flag for clk rate adjustment
Date: Sat, 30 May 2026 17:08:03 +0100
Message-ID: <20260530160823.130907-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
References: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
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

