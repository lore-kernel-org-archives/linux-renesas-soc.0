Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8314FE2C1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415583; cv=none; b=bVbcsbMHAtJydXJeum3J7agQTCFdjLYcnLWVOfj9ZEtL0zWmWkHVL5wGrcg05gsaQnx7cxPCLEHTBd42HCoQct9vlmzYoQ40tPe9hbdpK5viFYqA2r6wEKh/b6xF7LKOwKusL+H7FIB73JANn2T2FNWtUVb0qOZppDbzjTCqmHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415583; c=relaxed/simple;
	bh=2Zej5O7ExLkwUTDnTxc5Jd78WTqAYj7NBjmMvIp3tPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJ5Tv28rBFXCmQPJ/n9TVK1UZXi94IjN5wzeGqRjkTRg3rzHZszNgDjZBHuy6trEMGzVO4nS6PEoS4pgzP0v6Ii5W7C49wCLY9vzemiIBVhh0UpsSjy1ATEBNhk6DN0H1tytCLs6zsSMKKWoen1feJ27VPnObynPAUwcgBAxs6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mled32G6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8OnzhFQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mled32G6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8OnzhFQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OqYa2234278
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8uYiD1zR8PWqA+IXJr4jAlo8whu0RLGrHQ1RLoD/ipQ=; b=Mled32G6JjyaBNfj
	AyyWTfqwWr3YUkUoQWm7vVykiG9KY/+2Ot1APmujhff4/bo9wMq62WXhaS0Kk8xn
	4h7xGyC9vZpwUgGVRenliwAREGESf6eb/pMR3ZlfbXC/laP4Nv778VKbDtwo1qDH
	I+vbY6Nuau8q1Ed+qIINX7Gabn6UZ7SgrwDZFv4981sTzFbZGfwaEAJuKj6q9Eru
	dd61cdPdUENiRc4XyD+pGZ/U/Y35VCta8W4sGWEfFynWCiL2YvSQUeigZ33GNPcJ
	YylvuBR3l3DeMQbTqZE+3B3dlwI9+gFjA89/Kdsjo1BwFxTo+eunJb7aflik4q5q
	p0JjIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x987g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:13:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so488649185a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 06:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792415580; x=1793020380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8uYiD1zR8PWqA+IXJr4jAlo8whu0RLGrHQ1RLoD/ipQ=;
        b=J8OnzhFQ0z/KoUqkIbmEyVq0kUq/3ZUc5sW3H1gD8qZEL8y0/p4KQwT/4qgsp+3cRA
         2SRl/py4swlIxOEE7V5kJxuJopcoJYImgrqr5jZTRa0321YK8FbGbrxiW4iyHRFcyJao
         jjgPwcM6MFSdN3nIxSy3BRzv7ynHVLCaZ8ThDtqT+dhg1e/34++oSRwMvtJH33cetyjL
         5L44gZyvUfxtb7LOYRxh5YmJOFjRcPb1S6osMHKDEMJ4+Jkx5M6hFqYTYrhYG+XDHIsF
         i2Ziw2bHhEG6JjQqT9NcFaQGoZA0kYbOxkx0AwtuRch8U7JWOeZCqwoFOGNF+XfDQVmT
         wfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415580; x=1793020380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8uYiD1zR8PWqA+IXJr4jAlo8whu0RLGrHQ1RLoD/ipQ=;
        b=EZEqeFH4HiuRT5X6cYVQggAmb9h5CpjPwi0Cufu+ONSDoVCajZFqgaB/qSYhOBruaj
         JP+FGDtL4nOzV4D2Q7u3juLIECnmxl/lxS/Uf2/AEt/R9OuxM7RYv//74hQiLuwObCYc
         Q367Fnfh6MfuJFLEoAuBR6G707TJ8ScPJic6C0h3sadrK2DmrKz3XMuSXBmS8B+T7qBJ
         PtEHxXBoDMUdYRqd/uvdBdND10AV+IkMx7n869n/qJI23ZC0k+v3pSg9Z9y21RT0ODg1
         D43OyNR9tKHa+dMrKhkSHihoZPOhcHNK0DkfDj1QXuYs2UdUWTN0lB8D+JIEmHtNhwH2
         /MMA==
X-Forwarded-Encrypted: i=1; AKwUvBxTgHZ24UoveTci5clehdIMsVMNCNY+CkktzS0v/h/Z/QVEZkbF1rmMJSkKY8iettD48Isfrr2mmR+diXgR+fgh+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIDTm8H60nwhPfzj1ip+/o3SFXILkHzS6oNekEjCu/mKs4xjedV
	/fqi5m31m6TkYDfekchgrblJFEVn5ZAY1OUb31sSLeV7rC7jROrL5HcelGs8XVSFLtPzeK2D61p
	YSiMJNieAVpGK9qGuuIKix1v/W/GAx7sIZ5kmpzcIahwYb/3su0RQOfMXVt8FL3EpQrOwSuruKA
	==
X-Gm-Gg: AYBFou19+AWTiKe7W1q9dVntK2msgPHGJWCu6/zEcpU8eYFFyhRoV6gx/lvsy078kmt
	dB4tZ6wmFheNDP1qklO+NHa4y/0UxRFr6+CqJglCjmBJFegeLLt+COw4jTLHa24XEs5YEeGRql9
	FUl0TGYWrGLvlRfD/Ow2vfkiPPc43Q5T4RzH+ReotRTKTaceS+XJEigKxaqYopTRzyC8gN7Zl6u
	YIqnw03//L2qIZJT7Pgcx42qs2IGmvkSxEFzOn8kZFLr+qROhyEyHSI+wLV7PQWSjqeyrcD4qDi
	Gikcq8xiJfWyZ3687WqL4giaA1dLaPNj9sQ0xMoQmHXpXCIpBCCNS0b8jYi1kIj/unIGkIzfVcg
	OFxckLDDfOs38gSJC1RtWfjj8Hi8qTio7rqivY4jJaaA9tmSXWcMgHmXph4mOT/ZcAVjhNhEFJR
	ivqxK2hyHNpScV
X-Received: by 2002:a05:620a:258d:b0:939:6dea:374d with SMTP id af79cd13be357-93f29d813camr1296666985a.49.1792415580363;
        Mon, 19 Oct 2026 06:13:00 -0700 (PDT)
X-Received: by 2002:a05:620a:258d:b0:939:6dea:374d with SMTP id af79cd13be357-93f29d813camr1296657885a.49.1792415579701;
        Mon, 19 Oct 2026 06:12:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab24f5dd5esm23432581fa.6.2026.10.19.06.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:12:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:12:33 +0300
Subject: [PATCH v7 7/9] drm: writeback: don't destroy the shared writeback
 properties
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-wb-drop-encoder-v7-7-d4288a26eb54@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3846;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2Zej5O7ExLkwUTDnTxc5Jd78WTqAYj7NBjmMvIp3tPw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1hdGkXVsaMk0ehYPLXxFiA1cFN/d3bH+A07XC
 lUMPwYZynOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYXRgAKCRCLPIo+Aiko
 1WRbB/9NUG7CeTReAc0FKzhz0MyBz7QbY4MrFFfNvvhBum3bU9bVXSY5lLvDJOv+eQGrRIEYr0A
 Wht3myxvsT9p4KA7FuHBbypT8dTUkTfqvNAfunta/L0EVopF3LYYYE8sAwOoIoNiRj7QMvg5yHN
 w+IN7FNEg/mvYIsj/jNPTeEZMw7BtIk8Ex2i75SW3kK96lgawPa8tYPyBtldA2HpSrigCiCEmKZ
 P7Of6pFxZ+sjstB3mRZZTSYAsbwrJeXjNgqFxgLC1Fk9rUeFmFZ6peE+SaGrNRaWt9/bXlyskFQ
 3vAbovOYuH1p8/8YJ7ETKN7m/xoesebwhyCz5//xFdYixyUr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: SFaB10LUuIJBzYNnyxvqWEK2gOIGNhrp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX3d6/EpWuHotz
 prU/V+LDpurwJ2BRQi4ARW0PZSIn62ceYCU35Vs4E945NCiCdYx+GeoT1H6+O3ZZ3Ag1n4zJOK2
 LBLCQUky6KVRr9sO0lqFLd6zmn1NGVk=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad6175d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Brd4iQZBKng0vAjXyHYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: SFaB10LUuIJBzYNnyxvqWEK2gOIGNhrp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX26D3lLOnV2Cg
 U92AMuNw/Vtno8bE+vrMNVyLQnpUPlTHSrZDg3a3qBaEyuGmyDxXrndEmqAwasNqO7C8jarGJlQ
 WB20NmQtAQwgwTKLvtqnyHpHRSm6OIdomulbj2qhyN+IDVg2XOxsU7+qtPdfm0urUqtxq23xvXA
 MVVPhepFY97pYDZmuyrLfaHJ0enUXTMukUEE1RwnEVUCYu7V/Uos92cMsCti0xp8LbQV9BJYk6w
 KesM87hsHvB2aX9BxYWUNWcp1o7WflS2HkkXekEwtJu0NhLwwJWQLRUBAqhxLK6S17265AdPgff
 qGfzeEHQkuXfutaeR67hVwQP0LXcj4t2YETYZFvWNR5Amcoa+G9XYJZU7MjB5cTNXFicXJ1TAwN
 WjxnWfHqBPNKjWFd3HIv77mfbfumgvJCVcf2oIDJsSrTzd355BLTvho5Kb+NWQ5JQyobtJRuZnm
 pe49Jnh97pCg2/9HEKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190052

The writeback properties are created once per device and attached to
every writeback connector. Nevertheless, a failing
__drm_writeback_connector_init() destroys all three of them. If an
earlier writeback connector has already been registered (komeda and
rcar-du create one per CRTC), it is left holding stale property
pointers. The drmm cleanup action likewise destroys them as soon as the
first connector goes away.

Leave the properties alone. They are on the device's property list, so
drm_mode_config_cleanup() destroys them together with all other
properties.

Fixes: 2f3f4a73631b ("drm: writeback: Add missing cleanup in case of initialization failure")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 34 ++++++----------------------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 89c36f1414ce..2f6a7b50336c 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -148,22 +148,6 @@ static int create_writeback_properties(struct drm_device *dev)
 	return 0;
 }
 
-static void delete_writeback_properties(struct drm_device *dev)
-{
-	if (dev->mode_config.writeback_pixel_formats_property) {
-		drm_property_destroy(dev, dev->mode_config.writeback_pixel_formats_property);
-		dev->mode_config.writeback_pixel_formats_property = NULL;
-	}
-	if (dev->mode_config.writeback_out_fence_ptr_property) {
-		drm_property_destroy(dev, dev->mode_config.writeback_out_fence_ptr_property);
-		dev->mode_config.writeback_out_fence_ptr_property = NULL;
-	}
-	if (dev->mode_config.writeback_fb_id_property) {
-		drm_property_destroy(dev, dev->mode_config.writeback_fb_id_property);
-		dev->mode_config.writeback_fb_id_property = NULL;
-	}
-}
-
 /**
  * __drm_writeback_connector_init - Initialize a writeback connector
  *
@@ -198,20 +182,18 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 	int ret = create_writeback_properties(dev);
 
 	if (ret != 0)
-		goto failed_properties;
+		return ret;
 
 	connector->interlace_allowed = 0;
 
 	ret = drm_connector_attach_encoder(connector, enc);
 	if (ret)
-		goto failed_properties;
+		return ret;
 
 	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
 					formats);
-	if (IS_ERR(blob)) {
-		ret = PTR_ERR(blob);
-		goto failed_properties;
-	}
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
 
 	INIT_LIST_HEAD(&wb_connector->job_queue);
 	spin_lock_init(&wb_connector->job_lock);
@@ -234,9 +216,6 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 	wb_connector->pixel_formats_blob_ptr = blob;
 
 	return 0;
-failed_properties:
-	delete_writeback_properties(dev);
-	return ret;
 }
 
 /**
@@ -295,8 +274,8 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
  * @dev: DRM device
  * @data: Pointer to the writeback connector to clean up
  *
- * This will decrement the reference counter of blobs and destroy properties. It
- * will also clean the remaining jobs in this writeback connector. Caution: This helper will not
+ * This will decrement the reference counter of blobs. It will also clean the
+ * remaining jobs in this writeback connector. Caution: This helper will not
  * clean up the attached encoder and the drm_connector.
  */
 static void drm_writeback_connector_cleanup(struct drm_device *dev,
@@ -306,7 +285,6 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
 	struct drm_writeback_job *pos, *n;
 	struct drm_writeback_connector *wb_connector = data;
 
-	delete_writeback_properties(dev);
 	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
 
 	spin_lock_irqsave(&wb_connector->job_lock, flags);

-- 
2.47.3

