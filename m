Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart+renesas@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Andy Yan <andy.yan@rock-chips.com>,
	Archit Taneja <architt@codeaurora.org>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mark Yao <mark.yao@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Ulrich Hecht <ulrich.hecht@gmail.com>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 17/22] drm: rcar-du: Skip disabled outputs
Date: Fri,  2 Dec 2016 01:43:32 +0200
Message-Id: <1480635817-1258-18-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

When a DT node connected to a DU output is disabled no bridge will ever
be instantiated for it. Skip the output in that case.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index aa84689043ae..7a6bd8bdba05 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -384,6 +384,13 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 		return -ENODEV;
 	}
 
+	if (!of_device_is_available(entity)) {
+		dev_dbg(rcdu->dev,
+			"connected entity %s is disabled, skipping\n",
+			entity->full_name);
+		return -ENODEV;
+	}
+
 	entity_ep_node = of_parse_phandle(ep->local_node, "remote-endpoint", 0);
 
 	for_each_endpoint_of_node(entity, ep_node) {
-- 
Regards,

Laurent Pinchart
