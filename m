Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91613B5854;
	Mon,  3 Aug 2026 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747970; cv=none; b=sknriGd2U1QWRnQ1z+AZpXkWogewDvi8a2lRSBzJNDyyPSJVrnek4qQY5wLS7jur6XxnJ8117EI2m4RmQw4Hk1xcV18AQEteU5stk1Dx0cxdSBGHAoYaTM+JnMDeZX5ulUfeD0gPmxsVdabfCDwroDGk2bVL87P0AbP0tCuVS1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747970; c=relaxed/simple;
	bh=0LlHNnj0OQNwZMb9VvaGCBxBiZ55VL+WLMcKiAbuufw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dI84NA9cM6Pxh8xk5q2I6C8hq5jocTNWdLBTG/y77xCBpD+fzWMtRM9VHl5/sAGVUuBmwVpYnMc/aPOke7d7B4/D2RDNQI3IbjT4Og9ip89OyKJP0PgKLMoKYAYHCw7AjT2UeCyePUlf4LDpTjKbAuWYQE77/BNcilozZ0PSs9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8d4a9e928f1a11f1aa26b74ffac11d73-20260803
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:66aca1a4-d7e0-4694-9865-5cef6e73fd59,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:c724cdf97477801b410f97a45847a35d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8d4a9e928f1a11f1aa26b74ffac11d73-20260803
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1608937236; Mon, 03 Aug 2026 17:06:02 +0800
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
Subject: [PATCH 2/2] media: rcar-isp: Release ISPCORE resources
Date: Mon,  3 Aug 2026 17:05:53 +0800
Message-Id: <20260803090553.4082161-2-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260803090553.4082161-1-lilinmao@kylinos.cn>
References: <20260803090553.4082161-1-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_device_register() takes a reference to the parent device, but the
ISPCORE remove path never calls v4l2_device_unregister(). The reference
is therefore leaked whenever an ISPCORE is removed.

Probe failures after rppx1_create() also return without destroying the
RPPX1 object.

Unregister the V4L2 device and destroy the RPPX1 object on the
corresponding error paths, and unregister the V4L2 device during removal.
v4l2_device_unregister() also unregisters all attached subdevices, so it
replaces the narrower subdevice-only cleanup.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 drivers/media/platform/renesas/rcar-isp/core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 8dafffdd8de68..923970fd7841f 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -883,17 +883,23 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
 
 	ret = v4l2_device_register(core->dev, &core->v4l2_dev);
 	if (ret)
-		return ret;
+		goto err_destroy_rpp;
 
 	ret = risp_core_create_subdev(core);
 	if (ret)
-		return ret;
+		goto err_unregister_v4l2;
 
 	mutex_init(&core->io_lock);
 	spin_lock_init(&core->lock);
 	INIT_LIST_HEAD(&core->risp_jobs);
 
 	return 0;
+
+err_unregister_v4l2:
+	v4l2_device_unregister(&core->v4l2_dev);
+err_destroy_rpp:
+	rppx1_destroy(core->rpp);
+	return ret;
 }
 
 void risp_core_remove(struct rcar_isp_core *core)
@@ -907,7 +913,7 @@ void risp_core_remove(struct rcar_isp_core *core)
 	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++)
 		risp_core_io_destroy(&core->io[i]);
 
-	v4l2_device_unregister_subdev(&core->subdev);
+	v4l2_device_unregister(&core->v4l2_dev);
 
 	mutex_destroy(&core->io_lock);
 	rppx1_destroy(core->rpp);
-- 
2.25.1

