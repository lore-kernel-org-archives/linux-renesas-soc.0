Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EEA3CFF69;
	Fri, 22 May 2026 10:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445153; cv=none; b=EepTOl7NtoaiXmXX352X3cORmlKB8Fkkp6Y53D2/+yIlsvTnFUWVo7KnpJNwnHK1lPeBHfwcKIAQnApIDfxAnJBlP1u/BfH0wm26/qiGJJ0SUxHF3rR3AsR9slgr69ytsVTuWm9F+hNrFDJIKe7pfy/vQzuJSN3fcVc1QNZdeLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445153; c=relaxed/simple;
	bh=So7pwgWkCKK6qFNoIGV6sNXH+bSlX0B83MTCuYfx/Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Szwtb74p4JYSpGYFN+m+ewAMOQDqAAV+zOGB5qs01xNrJOEAW7Gj+2H2HpraoeBj2opxn2cjEr+ogpALC9eF5CD/uSyi1lSLm+YSaMVgGFZXqXT5/s1Tz9KrMhPQjUybhiGAyG5zpibflvulQdTai9Nd/x9CU22m1hJkW3ldEbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DE46XXTF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DE46XXTF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF321F00A3E;
	Fri, 22 May 2026 10:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445150;
	bh=aSGJt3Bw4ZA4gZKsUVnQGrh272MXdVQ2Sy4qXRc2hO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DE46XXTFyTpSDLEKGYfUQXsXQUSuAPT4QxJy/YdnMmXlpeWr1b8d0A5LlS/7ZrRs0
	 QNqo/KMs0IbaJfbeXUVCmCEUIBtMfIgIxtEI4VLvMKtmLL5gIDuK++YdWQASJMhVQd
	 brxKtppOWO37o3corXPOlic2aHg7QeYvklId5TTWQI8ELDQwIVwtAeYhjM1ox+bNR+
	 GlkMc9DUf4BjJOpdR4F2Q2t63UVYCQ7b4g5iRcd9rNmLLKDvFZptKI9aN0ho1pjNDa
	 B5+ojGrIecMnEeQqa7194MXe5dmAHH8spFgTg6/BGTrrHk5B2setp5o3Lb5E1sV8hx
	 9k9GxN3zdFpXQ==
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
Subject: [PATCH 15/17] i3c: renesas: Use the "dev_name:irq_name" format for the interrupt name
Date: Fri, 22 May 2026 13:18:13 +0300
Message-ID: <20260522101815.1722909-16-claudiu.beznea@kernel.org>
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

Use the "dev_name:irq_name" format for the interrupt names. This makes it
easier to identify interrupts in systems where multiple devices may request
interrupts with the same name.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 5614ed99553c..e6e05ac03082 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1385,12 +1385,19 @@ static int renesas_i3c_probe(struct platform_device *pdev)
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

