Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CB13EB11E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jul 2026 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883859; cv=none; b=dEeBlWMvnTVcrFtLZOOB8njsDFeDiYdoPZ++g5sBgzkvbJvrCmn5T7h6bR9bMAZraPex0CNmf2WH0E2y0dtmb0rfPmzG6DrzMQjBlrBWW0+OxvLeRmDK0+JWwt1Dmdn+TPbKuojk6hIjEv5yyjk73fwsbL80typF7Xm/hKVCCD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883859; c=relaxed/simple;
	bh=tWtyJH+acydIB1bHXKtC61kdBeQ9YCay3I6fogeNCBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RfWfsl+GQdhsKQP6uoqEQl7BCtWwiZMSAjW/JUScT3hfxgVafMNj91dvHy3jbCuC+isrpJTFToJenbLAZ8gbum9wG7/g/j7PO+4cFiRz8ApTepXWOg7AXQ8R2QP6QHyxVoBvKsY9UkZM8QwsyL7urVFqvD0WaUQk97839yWt9Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Uc4WLQqz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Uc4WLQqz"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-476a130c138so253749f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jul 2026 02:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883855; x=1785488655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NTCgdt6IpHLKYtA76srcT7UD0TdTAQVzu4zf33H1PjU=;
        b=Uc4WLQqzNQ566pFERfWt8OTbOohizyx4vvaNBaOR/dLa0UlUti1VVzbiEGkGCUCKdb
         ypUsA5psba8t6U4Z5aGMvk7SjYQw2ZJVuBKDS4LEQHlxrYMwZkLZf6FSLD3NAv2ow1GG
         MbAi6s+sZd5RpNNaf7aQN1dMIIHP8eeO7Z2EnjabVtAsYdR+AHn7bIxITTJCJ2PvVz0M
         /7W/8d5NdEZiLgre67fjwJXqNLf3iPcBpxKLgAskBpgg59nK3jV3DIwNuYOevb+9kXBv
         DpDMUPNfnzpXcQZxRW9zUmNs86sTGNEMzT9l1U/lVevvOYeIO7guE8pF9INzP6t7Xxxi
         +HFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883855; x=1785488655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTCgdt6IpHLKYtA76srcT7UD0TdTAQVzu4zf33H1PjU=;
        b=Yp3JlEmi1f3DdSe8etYKmFIfp7bM4VRnaGQrCuWrg8qhdciyiQnzPhsamI+zzS7xGN
         BEqFYLB4LCxTnF6gKOCNEw/aAsnInuEslsuQrd64NmRsv/Knr5VjK0nBuZtWQ57N5HIy
         4ZVplaP8JJf4bUetBWTwusErdHq5QUsRF61qOd94yA6XJwlvsnLcoz6tZpDXMmui7Frc
         UHGnA1kGqRhPq7PbVNYWYsBFkCCPo59pTcuJmw8BiMQpheP0IG/9ueJcP9cEVWqRVP20
         OHy/8UpMrQqoeveWeRKICuePPMUmOUoJzZUMrYB7rSobXavs/8uM7+rHzcpDX6lZAwTj
         aCYQ==
X-Forwarded-Encrypted: i=1; AHgh+RobgahtJ1f6+6SByMLMCWyh2ab4mwwxVIwM6K9/HpR8Bkyz9eSIuQbSEoZ7t/kcW5nvz1mmYMwF4i7HBGQazQRXQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPcRhM6r1FUWb/8MAMvwMLAbdRBM+Js6Uqw43XDOmP8KihGgYH
	YChEvXU2WpPXjmEPmwbffKYvdhd5MmvsB7nSJ44ZSAXQh6S536TFb6LD2+7fY3+yBCQ=
X-Gm-Gg: AR+sD13Fvukba/92+B8PGJXAE2FCTsZTDd9MA7puSOj31NgDb4T5R6Eu5GpT7ijfzfF
	nAjHT7pFzn1EAQHh3rmt8XvMbDYC8sfwfaNi7sZcSMmKyKQfVURTNbe1h/jBeZ5cpHRss9dJhiG
	XGHeNSd8I4QpxC1inRKyPnkE5NO2v9MzbMw5PNTmrf+5E9X2xnkhmL7iF2QwOobN9SSOlGgmX4a
	cO5AS5JvJOutTAYnN/d8kQlkHZMrvc8MkRlh/yt/5p6qZSUw397vaDCyVM/pINEZp3xbgFb6OXr
	SYWaR/jLbqmo+D02DLUL8nFF15cVXMVKaEkpTTH+EKPEweEi4HnQNKWHCDv/t8KtjI1gAxkVR1f
	Q7OeSzCgqCJ7Y2Aqee20Cho/lXBfpFKXJAN5EEcHEP3EhUXZ4a3a+Z4+tQGU6Xvhhi3ZcikLiW3
	z9ioFKblGDbKk=
X-Received: by 2002:a05:6000:2389:b0:47f:93b6:8d05 with SMTP id ffacd0b85a97d-47f93b68d60mr5219684f8f.0.1784883854883;
        Fri, 24 Jul 2026 02:04:14 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c67339sm23918983f8f.31.2026.07.24.02.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:53 +0200
Subject: [PATCH v2 2/7] clk: qcom: clean-up simple provider misuse of the
 consumer API
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-2-56f306156d25@baylibre.com>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3253; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=tWtyJH+acydIB1bHXKtC61kdBeQ9YCay3I6fogeNCBU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyp/w45qmtTosQnIAx1OStRzPQvEsipL2E/Lw
 yCoEF/QmN2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqfwAKCRDm/A8cN/La
 hUwkEACyf9+F3KKPL0lbfHI4K+dGS21x1ICKK2JloqLuptXfFmL93tKHFaBxvE3RoGIW4MnvD/a
 xjl/mhXdOBKFrrPN52n1H6Sy8BHbgV8b4iFfbZPTA/bH+VOHj1gaRcWw9BobjbZr505l3QYjFLB
 dhOF5mk5Zb0zs0Y37gJ6s50bYPpgaghJh1nbJowznMuN7RBPXOg7keZM4c4E+QSTxVw124y/PY7
 /a9LUuCd2p6+4nJWEIn+w22fNzwtmZIyfVlPZIe8ryf943A4eeIScf3NtHqaeptGBrD+i5yR8GI
 wNSgGwUVp6/DTMAntJwPVRJMwz6Cp8tX2iLHclB0sKeQWc0cVWc43QWD8dALm1fDvAyXZ0zdvY9
 i9beXiBoks+gDe8LHd3j+kuUvrrbL4xtl7dNRb8GRYkCw2RqZsd5vuOn6InV5PRftsPqKTcfNKY
 2fu/wtL0pLSimUUyLdjJmLaIaVOjQ6ne2OlWtUYRaB/TwkSrgsN9uUcwXfBOfBpS1DhYpOWH/C3
 awHFTp2tmLQXR4lJrO2t9kzkb1VPfu1G3wRkZ3eICcTJ+dPhuLjwiATQYp6yj3RM4+ZALuaIBA0
 7IVsJwEto2YbLOKaI4xcK15Ne9C70RG35dvwyZdDvtNZApIEJNFfJQf9cPLXIKhtfqJED/5RkSo
 zWdND+QOyfzSa+g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/qcom/clk-hfpll.c | 4 ++--
 drivers/clk/qcom/clk-krait.c | 2 +-
 drivers/clk/qcom/clk-rcg.c   | 4 ++--
 drivers/clk/qcom/clk-rcg2.c  | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-hfpll.c b/drivers/clk/qcom/clk-hfpll.c
index 705352aff067..9e9118d24df7 100644
--- a/drivers/clk/qcom/clk-hfpll.c
+++ b/drivers/clk/qcom/clk-hfpll.c
@@ -166,7 +166,7 @@ static int clk_hfpll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	spin_lock_irqsave(&h->lock, flags);
 
-	enabled = __clk_is_enabled(hw->clk);
+	enabled = clk_hw_is_enabled(hw);
 	if (enabled)
 		__clk_hfpll_disable(h);
 
@@ -220,7 +220,7 @@ static int clk_hfpll_init(struct clk_hw *hw)
 		regmap_read(regmap, hd->status_reg, &status);
 		if (!(status & BIT(hd->lock_bit))) {
 			WARN(1, "HFPLL %s is ON, but not locked!\n",
-			     __clk_get_name(hw->clk));
+			     clk_hw_get_name(hw));
 			clk_hfpll_disable(hw);
 			__clk_hfpll_init_once(hw);
 		}
diff --git a/drivers/clk/qcom/clk-krait.c b/drivers/clk/qcom/clk-krait.c
index f5ce403e1e27..5e4408b7445d 100644
--- a/drivers/clk/qcom/clk-krait.c
+++ b/drivers/clk/qcom/clk-krait.c
@@ -68,7 +68,7 @@ static int krait_mux_set_parent(struct clk_hw *hw, u8 index)
 	sel = clk_mux_index_to_val(mux->parent_map, 0, index);
 	mux->en_mask = sel;
 	/* Don't touch mux if CPU is off as it won't work */
-	if (__clk_is_enabled(hw->clk))
+	if (clk_hw_is_enabled(hw))
 		__krait_mux_set_sel(mux, sel);
 
 	mux->reparent = true;
diff --git a/drivers/clk/qcom/clk-rcg.c b/drivers/clk/qcom/clk-rcg.c
index 31f0650b48ba..1664101e8f78 100644
--- a/drivers/clk/qcom/clk-rcg.c
+++ b/drivers/clk/qcom/clk-rcg.c
@@ -208,7 +208,7 @@ static int configure_bank(struct clk_dyn_rcg *rcg, const struct freq_tbl *f)
 	bool banked_p = !!rcg->p[1].pre_div_width;
 	struct clk_hw *hw = &rcg->clkr.hw;
 
-	enabled = __clk_is_enabled(hw->clk);
+	enabled = clk_hw_is_enabled(hw);
 
 	ret = regmap_read(rcg->clkr.regmap, rcg->bank_reg, &reg);
 	if (ret)
@@ -771,7 +771,7 @@ static int clk_rcg_lcc_set_rate(struct clk_hw *hw, unsigned long rate,
 	regmap_update_bits(rcg->clkr.regmap, rcg->ns_reg, gfm, 0);
 	ret = __clk_rcg_set_rate(rcg, f);
 	/* Switch back to M/N if it's clocking */
-	if (__clk_is_enabled(hw->clk))
+	if (clk_hw_is_enabled(hw))
 		regmap_update_bits(rcg->clkr.regmap, rcg->ns_reg, gfm, gfm);
 
 	return ret;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 6064a0e17d51..d7914e59129f 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -489,7 +489,7 @@ static int clk_rcg2_determine_gp_rate(struct clk_hw *hw,
 	u64 parent_rate;
 
 	parent = clk_hw_get_parent(hw);
-	parent_rate = clk_get_rate(parent->clk);
+	parent_rate = clk_hw_get_rate(parent);
 	if (!parent_rate)
 		return -EINVAL;
 

-- 
2.47.3

