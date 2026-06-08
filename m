Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786263EA955;
	Mon,  8 Jun 2026 20:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949793; cv=none; b=Ip/9ILr7UV5+juCa7JTsEa/EFp77QAkMen1KcKIyYPXZdB3tGAeaxWN78xw3qGDNv5NbNs2BVtTfSYa9pnI313YEXq6TWPKbvo6UI0CYTRXmreQn4CYH3eQrnJjWNHW2qpSMvb1jeRMbPYSsGSCuwBsdmInGhybEJRsQNUV1bAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949793; c=relaxed/simple;
	bh=k/LOgJpS6zGmUD8bm7JaDGRNRkUaEDaoefMmoByt6Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rTyYpGPmZtuGpyUS0sNFYsV5Qqo3biEM0ZQYLvKTCbz/VgK0HzrlVlJ3A6iP2zlMRu1+YG9BPtw/Fv3YCy7L7HT3KuMqEXDDn0HcWXxwkscuzLjIf5C7yLAb+CFXiLspIXMU6CGJyzD7wdyN97OH6ZqWC8PbvAjwKZ0IcgBkL3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/6Z4+5v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/6Z4+5v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15F61F00899;
	Mon,  8 Jun 2026 20:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949792;
	bh=BerDwGmj7hZ7/ETxG2OHHzRBs4pWGWN+/2PjeQmlsxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R/6Z4+5vmWgXNwVZ3ZqTZ6RoOyc/ANvLZiRUTLehf70H7+DBJtrGLzmxMx2wm2RZW
	 FHbpJ4x2agXHhiYU6AJeh7xsPzt26EYUtGiZkuVJyH7rRURgl0/s1NbZXky1VOdmxd
	 +0LhmzRtOrmMJCojUhto0rNb1WSplcRgQn24CJuUBxyIScH25t0hT/9lYWL3LwL7BY
	 8rdOONrWTP4ADtGXVFpoTJv7oN+uBxMcQVQaOyOleNsjODUapU99albiGvinkSzHiU
	 piWIv2hawzQSJkGvmcCxIz4a0CFirwmLYrEKTna1QRsRzgor+8IkO6jq8y3hElyJ0q
	 PnKts/pFirdBg==
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
Subject: [PATCH v3 13/17] i3c: renesas: Update HW registers after SW computations are done
Date: Mon,  8 Jun 2026 23:15:39 +0300
Message-ID: <20260608201543.804902-14-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608201543.804902-1-claudiu.beznea@kernel.org>
References: <20260608201543.804902-1-claudiu.beznea@kernel.org>
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index dab643cd8859..38ce722881da 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -560,10 +560,6 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	if (!i3c->rate)
 		return -EINVAL;
 
-	ret = renesas_i3c_reset(i3c);
-	if (ret)
-		return ret;
-
 	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
 	i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);
 
@@ -614,27 +610,31 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
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

