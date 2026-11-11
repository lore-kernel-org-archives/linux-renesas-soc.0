Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357792;
	b=TckpkBWtVBtQ0oME59SUE9r2pVL/UDJ6uMINyuys3DrVDYAvBH+OCQoqzvAEf+DkrH08
	 7a8UUUINz4FPXRvzyilxgp6TVlEjemqDZm2OjES0IlibFeT0TVfxlCk5HCusQNdykP3+j
	 3JjrZyYYcPfSUmFvPdrippvrBDQC97YiRJ5Tr0eVzRvhxSUZ3Yr0poxj4UuxC8i1GhJeM
	 guoQBZWdnNYlBMCzNq7kA9BuN31tT6oRBzkFlKAYlXeGMXwH7qJG7r2DLEV7AYAhnEg7c
	 bBwUAakqALN50GnA6mFC+MRT/xlP32NT7GXb29L/MdTUoth4hHMjFmnt3OSa5djN09w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mc0502QjSovnWK7vfGY36WFYd9ZgYYG4f75fpMR8ddg=;
	b=q9vNTbIHikhWvfKk7bKTYIzs68KM/XFT/IB7QFm60JIvyton/BedIDAikX0pcR9OieyR
	 af8kLySZiKE25KaC/Wc5NpC3NuhfwNiOOu8V5Nm57BMl30H6hvShJLpsBLBm5b6+6q+RR
	 IfAyCPy5Nyk/nkGatO643kNMVYi6v55I4ehhUk4LSFz/ap8TfLSiMFfWsqb8jDX7n9M+9
	 WwqKjc7ET/smRXcewqco++rILcwTLHZj/vxHfFQ4+iVCjLnMwO8Amvd7C2JfbIV4lcCjJ
	 SylPv8DgWjNPImsO7Pn46VP1qGxJ+1TqGlpS24teMYjaBzGY1dWb+T7Vgw35xgc4Y7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FwDiu2/w";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fX3FHoDD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91BD606A333
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D91BD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FwDiu2/w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fX3FHoDD
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKgpo1113764
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mc0502QjSovnWK7vfGY36WFYd9ZgYYG4f75fpMR8ddg=; b=FwDiu2/wIVg5+sN5
	ZHhT095rML6/GoXvNZHhQtkyei7HR2++AGRgzcfwdDu5sXzLZAygaaU/xOaH1spL
	SeRTgViAuXfFjw8y61FITPw8sLT2XfwdXxmhKpT+OL8E/GuI259pwlNXGAbF5eGD
	rpP6/1P1++NM0pQcJg4edY+W4rYZsEPGn/clSNhhC8B0iqMl4yINrMh+HCrb091v
	15ChKUGj7ewC9C2HWTfjEcO/sDrzSNLYoNaapZEpXulcJjwI1sivXzRVnLYBfE/M
	3B5vP6aNDVYZJjyObGTfU1L3n3IKwl5qeVY9uY5Q9VbbpUhtHVySB6kP6EmuhfTC
	Ikfj5Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97c954f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91e98b67c0fso53244036d6.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 16:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357789; x=1794962589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mc0502QjSovnWK7vfGY36WFYd9ZgYYG4f75fpMR8ddg=;
        b=fX3FHoDDEjHhP1oF3eLgOsEN2RfVHoQNiFSrWgiXCDFrlqix2EBflN8c+RsKooKI26
         w6EYCkpaNb3JLARCli6MnBMQby/YsU3BKKgMHnriui8aSylmy5xgd0PLmabfiLON+32u
         IMMfis/zeubURpSvK03dcH6FLCBqiwOUPU0XjHVuqOyW0WrSIXHHCcB136W39FAmxbWc
         FFSkXcr+MoZfOGhEhcrIa/wRh+Q3U0G5ZniMgZEhlBQWkaUEgMGLBNywkBmw87+so+7j
         VTsx8aQQrZHYbZFRWaVUJgbpuhAQbmcQJTeHMWELytnpAGzkhtIhj8hng8Aew7/QO+vD
         ZzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357789; x=1794962589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mc0502QjSovnWK7vfGY36WFYd9ZgYYG4f75fpMR8ddg=;
        b=GX90K+tyYw0mg9X5kS+aW17SR3yf3sT2LKFZEXNBJtiPUbshOdrQXhtvak6QA5RQRZ
         beOml+HM+53OxlzLsT/0GfyCMJul7WQ2b5Gt5N376fNaJj8A31EYNoN+IEuSYElybaMW
         M4wlroUr2FhB5DClR3huPoDGUgFT7OF5Y+PGGpcPdMdB1LSU2aYqNGr0QSEarpAVS8do
         AFyJqQTu5NrpJsZGqr3bJtxA+HS0oB8wdCJuxFTKcBJI55Jl7iJLz5TYsXc18INU70U7
         i2Xwdudhn5RqegQLVCWszFKgkGOro+4fmIkkHK/sPlSq0KeEvkqsKB4r2i1jXpki/VF5
         AyhA==
X-Forwarded-Encrypted: i=1; AL+hErE5XuDZ0w2rF+IkNyYQEpqxLT2yjt5bUiTb0mqad+/ttKKLdR67IXO0e4/GSDXRxL/MrHIgIpz8QsaBNzG04vi5pg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/nrqVHAYgrhc9Yl8Ko2M0/FwunrTIYPjzCr+oG/qJLHwbX78lV
	OhOI1z6QhZKHqVx3MDnJ4nbWHehXSPgwuG2ZzK+VfYlE8uBMDbA/bGctcslqmLfasxleRMJeNa9
	eCQ884I7FuVVbISaDZOw0oFT8+CU5E5m25rht5vGk/IRQpsknftqH4PhUUnWhMgd+lQJ88oN+MA
	==
X-Gm-Gg: AYBFou25JM+7SMa/t4qY6cCfErBe8ln8CKdNL8IHFUeY1UCnG7izX8PtcIMf09vybAX
	tlUtW3LyW0goUrztsK4HROrL2Ub6dr18wXH0aGiF8BY70rVeTGt1wT9xSFSEieisL3AUEYpamif
	8ex+LdUH4UaYyK7y1LmIOi1eAWN01+eOcItxGVBagIiK8ZfuWlABM19poi2IfLHT9yGHOh9JNjZ
	wYiYz0RevjlcaDrOb0NWKZgFph4H3Tcl68WwOx3mjpeWutKyknHR+OnMaZJbvagERIRP4JuZBN3
	QtdogvFYl/u2GXvbxuIFoE5NtOqwmLRV/Q5J1y1ihfvG4qFd/V+q8YDr1nIATtvguGQ4fHFWg4L
	B4iqOnUZSLlGirVY0b4C48P1cRONM467xIXcgjLlyzhx/iTc9VARlh/Hg+ag9eSodmcJ6i3l968
	RnIcKgY2aOpPs/mIgRfduajrTkuuvfrvywhJnUj1FKHjPE3KjLWHmba6w7NzBlpA==
X-Received: by 2002:a05:6214:5f01:b0:91c:75ef:5532 with SMTP id 6a1803df08f44-91f040c0662mr15963146d6.39.1794357788358;
        Tue, 10 Nov 2026 16:43:08 -0800 (PST)
X-Received: by 2002:a05:6214:5f01:b0:91c:75ef:5532 with SMTP id 6a1803df08f44-91f040c0662mr15962546d6.39.1794357787587;
        Tue, 10 Nov 2026 16:43:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:30 +0200
Subject: [PATCH v8 01/10] drm/amd/display: embed the writeback encoder in
 amdgpu_dm_wb_connector
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
Message-Id: <20261111-wb-drop-encoder-v8-1-62948ed87d13@oss.qualcomm.com>
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
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6169;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hK2qPY9AT21budCgsaXkgZkIMdXALboBP7lCjCRQJmI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oDKYH3jNhUDLRZlLVx61WMVdAo+SJbh0qes
 1TtBYuzV7uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6AwAKCRCLPIo+Aiko
 1WDFCACi4kHBwkk3TsZD6c2vsanacmFNZzYYNpYYP/z3Txpuw8+HfYz7XtP2ofaV9QjCs44w0tK
 GMpfFO34XwYny0M5QYuRdDTTCzvtHhLFuKLSbh9HMbSNhg4oSXj8eefowqj3pjqTgMygxlu3ADV
 OdYyGNKhidlZwYPpDzeQ6vQpRGuIe4Idi5zSp4X7Qbw9rGqlmhhY2GiRR2OGfzfHfrOj8RElScP
 QB+uKf2B/qo2G0magfZMeCaUJDEZylYsE61a/aVYW6h31G5BwHDBXi1u+t+h5Dirgbk5g5gcKdm
 IOXCQ+Exht3fG0gGhgEy0xCO/vyZFwwKX52KiiEzmR+JP1Hw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX1+9J4fXyIGsg
 vDEv/Ix8yi/oezAC9ve/Di28lJrqjcrjdbCixY/xDnGVFs5E5xBUQh5bUPdx0VUJCSNDnwsksUq
 LC9zWHb6CGsuSvmFiJkewk7LZUma6FQfJCLtq9+5SBjvc6JtQMJ2VwBvjKjW/95VTZNgklETe4d
 l7JNE0EFs3zXMI1f7hQ15dvpvhj/ZBbtvydzucX/WjR4nRcy05pqYqLz80zVAEusPOyAMM5copc
 SNFtEBT6ZWi2S6kIR1Y6Pk8IK+piIgindPKS9Q8Gzgip9UZpuxcPitCRsOQjreq8McMNUCBiNwQ
 azfrddGCB9TRmTsY2VRWkDGzmmsQiwHnH7uK+XHKjSgH0epZfER+PE5ykSbh33E1L8CFBUkc0pc
 35p4nZH77ZfSetKNd5Iyf/jwLQWrDQiCe/qiuSLhnhL3qhm/zia09c/Rs++jwn05k78QvJL9SOo
 rAnJt+mT/A4wq14uZUw==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af3ba1d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=zd2uoN0lAAAA:8
 a=EUspDBNiAAAA:8 a=_MfM8nSJvC0osUG94L8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: jkqKaNnobGA_i7Ho0kqTNcT4Vci2X2cU
X-Proofpoint-ORIG-GUID: jkqKaNnobGA_i7Ho0kqTNcT4Vci2X2cU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX/z/LQPZzEROh
 n0t1YaMvxjECrONIyXHzefktczanPDrIuutDS6fpU/gmONJG3EsbAPQiTxYyOz4EfTyCOU4zh3M
 n+4xPmwwp0mALsGNfd1aduqkJJORSLM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110001

drm_writeback_connector_init() hides the encoder inside struct
drm_writeback_connector, which is the only reason that structure carries
an encoder at all. Every other writeback user already owns its encoder.

Embed the encoder in the driver's own structure and register the
connector with drm_writeback_connector_init_with_encoder(), so that the
encoder can be dropped from drm_writeback_connector.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   | 29 ++++++++++++++++------
 .../amd/display/amdgpu_dm/tests/amdgpu_dm_test.c   |  4 +--
 .../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c    |  4 +--
 5 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0ea45ab12119..77788a2289fb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4812,7 +4812,7 @@ dm_set_writeback(struct amdgpu_display_manager *dm,
 		goto cleanup;
 	}
 
-	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
+	acrtc = to_amdgpu_crtc(to_amdgpu_dm_wb_connector(wb_conn)->encoder.crtc);
 	if (!acrtc) {
 		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
 		goto cleanup;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 1b91fe4c3171..111bb110c439 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -935,6 +935,7 @@ static inline void amdgpu_dm_set_mst_status(uint8_t *status,
 
 struct amdgpu_dm_wb_connector {
 	struct drm_writeback_connector base;
+	struct drm_encoder encoder;
 	struct dc_link *link;
 };
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index 39b7b3e49f6b..e0ef23f692d4 100644
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
@@ -247,17 +251,26 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 
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
index e77e6fa18a72..e15db8c41662 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c
@@ -4567,7 +4567,7 @@ static void dm_test_clear_writeback_removes_stream(struct kunit *test)
 static void dm_test_set_writeback_no_pipe(struct kunit *test)
 {
 	struct amdgpu_device *adev = dm_kunit_alloc_adev(test);
-	struct drm_writeback_connector *wb_conn;
+	struct amdgpu_dm_wb_connector *wb_conn;
 	struct drm_connector_state *conn_state;
 	struct drm_writeback_job *job;
 	struct amdgpu_framebuffer *afb;
@@ -4597,7 +4597,7 @@ static void dm_test_set_writeback_no_pipe(struct kunit *test)
 	conn_state->writeback_job = job;
 	crtc_state->stream = dm_kunit_alloc_stream(test, NULL);
 
-	dm_set_writeback(&adev->dm, crtc_state, &wb_conn->base, conn_state);
+	dm_set_writeback(&adev->dm, crtc_state, &wb_conn->base.base, conn_state);
 
 	KUNIT_EXPECT_NULL(test, acrtc->wb_conn);
 	KUNIT_EXPECT_FALSE(test, acrtc->wb_pending);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_wb_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_wb_test.c
index b54624385e48..8359ef046c9c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_wb_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_wb_test.c
@@ -510,8 +510,8 @@ static void dm_test_wb_connector_init_success(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, wbcon->base.base.funcs != NULL);
 	KUNIT_EXPECT_TRUE(test, wbcon->base.base.helper_private != NULL);
 	KUNIT_EXPECT_TRUE(test, wbcon->base.base.state != NULL);
-	KUNIT_EXPECT_TRUE(test, wbcon->base.encoder.funcs != NULL);
-	KUNIT_EXPECT_EQ(test, wbcon->base.encoder.possible_crtcs, 0x1);
+	KUNIT_EXPECT_NOT_NULL(test, wbcon->encoder.funcs);
+	KUNIT_EXPECT_EQ(test, wbcon->encoder.possible_crtcs, 0x1);
 }
 
 /* Tests for amdgpu_dm_wb_prepare_job / amdgpu_dm_wb_cleanup_job */

-- 
2.47.3

