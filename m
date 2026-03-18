Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD553B8D65
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826815; cv=none; b=U27dmzvjeg2HGY8fgyaOd+/JFXwOux7z3AIi8mygySd0rfvnCjcTywHoYbewoolFl1cTFjgKjaJJL/sw/3vkx518HmrjRkK9W2ivT0y7MrHSHZxXW/QdGvdU/YW3Z1h6TiaM+YdZVObKoAMZTMzf/ufm242XLI8rwHWz6t0Vl98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826815; c=relaxed/simple;
	bh=1u532q42fUwRFhVkdE0Q2Hq9LNvaZw+mAxBWSN7guBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5Besuqdy6UQVvQjg48G5xpYitSuNQG+eK3q4Z6O2MQ7LTtqB14IY2NDY6/Z4jWoIaldKvbSPc05j6bkmpiDDKAc83m9Yd2g1hoblSvz48E9JFe5MOz8+7hui1Ry3mTpT4H6GW2Oz0wXRvoPQZd1TyfxnWKwdG+zt55BFspdY0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rtGQSrON; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rtGQSrON"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5358C1A2EA3;
	Wed, 18 Mar 2026 09:40:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2745B6004F;
	Wed, 18 Mar 2026 09:40:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EDDF1045072A;
	Wed, 18 Mar 2026 10:40:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773826805; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gw9IiX9wHuJVqEPWrO12es2autsBEVAbQ9Q/0yqHv7s=;
	b=rtGQSrONPEXimZ2BBvhYe4h5DGLpaG/xtUhrhCIGE1xA66fNpUcHkeIVfaxKOh+b38TbND
	SDPCdVm3z6YSzP12ZojCFqAWdhuChGYrEU54rV0vlfiZ2a4ZmLkVcy7mgGcJ/10692N3cG
	NYEyRqVIbNeJ2RYgiJ6p7etj7iJvVHiJZI/oifkqKhcEf5li6fnsrpVmjgCdyfK7jq0ZdT
	DIQ2fbEQ1aqZPSUoeaH1THYkeeJ/U1/2q0vpowhR1G9bAtvkV0M2hI4rQpt0Xr83m+9Vq/
	+S1l1xzpi8QvpNAvOrCiV+wRyemVkQ4URGJAPw0M9Ir1+cBdePhdY8ly0yY6RQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Mar 2026 10:39:38 +0100
Subject: [PATCH v3 4/4] drm/omap: dss: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-drm-bridge-alloc-getput-drm_of_find_bridge-4-v3-4-10f502520357@bootlin.com>
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
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done.

omapdss_device_init_output() can take one bridge pointer in out->bridge or
two pointers in out->bridge and out->next_bridge. Ensure each has a
corresponding drm_bridge_get() and add drm_bridge_put() calls in the
cleanup code.

Also slightly change the initial code assigning out->panel and out->bridge
to ensure and clarify that either out->panel or out->bridge is set in the
function prologue, not both. If both were set, the 'if (out->panel){...}'
code that follows would overwrite out->bridge without having put the
reference.

Finally, take a reference in case a panel_bridge is added using
drm_panel_bridge_add(). This ensures we always need to put a reference,
which came either from of_drm_find_and_get_bridge() or by the
drm_panel_bridge_add+drm_bridge_get() branch.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/omapdrm/dss/output.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
index 7378e855c278..ca891aba3820 100644
--- a/drivers/gpu/drm/omapdrm/dss/output.c
+++ b/drivers/gpu/drm/omapdrm/dss/output.c
@@ -30,11 +30,13 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 		return 0;
 	}
 
-	out->bridge = of_drm_find_bridge(remote_node);
 	out->panel = of_drm_find_panel(remote_node);
 	if (IS_ERR(out->panel))
 		out->panel = NULL;
 
+	if (!out->panel)
+		out->bridge = of_drm_find_and_get_bridge(remote_node);
+
 	of_node_put(remote_node);
 
 	if (out->panel) {
@@ -49,7 +51,7 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 			goto error;
 		}
 
-		out->bridge = bridge;
+		out->bridge = drm_bridge_get(bridge);
 	}
 
 	if (local_bridge) {
@@ -59,7 +61,7 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 		}
 
 		out->next_bridge = out->bridge;
-		out->bridge = local_bridge;
+		out->bridge = drm_bridge_get(local_bridge);
 	}
 
 	if (!out->bridge) {
@@ -79,6 +81,9 @@ void omapdss_device_cleanup_output(struct omap_dss_device *out)
 	if (out->bridge && out->panel)
 		drm_panel_bridge_remove(out->next_bridge ?
 					out->next_bridge : out->bridge);
+
+	drm_bridge_put(out->next_bridge);
+	drm_bridge_put(out->bridge);
 }
 
 void dss_mgr_set_timings(struct omap_dss_device *dssdev,

-- 
2.53.0

