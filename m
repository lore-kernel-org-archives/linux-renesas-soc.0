Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DD73E7BD1;
	Mon,  8 Jun 2026 20:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949799; cv=none; b=FcH3UGZjmqFvA17TAgBn1YXFC/6yRhEmkd2xZHNbmz9bvT0d3/ckAy4vdepQaHk83ym216wbwoNEZw8Cbc8Z7SNtXlA9vxDVTieZlgqJV1FoD8y4d85ZSElM88Jf9tSq5dqkHbwjva5Ux5dgAw6YEhJSfiWa8uIa/qTFWaxM5oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949799; c=relaxed/simple;
	bh=VbbimtnH/8X8ltGJ+EThZkpML2IwRGZYOuS+gI0vNxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EGa4/85xjkafxsLiYI/WyJnyUN6Gsx289E1lLdVmdLsQUXO64kLIMAqFN5ZNjJhek00eKn+yRnI8IIbS4lZK5xmiEuy4L3R0cQxQ4XZJr5tRxrHq0gotJIrfeaPdAyKK+jmufLeDHyBd4x2h6hV3ebpHXCXutHmD9xSn4KzHbT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9SQcnW+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9SQcnW+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906151F00898;
	Mon,  8 Jun 2026 20:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949798;
	bh=AKSEwxHG4l89bFYF0FcArUN3IFekiGEu40fvQrNy8+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P9SQcnW+6voirvsAk8gwovXqxrs6cDu/SdOCfVrtWdIs7fm7UmkMvDrpcUq/oFIx/
	 +aQgKHogxh0jow6piEyvhOkQMcKWz14VZcCkWeMiQIGU9ES8kfx6YTpbXcUeCukDMV
	 D8ucfCgJAAEWDvrbxcXOAr+XcAsgcGyhOOLw/oYNyUrFAayIAxUygzHZXo9TII4dWl
	 zGyHKgd8rScxUff2fW61h0awT7/cyAa/Ax86Hszm/8bw+PSyrrcDyXd9Bdwk8tSyuV
	 +swWxsxi/VjeYXzpzPr4YMNmoirYniV5huvyOyysmgzpiGiBOAsH8ENRf31QwQ2ekX
	 FDrGQg+TsPN9Q==
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
Subject: [PATCH v3 15/17] i3c: renesas: Use the "dev_name:irq_name" format for the interrupt name
Date: Mon,  8 Jun 2026 23:15:41 +0300
Message-ID: <20260608201543.804902-16-claudiu.beznea@kernel.org>
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

Use the "dev_name:irq_name" format for the interrupt names. This makes it
easier to identify interrupts in systems where multiple devices may request
interrupts with the same name.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 103c938d1455..6572934a1837 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1536,12 +1536,19 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 		return ret;
 
 	for (i = 0; i < ARRAY_SIZE(renesas_i3c_irqs); i++) {
+		const char *irqname;
+
 		ret = platform_get_irq_byname(pdev, renesas_i3c_irqs[i].name);
 		if (ret < 0)
 			return ret;
 
+		irqname = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s:%s", dev_name(&pdev->dev),
+					 renesas_i3c_irqs[i].desc);
+		if (!irqname)
+			return -ENOMEM;
+
 		ret = devm_request_irq(&pdev->dev, ret, renesas_i3c_irqs[i].isr,
-				       0, renesas_i3c_irqs[i].desc, i3c);
+				       0, irqname, i3c);
 		if (ret)
 			return ret;
 	}
-- 
2.43.0

