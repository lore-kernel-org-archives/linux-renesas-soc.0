Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933613E16B5;
	Fri, 22 May 2026 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445148; cv=none; b=m3N7Srgpx+BQmnGrkG+ejluay6JGu/w/9FfwVfTjSIS+yZztBKlyHEbBj42yF0Up2aIdVw21xlt+p1rg9S/Pm4Wr3vreXlwEsUCa18EfoFJZ0qeTM6daN8Mw7HwQi4qpC4jBQ8Xg1TDpbo79/KoKmr90rUr7ezmmQCGw9LtOymo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445148; c=relaxed/simple;
	bh=WBZhj4NgGiwjTi9j4Mqu2SHvcm9wglX+/npJOEzAaHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R7rtml1wwvXo0mcPSbp4bM60gYOGM6gI9REE/U3d1UIUsdnHPVDkn36E99ye6hqhQsoCsQ6WjuE75lppyIQiq4Atap/tB299MUu5mncXrtPC9p6PhqnV2b8WHOi6myqywwhqLVAfwYoRfSeHBtxG1rthl+UgidchgeQlUg92EJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evSBmtWe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evSBmtWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC691F000E9;
	Fri, 22 May 2026 10:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445144;
	bh=O48MvtboEsVG3v8Dnm6gl7B+O5EQNDH5bmjyaZheYiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=evSBmtWeG6K9KrY0mMd0ISrjE23GUPv5y4BYGPnrJsC9SvF29iwYg2hLI98HvQae9
	 Xf1h4+OymJ/MtdMChqSOj9wiToMQO3pUz7DCmdN/gP6+IC8IGgT2JIgHOwCetY+l54
	 ND+geNs+kEct/xNL38IyAB1cJ+B9JMXjSvWQqYFa8yrpPSjv2cbOrqg2mFliqVlI6Y
	 J8XjAwPeZu4uANh62RAAj/2if2hAknRYXSQxmTsok/3IpGk4L75DbSKvxUYDiRqCkh
	 x52QEpEHMT+P9EZwkWtK6ToQjgcPvbJxF/jYTzJnvMN4WV8S9JDXbfVh5wBFcbuyj8
	 qqR8hxDQ0TXRQ==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 13/17] i3c: renesas: Update HW registers after SW computations are done
Date: Fri, 22 May 2026 13:18:11 +0300
Message-ID: <20260522101815.1722909-14-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

renesas_i3c_bus_init() performs a number of computations and software
cache updates, interleaving them with hardware register writes. While
this works today, it makes it harder to minimize the time the controller
must remain powered when runtime PM is introduced.

Perform all software computations and cache updates first, then update
the hardware registers. This prepares for future runtime PM support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 865e67ac0fd2..631c9c5d8038 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -550,10 +550,6 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	if (!i3c->rate)
 		return -EINVAL;
 
-	ret = renesas_i3c_reset(i3c);
-	if (ret)
-		return ret;
-
 	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
 	i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);
 
@@ -604,27 +600,31 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 			STDBR_SBRHO(double_SBR, od_high_ticks) |
 			STDBR_SBRLP(pp_low_ticks) |
 			STDBR_SBRHP(pp_high_ticks);
-	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
 
 	/* Extended Bit Rate setting */
 	i3c->extbr = EXTBR_EBRLO(od_low_ticks) | EXTBR_EBRHO(od_high_ticks) |
 		     EXTBR_EBRLP(pp_low_ticks) | EXTBR_EBRHP(pp_high_ticks);
-	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
-
-	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
-	i3c->refclk_div = cks;
-
-	/* I3C hw init*/
-	renesas_i3c_hw_init(i3c);
 
 	ret = i3c_master_get_free_addr(m, 0);
 	if (ret < 0)
 		return ret;
 
+	info.dyn_addr = ret;
 	i3c->dyn_addr = ret;
-	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
+	i3c->refclk_div = cks;
+
+	ret = renesas_i3c_reset(i3c);
+	if (ret)
+		return ret;
+
+	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
+	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
+	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
+	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(i3c->dyn_addr) | MSDVAD_MDYADV);
+
+	/* I3C hw init*/
+	renesas_i3c_hw_init(i3c);
 
-	info.dyn_addr = ret;
 	return i3c_master_set_info(&i3c->base, &info);
 }
 
-- 
2.43.0

