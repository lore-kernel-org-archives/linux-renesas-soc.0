Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA612DC792;
	Sun,  5 Jul 2026 21:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783287359; cv=none; b=e/yP5ILKqJSVo+P8eRPY8HKW6Qof2ZGh5EKP1+MNuk5vy8sFcZ2IAvD6N6X+WH3YT++v5H6Uo69Inw7zFXNEIUetS7Gmarlpz3sEV+NE0hT1FrP/n+57AobkkCAE/kDq/90LukVhMIyym1LjyVszf39VTSsdwsG9RsgSdrC01KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783287359; c=relaxed/simple;
	bh=1F4yyozr22c647s5CMUnLLK4oVdPq6kvADdvLYZTias=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D3Xa36/4rdqc/ClcZe6UKk83xlClfMZAuoPbaAQE8+Rk7coqF5FWTJQrxa+h+u3+c7KNKdoYOKZ3sEIIe50cGIXZDabrQaPpcc97qMXrJuWGzIvAR42bgI4fr2pM97g9N9GBlpzsGC/caFAI8+KyqjBjO+2MbFqlu7pJuoWjxBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Cplnf87w; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cplnf87w"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F0B1BCA;
	Sun,  5 Jul 2026 23:35:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783287300;
	bh=1F4yyozr22c647s5CMUnLLK4oVdPq6kvADdvLYZTias=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cplnf87wJYtIoM7IXeir1u6P8fZ/66j64mbZeVkIdyYIgM+XRs8o6AnedwPjeCGor
	 iAybtHuDIq0ql/nnc3T8HGAyJlOPohHqlg9hMXS/Gd1h6+wE8n62zzSPFKYDAOQJAk
	 zTlgH29FmiwE6DFN9jcV5oul65BrbViBFFRJ3Gp0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/4] drm/bridge: display-connector: Support hardcoded EDID for VGA connectors
Date: Mon,  6 Jul 2026 00:35:41 +0300
Message-ID: <20260705213542.28987-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT binding for VGA connectors allow providing an EDID blob in the
device tree when the DDC signals are not connected. This is useful for
devices where the VGA connector is internal and a display is guaranteed
to always be connected.

Support this feature in the driver by parsing the EDID from DT if
available. If a DDC bus is also specified, return an error from the
probe function as DDC and hardcoded EDID are mutually exclusive.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/display-connector.c | 31 ++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index eb3412ec30a0..225a8e987d08 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -27,6 +27,8 @@ struct display_connector {
 	struct regulator	*supply;
 	struct gpio_desc	*ddc_en;
 
+	const struct drm_edid	*edid;
+
 	struct work_struct	hpd_work;
 };
 
@@ -48,6 +50,7 @@ static void display_connector_destroy(struct drm_bridge *bridge)
 	struct display_connector *conn = to_display_connector(bridge);
 
 	i2c_put_adapter(conn->bridge.ddc);
+	drm_edid_free(conn->edid);
 }
 
 static enum drm_connector_status display_connector_detect(struct drm_bridge *bridge)
@@ -64,6 +67,9 @@ static enum drm_connector_status display_connector_detect(struct drm_bridge *bri
 	if (conn->bridge.ddc && drm_probe_ddc(conn->bridge.ddc))
 		return connector_status_connected;
 
+	if (conn->edid)
+		return connector_status_connected;
+
 	switch (conn->bridge.type) {
 	case DRM_MODE_CONNECTOR_DVIA:
 	case DRM_MODE_CONNECTOR_DVID:
@@ -130,7 +136,10 @@ static const struct drm_edid *display_connector_edid_read(struct drm_bridge *bri
 {
 	struct display_connector *conn = to_display_connector(bridge);
 
-	return drm_edid_read_ddc(connector, conn->bridge.ddc);
+	if (conn->bridge.ddc)
+		return drm_edid_read_ddc(connector, conn->bridge.ddc);
+	else
+		return drm_edid_dup(conn->edid);
 }
 
 /*
@@ -376,6 +385,24 @@ static int display_connector_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Retrieve the hardcoded EDID for VGA connectors. */
+	if (type == DRM_MODE_CONNECTOR_VGA) {
+		const void *edid;
+		int size;
+
+		edid = of_get_property(pdev->dev.of_node, "edid", &size);
+		if (edid) {
+			if (conn->bridge.ddc)
+				return dev_err_probe(&pdev->dev, -EINVAL,
+						     "DDC and EDID are mutually exclusive\n");
+
+			conn->edid = drm_edid_alloc(edid, size);
+			if (!conn->edid)
+				return dev_err_probe(&pdev->dev, -EINVAL,
+						     "failed to parse EDID\n");
+		}
+	}
+
 	/* Get the DP PWR for DP connector. */
 	if (type == DRM_MODE_CONNECTOR_DisplayPort) {
 		int ret;
@@ -412,7 +439,7 @@ static int display_connector_probe(struct platform_device *pdev)
 
 	conn->bridge.of_node = pdev->dev.of_node;
 
-	if (conn->bridge.ddc)
+	if (conn->bridge.ddc || conn->edid)
 		conn->bridge.ops |= DRM_BRIDGE_OP_EDID
 				 |  DRM_BRIDGE_OP_DETECT;
 	/* Detecting the monitor requires reading DPCD */
-- 
Regards,

Laurent Pinchart

