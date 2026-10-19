Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01FC4AB1A4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415580; cv=none; b=B3Gogys0TW0Gy/5gL9JxeQ/l+Ow9fwPzcEzfvkCXKXamDKDgAZnGWlh9Gf5TKfsVuO7PX1u/XEKUYb8xG07/LAZe/1RF2oL0EOALZbw9FTD/5xvOPgt+nLCUpIiDYfEAGLvYmUcykgQcqOBB73bfMvgfwrxt+mGFGcIMZDJYB7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415580; c=relaxed/simple;
	bh=QEKNuuMhXPGLAYB0Q++KZrnkiKauZVjWcJRHipLfbt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lyJxxovTanlaUU/ahsrQsLxp5LCDUAa0m3Fz8C3KoDFi2IVBNw+/SXKAucs6OXObydi+HN8eB0zGDTlV7Sph6Q8Edu2tXuja7RqdssCgFw6lmkpzh85HMVGjpS7mvTYAg7aG1Ss4IFQZ31yyGxWhy+p8LdwOYdl5+uC8p95OKas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adOHELmu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6Sj+qIL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adOHELmu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B6Sj+qIL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OrGH2234322
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jDY4R6k/Nm1p1S0xEhbA3aSwiXunRz/voblMx4e/CvA=; b=adOHELmuvYRzRZ9i
	Tw2UQQThdT5kHnHFUtGCbgVNyWMhVfnmuNiOvJ4jfQ7peT3GUgn21K4MdsqlTrK3
	BepVjbg77yFm3daWLGfy8zr9FDr8BqcZRLag4NFlcnzIFPeKBnmncfft8rfmET8y
	tYXrPZs4DwQ0xjeEjcv0Do2ym4GkaN64zeaquqa0EfByTZCeR2KKCZ/VgguS8bXg
	K81jYSSecBPRLKNFb3L6oKMuwZkvmTFEK988wRopCUyOTyMFL9yav6dNlueUZS1T
	4LDtz93jFoQ3KYw1tx5GuIQj2sTEhy1ZW5ZOsFQK7sbyBZambDTBFVqw3M3UoRPg
	kDGU+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x986y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:12:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939c30aa9a0so227133985a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 06:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792415577; x=1793020377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDY4R6k/Nm1p1S0xEhbA3aSwiXunRz/voblMx4e/CvA=;
        b=B6Sj+qILVCKGQavh8ZKDYpYS2wbjk1xdFPHt74MHtcio6PybVF88X9EuTFrlJ0BQBp
         DUajEwCCpLVHrGKxDvLhZ75jZPODB7RupS+DQC/8KQwabv1F6AgtCTvXXmHa14iNYAfc
         Wd50w8EIt3nG7AZhZzff6B+5Xz66zDcB4dQJr6fiVlS4hfqgv2ZaTdCwUbQfewfBRkzK
         u3iVPdjRYeOQvFvuKeM9zMIvbrb4VxvnsSrh72POVrCaghJqdv9/yUs3MuJ6LkKre0ka
         aSTnJNiLxrHaaCAZ0EX6YeEt0XkVaE6Qub7F/2cIKhq6P3CSYAA7zEhkr0aJdGefIX43
         s03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415577; x=1793020377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDY4R6k/Nm1p1S0xEhbA3aSwiXunRz/voblMx4e/CvA=;
        b=ReP/YyHkLmJVoxRE8OU9uLS2Sz/l7zdTJtLqEoQ0UuICf5KeGOCLs0o6ijldePwdlB
         uatDbNfaqCNOpzLv0wbGMPAPNEZ+hWG5MufM83vZBYhjoZc1VOtZER/g2XtxtbObQuR/
         Tsd0fn7enbyvGxT9d/EMj8/1mrxRp5Dh5aG4yEed+R89vQmrCdKuOIYWnXXJoGDWh3K0
         J0NzSV1p1xSQo0OpCLLk7lJ+ujs6WtFaBkxhdc4vlyCgXi7FJz7p/8DesiUnOzFiH52F
         cDzpH50roUzYP2Cr3Rz3VpUUxswvck55UtfO9WCkaDbJgf7WrJHZks2ekDMSEzv1rHQm
         YOfA==
X-Forwarded-Encrypted: i=1; AKwUvBz4Nt+6qs/ELCC0qCLNoCZ9NGfIFRDK5MEBbIElPO677zCemVC70bA2mJEF5DZu0VL7Y1YQcpTbBKxIDWW6bk9oJg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJw9rR6Y311fyQgHxvUcrlIENDbcUqqNhLhaYnHqepAduFaXOQ5
	kUZhckZ/fdGlUjlNzRXcWRoY2l/Rs+0TkLNgX2bs5IS5bTWLeGDDqigNfnLvXSglfnvOV4nBqga
	KcM8AMmrYpVulEneOuR84sixf0BMtOsBd13EzO17d2Qu7i6iTk4oVHiUin5Duz9R46C8z9/xNsA
	==
X-Gm-Gg: AYBFou31WHVCNpcWN2m5vnPxYpzbR9ZTKgDusBgJ4SDfKARQ5JtTuqyNw2jTtLjfP1Y
	hccDNcKbX4k4f3GXsKhG+TR6qQUpqZ19WabplihqPRrRPhOWvTTNB8QKfljghRE4D5DqKIZmZN5
	hDZvyIMvU/LSfgmiLwIbY2X2+PHXSfzypjGcWDAPe0i8HIMn+dMFSKMJ8LHQzNVIiz9H1esv+DT
	gw+8fwndams8BLg+qqebuzhLWHilrQNPPEeJR2LBOT+mWKjB612lXRViqTV+3tlPCOmsj7KtfOb
	JsLmuPKcrso4M2u5xulwHSlQ1XpsvuH3bmrgoVUIXCVuOywpDpUTsa/hNaYS8nKyFrFEP9ORaN+
	f2mAw/oENmB+j+p9dEdh4X74r3tJqUEfhDF7BgxUY+empYKnEdB72S40edJQQ9Snft7ctT/sxKX
	uxA7OykL7JC07n
X-Received: by 2002:a05:620a:1a20:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93f29cc7983mr1348474985a.26.1792415576464;
        Mon, 19 Oct 2026 06:12:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93f29cc7983mr1348462685a.26.1792415575701;
        Mon, 19 Oct 2026 06:12:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab24f5dd5esm23432581fa.6.2026.10.19.06.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:12:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:12:31 +0300
Subject: [PATCH v7 5/9] drm: writeback: drop excess connector
 initialization functions
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-wb-drop-encoder-v7-5-d4288a26eb54@oss.qualcomm.com>
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
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4493;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QEKNuuMhXPGLAYB0Q++KZrnkiKauZVjWcJRHipLfbt4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1hdFkCB1I0mJpJakqeGM2PCp6MQe20cpN/1ZI
 prHiqRY8pqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYXRQAKCRCLPIo+Aiko
 1X76B/9WHBADywt3zJKdEWe7Q+mdyQgpR3U2HGDdQp2sC3yDHaRZpQy6ejouNHEitQaWAuJNEz5
 bYlUPNFzeRIBEoagUceaCcfEdBCvPHTQ2PM+RkP16t4MoWeRvERwOQNtnO/Q15L6q0rDM1POQOV
 hmM7RVVECywRMAqjvoXw6E2QCgpuYzqXuwJU9u81hSfHu9YlYDNWQPaGMf4OUtLEubJXz1/86FK
 d2J0f93x7H6R9hC4NLoAaJHlchceIMBtnt1mkwv+r19tIJ9IMIT90Na9bkYs/+Fbu7uiKsNXjxH
 Z7xZf2tg7P+QtxspdCaNbMEucndaLXupgnlsnXEy8+PyZr8Z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: EzG-Oav6m6Q3nb3tid3fyPJK6ffbjPUM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX7G3e5l2Lr5ih
 tnuMj9dQl+Uw4P+vgFYur0LKbWg+Hlzxdp/XUXMby/p8VwRe1+cvHUplGD+41LyA7wT+tiDpC4j
 0PnuYxgQBzvG8l4iQRaz2gQB9Yltc/A=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad61759 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=3owybDqXPaZAjLikVYcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: EzG-Oav6m6Q3nb3tid3fyPJK6ffbjPUM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfXwLQy23VYNiUY
 qNLIQI4kSJiW/DBt4dZQGCprEsZ1k+wpsMX9HvvMoyqd5Pyg7jj/N0psJjM03elZN/aksSI2KZ0
 N6NaebylkIBL1Y2Pya/H7CeB+0+rQP3Li6n5rJIxCaaJN0/QiL7A+1eGYDYsZCy1AgkXNjDctWt
 oQ6n36MwKDLx/N/NIeDjxWsWuZuoKBIDm+3TTD0LnIl7ZaN19/bg/7wzaX5Yhf2dFI0OlkZntsf
 ts4ddpkmu2bp6ADGqLu7U/F4cb6FwQV6Y0P9PkHf0F/yVhDGevh1E2NSeyjxxUXdSvT6w1Mtb3L
 A8mrxnq9oBHo+SsI7xjWw3hxcvGneF9Fm6jr5KMv/pwqvwEjONt1OAB/+O8zamhbaQSe+yHySYg
 kftneb6EBJPxl+ygNM50zePY7ZKTIMyiqw+mqEGgz52O1MHtupMbbe3VInzK0T5w9/C6Wf+HzxZ
 H9f7Kiad8y0fPrM/naA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190052

Now as all drivers have been converted to
drm_writeback_connector_init_with_encoder(), drop
drm_writeback_connector_init() and drm_writeback_connector::encoder
field, they are unused now.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 55 -----------------------------------------
 include/drm/drm_writeback.h     | 18 --------------
 2 files changed, 73 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index b4a002e6d043..683da368e339 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -148,61 +148,6 @@ static int create_writeback_properties(struct drm_device *dev)
 	return 0;
 }
 
-static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-/**
- * drm_writeback_connector_init - Initialize a writeback connector and its properties
- * @dev: DRM device
- * @wb_connector: Writeback connector to initialize
- * @con_funcs: Connector funcs vtable
- * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
- * @formats: Array of supported pixel formats for the writeback engine
- * @n_formats: Length of the formats array
- * @possible_crtcs: possible crtcs for the internal writeback encoder
- *
- * This function creates the writeback-connector-specific properties if they
- * have not been already created, initializes the connector as
- * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
- * values. It will also create an internal encoder associated with the
- * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
- * the encoder helper.
- *
- * Drivers should always use this function instead of drm_connector_init() to
- * set up writeback connectors.
- *
- * Returns: 0 on success, or a negative error code
- */
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats,
-				 u32 possible_crtcs)
-{
-	int ret = 0;
-
-	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
-
-	wb_connector->encoder.possible_crtcs = possible_crtcs;
-
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
-			       &drm_writeback_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret)
-		return ret;
-
-	ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
-			con_funcs, formats, n_formats);
-
-	if (ret)
-		drm_encoder_cleanup(&wb_connector->encoder);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_writeback_connector_init);
-
 static void delete_writeback_properties(struct drm_device *dev)
 {
 	if (dev->mode_config.writeback_pixel_formats_property) {
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index c380a7b8f55a..879ca103320c 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -24,17 +24,6 @@ struct drm_writeback_connector {
 	 */
 	struct drm_connector base;
 
-	/**
-	 * @encoder: Internal encoder used by the connector to fulfill
-	 * the DRM framework requirements. The users of the
-	 * @drm_writeback_connector control the behaviour of the @encoder
-	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
-	 * function.
-	 * For users of drm_writeback_connector_init_with_encoder(), this field
-	 * is not valid as the encoder is managed within their drivers.
-	 */
-	struct drm_encoder encoder;
-
 	/**
 	 * @pixel_formats_blob_ptr:
 	 *
@@ -148,13 +137,6 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats,
-				 u32 possible_crtcs);
-
 int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 				struct drm_writeback_connector *wb_connector,
 				struct drm_encoder *enc,

-- 
2.47.3

