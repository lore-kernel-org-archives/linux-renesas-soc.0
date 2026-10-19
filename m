Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AF54E2F18
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415570; cv=none; b=j4/2o1UzrHwlGg6Jm819vkN93JDxD8t2RKeGXACwxxEhfqTOwwvw3t3yTMpNg5AmS57k3jzi9OSuEASoSXODdbJtGVYmam+eKic1/xVJ/wFY8f0diA0M0eSqUbRs0ALUCkRwiyzpIK63c2t6hilRqvVCqwwaXolZT86TeHOxhEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415570; c=relaxed/simple;
	bh=NrouW+lVauNgON0jHseun6cAAxKf6ZXGanxiaBIsFlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwx4MIeYbl1P+0enn5+4ouMIQgXBJdpOduPWtLSyIHtS0BHjjRyfYUbpK73C916g6DZJVXTT7Nk6S6Y/W+280HTjTER/zIJJN0L48aTXcKdJKlNU31Bolm8VZ0bpqUn4cM8JRjmwuWgodPTYoPT2DUxEhW2SPl/iRawIfOU7+4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DyAgfWMK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+TnhXsw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DyAgfWMK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+TnhXsw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OlFA3305139
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7nJSSePe19a+M+g6PxMBInmxs8mUq4HTiTkNQcAnA0=; b=DyAgfWMKSzCiuNiL
	jxBH1qF2fgWAoPvlIHVI2vV+Vwwm/HyIEudioyHkcvJcuRZwTBwQbRb7UsYLHVN0
	3G/O5bym3ff+iN0CVhhlmybGoTxsrTuxJDnE9SCmfZhHOkHfXPTdGXwOznRSTaGo
	eIlv9qbe1EYPb5KSGFRaC6ZpZ+klf2NJKsRE99LmJFSJFuGQjjZWL7n34zSWKhG0
	OlQy8R37oxSW7ofDrE9S9urdhc6LIyw8ND6xY5jBFGy52RWYkHZMuB1XSk7aUezX
	kD2wu3QyLhX4uss495l7K9Om4J7FlgiLph1bBXYetwGlK23oizc6Zmc/tC3IRj4I
	aV8oQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf47h85p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:12:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso510274085a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792415568; x=1793020368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7nJSSePe19a+M+g6PxMBInmxs8mUq4HTiTkNQcAnA0=;
        b=f+TnhXswaxzTL07uRF2ymLt5N0Z1o4YakWhN6J/Blx4B5efWpMZUZE4rndids1LvXw
         gUP6N8avVZdeITudWjTstnnroX5DIXIbWIuOUlB2ST50VePCrJA1BwFEUcrI+bE3/y4r
         hG3RhIduvY2RnWZkcbcWOxx+z3egCagsAOx9dB0PwP0/V9o0TaVNBP3GMkj+0N8qOGzC
         dgUcGqXTOOzhb3mqjIsuIhB68Z9lCXugKQwQODQMZxIEauo0I5H/m+hkzwE4WvKaR4Pt
         75NB6NyD3u1Ey+ADAeY19bx+0Qii73k2E5FYo2UtKPxnp5bR87L8KxDvzy6nnNT0ZuIZ
         2RIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415568; x=1793020368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7nJSSePe19a+M+g6PxMBInmxs8mUq4HTiTkNQcAnA0=;
        b=KPrY9Kqt251qZI5UFfLO3TPK87PUnMKh59vDKs6s2C00bl9gYC7mODk6oc+wdYGEIy
         hof0aV6j6caORMWPggE1u+2qnkB8PE82YIlV1/kPIKbgNaBUf3G2I+rmnn4j1wDLD1dT
         bZml949F0XFxJEIboIIsYLgEp8gLYc7RsTIF8x9WC8yiDbCZqS4SEs4xi697Pux2sDiO
         Np1S5TnvtanxFmPK1Fhiq9ajBFEQPEFkBCEkk9NFZjn2CfF3OM5C/mZkCDVU8RCKZEyo
         w7LF9H3hfYSqpu3O8m52jg0c8rzDo/M9gJtyhAdqd2L4/hsLWV4pshe8JaKtZBj2TBig
         qLKw==
X-Forwarded-Encrypted: i=1; AKwUvBxbPJHS4fPpD+2VL6nj3IFnumnzFpdjDSx4oXy/iPDBhpVKLNNIuc+FXOYtpPkBsSsOJfb1hbX3nPOhxaIg5UzLrw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLkPN8ROuHPxSlzGSliQjlrCwQLirNWyuDxLuwn67I8AEH9WfTa
	E8R9Fu/acBB6ouaE+DOFmZ2OAIPwQHMLqfLSXdxV8aXhpcYI1NDJVPEp4LpM+ff35672mcQaHkK
	X4ebZzK0Cd/AcjRXMfERsRXrMX/V194fEffI29uoDtVchTRvrKcYai0UaTuGxuQy2flobZ6qh8w
	==
X-Gm-Gg: AYBFou2HfMFoZPGbRmBpUDUmH22oXG4hxwkh9UbHjYFO536/YMjo8qCjv/NHbHfkdd5
	T8q63+bdesiH6noAjzq7jgYY/TIolGPwA8RCZnyX9gpOhw8IISp4yyvZIjYwc7BgoafrWKHPezf
	pTGNO/F3stuQVMMWD9tZO9No6B4Zm9kCVrbDAl8vjkXU/V5f+i8dFEoAE2dd9EwS12HohNLIAyS
	74kzMMdG1RLozPx6DNfk94ueK7StV6srAc+Ty9zxXzoel/Nfl3L3uNnNWjD8uJLBKtqwTXOid+Y
	CWuICuR8EHey/8wzmKMBbocQSO8dGgKkAKHiLpO/r6+apCxkez+60b1XuN0WvtdrS/hr/KQIWjX
	D4eBdaQkZJymofbEHfO/CcPqs9DaUZwVkv/9981yqjmPYR7LfOkeL+RyPRTGjhqzrsiZ8/24ysk
	H5LXWNHdstdK7m
X-Received: by 2002:a05:620a:a2da:20b0:93f:2571:c317 with SMTP id af79cd13be357-93f2571dc9dmr860033685a.28.1792415567106;
        Mon, 19 Oct 2026 06:12:47 -0700 (PDT)
X-Received: by 2002:a05:620a:a2da:20b0:93f:2571:c317 with SMTP id af79cd13be357-93f2571dc9dmr860029985a.28.1792415566587;
        Mon, 19 Oct 2026 06:12:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab24f5dd5esm23432581fa.6.2026.10.19.06.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:12:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:12:28 +0300
Subject: [PATCH v7 2/9] drm/komeda: embed the writeback encoder in
 komeda_wb_connector
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-wb-drop-encoder-v7-2-d4288a26eb54@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3153;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NrouW+lVauNgON0jHseun6cAAxKf6ZXGanxiaBIsFlw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1hdD1DCtkA+u6NCRZ4TR9cfpMtSBKJoh68S5B
 5WR8CKWtDSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYXQwAKCRCLPIo+Aiko
 1fXhB/9ueb/k6E6h5LRWhJ/DwQxRqBdV5htWru57d+0lMYqSjcmijqPs+FZP0q9YXQds03fXB4b
 TfDAdzNVIeBJbUVpEHobAVDjg70zFwtbRgm2XVOUZBwT99umeLuU4Svk18tl90BRqdKmtPnm2y/
 z1HXgJitz8eANW4yE63Z/VCTngNgXcn/HFqj3U7LheWzUKeNZFeYxb4PWsJnM3qCqgLf/IIksTb
 /5SbNXJBEoLb2X4RWfvbSiImpfOkiznb6pfitjNpsQf2QLIzFCkvzWmEKX1d3t8QcrcuyOyWaf1
 CB4Bamk7lyQeGc6kpH/F6WedLX4owP8WHJEzNtDXMS8pPI17
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -bbY-lGsxEeEJybFbKURVmyDXd9XTff9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX8hBPqNV20KhQ
 HAt2zUKEfoxAFBAHX4bLFgo0kGj1/6jtc0c4RQI6Xa9f2EOriElC+MpjbY8F7/QM94G4sOJOIbo
 sghi0Tt3GrBCN626gN+9QGC+pEk8kWIdQ1SigiMH5TrIrjQ+KOyAd0VjYB7lDGHRXOGwgnqGJnd
 +MZMnT422XODjwWxnl3RTsjA7EZnr/RAu+eVWMEhLucHltniDRXOuqn6upOMYfbwfyOR6M2tqwR
 Qz1cuAxJUKdBMgrlqstLTMIUQ3mUsoHHA7VxgUV2cNuYtqpRgmeGbhteWS+gW96akp4MbZWVcws
 mkFqlwWGwJOZZeN4+njgJzCk6PK6Ww41vc0FXHZs6KOiLuJw+u8Z/dk4vNT+Cttoi82iW/BcSyi
 ndoHebIhHaF3PDAVQP1owcfrXKOQ6bqSLvnbBZsKoS6RuN18sp1OLTUY/n/WYPMkzBuzuLmczbo
 pz0sHDXsMxEzGuEqsqg==
X-Proofpoint-GUID: -bbY-lGsxEeEJybFbKURVmyDXd9XTff9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfXwEEdCL1Jizl3
 g26tm+tjZtobOULVJQe7a7OJ13c0+hISv2lOFMUxV8l27Gi71JUZma0OqZsfuGMNaMQmOcHois5
 ZqSj3wrOJHqmjWurvBbTqhy54v9biWY=
X-Authority-Analysis: v=2.4 cv=cLt1IVeN c=1 sm=1 tr=0 ts=6ad61750 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=eOsO5XS9GAZRO-ePzeIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190052

drm_writeback_connector_init() hides the encoder inside struct
drm_writeback_connector, which is the only reason that structure carries
an encoder at all. Every other writeback user already owns its encoder.

Embed the encoder in the driver's own structure and register the
connector with drm_writeback_connector_init_with_encoder(), so that the
encoder can be dropped from drm_writeback_connector.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |  3 +++
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 28 ++++++++++++++++------
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
index 83e61c4080c2..4d41681a834b 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
@@ -56,6 +56,9 @@ struct komeda_wb_connector {
 	/** @base: &drm_writeback_connector */
 	struct drm_writeback_connector base;
 
+	/** @encoder: writeback encoder */
+	struct drm_encoder encoder;
+
 	/** @wb_layer: represents associated writeback pipeline of komeda */
 	struct komeda_layer *wb_layer;
 };
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 4872253a2449..77aecf4d3f09 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -127,6 +127,10 @@ static void komeda_wb_connector_destroy(struct drm_connector *connector)
 	kfree(to_kconn(to_wb_conn(connector)));
 }
 
+static const struct drm_encoder_funcs komeda_wb_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_connector_funcs komeda_wb_connector_funcs = {
 	.reset			= drm_atomic_helper_connector_reset,
 	.detect			= komeda_wb_connector_detect,
@@ -170,18 +174,28 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 		return -ENOMEM;
 	}
 
-	err = drm_writeback_connector_init(&kms->base, wb_conn,
-					   &komeda_wb_connector_funcs,
-					   &komeda_wb_encoder_helper_funcs,
-					   formats, n_formats,
-					   BIT(drm_crtc_index(&kcrtc->base)));
-	komeda_put_fourcc_list(formats);
+	wb_encoder = &kwb_conn->encoder;
+	drm_encoder_helper_add(wb_encoder, &komeda_wb_encoder_helper_funcs);
+	wb_encoder->possible_crtcs = crtc_mask;
+
+	err = drm_encoder_init(&kms->base, wb_encoder, &komeda_wb_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (err) {
+		komeda_put_fourcc_list(formats);
 		kfree(kwb_conn);
 		return err;
 	}
 
-	wb_encoder = &wb_conn->encoder;
+	err = drm_writeback_connector_init_with_encoder(&kms->base, wb_conn,
+							wb_encoder,
+							&komeda_wb_connector_funcs,
+							formats, n_formats);
+	komeda_put_fourcc_list(formats);
+	if (err) {
+		drm_encoder_cleanup(wb_encoder);
+		kfree(kwb_conn);
+		return err;
+	}
 
 	/*
 	 * The writeback connector is associated with a single CRTC. Make its

-- 
2.47.3

