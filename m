Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357800;
	b=fuzyxGI0qLXxwVRGT+mjcNb1jEd/0lR5tbbdnOqzLX4LSALTH/3MYwTWPyDVi/l6VBBT
	 +mpvmQ3XG/v46ivWDiFk/MULyPMw5KM3opDpq0o3xy1GnEtdQ7MqBGWktPNmpTVIJdNMJ
	 ah+h0FFUd7DJdG1q4oo/WluKefHhI55Ww68WdLxzafRmoqZ4/bfGklQ6u8Jfxhk1WOizV
	 uKVykrpg4h+68m+tLblLUKn9mLHwNgaakszHwIAI3OotkrcwJkPIBPJ+ooyfJMIfiIHE7
	 /1ohlrjfERr1+mgK4e1S3F+0srRYFNMJLvt62YZP5EhUskgiHnvX/SbLzqmnR7k8tOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jDY4R6k/Nm1p1S0xEhbA3aSwiXunRz/voblMx4e/CvA=;
	b=xqB+ruMbaP9NsW2Uj+h21IIy7QNyqGMz/8rrOF2KTld1dwR8l9PQt/0oLX2cnWuwT9qD
	 nIiq+5TEOBs91S6T369wM5VT3VDegvS9XvV7M0ZavoT/hEtbvehHpUsYUsdR+HfmtHysN
	 00JpUqpe2GRXil6UTlERGAD9BRyGieoaMNDaeVGMcyNG6ZZTyzKxpJzYGlhTa9lZ1lvHN
	 j3YSo0ePgkuht1YcWcnUX3wT+T6akwVgP3VmaVueYbBgzfJUQwSimumSO12XLQzNqRVPy
	 km44D+159Lbozs6weyFyAWc6fhaO+7WpUzsmeO763C9O6tvK1cluxXIXhWKwx4HlfPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RpxXNdvG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aKwxL8fz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F990606A33C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F990606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RpxXNdvG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aKwxL8fz
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB0FFh3725838
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jDY4R6k/Nm1p1S0xEhbA3aSwiXunRz/voblMx4e/CvA=; b=RpxXNdvGJNyU4xIK
	Yn23v4rvrdzJEam9XSUDSFW44xiRf1LyML+rXyR9eoxnqBhbDw6hg1kgqZiqvgTz
	6P5t4O4ixOBNE0E5HqVjTkgFBgjtsxo+0iJOmtmeOAYoOrjd/VvG9yWWlVI+MiTk
	wWXmrMOV6MLxuWeRNDQQLZS2Bzetp2LKAUSsksgrkAOdbWnA8MaVf7Kf8nf041Uz
	3dZbLT7EGlK6XIsuuE9HOMLNwkV2znTO+5pn5saAwV3t8i9eh2YXQNagP+mXQ1gi
	deG3MTm0keigBQeadD+AmDfEal82BJmpKrMGSd6uLchz0kVczbR9CwJNlpa0i29o
	gbbAsw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm82ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f322ef7d3so616422785a.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 16:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357797; x=1794962597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDY4R6k/Nm1p1S0xEhbA3aSwiXunRz/voblMx4e/CvA=;
        b=aKwxL8fz+EUCQq160Tby6ZTRsijjyOZNQJowGbEvL3bLaZ0ApbhRwiF1oGnYlXf1Wc
         aNbMFqgGjowY+AvxDx1bXF0rl96emLyxhxPQiBw1B6nIPZpS5dz8iy+OwpqY7v+FMaz5
         QfK5ai/vXEmw3r5xSOd+G1+mwt2Zrc5oWiRA1y+nPxpIZvCathxFGgIb6Wx56GqumbPG
         qdBtMu3lPKHAwaPS/ap4KL1ZbcNoKc66LokWbeaH9tAh2cDUEQELr109K8+lmVf6zBjC
         FtEbPvd87QBHw2hEktCQR9RWZ0UPHW3kf7Jw23LgmG2ssUz8qkGEcEeLYg1SxmBJWN1F
         O1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357797; x=1794962597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDY4R6k/Nm1p1S0xEhbA3aSwiXunRz/voblMx4e/CvA=;
        b=hewZ62yb4SKaxDJXTf9wjzIxwpFXnhpqYL9O4TpXaNiUPbPlwrgg6vbyG5MnePA73Q
         y8R2sUrx1JJLIacxqPMOIZ49sw4PWI59AZBM/IsNXrQWis8XF6l4FneWtKWKNKa1Hhzq
         0qXHp5izjtkDmO9TAzH2nfQHCQp1dbgj1rTJvfd//0zc08Rk7Ta2ybNmg+PVxR73TTUt
         GUvY0NtLFZBcbpR/Lx7vx1FoDAcbgoLL83MHC3hVwC12fadU9UvyZBurV9A1H2CSHR/d
         AO1Zka7nKmTe3hKzWx1qAak3YSdTEaaV7zUmWpohsDB+k1zmGvKg8dNiE200oOZ81JSN
         /csg==
X-Forwarded-Encrypted: i=1; AL+hErG5XLeBjZ081uabWa1E4DJtzQw8Y4C/XXUqktCwEKZngriLs98ids458DIsuJnndKKnnLF1uoiQ0qVhCoXSJ8G6ZQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8UnKlbhD/t41OJu23AjZNp1OW0kd4+dcRdJHlV65OR7UUK3NS0
	W6aUxbkqQa7oQkqCc3moJiyj2GBqTmSGW90LyNqUubi5DKe79F1SIQLt0MXvApGA7/N6JY5OQ9g
	MfWO+k8RLZ3dm+PQoKtbP+UT/O8IBb8KeSBL3QsoMQJvjqldJovx7bs3TABOzFPgSwLMBVAdNwQ
	==
X-Gm-Gg: AYBFou0PhXHldnnklm9XCnJpZ9doMbBXxfbvi0Am+3fky7nVwc+Zcg/W9b1mmOQI28H
	IgHbfMPLeO4lmhyQC4FWJS57fXxgAc8Mfwd6jnxU5QCnrAqaDY4iVDdY8MoqJ2H0vZETY1qznrc
	t77RTZAK3OepDB3n/DCWec09AmsUtoxMyggoPsM6kWyMXl/GFTnjOtXGI/MCfiX9LCU2Wc49gXe
	1O7cY+fZV+tATZK+6y8IInSTXTe6YVSwVdtnXOaBuMymLvN2QfQw1Yn2QYArwZkJaqw7olHPh3Z
	q285pDEGEb5ATf/+/b1AQKY0ZYUwCkCaL+YMe2o7rW1W2D6TIl3BYiYh50PxrWUBg5SEKd6FjBS
	yg2r/A8lwU3Nt+3+RLnGspJCWUDWKJqq32peCihXX13ejKqUH19XXL8TUlR2iKtrAA0JXUid6TH
	BugUwBnjnqXx6CqNO2H3PVdu4+igrnJswl1Gib7JiupaoMelkd8KUhXJf2sR5baw==
X-Received: by 2002:a05:620a:4452:b0:93a:2e8:5aff with SMTP id af79cd13be357-947aff97f54mr127298385a.21.1794357796041;
        Tue, 10 Nov 2026 16:43:16 -0800 (PST)
X-Received: by 2002:a05:620a:4452:b0:93a:2e8:5aff with SMTP id af79cd13be357-947aff97f54mr127295885a.21.1794357795520;
        Tue, 10 Nov 2026 16:43:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:34 +0200
Subject: [PATCH v8 05/10] drm: writeback: drop excess connector
 initialization functions
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-wb-drop-encoder-v8-5-62948ed87d13@oss.qualcomm.com>
References: <20261111-wb-drop-encoder-v8-0-62948ed87d13@oss.qualcomm.com>
In-Reply-To: <20261111-wb-drop-encoder-v8-0-62948ed87d13@oss.qualcomm.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4493;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QEKNuuMhXPGLAYB0Q++KZrnkiKauZVjWcJRHipLfbt4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oM13PxAyI1w9bgajKA46sMEgojpOcz29Dac
 FZ/7CEv9iyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6DAAKCRCLPIo+Aiko
 1cU9B/9UwbZgTFXDQaVSVNSllqahNLCWJgRpFNU+7Iiog9h+C/GQIabCL23UCJwXfsNB6SjPzRS
 MLaXT0agcTPNshHkhSLFC0w0JRAIVcghV6RBP6FVLX0NLR/U/4MLH4C/sEvX/pjfAMsMQgU5vZQ
 Ta9x/RX8m+DCAud8NxSzzPDewDXaUY1+oygjlsPpCPV/b9RuOfO/w831uCHn1EL7N57SrkQqMOP
 oBX383nwP/aUBhqT4XIi7x6OPH4StzxKATQp/oSF6XmYkq/EtQzUCFbADoUliE1+WCb3gJWS1Ul
 cnkMel2fRcQeVGefitJlHJBspLqie1TRY5EEROfVgsVgroM4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: D3dzKmjF9K1lzD2ZKCaB4d-2WHXYuMoR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX1WukmvmhCo+M
 T8lNCNrMplqba0H3evDy61vA1mkytVmhMP9/Juvj0Co2h2+VDaFba9DLbzgK12Qi83dMwPD1n63
 H2dw89zlH81GD06HiiZAzOTRlG1ZgQ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX8srgphb87cE0
 TsUix/LH/a7WClA0ijgCDq/IKPt0bs61UAcr20HBbTHMOlwMrXUpSWvk9V/zKbu4tt4yYYonLkM
 b0dmRhtgMnweKmTi67L25rgRFBWNE6c38nZ3GJr5mA4TSkjEStPL/zg6B9uEmnTvUulaE19y7V1
 jC2dxxlvIHv1ewl/0kcjJQa6MESfL9pu/nijek1PlNBAYjpgWhmKm8ddBZzCLUAIv62Nxi0rDtg
 6PeiEXkhuUYIYqveOi5IeAN5WfhBWD/cD0n0oiLqvDfFt7IRIsTrWSGcFcB0tHzJwUg/rm4BV63
 L6kJpZNqQy6gm3sbMJfs8DbNlw6ooQARPQPdF69qPteYsotilwTmRI9WB/l6A82/KUCAgKzSelj
 uaocEBRedG5qiceIFEF0p6NiSLDpHw8Wb2WT/urZXaj2+ghVfUMS5ncKn07/9gxki5GX40ck/vN
 uQUTPops15lOsM9tkig==
X-Proofpoint-GUID: D3dzKmjF9K1lzD2ZKCaB4d-2WHXYuMoR
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af3ba25 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=3owybDqXPaZAjLikVYcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110001

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

