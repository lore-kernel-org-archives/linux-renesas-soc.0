Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191891;
	b=kKVBc5D0JPjTJH87MkU9oS+N5xWgIVic+Y3LD6nWz2aPeUn3lfKOHqvzqEkYyQi3ovx4
	 F36DIn9FbqdiVL0VHJv4kLAS1CS8tKyw2SZdCofIFCS4rLLNAxKkYXmQkaVknniywA5SO
	 VThcto8WfWjBfK6Fi+jlaZMfhkhMM6ITTzjXOhr5FWUi3L+d6+ZFt3PW3sFSD8z/WiVSn
	 snC9ahT5NQtsq716N9CO62i3saCZAtn0d2Vlq6Xe00GT+23teVV7zcAWsp4G9Z7XhEeRZ
	 1iUx2KVhtytzNzipux457MvJSfHp0dETz0o74epGt9F6NN9yUsytkxI1Iss8Lellbeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NDYCli03jm5HDC18+jpqlfWW5DxjG3FLYsMKRikZR3A=;
	b=HAq5BZS/V0Svt4HXBL2k3gWhxjhQv+GDzJBuiYXGkKqAkhszWtvRW5/c7Zo1PNiQ2q/6
	 hYUk0sBuk5Aq0Am6wxSNrjs1iaIygaH23W7W9ldvGZR0iZYXjoGUfcCH+tRKXyENkbYRk
	 PUx2c7/BdF+aA9bW8CPs5jolX4F8bHGFwkykml1SL1FiCFIEXG9Dk8M0FsYkfzvGFOi/5
	 EDa5HPsDCPLoypNdxYBTlYJOODuo++VDetvr2faCZ0NrHhmAcmdcKLA+T0BmFKDOn1eiM
	 nvdIQrabnvkcJHycIq5uW74VS40VZ6AY+hv+IxEVE9J+ld7pJZ7XqOdIo5wnXz00S3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uaaDM2z5;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FE860A261C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 12:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62FE860A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uaaDM2z5
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so7517805e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 05:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191890; x=1793796690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NDYCli03jm5HDC18+jpqlfWW5DxjG3FLYsMKRikZR3A=;
        b=uaaDM2z5PHE6sDYD8c0NBxH50c/ubn8bEwNjdpAVHdy0gCdXNU3ZHj/6jEaYvmmIiP
         qJggk+uwu+oXaxh3LNyzZ46joX4Diy3a7j7lIpK1ElemhNHIGFL91ayVHEPjt7vQCYQE
         H4QG0yKeGlan5oRvtA7O8SoYwHB8fafVxuv1Fl6XDbxXlg17V166ueCZfwZK3EmarqD6
         SkTWPid5kP7lXg+wz+u7Io+qZ79DsjTzg0HqlTq3Z2NWzQaNCpj1LtLkTaaoVl8O4uT8
         ElStmpn0BrFzIc9exxH6mFOBZAuBzRKWAhziGJ/sT2Uq4zyJmdB2V8/sQhza2UAIyKVA
         1KVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191890; x=1793796690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDYCli03jm5HDC18+jpqlfWW5DxjG3FLYsMKRikZR3A=;
        b=oEBTkenCYTCZ3VpMfPBAVewQAwvZ8HGFjmshag8MuC/qzHQQ7oDH1Hw0PcSeTSDAw3
         IYg9FC5SaPpYm9uTw1jT7SSDjzhcSmqJn4Zxo3Y6ilN9IvFKhqAM1sTVNS1+CsRENsxe
         T9EvGmuws9WtnTPk05IJemdn1S8mmkAhF1a1fr9R7S6/xm6kvo6KJtI9h1OJtoGaEqVB
         +sqztIh0FAUFK2HqE+rjHKN69h8ahAy2frf/fAXjCcxgsu7+lcfTXnPO/0kzPGQQxDMe
         mqrt95vpXFKSlogDm6zSeoqEAl8lAVwjKjHBe05tlPmJCPXtxU1odoLpla0K/huLDqpG
         TQmw==
X-Forwarded-Encrypted: i=1; AKwUvBw6tR/b1NVY6m5ieFI5Api911/Hg3hVoJS2dusYgxCuyb1AziPQzr5+hej6pyAh2E0abvStsLh4UpeiKUHLh3hMgA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJw9kyRFp3SWnRDurUCSC7iBS58OIlKmr0dTiB95HpgQntFg0ZH
	8lpmnWrmefyIoS2uph1zcJx/QeYSLHLWZHr8V73J/rTn5NEKK5LajiOB
X-Gm-Gg: AYBFou0B8p1D4WMpDAHl60cScaDBHU39QOUF40Bof1VILf6KIsgQ04LiF9yfMhmReMB
	WGYRBHCsA7Ja5ZJyxLEHOQ2KWk84V37f798LlzccEwFUH6L/DCLch9EQqPANlkeixn1bcgYxe9f
	TAsyqICvFd5qPEXADAjlvcDfXnUgbZzD88YXcrlnBFyB4TQtJJKHe9vk72KrpTEwhaLtik4KHN4
	PRaB645mPcpQWr175ZSUoR7I01oiquiKUx4E7+adLgThZAktTBtDr66B2+254NbaJtkQJNdLINe
	HLX2hdFWb+hPQDdgQjEePInyCPIGvA0ZbS7FuFHBxcHM37gowwHQ7i/yl5F8Qa/RBh8zqCmHPwN
	Jg6Ho1z4c4epT6GSZXu1+iAITtnAXlknzCjpn3/nFRBaLBnDzWV79mvgr/VUL1QrHfoBLRiGjoO
	6LmLYHKLbem3PnfYXhCgQEF64W63ft6YHvTlHlGdBdFCheyc/DwNLsxG7Ga2Bi9eFcpeGpvQ1Yk
	WFEdC4M0V0priJ8/b/umtYrYzPGVwsKLTV7iTSWzzj617GjgKQ9frGet6IsrlFo9le7RXEqwbWv
	K8+yHBze5wJojjTplBPnnDBXVyeIwMZQREzfMcIKlK9mj0jEyTmQ1+jV7RvDJ0PjwTU=
X-Received: by 2002:a05:600c:840d:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4a9661ab538mr44711185e9.15.1793191889644;
        Wed, 28 Oct 2026 05:51:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:29 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:25 +0000
Subject: [PATCH v25 08/11] mmc: renesas_sdhi: Add TMIO_MMC_INTERNAL_DIVIDER
 flag
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
Message-Id: <20261028-rzg3l_sdhi-v25-8-57f16691c2ed@bp.renesas.com>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
In-Reply-To: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=5254;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=g3hpy4qac2w9Tu9aIwtRrq21qVrNywcCSyXX05Hxexw=;
 b=auZQ0YCsWkfOFg4n2RB1XIOYlWqnv0PsIrD7JN9WO24kEPlH+JTbzKgg33qKROexBIvuZJEYA
 B/Aph9EOPnWAeOCMynViG52jneYHCtPFFYo3X35/dpm45VdqpQ50UbJ
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L has a fixed internal /2 clock divider active in all bus
timing modes except HS400, where the divider is bypassed. Add a
TMIO_MMC_INTERNAL_DIVIDER flag to mark controllers with this
divider.

Add renesas_sdhi_clk_get_rate() to fold the /2 division into the
reported clock rate when the flag is set, and use it in
renesas_sdhi_clk_update() in place of clk_get_rate(). HS400 is not
yet supported in software for this SoC. Adjust clkh_shift for the
internal divider case.

No existing platform sets this flag, so this is infrastructure only,
with no functional change for current SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * Dropped renesas_sdhi_is_internal_divider_enabled().
 * Added a comment about the internal divider in
   renesas_sdhi_clk_update() and replaced 'clkh_shift = 1' with
   'clkh_shift--'
 * Moved mmc->f_max to probe() and made it fail if max-frequency is
   not defined in DT for SoCs with an internal divider.
v23->v24:
 * No change.
v22->v23:
 * Updated commit description.
v21->v22:
 * Updated commit description.
 * Added renesas_sdhi_is_internal_divider_enabled() and
   renesas_sdhi_clk_get_rate() to simplify the clock rate logic.
v20->v21:
 * No change.
v19->v20:
 * No change.
v18->v19:
 * Updated commit description.
 * Dropped divider variable from struct renesas_sdhi.
 * Updated renesas_sdhi_clk_update() to return rate for HS400mode
   and nonHS400mode(uses 1/2 internal divider).
v18:
 * New patch using flag.
---
 drivers/mmc/host/renesas_sdhi_core.c | 47 +++++++++++++++++++++++++++---------
 include/linux/platform_data/tmio.h   |  3 +++
 2 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 5c317ab29d92..3a1a558bc98c 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -106,15 +106,6 @@ static int renesas_sdhi_clk_enable(struct tmio_mmc_host *host)
 	if (ret < 0)
 		return ret;
 
-	/*
-	 * The clock driver may not know what maximum frequency
-	 * actually works, so it should be set with the max-frequency
-	 * property which will already have been read to f_max.  If it
-	 * was missing, assume the current frequency is the maximum.
-	 */
-	if (!mmc->f_max)
-		mmc->f_max = clk_get_rate(priv->clk);
-
 	/*
 	 * Minimum frequency is the minimum input clock frequency
 	 * divided by our maximum divider.
@@ -133,6 +124,17 @@ static int renesas_sdhi_clk_enable(struct tmio_mmc_host *host)
 	return 0;
 }
 
+static unsigned int renesas_sdhi_clk_get_rate(struct tmio_mmc_host *host,
+					      struct clk *clk)
+{
+	unsigned int freq = clk_get_rate(clk);
+
+	if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
+		freq /= 2;
+
+	return freq;
+}
+
 static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 					    unsigned int wanted_clock)
 {
@@ -149,7 +151,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	 * clock during tuning, so we don't change the external clock setup.
 	 */
 	if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2) || mmc_doing_tune(host->mmc))
-		return clk_get_rate(priv->clk);
+		return renesas_sdhi_clk_get_rate(host, priv->clk);
 
 	if (priv->clkh) {
 		/* HS400 with 4TAP needs different clock settings */
@@ -192,10 +194,15 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 
 	clk_set_rate(ref_clk, best_freq);
 
-	if (priv->clkh)
+	if (priv->clkh) {
+		/* internal /2 divider is always active here */
+		if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
+			clkh_shift--;
+
 		clk_set_rate(priv->clk, best_freq >> clkh_shift);
+	}
 
-	return clk_get_rate(priv->clk);
+	return renesas_sdhi_clk_get_rate(host, priv->clk);
 }
 
 static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
@@ -1255,6 +1262,22 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
+	/*
+	 * The clock driver may not know the maximum working frequency, so it
+	 * should come from the 'max-frequency' property. If it is missing,
+	 * assume the current rate is the maximum. SoCs with an internal
+	 * divider can't do that, because the current rate is not
+	 * meaningful for them, so the property is mandatory there.
+	 */
+	if (!host->mmc->f_max) {
+		if (mmc_data->flags & TMIO_MMC_INTERNAL_DIVIDER) {
+			ret = dev_err_probe(dev, -EINVAL, "max-frequency is required\n");
+			goto edisclk;
+		}
+
+		host->mmc->f_max = clk_get_rate(priv->clk);
+	}
+
 	rcfg.of_node = of_get_available_child_by_name(dev->of_node, "vqmmc-regulator");
 	if (rcfg.of_node) {
 		rcfg.driver_data = priv->host;
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 77d3dc91c828..09b3411a59c9 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -53,6 +53,9 @@
 /* Some controllers have tuning delay */
 #define TMIO_MMC_TUNING_DELAY		BIT(13)
 
+/* Some controllers have internal divider */
+#define TMIO_MMC_INTERNAL_DIVIDER	BIT(14)
+
 struct tmio_mmc_data {
 	void				*chan_priv_tx;
 	void				*chan_priv_rx;

-- 
2.43.0

