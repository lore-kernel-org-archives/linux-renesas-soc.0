Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0440D3ACA7D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826810; cv=none; b=NDwQPubYoSj+zFbql0Fp6cRCor/IXfpJRGgBWY2q6+9L3SRvnUrnnGpdYgars0zGtsTySv45hkqorjwBm73L6bwxcvULV2rlQQkqgNK6PgSPs3FBxg10GH01IGh+lbpEPJ2GMaWrVVqPRTPbpLT+mm73grI/HQO9Q2aEhB/DN3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826810; c=relaxed/simple;
	bh=1Im8S6jtLTEPIZHXUvTz/t/ZBSn+UlzYRoKYUPn+VKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F5PRdIEIJtDLYReKuRFe77Iaarq47FqfWPQ0PI4EK1X80FZzFw84Ie5oixf5FxS2kAwt/GvxW5cuOeuoGnlePSiZljWQ7uKJ7aaWyfml03mLSWPSPIKsp5Qr6lXX9Uev3Z8Us4ACLhFeCNoi3j7c2d77LTS7e+mol6ilDK3KR/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zPV2Z3rJ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zPV2Z3rJ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F23561A2EA4;
	Wed, 18 Mar 2026 09:40:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1A326004F;
	Wed, 18 Mar 2026 09:40:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0BC731045074C;
	Wed, 18 Mar 2026 10:39:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773826799; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xkg8WT1H4nXO5fcJJ7+qnjT9Yuxy0/lZMRRqi782Ryk=;
	b=zPV2Z3rJuNSZkPd9gOJqeKkFsIPIaDMYXuF/l5srNk0O1Vi0TQc2OgiLEU9L55DBl9NybK
	Xkl8cFqI5JR6C9CdbYq7UGDrq+P+zxL9Si5j6vJ1bfn6A5NEdMiTH4NRslSieBaY6lTrm1
	D3pCgPV+M8s/vTnNCND4l3wW2l8xcNC563XKe+MWgjcqP4rJUeZEE1Om0BEnMg/Gxgs2nf
	6xSwQEWV7zsq6jpgeiLqwBs49lzFWsHReuziJM8p9UHiYkncsja7Lvdggls8Ly/msfLwNI
	tIfdTL6EGo5g3AzhdwSRoRBvbji/UCy9p40kiFgQWoZ4Gz5rQaITLBSEKsY5Hg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Mar 2026 10:39:36 +0100
Subject: [PATCH v3 2/4] drm/kmb/dsi: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-drm-bridge-alloc-getput-drm_of_find_bridge-4-v3-2-10f502520357@bootlin.com>
References: <20260318-drm-bridge-alloc-getput-drm_of_find_bridge-4-v3-0-10f502520357@bootlin.com>
In-Reply-To: <20260318-drm-bridge-alloc-getput-drm_of_find_bridge-4-v3-0-10f502520357@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference.

This driver has global variables for the DSI host and DSI device, and code
to allocate them on probe but no code to free them when on remove. So it
does not at all support removal, and not even multiple instances. For this
reason putting the reference would be pointless here.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index aeb2f9f98f23..febca939bd01 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -251,7 +251,7 @@ int kmb_dsi_host_bridge_init(struct device *dev)
 		return -EINVAL;
 	}
 	/* Locate drm bridge from the hdmi encoder DT node */
-	adv_bridge = of_drm_find_bridge(encoder_node);
+	adv_bridge = of_drm_find_and_get_bridge(encoder_node);
 	of_node_put(dsi_out);
 	of_node_put(encoder_node);
 	if (!adv_bridge) {

-- 
2.53.0

