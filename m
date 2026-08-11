Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C03437FF54
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 18:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472861; cv=none; b=iQlsqB3xpyyWhW+9GDXVg8au04YpxNRoMJIY7dVXLVoVpMXtk/PauSsqryfNKQKq6Xn8eQUZTY/3RqLXEJ3hFnbolA6bUHLP7sYs/0fu45DOGUhj8UWP4iEmsiYURDkNJgQzZCEoh5UtgLLIbkZre2+pSFOBknK+CT7heC5yPyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472861; c=relaxed/simple;
	bh=81srWI1KlHLjAM9miqRAolVpUFNZhILYy/bRj9ePtxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Chs+KZBOTwyOAtgH9GcJatjxWPCvFaZ/DvBgaw1XZlx4N69dUYcrgUQBN7LM1hxd7Lino7KkmOGBS9cxU1nKNXIfjl5ultOtdl7HfOuYwp76ACbpVvwjk9ruw2nTMphnfohFg+ykK0QsGEMnI4lh7ZfX1nVsd7zCw4QsUVnJbPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuDsKawJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuDsKawJ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b966dd74so589265e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 11:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786472857; x=1787077657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nsxRdP5gqkJHIJj6w5qterCv5NlLzVyDoUjZaLik7xA=;
        b=HuDsKawJWCrecU0dI5ySEafGAmlM8wimKFq5ZzL4/L1J/LO7fE4s10I5lRmbXYprau
         rttugC9fkyznnwkA014hBOKw6kwXM3yxPrJCmXOrF8TNQiGDRPkI2SI6DlzxFN4lJGsQ
         jPAuiO0UqAf84iTP2UveVppoSEK6/N6JnHRLF80t9+9e+9GyWRjjvbZFelh6jWlHbQ7e
         pg7xfYm75XxnJ/QsBvQeMJ5Dq+I9IandoR9QFB7elzKbwus/81DmKzaU7H4VNEeUqL7i
         aUDIjPIsMQsMkEAo7Nei49vjxu7ba0U1Vvh2eUTGeFUg8VZxDB8edYesmy3+5uvQIzG7
         bykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786472857; x=1787077657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nsxRdP5gqkJHIJj6w5qterCv5NlLzVyDoUjZaLik7xA=;
        b=WHuoizzi2CoNqWwyLd9oStVRczj1p4fY9jOBvXVd3w1/mAlsFihg1J+tp9aegyI6T/
         sFE5Ej6a8HP63ud7dYUlbAgxSPeWTpEhYTim6YZumB6tmvWPQe4zYzIBQg6dLCoktDot
         4QdiiLnDs3ZNKCrqpzhefCqab2NP7ZHRYkBWj7KoeoTux/HeE40TjfFwNa/5gQYtk1tm
         xnFOeP7P4BcDa12JVue/eCh2Qj6HNYEgIFrAkWkzZWihF2xzy2mgv2f+FOD9Vof2qrkF
         ewFjf2wKlQi72f60W80HXcIgIMoeZmntAzS+sHx3qtQRyRrtGOtYvO3r4G1cWCZp5yxh
         8rfw==
X-Forwarded-Encrypted: i=1; AHgh+RqoSAXOi7CuI3oMCzvsrIPQ0PkOjj/4/jdJBcZbIXt1JZbP+6UY5+aVhY7GQIl0+07x9Qcj7xg99isCE8gvJL5rRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLyGPjAyu+E+GRgIf53SE7oc2ucheIWAgEirMhs4DpiTPhdfjb
	z9npZC7UDmG/N0eHtpZa9MAfuD0xzdqK5m7pe6DMK4wTBe3qKctAPbh0
X-Gm-Gg: AR+sD111hRCYcWv+m7hobMQfOfbtN8K/ZwmOY1ekiNfAXkpW9sAyEZByyUAXrBrkWif
	N9Fo7dOToI95rRLPaTf9flQVX3I0FTqum/+h3igEV8JlLOIZDZtI0YGBKpEaZ8uGKjZ7DhHH00m
	zuW+antlR0AfYR+jtKZJntQoir6XhwmmgYnanSDB7guc7AtbF8Li3b4gg9+XGpuZ5el7QONxzqa
	ll8bdfrZxbRwwvM04YsPwRalATIh3rzev789UAJs3NpCHGon9eaWjKw6UwJa1H6uf2Cjju+1mO9
	HeN5dV+kt0ThXC+q/cjK5Lerf1FSkzblrLhKp282fQUlVuxpYn7nOSqncmtiryCLDYUXtXQvwZ2
	tJNA3HllOftExqwjgGU+3nCMrF8qYPIM3k2aAIn0zpa6Q3LqX8d46xcR6W/jUE9US5/gnUJWFGE
	/lE7UeNEiO3VpPniTvWJt5MqFxfyU2mcWzGT2GC2TD+tlOsTS+aIIWpmUwXGLYDPcC8E6yhtCLC
	jTbWHPj9sjS
X-Received: by 2002:a05:600c:4683:b0:499:5210:c537 with SMTP id 5b1f17b1804b1-4997842c1efmr76883715e9.1.1786472857045;
        Tue, 11 Aug 2026 11:27:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:935c:3ee:d543:9da1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aac8c47sm12499385e9.15.2026.08.11.11.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:27:36 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 5/9] clk: renesas: rzg2l: Add support for LVDS fixed-factor divider with 4:7 duty cycle
Date: Tue, 11 Aug 2026 19:27:18 +0100
Message-ID: <20260811182729.360959-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a new CLK_TYPE_G3L_LVDS_DIV clock type and register function for
a fixed-factor divider used by the LVDS clock, which cannot produce a
50% duty cycle for odd divider values. Implement a custom
get_duty_cycle() callback that reports the actual (div + 1) / 2 : div
duty cycle, and add the DEF_G3L_LVDS_DIV() macro to define such
clocks.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 drivers/clk/renesas/rzg2l-cpg.c | 87 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  6 +++
 2 files changed, 93 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 2d80775c60c2..d3d4e618466c 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -864,6 +864,90 @@ rzg2l_cpg_dsi_div_clk_register(const struct cpg_core_clk *core,
 	return clk_hw->clk;
 }
 
+static int rzg3l_cpg_lvds_div_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
+{
+	return clk_fixed_factor_ops.determine_rate(hw, req);
+}
+
+static int rzg3l_cpg_lvds_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
+{
+	return clk_fixed_factor_ops.set_rate(hw, rate, parent_rate);
+}
+
+static unsigned long rzg3l_cpg_lvds_div_recalc_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	return clk_fixed_factor_ops.recalc_rate(hw, parent_rate);
+}
+
+static unsigned long rzg3l_cpg_lvds_div_recalc_accuracy(struct clk_hw *hw,
+							unsigned long parent_accuracy)
+{
+	return clk_fixed_factor_ops.recalc_accuracy(hw, parent_accuracy);
+}
+
+static int rzg3l_cpg_lvds_div_get_duty_cycle(struct clk_hw *hw,
+					     struct clk_duty *duty)
+{
+	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
+
+	/*
+	 * An odd divider cannot generate a 50% duty cycle: the output stays
+	 * high for (div + 1) / 2 input clock cycles out of div, e.g. a divider
+	 * of 7 gives a duty cycle of 4/7.
+	 */
+	duty->num = (fix->div + 1) / 2;
+	duty->den = fix->div;
+
+	return 0;
+}
+
+static const struct clk_ops rzg3l_cpg_lvds_div_ops = {
+	.determine_rate	= rzg3l_cpg_lvds_div_determine_rate,
+	.set_rate	= rzg3l_cpg_lvds_div_set_rate,
+	.recalc_rate	= rzg3l_cpg_lvds_div_recalc_rate,
+	.recalc_accuracy = rzg3l_cpg_lvds_div_recalc_accuracy,
+	.get_duty_cycle	= rzg3l_cpg_lvds_div_get_duty_cycle,
+};
+
+static struct clk * __init
+rzg3l_cpg_lvds_div_clk_register(const struct cpg_core_clk *core,
+				struct rzg2l_cpg_priv *priv)
+{
+	struct clk_fixed_factor *ff;
+	struct clk_init_data init;
+	const struct clk *parent;
+	const char *parent_name;
+	int ret;
+
+	parent = priv->clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	ff = devm_kzalloc(priv->dev, sizeof(*ff), GFP_KERNEL);
+	if (!ff)
+		return ERR_PTR(-ENOMEM);
+
+	parent_name = __clk_get_name(parent);
+	init.name = core->name;
+	init.ops = &rzg3l_cpg_lvds_div_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	ff->hw.init = &init;
+	ff->mult = 1;
+	ff->div = core->conf;
+
+	ret = devm_clk_hw_register(priv->dev, &ff->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return ff->hw.clk;
+}
+
 struct g3l_dsi_div_hw_data {
 	struct clk_hw hw;
 	struct rzg2l_cpg_priv *priv;
@@ -1715,6 +1799,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_G3L_DSI_DIV:
 		clk = rzg3l_cpg_dsi_div_clk_register(core, priv);
 		break;
+	case CLK_TYPE_G3L_LVDS_DIV:
+		clk = rzg3l_cpg_lvds_div_clk_register(core, priv);
+		break;
 	case CLK_TYPE_G3L_PLLDSI:
 		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg3l_cpg_plldsi_ops);
 		break;
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index ebf6b744dac4..22cca4795301 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -148,6 +148,9 @@ enum clk_types {
 
 	/* Clock for G3L DSI divider */
 	CLK_TYPE_G3L_DSI_DIV,
+
+	/* Clock for G3L LVDS divider */
+	CLK_TYPE_G3L_LVDS_DIV,
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -217,6 +220,9 @@ enum clk_types {
 #define DEF_G3L_DSI_DIV(_name, _id, _parent, _conf) \
 	DEF_TYPE(_name, _id, CLK_TYPE_G3L_DSI_DIV, .parent = _parent, .conf = _conf, \
 		 .core_flags = CLK_SET_RATE_PARENT)
+#define DEF_G3L_LVDS_DIV(_name, _id, _parent, _conf) \
+	DEF_TYPE(_name, _id, CLK_TYPE_G3L_LVDS_DIV, .parent = _parent, .conf = _conf, \
+		 .core_flags = CLK_SET_RATE_PARENT)
 #define DEF_G3L_PLLDSI(_name, _id, _parent, _conf) \
 	DEF_TYPE(_name, _id, CLK_TYPE_G3L_PLLDSI, .parent = _parent, .conf = _conf)
 
-- 
2.43.0

