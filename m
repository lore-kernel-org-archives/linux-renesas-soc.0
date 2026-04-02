Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F3E3F1646
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 16:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147271; cv=none; b=IdKlmupCifylid0o27/IDu+17FgxgasCZsdZyf2Iwqpi5C/NR5p0zJUo6FE9i0s1AzHRmpIKJ/ys7P0Iuf/Ms8kctUe4aiUE6SNLO2iaSWbfxm/G2plS4ikW/eUO6neeBMa2VBePgd/wDDDJ4m4DMT/YoIapFxfA0+pv0wFKPDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147271; c=relaxed/simple;
	bh=1u532q42fUwRFhVkdE0Q2Hq9LNvaZw+mAxBWSN7guBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K1Uakzo67hMoLN6G9ba2VRXeGD2bUc/kJNMSDEXS+PseOBTpPqq0G+Ot1l1K2MvKGHWYEWLbLyIf4u6ShfY3vlvw5V1vcDmHaBK+pNPJvWyHCXSg2Ip143iyyHYD1q0mMTOYMVFseHJrhUZdV5eTV6RC8F7Jdb07y3Mqjry5DOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RgQaQsPz; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RgQaQsPz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9A653C59F45;
	Thu,  2 Apr 2026 16:28:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A9DE602CD;
	Thu,  2 Apr 2026 16:27:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5021910450295;
	Thu,  2 Apr 2026 18:27:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775147267; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gw9IiX9wHuJVqEPWrO12es2autsBEVAbQ9Q/0yqHv7s=;
	b=RgQaQsPzK15bu3MyXO1lc4O1Seil08CyL4AFtMHWNWNSkpT48ND8fPW/DOUiqtWOUUDssZ
	/xWUDeo86E8F8nbNFVNaz8UhM8pV9IRrEoW4QRyGQOhHuf7bGYdyKBRvJWssEfzkvvVStJ
	/4RV/dHGufPf+SjapeYH61SZ0StucBf4FTUswz0/F/xoEgnI4M6X33OwbwFIQSb5GgnaFu
	p3imtV3vetF6wY9SRPo4w0UdgAj7u9qV53f55fK/1C4TwRB7u+u9rKUMhVUnBMIYL8lld+
	RMDx8D19SqM5H3nGNaf7eRL4juSclmBKQ4wdKXC+Zc9I5ANnj63nJfUUBc2ycQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 02 Apr 2026 18:27:20 +0200
Subject: [PATCH v4 4/4] drm/omap: dss: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-4-421781c8c061@bootlin.com>
References: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com>
In-Reply-To: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com>
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
X-Mailer: b4 0.15.1
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

