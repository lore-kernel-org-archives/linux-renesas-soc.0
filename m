Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEF336A356;
	Thu, 16 Jul 2026 03:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784173288; cv=none; b=Qbly/ZIXLreE/dQk2anCAqfuMXAViGuG1jhOVAKbUlkmYrFn230e0i1uL6e6U/mJRyIiagC/xdaN09Gn9dpfUtYHeJvsGpFzzhSczHLa+NfbxOf/KeLawYbCZU4RTHg2qbWNsV/K8t1RowcgaVfhHTve671koJiEjY5Yq7nAbng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784173288; c=relaxed/simple;
	bh=kT4pawudicouAWRFhpr4j7YF16tPZHnXROuSpfuzbDA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Sq1y/rrWQJxEDgjmFwNUUH6SCFLe0YdfwBLLiD8W7ThP2D1HTzB1JQI6jhcRNwIoyk16fxD36lbFM+PDzzwKp0ZnCYUU+8gpr4zLvxmPvPJHrsg4D00bPdm9Wd6PUT1KotQmkpngJtxLeDwUHXZ2gVVwjiIgZ7VXBrxLy6GBDrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 35bb14f080c811f1aa26b74ffac11d73-20260716
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_UNTRUSTED
	SA_UNFAMILIAR, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:2a5791ce-17b4-4627-89e2-9684be8d1097,IP:10,
	URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-15
X-CID-INFO: VERSION:1.3.12,REQID:2a5791ce-17b4-4627-89e2-9684be8d1097,IP:10,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-15
X-CID-META: VersionHash:e7bac3a,CLOUDID:7bf9cc0a01e823d24d2a605480e0cda5,BulkI
	D:2607161141216LG0E4QN,BulkQuantity:0,Recheck:0,SF:10|66|78|102|127|136|85
	0|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:n
	il,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BR
	E:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 35bb14f080c811f1aa26b74ffac11d73-20260716
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2085523666; Thu, 16 Jul 2026 11:41:20 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH] media: renesas: vsp1: Propagate runtime PM resume errors
Date: Thu, 16 Jul 2026 11:41:13 +0800
Message-Id: <20260716034113.81187-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vsp1_pm_runtime_resume() can fail while deasserting reset, initializing
the device, or enabling the FCP. However, vsp1_pm_resume() ignores the
return value from pm_runtime_force_resume() and restarts video pipelines
even if the device failed to resume. This can access hardware that is
still unavailable while reporting a successful system resume.

Propagate the error and skip the pipeline restart when the device could
not be resumed.

Fixes: 1e6af546ee66 ("[media] v4l: vsp1: Implement runtime PM support")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 627b5046fa80..2a9f9f114575 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -641,8 +641,11 @@ static int vsp1_pm_suspend(struct device *dev)
 static int vsp1_pm_resume(struct device *dev)
 {
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+	int ret;
 
-	pm_runtime_force_resume(vsp1->dev);
+	ret = pm_runtime_force_resume(vsp1->dev);
+	if (ret)
+		return ret;
 
 	/*
 	 * When used as part of a display pipeline, the VSP is stopped and
