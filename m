Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BB14FE2EA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415585; cv=none; b=pMgmPA+3ys08GjLMb3mvUr3BlP6iytGOpPpa4TfmGTmr97LOz3YS0MH1+L+/PhpeQsFxeiMFB2cIAtSqpen6HAhnWzdCgj27GFvOeEYUBDXvPzD5bkD/thAeUESoaFRiKtFhGgg1zIDCicGmm78aXJNZlSx+YDg6XCmSZcrTd+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415585; c=relaxed/simple;
	bh=XIP/W4rAxpK5vpYkJfeZbQxyOrOhM2dyK9i2qunQ0s4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/DMnjYM8YClALlQnSB4D4r8HhwcmdpeaC4ZU9Z+iq/bNeLmZobvzE1aTNxVFVIB14fS8SOJOqJY0YwbUDWiTPXPESphpYXi87dA22H0V32Hbn6zx1Hf1if5rafBO8eG/zL5WlYFAi4Vcq/dnrIzKOOpZl6LJgp8o33cEyVZBUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgSjQwPe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3qt65op; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgSjQwPe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b3qt65op"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Oq2d3256584
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eDwMHwMtxfU7670dkTXkc05qSneY1y9esdOAThnTnig=; b=kgSjQwPenIxv2umN
	Yd7boP0ITxwVZEK2GEMcWSqS2kqILy1LDIA4/fwyEH0AvC2qzgj9d/Q+CrwIojkJ
	IuDRoloGv4PBE2Nl3ekM4mI8vh07/07WBI1sXBAKSDZ2irR5EaZ855I6uciI2dqn
	JBJO0zHFO5amxZ+SNnkc21Fni5uOLYj5E762vCcX4Hl+Lh2dibFOvHUZ1EA8sAjC
	dHSwhuBwqyeGUtOQGgbKLregdXY6qBQbQSXbDW41g6vf8dUmnNG/iX4Nqs7b80IL
	HvzRAQKUnU9UiS2GY2nEJ7IXRvGBgH7BbhlMGolaR47Rul5sDh6b6cBKqPUWsRQq
	03F/hQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f97m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:13:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so422946285a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 06:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792415582; x=1793020382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eDwMHwMtxfU7670dkTXkc05qSneY1y9esdOAThnTnig=;
        b=b3qt65op79+cWVoVPCXsJgJ4ww14lV8wBvSA42a+UKHF3GeGLBx6kxphvn2iVzyfbN
         PwkBf0Af7AekpESJ3takdJmQc/8k2eXAHoD3g3p6avCI0MigVN24KZylizf0WAitVbWz
         oKc7zwzD1PBm9pPor8gAx+j2+3+pMcwzkD8pSM7jFWREDr3pH/Eprh+aJxubtt9wUcGM
         rLK2APCmUjccbZST0Vq1mzssyE+9b3ousueLZAe4vn6JWtq3LxVXuCcNPNv+t8OrsLn7
         vOBWf8qGZUYAyNvgBsQVdo2/G0inARbysbrEqUT8b95z39N8imHOKPg5Jawn9T9SvV7J
         bSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415582; x=1793020382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDwMHwMtxfU7670dkTXkc05qSneY1y9esdOAThnTnig=;
        b=0SsPB6PCacaV39RZhNEBvpc/QvgLHFKrkxk8rjDBswJg8ZQj+OyK5LRfOFff78Mhij
         6Hyc0mbkLWyjpFwuWdZp3tImWBb7ZyJzaYcW6aZfqqozlHBMCxd/R2zKOuwANpdu/CtI
         YtBqVs5BYx2hkhgFTz2IX5R6jzsdmOWfbYwI3Yt5uOv0D9RFzJFHb2OwIabuvG9w4r83
         404Ke4ROQihnVudeSlPHCtHRFRAwwVfDmTk4ebp/90f7j6Tqyu76NuhtVBLjzPM9l0kH
         5Kh9jf1f9HGgf4+nnlRyYFyisIQUXK615HV3JXR4sTmnOSImdg1UyOxgmwL/9qd3sLjJ
         GtiA==
X-Forwarded-Encrypted: i=1; AKwUvBwmBYumXETqP2AOUCylfCmXHKDRQA5GPTTZARQKoqqB420OpJcemmVTa77hHenbx8BoAGhTi7x/di3Uq0v/swIGGw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLV5+UFv77pOIyF+LwETvFJc0hVK8zOKt1XVupDriTKXKtEjkf0
	9Pgg07W4JyOD53L3TYUYs8zqwbrQ71eQJsqpTF96y7wiFtnM06ZJhLdWT/sZDDNOeUb2w0JVolZ
	LlAJ6iQQZLSGgfduGsMawuPHs1ruNo/dJP3jjpJTV+Dd50M+lphNl1L03KddJiEc2f+M+exZ7RQ
	==
X-Gm-Gg: AYBFou10OPqVYmpeJMyarfXWPE+ULGjo27vZW9SKdKIANANFjwLdZEpkGjJ+1attWt9
	vVH2fhKLNMCPAA3WORZn8NLgWUYtREwbNbKLh4qYQe+YW229oEG+o1je+OuemhtltPh6f8/Tmp3
	6H8UbD0bpN5V2ReyAm/o54onHCon+k7zAIXzC+O0+SMlju/cmXtD6nXRCilrD+0Nw//DJzY7ah5
	9/Nt2+1+yEJfs5y8eSAwGm59mtJxLXu+a5vfeqZN1OqGBpWAWVzch/nRXWpX/Ue+42Hopzl6xrR
	SzxmXxy4hzzgu/BdlXDcuQfQiqWGYcT0ssGdOsJq6KEW69j8/a4HO/6+LSb2q2sJ7YjteV5dScb
	vy8K1HqbGQ3vfZmZsn5HYWTNOALNuySUBv/kDUANruKkJI+9n3dny98Gaf1xuoD8CkScztZh2Eu
	Kd5TiT4v3pABSm
X-Received: by 2002:a05:620a:294e:b0:93c:6e1d:96af with SMTP id af79cd13be357-93f29d6f5e7mr1318406985a.49.1792415582325;
        Mon, 19 Oct 2026 06:13:02 -0700 (PDT)
X-Received: by 2002:a05:620a:294e:b0:93c:6e1d:96af with SMTP id af79cd13be357-93f29d6f5e7mr1318401185a.49.1792415581801;
        Mon, 19 Oct 2026 06:13:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab24f5dd5esm23432581fa.6.2026.10.19.06.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:13:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:12:34 +0300
Subject: [PATCH v7 8/9] drm: writeback: clean up writeback connectors in
 drm_connector_cleanup()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-wb-drop-encoder-v7-8-d4288a26eb54@oss.qualcomm.com>
References: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>
In-Reply-To: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        John Harrison <John.Harrison@igalia.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Eric Anholt <eric@anholt.net>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Starkey <brian.starkey@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4699;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XIP/W4rAxpK5vpYkJfeZbQxyOrOhM2dyK9i2qunQ0s4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Y1cbfyTNnTMQvkTP5+DzPePCWhUPPFnw139H9YSy25t
 Odfr7dXJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmwq/JwbBcvdbkZvTKx3sT
 jNlZN8m5+Xb8V37IzxtokZVnuVz3Re8js82BbdK2rlGdDqo33PgcWV+X8Z9yPTelWqn98cFKCdV
 FTv57/ylnHpByb5dd06byt0nVeHoiR3Gw8OYL/V+yO23/3on/Un9j2WebXKWX55pZakIkZ6z8N2
 trTSYH6xvWyEDRorqlSzfqMK+R07y3K17C7FGW4rUMtxD1J8fMZ1qpbtJILLl6o+f9NdZ3F1X23
 +7v8C5ZEXTh0s9ySeYHOu2KF+r7fx80qk7QK4kXqvR7meo89UvNb8XStXL5qtLlb725ekq2nPHO
 rb678bAN30GLmEILwdQtQU+ZcxOTOX7bBATNYvacswsA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: oD_FiUx6ZjxeyvsulAOQU5dtvV73PtEW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfXwcyE1olwDUEA
 gtMKWVGphxXMR9og5VgUSzAaOlLfrdrWh2o85RHuksOrfnwn0Exg1CrJYcx4oSEM8hHzP2iy+pQ
 lTzAF4vZ1i/rVgvMgTI8TwPDzHYVEB4wU/bL9AbNt6NvtEYfBTrH0ScGZGLou6rTPYmT2Vdjws3
 xpftU2MZLTFhy8KxjUiQW+MUZLBBAtycn4it6k+ntj5uBw6VKnz7YfEZkbL2fgR3xL/KTTQX/EI
 iid7V8nKVssVo5c8WkvlTly9YsZiXVKpXfkAzj8olu5H0L+XgOH940zebNOLxycV7ZVfY9192JS
 S/bSSQMFlJ9wa8/YZY6+9n+GTD1gDzGDR30ylr283LgG7Q0Pl5xcaeM8wl47dupVgMR8WqDez5f
 BqmwnO8cHS0gdZMyWm8hTSt7jbZtnkI3ZWv7KLCxJjwjnNJSHnvjT34YIfrETs1VqsIIp1FqhJB
 n1e1DXBawktXOjDFpdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX2u7U/hs/rlEn
 LS2EoxCvc8c1Gu0IVEoLkmvLr1Cg9L3wqBpz6XiFbDwAhWV07UsEIAWfBpq9NuTYTEwWub+x+37
 to8OrEHxjFwQrlYRXCwVLd6js+rKWM4=
X-Proofpoint-GUID: oD_FiUx6ZjxeyvsulAOQU5dtvV73PtEW
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad6175f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=yH-GMt59n7S85gEv9-QA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190052

Only drmm_writeback_connector_init() registers
drm_writeback_connector_cleanup(). Connectors set up with
drm_writeback_connector_init() (amdgpu, komeda, malidp, rcar-du, vc4)
never drop the formats blob or free the jobs still on the queue, leaking
them together with their framebuffer and fence references.

Call drm_writeback_connector_cleanup() from drm_connector_cleanup() for
writeback connectors, the same way the HDMI audio and SCDC state is torn
down there, so it runs for both kinds of initialization. The drmm action
now just wraps it. Clearing the blob pointer makes the second invocation
a no-op and also covers drm_connector_cleanup() being called after a
failed __drm_writeback_connector_init().

Fixes: 935774cd71fe ("drm: Add writeback connector type")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c     |  3 +++
 drivers/gpu/drm/drm_crtc_internal.h |  3 +++
 drivers/gpu/drm/drm_writeback.c     | 30 +++++++++++++++++++++++-------
 3 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 893716a9e489..1c2bef5e0636 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -929,6 +929,9 @@ void drm_connector_cleanup(struct drm_connector *connector)
 	if (connector->hdmi.scdc_work_initialized)
 		cancel_delayed_work_sync(&connector->hdmi.scdc_work);
 
+	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
+		drm_writeback_connector_cleanup(connector);
+
 	platform_device_unregister(connector->hdmi_audio.codec_pdev);
 
 	if (connector->privacy_screen) {
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 3492787c3697..f60216adcd31 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -329,4 +329,7 @@ static inline void drm_panic_unregister(struct drm_device *dev) {}
 static inline void drm_panic_init(void) {}
 #endif
 
+/* drm_writeback.c */
+void drm_writeback_connector_cleanup(struct drm_connector *connector);
+
 #endif /* __DRM_CRTC_INTERNAL_H__ */
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 2f6a7b50336c..272012a70efe 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -21,6 +21,8 @@
 #include <drm/drm_property.h>
 #include <drm/drm_writeback.h>
 
+#include "drm_crtc_internal.h"
+
 /**
  * DOC: overview
  *
@@ -271,21 +273,27 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
 
 /**
  * drm_writeback_connector_cleanup - Cleanup the writeback connector
- * @dev: DRM device
- * @data: Pointer to the writeback connector to clean up
+ * @connector: Writeback connector to clean up
  *
  * This will decrement the reference counter of blobs. It will also clean the
  * remaining jobs in this writeback connector. Caution: This helper will not
  * clean up the attached encoder and the drm_connector.
+ *
+ * Called from drm_connector_cleanup() for all writeback connectors.
  */
-static void drm_writeback_connector_cleanup(struct drm_device *dev,
-					    void *data)
+void drm_writeback_connector_cleanup(struct drm_connector *connector)
 {
-	unsigned long flags;
+	struct drm_writeback_connector *wb_connector =
+		drm_connector_to_writeback(connector);
 	struct drm_writeback_job *pos, *n;
-	struct drm_writeback_connector *wb_connector = data;
+	unsigned long flags;
+
+	/* __drm_writeback_connector_init() has failed */
+	if (!wb_connector->pixel_formats_blob_ptr)
+		return;
 
 	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
+	wb_connector->pixel_formats_blob_ptr = NULL;
 
 	spin_lock_irqsave(&wb_connector->job_lock, flags);
 	list_for_each_entry_safe(pos, n, &wb_connector->job_queue, list_entry) {
@@ -295,6 +303,14 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
 	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
 }
 
+static void drm_writeback_connector_cleanup_action(struct drm_device *dev,
+						   void *data)
+{
+	struct drm_writeback_connector *wb_connector = data;
+
+	drm_writeback_connector_cleanup(&wb_connector->base);
+}
+
 /**
  * drmm_writeback_connector_init - Initialize a writeback connector
  *
@@ -333,7 +349,7 @@ int drmm_writeback_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	ret = drmm_add_action_or_reset(dev, drm_writeback_connector_cleanup,
+	ret = drmm_add_action_or_reset(dev, drm_writeback_connector_cleanup_action,
 				       wb_connector);
 	if (ret)
 		return ret;

-- 
2.47.3

