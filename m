Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2423C2797
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284332; cv=none; b=Z4m8MUdN7UKaik1z/x78YaI/YpulHWdz9/hOis71FByQcONzjqg86V50++CwxLePP59bxsdVS3TNz8pJnvMhuzY9jdTlGC21e9tQmUiBIPu5YP+VylVGXr6lc8ThA1NVg9U6qDp8mUfMhqAdgdAi6x99SL4Q0MAQn/8vhpweYUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284332; c=relaxed/simple;
	bh=Rrf1C5sZpa08Wax1Iq+YAs7bOiJ4amt3LJuRGbCDwSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PTxD2G/CUJfxGSWxlqoNIPKP2K2y7hnrDITJhZekjlwi+VGebX5YUWrIIXFc3dhNS8coCaKfXx3SQessWol+bCO9oeTE+/Faw/ngQD1uWbvn5JvGPOCd2nbjrJx3yzP12pnVFZKRkG0sh2YBSBzddIirfLfu0wvIU8hPJ67ObTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GMmqVkP4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GMmqVkP4"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BB57419DF;
	Mon, 23 Mar 2026 17:44:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774284252;
	bh=Rrf1C5sZpa08Wax1Iq+YAs7bOiJ4amt3LJuRGbCDwSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GMmqVkP4nG/G328l566I+wdXy+u9n5vzMwDQhYnaGOMfwStJE9IAD/UjgHP7ZHtvO
	 vlysKfU5/FapCjhbZZCk2onQL1USBeICKyooOuMhu+OwA0awAMC7Z63/B1wdZObTy5
	 ytNJBFEzaB7zPPYgqnpnoZr3fKsqZL5LsMuO+kFE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 1/4] drm: rcar-du: Ensure correct suspend/resume ordering with VSP
Date: Mon, 23 Mar 2026 18:45:23 +0200
Message-ID: <20260323164526.2292491-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260323164526.2292491-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260323164526.2292491-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VSP serves as an interface to memory and a compositor to the DU. It
therefore needs to be suspended after and resumed before the DU, to be
properly stopped and restarted in a controlled fashion driven by the DU
driver. This currently works by chance. Avoid relying on luck by
enforcing the correct suspend/resume ordering with device links.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 16 ++++++++++++++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
index 94c22d2db197..a4a49dcd8233 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
@@ -20,6 +20,7 @@
 #include <drm/drm_vblank.h>
 
 #include <linux/bitops.h>
+#include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
@@ -458,6 +459,9 @@ static void rcar_du_vsp_cleanup(struct drm_device *dev, void *res)
 
 	kfree(vsp->planes);
 
+	if (vsp->link)
+		device_link_del(vsp->link);
+
 	put_device(vsp->vsp);
 }
 
@@ -482,6 +486,18 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * Enforce suspend/resume ordering between the DU (consumer) and the
+	 * VSP (supplier). The DU will be suspended before and resume after the
+	 * VSP.
+	 */
+	vsp->link = device_link_add(rcdu->dev, vsp->vsp, DL_FLAG_STATELESS);
+	if (!vsp->link) {
+		dev_err(rcdu->dev, "Failed to create device link to VSP %s\n",
+			dev_name(vsp->vsp));
+		return -EINVAL;
+	}
+
 	ret = vsp1_du_init(vsp->vsp);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h
index 67630f0b6599..a6731249db34 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h
@@ -12,6 +12,7 @@
 
 #include <drm/drm_plane.h>
 
+struct device_link;
 struct drm_framebuffer;
 struct rcar_du_format_info;
 struct rcar_du_vsp;
@@ -26,6 +27,7 @@ struct rcar_du_vsp_plane {
 struct rcar_du_vsp {
 	unsigned int index;
 	struct device *vsp;
+	struct device_link *link;
 	struct rcar_du_device *dev;
 	struct rcar_du_vsp_plane *planes;
 	unsigned int num_planes;
-- 
Regards,

Laurent Pinchart

