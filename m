Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6643397323;
	Mon,  3 Aug 2026 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747971; cv=none; b=kilrQl8UKO1/9dXh8yLzJTVrn1kBAlrE6bVWn3tE8W4WFrZuJyCTFwof1tGbUN3/99brWeJStHwLA2cSAEKvptBBy2yMXlt5tvh7Bxf196RLrU9PyYxmy2X2JrFy5U3C1d+TbAB2ThAMf8JtHOQXmlWEqwAqv520WVndMEqZwTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747971; c=relaxed/simple;
	bh=/15SKzcbgZt5eD1zo7daQzHXBvF3lbUIdNdLESl43Qc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AcnKv9JcKZQY8CT8D+GlheMhIYMxIkfPF5ZSLgKx1SR2xyYWJWLEUnH+wgP26DjuwOtFYooQdFQDPWYGEKLBupALQucislcxfXJMGgwSPlBXCxVdMY+bNSL0Lkep/acElc5CdwQcxm3nRjI9Pimi3pJNqLp6gFVlZd9cl2N0PFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8ac425f88f1a11f1aa26b74ffac11d73-20260803
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:3451fae5-3ad6-4525-84be-89ebc0dba927,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:e7bac3a,CLOUDID:2e424835032b15bac0ab4d32f28c423e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:1,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8ac425f88f1a11f1aa26b74ffac11d73-20260803
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1046068365; Mon, 03 Aug 2026 17:05:58 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH 1/2] media: rcar-isp: Fix VSPX reference leaks
Date: Mon,  3 Aug 2026 17:05:52 +0800
Message-Id: <20260803090553.4082161-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_parse_phandle() and of_find_device_by_node() both acquire references,
but the ISPCORE probe never releases them. The device node reference is
leaked immediately, and the VSPX device reference is leaked on probe
failures and on driver removal.

Drop the node reference once the platform device has been looked up and
release the device reference with a devm action.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 drivers/media/platform/renesas/rcar-isp/core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index f3dc52c136120..8dafffdd8de68 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -781,6 +781,13 @@ int risp_core_registered(struct rcar_isp_core *core, struct v4l2_subdev *sd)
 	return 0;
 }
 
+static void risp_core_put_device(void *data)
+{
+	struct device *dev = data;
+
+	put_device(dev);
+}
+
 static int risp_core_probe_resources(struct rcar_isp_core *core,
 				     struct platform_device *pdev)
 {
@@ -820,9 +827,15 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
 		return -ENODEV;
 
 	vspx = of_find_device_by_node(of_vspx);
+	of_node_put(of_vspx);
 	if (!vspx)
 		return -ENODEV;
 
+	ret = devm_add_action_or_reset(&pdev->dev, risp_core_put_device,
+				       &vspx->dev);
+	if (ret)
+		return ret;
+
 	/* Attach to VSP-X */
 	core->vspx.dev = &vspx->dev;
 

base-commit: 31152f5b0f8719f92063b8c6196cd5e34106c73d
-- 
2.25.1

