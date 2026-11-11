Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357807;
	b=322fXAF0HyP6vPbdoyZGs+LL9kgDWX7LpkHnVVgqXp452MvLWVECGqpszlbCOhTCQzYJ
	 mR06+Yq6XSOtcjLvZabpXdi60GGi9Ijk4BzRTZcNcPHSnqQClm3nLChtP6hFeIR2cOU1x
	 8gdlWqInCCHFSHhy4YdWhkiZdMHBg85Wvhr+4wuROsNZrSni7IHEcpkB/83pbkK/g1G7c
	 OyA6mcitiGWOj6p9d7ceM4qIo1ScyB3bSE435ZhjvPUPjgXTPDmaBJprEqNdyDj6sHK2f
	 A1c2ibnK67S0j8SN2tSORIhRz4yx6lml5JpUR6I8iN9Egh9lnkGF8BgH4rVY+9c3XRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357807;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EkeKOmV556G5oy0quwFksL6YgLAm3oPpd3qf7nvMs1w=;
	b=fnhwy4aaf2ifOGRMx6ggJB9g3bwtlJK+GFneBCGlbOLqxUdXyvR4Tm2tHqiacoaveyn/
	 n3pYggKDhnyOroH2F3zY8163JHnr3IkzwnVT2qV3YDL7u/PxSwKLrNZaMWgGqTfY/IMqx
	 TTMoE2v465opac6jX6ps6sjYFvyX2ISHHGssUC2gQ4RxMp6tTh5xmAnFWpc1syjKfxbvV
	 tq5nBjFc/QcY7mjOC8mYwP4ZQZ1rsqkErlypFF+YNXWbiUcXffonp2vqdBwrjVXt9I0fU
	 Gx0S2PgpUHitO7JkgbZba7bDraRSY2Hp+XH95hihQ0jb9x81AUZiHR0Bu8iOQTr38yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YSf4C42p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ksHM6psb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC39560A2616
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC39560A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YSf4C42p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ksHM6psb
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB0Fb1j726246
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EkeKOmV556G5oy0quwFksL6YgLAm3oPpd3qf7nvMs1w=; b=YSf4C42pqvHJUUxF
	W8UP3vMr9r32Ke0eoBq8Qg8NajOpybQ/nbQ4HeuzdAFfZS40kX2rZzIfVoIMLUVu
	QZHbmiHM7h+3d5asQzLo/08LTK4SXzq9Tmn4Z/n8LudSocdolhBeKveLx0uJW1B3
	stxmVMMMfpDOJ31H33LTXG0wmh13bgXSEKZX3fw1xSP3Ry7OXxJwFXbrClCeSq/0
	Rv2EfUrEP5TESLxX59LjDgeNRZXzpmY2KcPyrmst2eGBVfpQ2qg4Bei1G7KYS316
	kg1w0v8lGVS0FcPI42in3XtUMavGjuFymrTk17td7pLtEFVufKzm2uL+/ygDQfI5
	Whw1pw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm82n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91ea4a2210fso30592816d6.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 16:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357804; x=1794962604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EkeKOmV556G5oy0quwFksL6YgLAm3oPpd3qf7nvMs1w=;
        b=ksHM6psbUcCZGk8orqUV+4ZxetaBxyEdY+H9jLoRIWtPKLM37mg7QWIssVVFlTYhRX
         BAMKot142fPxz3ukqkhggG4G1o43udSIEmNzV7x52FOd3Bi/kLNRTiEgSQt96pzIDi+K
         BH7IrGwXcjfBkoAyGdvFVKD54/w9w7UL+cfoyLhdn2O7R8sZt7Mu9h90RmLapBKNa/TL
         440Yzho/lLD0Ad7+WojeDVw7ZJvPK12blHHnBzS+r/KDpaMWuwsiu1xLKz2uIZ1TySGn
         LuzkZHURdQTNjIDVENjy00MbtbAGe/3p1mDrx4eZnQ0Qm8QrcwQm6FxfuJ+De8p0q4bg
         eelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357804; x=1794962604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EkeKOmV556G5oy0quwFksL6YgLAm3oPpd3qf7nvMs1w=;
        b=UC7dChlsRqc9t3OKhqaRdZYORY5H8qC9pBst4MEq94L61m1pu9eDszBkdbMUN5/WgK
         Aw4vFObUYzt4JnKuIl15NctJzfGU9r7F2UYHOktcGnTsNmMcURr6a3qjOJ7yU92V3CnO
         wl4G3hXQtsT6lW67fs9hZPm9GaHmc3hbhdDlEpjdlhByOkP1aBm71tDA5YppeG0bVDRP
         dE4HRBtWm6k6UCnz7YVMJ1kKVmErgOWQcyWB+ovuuiTHhHzn4QCwuah8w9hxtJc//G9A
         4nto3xomwEyz7CIWVx5p0WxzTjv91CaS7Xba0sVgxz12i4QUOCuYksJ6IsVP0Gnha02c
         MUQg==
X-Forwarded-Encrypted: i=1; AL+hErHZyRAS0aCCcJ7nuqPCQFBqtzIrJhFEoq7uwzk3zjb4YKD0ATRs7R0YYBpOmGxe54Fg4Ml6ReBe0O4uoe6C7AGFDw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/3vI5dcM4Mfg8bfBIfzJBi2MaSITFcxJieRkYE2gBwb7vk9zYY
	y/7e3xzKx6pAgAAEbCCLwOMJmolNhOzKd+YA8k0pAkkUIYq5PcL51pSxrLr6x02fJ+AHsun2Tjf
	6uDA3jphQX/ODOC1lIOFgZvJJqdPKJMIpjPoz5dKJN04QVOoYFhbVHSj9Xlb0N4fqpcbiqMrzsA
	==
X-Gm-Gg: AYBFou2aB/iXyQhNcrbta+grOkNwlCdtBmZVs8WRvPJNCYD/DjRjW5kWnc75gK5zipq
	Kpr0VZpm4EWR6TLkREyzjEikUqA1K7rLjmv8mZXa2F9iY2+Q6O908I4bkjal4iWNlc2G6wwGjAj
	hvPmQxMIWsQ4BSbk8PtReEPOdCynbKADyyf+yRxCoNXmzhsg8TcjfQGddWHDOjLywC3VnLuAoPX
	v1wmQNedyjmimIIFASOdTmzcr4x80JADmErZ8zAF0A2sqmQUUtxHTHbberpgc8nwCOV3ry3T5Cs
	W/6xcPTiBnFl6kDyEfnxVsh+SUKMzPYHHZWeMGKJ5IkwwtrQA7riQS0su8RogcJ6t0SkLDJKXq+
	C7la1AJbTkuKcjwLh375SjB2PCzvwl7qSVoC2fpX694MrmkADN9SxA/f+y68vqyaQ9zW4MyhEOL
	keZi2JTWVHvgwUBquD3jF4LB4TZt7prL4AvI4hPvVSpEyoKFkYg/oBbnbvOwN/+A==
X-Received: by 2002:a05:6214:2249:b0:91e:bcec:dd6 with SMTP id 6a1803df08f44-91f040e8cfemr18262226d6.34.1794357803346;
        Tue, 10 Nov 2026 16:43:23 -0800 (PST)
X-Received: by 2002:a05:6214:2249:b0:91e:bcec:dd6 with SMTP id 6a1803df08f44-91f040e8cfemr18261716d6.34.1794357802708;
        Tue, 10 Nov 2026 16:43:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:36 +0200
Subject: [PATCH v8 07/10] drm: writeback: don't destroy the shared
 writeback properties
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
Message-Id: <20261111-wb-drop-encoder-v8-7-62948ed87d13@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3828;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZMmknsfr9fO2ooOGlXI2wiwkvAWhuDIhtJaDkPBlfcg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oQcX4TkBGw0MKdj9tR1CR0bhdMfpjNQjJM5
 EEMcRML3a6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6EAAKCRCLPIo+Aiko
 1cWCCACXQKaJYDW8pw84y5h0sLJnOub3GG15pTXhZIXisZVjqa147f+1H/z9+d++hwJ3NfPd4GL
 NyJm880aY0LY2YCE4t93ZuOtYOFwxAdvz5n+wxq+8fcvhIrbbF516WhHYtcVxFxuo4rXOGEKVSP
 wXr1mc4/+WbjqS4yieCKoO4REKOpzoUv/kLzkDkB/jC+E/JYlj3WLahjFT5Gp2pJuus3359xL1F
 puhRVaSD14LwKp0i3k7L3mQw6hG8+XHnZT4GkAjYOLLTfUAA+ZJvWYGRW5UyuHFjJnt7poQOtPT
 4ssFdYgIIuT1JOumLBcfCPGpxRKVSHgnyH4868wCjA95Mnn9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 6Q99jH1Ri1_zCqhnEwBMun8qhtwnme5P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX1x/IJ4pVRPsg
 SpSVt4z5xzcRnaxcUU0Afx4EdDLztgYyBBmPK6bVG9tj5bn2WWCkxC6HivqfmT0MHOf6cjUOXKv
 ORK8lXAifmLEoHlxc1amjVrmVVF38MA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfXzCOFNAiPax2a
 c2O/Tat2VIG69HhVHHfb0lcvUyPkGrd92u0hzQ9xqgwcp1KzNnEkL556SOYrZ8/nDzE7LOqwndA
 Cs4qHqz74UXrCBha8bdyRbtclLoeoE+zqoPQTIfCKBtheYil8BKJIw0K2MuAHShh38J6GSidEWS
 /Y3/LmVvcxqci4GlZ4Dw8uYfEwSi5g4E2im8EVWkKYcwZQMJYWTiAdSTXTLz9nHfhpJ1fWY6lOU
 p9PUrh6tpaDBtRssoFSJLLKEWNV8QSqgnZtz7FiFRMePXBitYpwRVbBPF4NHLQV1/XALVZLXIJb
 WTp4M46are0eUWtev/9G1IbFHPlOMK2l1WLGbGywqr29DXOCH7n6dv0cY/equhrfJUNW5ct2Nge
 CvgqfXbLMdpjALfWMacnkF/LZtDeCbJ7pUmGzKpSQuH7A3DPnxNhdGxlgWrdrJg6fHjU6VgiW9M
 0nAG6mXRe2hgQ7sxlVQ==
X-Proofpoint-GUID: 6Q99jH1Ri1_zCqhnEwBMun8qhtwnme5P
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af3ba2c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Brd4iQZBKng0vAjXyHYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110001

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

