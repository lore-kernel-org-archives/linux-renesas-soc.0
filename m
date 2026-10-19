Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D3A4F55AA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415568; cv=none; b=Kn8Oe3fU94nkeLJ6Xg334T6Ra60Cmb4wjbMQqmlx1FrspO0Qmf3mgmJH9w4ktVW6yq3xxhLkpKnet/N2UuH8MMsRwL88GlNYdZVT/dxiXKXQt2hHhyQKXEr6QP9c1ILRDxMog3KunDhu8jHo1fxh71cqA6tsFoZRCwVFpTGkUu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415568; c=relaxed/simple;
	bh=RQQTV6F8Gho50u3pkasrI5WHU3//8mnfLirnX/eGUEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0WXBvPdqjahaC6TG6VqSIV5sgLFzdL9ZK/JJO08ZXh1DOdU/5NfMBylaJgZQ54SWZ/wTNOv8xDZpInJxRCXmSvbl5BIDnEMOjrSrtN09cztDyJ3S/JdqBLSXcfd7pVYGZnq/CXvehSGTLNF70FwTTjiRtcZzthQuWSClDrGhrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ptesDcJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtY5+zXV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ptesDcJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtY5+zXV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Oop72234216
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6kR0wYJi5BkqYMmIt/Uxs5VhTS0LKD7uaMFFExvkTAc=; b=ptesDcJEX2PKVdZR
	TBcA/OlZg+1cKIHDRqJSeHN62glL7/MQSdw5NDGvKAQ//+lAzxPgn/2TpmM1Csb1
	sm1N2m72uIWygPsOLN+pZVPgCGMz7D868OXYQWxLPXjvYOUvHHM19qamF9aSocEz
	Sa2d/zqtsc9sc/dV/0WK3IccU83lL+bDQ9CAclo/p09NKRfOXUKvAaV7bqEsrSQ9
	HHZAw15T9mKGu4YJBDtVZSIbEZvIRQwWVQXMazX+MzhGT5Xl0pY61+rn544Akzo0
	ZIwaxb05SFOsEJE67DfT0tYd44Ge1FCucDcrtBAmJ34h4B5yok6zHwGTOllRWH6u
	fSbfuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x985j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:12:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso418507385a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 06:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792415565; x=1793020365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6kR0wYJi5BkqYMmIt/Uxs5VhTS0LKD7uaMFFExvkTAc=;
        b=BtY5+zXVjE1JwHXoRJMpWrz0SQwXdfzOvF6nkYmKHUeJynMGRqi+5XXS3BlZaThxik
         DHhD64cgAxuap6VJDVMQB6z1pioRWNbDvmb0+VCm5aZ3UcSABkeXuX3/vWHDGANgBIb/
         Q2ooM4flKb5nCWgI0K1Oj+lhcXVJRCY0mXJxG0Ec/cMOsaaXGSmA6jeDrcqMzkC5M+wE
         8KDd4uA1y6eDriTQABkUgbMOItZaBtoJJQmWmvOJKejuxu5OmcC3xkxN6S1flP6rj/Hu
         9hs9hznKsdtKYuezxGFhYR01s3ZeSonP3ZBoCVfwXd+172mdkTaHSV8z7+akWb+V0AQh
         AtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415565; x=1793020365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kR0wYJi5BkqYMmIt/Uxs5VhTS0LKD7uaMFFExvkTAc=;
        b=gPBXvZgDXsA8lc43jG92g1Y/pe1A9DTbVj+S0nqtPvKdwNZg/wwchezzoAPi0IRFbG
         SgCaWmuYxZMh8lbOxYCCzbj9s3/Dijt/jpcJZ8T87GVI5AXRNpp8ZjMmaSKh2xjjIeYB
         GFKQMZvijGKHle6RKPdlJH6n0Jsl6wCG5T18OnZdIO0PUYIOpEk3rGujbg7/Aor0IomI
         9U77YbL/XauMwv2zQmNvHUX7K4r01l9BssaYjnsbnpV6aX87DhhOkgHYV1WAxwKz/xxe
         lJmyKDZHdvk3A0oE7Gh+McAWP6nXtx5ANAuTYu6ouRXqqe/G+5az4wDUDcoXi1PrrUax
         50IA==
X-Forwarded-Encrypted: i=1; AKwUvByk0+giFK0WoU2ReoQii9i/9wzLGLwTVVbcFV4VNmc0FVwyRrQMawp89PsQJiNMTbsV9dx4TufV19jlvj916vGA+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJl1K9+OesW1Sf7NMSoq8r1ebJLOyhghPVcqE+pQ8ssAiEwcb71
	7gBp5qv3xvA+TGIIBLTrvASFGS9H3G6BwSHDmHIsRJ2aPQt8Tjlbr7dgLd4kA8iao+LxY5iY6HB
	idHEnFqFsvy2f5WA5H6ud/wWPSOsJpOETqa3iyF1dWlL9w40jNvbCUvcz/UhOeWzxC13zzeI1tQ
	==
X-Gm-Gg: AYBFou0qmnJLkGvdDNHJ3hTslQHUroMg3GLEy3CmFLHC1XdSJCR9inksgPZY5zVjjw+
	ZsNRUJ+GAh1fpo5YiGJ3HjGa5oZOh4lqptnC1S+FW0cNW6llbxhhTQ77K6AnlkFvi5KBzMODmoh
	s/47qns57vPHLfofRNJcYzY4wmmfgw5JrzFMYUT922zhppNB+k2vve0mUzYG8sXAEU4ozZishnS
	D2f/RIXiExz1c70tEJVqSCDlnNwlYcPGyNfBryQ/mGHYzYJpAVIieFOj+IL9EqHZgbEaEE2PJq+
	zekj+dPwYkhuG3Tc339D0h8LqPbhvsikEKpYs/s+kYclMcxuJ4o1Q7xdbjPjR526A9rVczap11k
	q1WHvbZobihEx9KFJrT09jFgCIsVvgo8Tqq2QLsvsXA/mcRXubLsyOvydchqZT8qVA91aPB7E21
	b+pNc2DPChjGyF
X-Received: by 2002:a05:620a:4888:b0:93a:10b0:aee7 with SMTP id af79cd13be357-93f29d4d901mr1300124185a.44.1792415564726;
        Mon, 19 Oct 2026 06:12:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4888:b0:93a:10b0:aee7 with SMTP id af79cd13be357-93f29d4d901mr1300116785a.44.1792415564088;
        Mon, 19 Oct 2026 06:12:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab24f5dd5esm23432581fa.6.2026.10.19.06.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:12:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:12:27 +0300
Subject: [PATCH v7 1/9] drm/amd/display: embed the writeback encoder in
 amdgpu_dm_wb_connector
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-wb-drop-encoder-v7-1-d4288a26eb54@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6137;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RQQTV6F8Gho50u3pkasrI5WHU3//8mnfLirnX/eGUEA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1hdDDoGN72GSrxZ+UIvVOsBEeFks6m+TV715q
 SXH7R4jTHGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYXQwAKCRCLPIo+Aiko
 1ZHRCACKVigu2OyQSC7weKOsx7VpYKUWBAeSxrZkrlX4ibao6F76CXxYbwJ7x4xP/aQMKDNwEcq
 xoaOfJrF35y4HGjYuHNEWV2foSgAcPRXGDqofJlDHh5aakKKJ76WUWq3qUrWtxEMpLWrVWBPHOD
 zykFJWy+R6wSZE/VaX1oibyX8FgMjmPfr/dhiST/e0SMCmm3+R/p+GijH675g7EiQv5sbNR2NQE
 ENyfYR/wsLgah1xDAzJHi06dDITzeh3rUHeHAhnESnA8K45ZCpd55XJ7JDuXrco4xAHLHXDV6Hg
 bSmJwL7AGAO/ClKNDsiOKFSFP++i69y9ueJgJSquIUPlcQFi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: OIzueoYu5KZavqRbo647LSJGw3xD0ZVo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfXzH6APTKqNafX
 LFZwNEhEJtUSzCfA+aVyanUeqVmrvwr93l7rKY7z/Xtc9GQ+jaPIQSyo8kyzBOctfl8WW1N8NbJ
 RlaE/k9YY52GK+a6D83IdvcHEFiXmKE=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad6174d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_MfM8nSJvC0osUG94L8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: OIzueoYu5KZavqRbo647LSJGw3xD0ZVo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX4K9vmw21NCPF
 G7m3tAzBE6Ol3ONnkwgDqpQYJnYP3m9Tbgo9P64t7cvNjz7oMuqSTeAZ+o+aUqIbO0wY1uKaj0n
 s0UIGtV1WWbgwtVtBVmLT44nBnhgUHFsdUq2z2PMSuww7gS5+uiCEdnkdZLHk/bBJuU7axLDVn/
 pBUxohJ4H4fe2W4GiAvKKRJ0xd48UG1c2TlVQ8wIGLTkmZFZ+68xK1+93MCnqp1lUZg7VYnWui8
 suIgscJQ2yapjFg8dPNDCY1RhZiYmr/K6Et2gIp9QHjPMe+/5M7JaMdaoQ8tk6PIAJzzfE7vlGh
 ylQAWiLlzU8ISKak7n0pyuBTQHXdFBQqTEuEbWfeC9CdS7mFLuViKE8Ktkt48BWR5HiZ0yc2l8q
 W8fd6H+LISSiNRUILvg4wSKaCiVTYlXlpysIODNprHfxe0SMR7EO/VVmAgWio1H2DDRrzN297lW
 6NtkxrSy6NIJk83xAEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   | 29 ++++++++++++++++------
 .../amd/display/amdgpu_dm/tests/amdgpu_dm_test.c   |  4 +--
 .../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c    |  4 +--
 5 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5e106b65034d..07dd69b42e83 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4805,7 +4805,7 @@ dm_set_writeback(struct amdgpu_display_manager *dm,
 		goto cleanup;
 	}
 
-	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
+	acrtc = to_amdgpu_crtc(to_amdgpu_dm_wb_connector(wb_conn)->encoder.crtc);
 	if (!acrtc) {
 		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
 		goto cleanup;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 1d256dce0e4b..d365370d9958 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -930,6 +930,7 @@ static inline void amdgpu_dm_set_mst_status(uint8_t *status,
 
 struct amdgpu_dm_wb_connector {
 	struct drm_writeback_connector base;
+	struct drm_encoder encoder;
 	struct dc_link *link;
 };
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index 6f91a992d43f..b5b186e4f81c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -218,6 +218,10 @@ STATIC_IFN_KUNIT void amdgpu_dm_wb_cleanup_job(struct drm_writeback_connector *c
 }
 EXPORT_IF_KUNIT(amdgpu_dm_wb_cleanup_job);
 
+static const struct drm_encoder_funcs amdgpu_dm_wb_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs amdgpu_dm_wb_encoder_helper_funcs = {
 	.atomic_check = amdgpu_dm_wb_encoder_atomic_check,
 };
@@ -246,17 +250,26 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 
 	wbcon->link = link;
 
-	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
-
-	res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
-					    &amdgpu_dm_wb_connector_funcs,
-					    &amdgpu_dm_wb_encoder_helper_funcs,
-					    amdgpu_dm_wb_formats,
-					    ARRAY_SIZE(amdgpu_dm_wb_formats),
-					    amdgpu_dm_get_encoder_crtc_mask(dm->adev));
+	drm_encoder_helper_add(&wbcon->encoder, &amdgpu_dm_wb_encoder_helper_funcs);
+	wbcon->encoder.possible_crtcs = amdgpu_dm_get_encoder_crtc_mask(dm->adev);
 
+	res = drm_encoder_init(&dm->adev->ddev, &wbcon->encoder,
+			       &amdgpu_dm_wb_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (res)
 		return res;
+
+	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
+
+	res = drm_writeback_connector_init_with_encoder(&dm->adev->ddev, &wbcon->base,
+							&wbcon->encoder,
+							&amdgpu_dm_wb_connector_funcs,
+							amdgpu_dm_wb_formats,
+							ARRAY_SIZE(amdgpu_dm_wb_formats));
+	if (res) {
+		drm_encoder_cleanup(&wbcon->encoder);
+		return res;
+	}
 	/*
 	 * Some of the properties below require access to state, like bpc.
 	 * Allocate some default initial connector state with our reset helper.
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c
index e27f6e504395..9d237f2db95c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c
@@ -4535,7 +4535,7 @@ static void dm_test_clear_writeback_removes_stream(struct kunit *test)
 static void dm_test_set_writeback_no_pipe(struct kunit *test)
 {
 	struct amdgpu_device *adev = dm_kunit_alloc_adev(test);
-	struct drm_writeback_connector *wb_conn;
+	struct amdgpu_dm_wb_connector *wb_conn;
 	struct drm_connector_state *conn_state;
 	struct drm_writeback_job *job;
 	struct amdgpu_framebuffer *afb;
@@ -4565,7 +4565,7 @@ static void dm_test_set_writeback_no_pipe(struct kunit *test)
 	conn_state->writeback_job = job;
 	crtc_state->stream = dm_kunit_alloc_stream(test, NULL);
 
-	dm_set_writeback(&adev->dm, crtc_state, &wb_conn->base, conn_state);
+	dm_set_writeback(&adev->dm, crtc_state, &wb_conn->base.base, conn_state);
 
 	KUNIT_EXPECT_NULL(test, acrtc->wb_conn);
 	KUNIT_EXPECT_FALSE(test, acrtc->wb_pending);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_wb_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_wb_test.c
index 03036f906385..2711696f6b9c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_wb_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_wb_test.c
@@ -506,8 +506,8 @@ static void dm_test_wb_connector_init_success(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, wbcon->base.base.funcs != NULL);
 	KUNIT_EXPECT_TRUE(test, wbcon->base.base.helper_private != NULL);
 	KUNIT_EXPECT_TRUE(test, wbcon->base.base.state != NULL);
-	KUNIT_EXPECT_TRUE(test, wbcon->base.encoder.funcs != NULL);
-	KUNIT_EXPECT_EQ(test, wbcon->base.encoder.possible_crtcs, 0x1);
+	KUNIT_EXPECT_TRUE(test, wbcon->encoder.funcs != NULL);
+	KUNIT_EXPECT_EQ(test, wbcon->encoder.possible_crtcs, 0x1);
 }
 
 /* Tests for amdgpu_dm_wb_prepare_job / amdgpu_dm_wb_cleanup_job */

-- 
2.47.3

