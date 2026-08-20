Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F7839792C;
	Thu, 20 Aug 2026 18:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787252127; cv=none; b=psoryL8DQ9VT+QRr2VaPXwsC4/FLwYsrEClhoXwk36jtP4FvqMe1Rzezse8L3BiH4kuPbwVmUmrN+3MS5Q00cOKXK1qeSF3urM5jEhD2yv6t2uG/VCSVjAmKREZvuhNFlc2eKuGmry5dkgw1TIspE4v2tcqDQNt2ac+ciLzlbJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787252127; c=relaxed/simple;
	bh=ddEK7ScEEbf7WKERGZlF0v3Q77OX6sOCExGXytnD94A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gC6d9dALEkRGeaR+VmuHF4WJLOFi7ygyvMUC/KBJ/JMRwXZEZ6tL/igE/nj69dgutB5tHGI8k/5NZu8VZanI906Y8CVNIOmK8OgYzcFCrp76ABIwwaTLW2pVYCyUzIX8lHgx/1hMD3FjH3XBrDZpErJy5OCObKYXjFQ5CKiRwHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RFA5VXBG; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HbkETHNO; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RFA5VXBG";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HbkETHNO"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hQt173M26zMlMq;
	Thu, 20 Aug 2026 20:55:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787252123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DcCpRn61dYCTFTR2Iv+QN3ZbAxJ+smtH1MG8GDIkx/o=;
	b=RFA5VXBGMSnY+2Ewg8YIQ1qZY1da+e+9nLHNWmszixxJzXOeXzXinGk4BKkg2LIVY3mFx0
	QFIfjXnTWsCjPQVH+mlkDguBE2p6DwgpuGFyjUBXGaUEGZC2JhOOuBGKKbalK1oFL2cYBP
	cm8xWWSMvkKa7vgJOfUWgXzfozZ4+lONv0Ham2D7lVN11R5fxTuqoAcpkKZOAx6ZB+Y5x0
	FYh19ktVBYGeTgFNZv922TNDi70L15vEEURMJKsv735k4mTD/ZKno39L24yS+nsmQqvPGS
	HTSlalIzy7KfriuNW6MNP84aWLVs10YfDlRqNqHDhN2k342SS14HjTMjIvMYyA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787252121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DcCpRn61dYCTFTR2Iv+QN3ZbAxJ+smtH1MG8GDIkx/o=;
	b=HbkETHNOq/+wSeV3RP0VTZbTKxHnJvvNpga62+G+NUu5CTBfocKbvfiKesBQ1Rz7fw4U0u
	nIcCRcufy7419hoR6LmVyDr/5Go9ap5bzy0BMuBxjb8vezx693K2/UYy/dXPGo0es0rj8w
	gsA9aynblikdEOFugCqEa4vJys6+hpTFqDR598gfihq/S6PdBAEYHoq2gq5b1yqZUMKpL9
	6MJz61Yla4M6q47nqGFixZB0/oZDcRoAHX/eeCSIs96wilODH38L9hIBU/k5Znf5M1rxYI
	pWcgy5SyrmKdAOjkJWrjgJ0Sq0GgPjZdQ5uCvZMZ5A9elF6XGxdgXxOd5QJaqQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/4] drm/panel: ilitek-ili9882t: Set prepare_prev_first
Date: Thu, 20 Aug 2026 20:54:29 +0200
Message-ID: <20260820185506.84448-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260820185506.84448-1-marek.vasut+renesas@mailbox.org>
References: <20260820185506.84448-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 178bf2c549fada62006
X-MBO-RS-META: g1fpqn8zakc66wwkgeagk5m1k7xwtq9n

Sending DSI commands from the prepare() callback requires DSI link to be
up at that point. For DSI hosts is guaranteed only if the panel driver
sets the .prepare_prev_first flag. Set it to let these panels work with
the DSI hosts which don't power on the link in their .mode_set callback.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Add RB from Neil
---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index 219d048cb883f..24e72ad0d29a1 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -808,6 +808,7 @@ static int ili9882t_add(struct ili9882t *ili)
 
 	ili->base.funcs = &ili9882t_funcs;
 	ili->base.dev = &ili->dsi->dev;
+	ili->base.prepare_prev_first = true;
 
 	drm_panel_add(&ili->base);
 
-- 
2.53.0

