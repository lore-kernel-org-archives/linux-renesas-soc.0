Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3973C199B;
	Tue,  4 Aug 2026 10:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785839092; cv=none; b=RpvgkdCP4JW7NjaX76H+5lzklqBQKryQLW6hoXIefYYpuI+MSeDU5SzBKeGgW0BlihmBDXb1AxBjmzBoHgs9XqToqUC6Q+4XMd4e0oN4jzsnPo1DnXORNkBKo3hqTknxLNP+U4fZF/qor1Gy1UKmR9HIKPs0YJqBCL9eXeR230w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785839092; c=relaxed/simple;
	bh=MOiZVN9IjAsl4MH/BX6q5K88Mh5TEauMvPdpLGP77dU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lAzVhKlbliPnJbswoK440FEbWu+z5ic7JCt0ezBo6GmEIt/Vb1kWZeHI7oTLZUvFbanRzM3YO3QGShDTRqF/CTl4+F+KoBiITGrADICiq+IQmvAtsrKm+/SGkQclo3H366I5YI/dphL2q4877LXhnAcAYtbFisTAhlg+aii3Iyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b4e498208fee11f1aa26b74ffac11d73-20260804
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:84e22f17-9ba2-4684-9a4f-d6f845452dd4,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:6e5e5c39784c1ed7f11ad1803359c245,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:1,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b4e498208fee11f1aa26b74ffac11d73-20260804
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1959304178; Tue, 04 Aug 2026 18:24:42 +0800
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
Subject: [PATCH v2 2/2] media: rcar-isp: Fix VSPX reference leaks
Date: Tue,  4 Aug 2026 18:24:31 +0800
Message-Id: <20260804102431.273385-3-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260804102431.273385-1-lilinmao@kylinos.cn>
References: <20260804102431.273385-1-lilinmao@kylinos.cn>
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

Drop the node reference once the platform device has been looked up, and
release the device reference on the probe error paths and in the remove
path.

Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 drivers/media/platform/renesas/rcar-isp/core.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 181446ae53779..b5861d0cd0e8b 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -820,6 +820,7 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
 		return -ENODEV;
 
 	vspx = of_find_device_by_node(of_vspx);
+	of_node_put(of_vspx);
 	if (!vspx)
 		return -ENODEV;
 
@@ -828,7 +829,7 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
 
 	ret = vsp1_isp_init(&vspx->dev);
 	if (ret < 0)
-		return ret;
+		goto err_put_vspx;
 
 	/* Attach to the RPP library
 	 *
@@ -839,7 +840,7 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
 	 */
 	ret = clk_prepare_enable(core->clk);
 	if (ret)
-		return ret;
+		goto err_put_vspx;
 
 	usleep_range(2000, 4000);
 
@@ -847,10 +848,16 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
 
 	clk_disable_unprepare(core->clk);
 
-	if (!core->rpp)
-		return -ENODEV;
+	if (!core->rpp) {
+		ret = -ENODEV;
+		goto err_put_vspx;
+	}
 
 	return 0;
+
+err_put_vspx:
+	put_device(&vspx->dev);
+	return ret;
 }
 
 int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
@@ -886,6 +893,7 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
 	v4l2_device_unregister(&core->v4l2_dev);
 err_destroy_rpp:
 	rppx1_destroy(core->rpp);
+	put_device(core->vspx.dev);
 	return ret;
 }
 
@@ -904,4 +912,5 @@ void risp_core_remove(struct rcar_isp_core *core)
 
 	mutex_destroy(&core->io_lock);
 	rppx1_destroy(core->rpp);
+	put_device(core->vspx.dev);
 }
-- 
2.25.1

