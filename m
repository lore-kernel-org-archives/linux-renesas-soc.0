Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC5F4F5E1E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415581; cv=none; b=i21n8kCp09lWX7znrqvC515J/olJLwhIAhVqNKN9dogD7k2xQPfJZQaXyyOzGWxrnfFr6PRzG10mVfgWgdKoSDvbF0tF2TZ2WhM1SRzPkyAjUG0m7FKI0fNnGUz+sz1DD7opL7AeActBRgXUz/bKlk5bcXgsGwnSy+oLdQkFgGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415581; c=relaxed/simple;
	bh=MXiUgqFb28XZ0uD8+NV8QVzUD8kgz790YiWbaz0Q+SY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=icBDgow7EFjKCJ1T+l/lsWI4rOI0PCRb3GWXcS/f5JyIW4yzRNC20gM7itXQChUitidj3Qr6uw64LbR26mnlTlvJ0/f3TfWZpkXUk4c9PdupMVtPn6pvUWOdk9k09hBGp7qVWB49e8POR2u6rteglbjh7K3GA80Y0QDferTQOXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G54f4czi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XHwCxgBl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G54f4czi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHwCxgBl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OtEi723143
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kFaI/Jkc6f4Kq/MuB+nr4917gGjbH7lnxAEvCbOlf7c=; b=G54f4cziwK6Njg8J
	IjOWS6X9HSSyrOE0R8cQTPXUuDi4BwX5wnm5g73w6JpxpSGDDtIm9Y+dKAO8OLOy
	5kdHyEj+h1AjnyRRnpFisYCBMdVMy00hY+7kp0Z2nfzCxVHPyIbb5j3DLsWpKmK4
	Y1pRQnydVzNubkdBnXq/b+TUEalKm0xTikc0keMXBFbOBn2wYok9MKuVXQRZffyk
	BvULSy78wEioi3riPRarJZCtn0a9RmM8nKfesM0KhFKm9zQVof3t5pF1fl43lPug
	UFzUQYXYXJcB6Eaz9RH4CkJdDke5Q5txkIg1rrIp6/INDomyYp+bwtHgk7iRZIIM
	0fcBIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65h7ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:12:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbf2fd504so362033985a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 06:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792415578; x=1793020378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFaI/Jkc6f4Kq/MuB+nr4917gGjbH7lnxAEvCbOlf7c=;
        b=XHwCxgBlQU7htQij/++Nb1Zit6AMI/YQYU0vmJTH5rg4VE8CkYpScDfye3HZc6Qp8O
         qqYfU+JdOXzONKLzwv/lo9zlMh4Lh4dcr+V/rkFRPHC4QW8O40wbfQcFYgmbWrSGpP8s
         oowXc/J9vggZ8gdRTW3fOWu7lHK5kdGrauSsRNjPCNW+O4p6XxkK4XPESoYj7UMcovhN
         kAWesSzINQUdXR11fqasGqQwn1zO+L6orpAVYUFiqWxuB4xAWhg/YEaVSIh3v+NKEdXb
         xAPULcda2ji4OJyqICqhY0YGGIf46L6w4NhBD+L89k17aQmBUbc67TUUeFe1nQd+85nF
         ziXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415578; x=1793020378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFaI/Jkc6f4Kq/MuB+nr4917gGjbH7lnxAEvCbOlf7c=;
        b=RVMlTMixlHqwcr33RBTntXALq56FKqwDNxpBzpZ0hs5qaFPRqOzF0uN0p+QjSrXvr5
         +PgMZDimSH/d/BWtugmwfyvSmT8jb+ii8NBfil+ILyIScpkI1EJctfW6XuzmE+OZa8/N
         wWvbSL7kRO0+kg/6cOqOFFEgUlLcNnYRS94HjDZOdTcEx0XEYuRpgzFUsaFa9ZZX0JHx
         rQQoVVlee/RyNGrXe/ybIZd8lhYBqM584gJYM56cmt+FxXhVJgyfOGJXh+7XIZg/IvMH
         HJmOzDYRSQI2MApVk2GubCHr0nldQxPoUfmqHfCwyfpK6vp/pmc0tFn1x91nmmI/0o5t
         fXWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnAZn/IsTSA4OUJSxE1NnCvJPJ9yNRST1mWbi2lfSBLjL7MJESSEk2EFV7SmZn98kbr7RfKDgZ6Aji5PnwWkB8kg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLj0f8XdnGvL2JPPpBuxIT4y2oMnlHyYy/Nyt7Ox9BopbE/9BC3
	vrV+MXiIxoBgTbTWvRiWGlA1keSQSqB8zTNpqp2l+WvXdVkLbqczndyrZ/wJYHMcKQDiusjLYG8
	fHGVKHgWc4Ko3jdNj+Z9uMc4FzzJqA22QXg02cxKPf96vLDBlfxyhGhm57nggJUT/Vni1DAqH8w
	==
X-Gm-Gg: AYBFou2CJG8eK0hpItAo9M2exI9kD9yqUrtmSl960lmIQ3/A3EgyB2LgU6VUAEpjvjp
	lHWjDTKY+ic1Qq9gOFPsK4lmCqv7gmJzJA8J8zDjHB4BtqOAzLxE2HW+PWjZgNIRa3B0vqJJOky
	TAZMsuHxPnsAQegYbEZLl+tvfEWIOPyVuqG4o1GM/c3Go/FdZAiyoelQZ3s04DJA0imuxGwjIFf
	yYTpKZuujWZAmDWtAcvHlKNsXE2wIC7P7aXVxVtplWqAi80ZMuIeYd5TXMt3zVK3P7Hv9SuEYeE
	ACwh5Hfbfwu0crl/BMEtB1vBXEEcVUIvzZ7HwhRPkl5JPz+sinP2MHeJ/P6dw/dRtKvIhuaPGRR
	UiocQiRNBwLWkE1Ws9h8+bZ5AGTK3H537RHzuHT4Oa7BlAZvjAsgbNCgjzarlFbLeA+uTMWf7va
	J1M6ANRFT8i7h0
X-Received: by 2002:a05:620a:2609:b0:93e:4d74:68fd with SMTP id af79cd13be357-93f29d8e1c2mr1205207685a.65.1792415578442;
        Mon, 19 Oct 2026 06:12:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2609:b0:93e:4d74:68fd with SMTP id af79cd13be357-93f29d8e1c2mr1205200985a.65.1792415577911;
        Mon, 19 Oct 2026 06:12:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab24f5dd5esm23432581fa.6.2026.10.19.06.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:12:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:12:32 +0300
Subject: [PATCH v7 6/9] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-wb-drop-encoder-v7-6-d4288a26eb54@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8295;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MXiUgqFb28XZ0uD8+NV8QVzUD8kgz790YiWbaz0Q+SY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1hdFDtgtFCpX8pSrsYjEJBgBhNTr66M4hywK1
 J0EIgFup36JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYXRQAKCRCLPIo+Aiko
 1ccyB/91WtfAKSG7oAIcANu9YZJIQqQ3uZFxMWZEOOleVroXsEQTqIpN8rP4CEeaf1mzAJWb10Y
 VxXKdxOiOllbWBOP97bjLukuSYDlqgc/P87HkTCTVY5WvTAYReEQEGdaXZU1VVBJgOKrl6u6Nf6
 5gYu+C4QU0HObuYv1ImaWFkngOluMokJfVyOhk9b/7vUhDW0bB2X/NwAuPrt5lNg68qvVcIbJkk
 iEPmH3kCQxQuU/THoUD037Eo4znFy/dDOeWM03kRuF/uw94o2xQBqvswdxXjMjW8ivhEI6X8xXX
 UGcAq16ZbPXKZuhJm3eJ2JvEqDOm51kw6Sjx1PIO+ReHfXDF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX9pszusXqPR4k
 LrP9m/DHIIHqe/mxLcJxx0uzFr+LUl0zHC1GFLnR2eHvrL2MybenDQ/evPE/uuYMnCo1MAq6RyU
 4KndIFaqo1igYsgxyS5gm/WC5ZUdGk4=
X-Proofpoint-ORIG-GUID: uRttWOGEcplugEkmF9le1_Z_2EGW-5RZ
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad6175b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KeTiLIfg1DN4_MrrFvcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX0oW9P3+DMzhN
 aTeyz8JX67Tujjj5ol3jjs9VGYHoH4YrGFrdLIQ5OpE+NER75IGFYr+oW0uCW9fOyVZ8CQUrE/1
 Z04ZDBN432vLv+ixTPptz6xCAFtJsJN54smjQhlYKdHhSMzw4h+7auqRhissuivq27Vgahiipnt
 r4GuYEhs76Yxw3+/H6ELILx+o6YM91HiUt8g8XXS1e1epfvusJEML00ailJIQzxx/1TeMsufa5+
 cs5mloH4dhnnFn51BMlqLO04gABGQGxWdcJFYkUlIysH2Ad/SDu4DBxxCK8DM1/IdMsE2KoO/BD
 lEOVhNUAUVpxJ3DdahqMABJgacyXz4CDy/4NQQ2qutQsHS67PFx/fm/HXVrPSZQZ8IEfe1eHoma
 sJ+rtQdqXyXObD1KDn/3c/LS8cv12HjnSpOmbqZZT+YoFWFDLAIovaE1cSLf94YBWgMrNRCEfE4
 9KG/zXObA8mTzkwntjw==
X-Proofpoint-GUID: uRttWOGEcplugEkmF9le1_Z_2EGW-5RZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190052

Rename drm_writeback_connector_init_with_encoder() to
drm_writeback_connector_init() and adapt its interface to follow
drmm_writeback_connector_init(). Drop references to the "custom encoder"
from the documentation since it's now the only way to specify the
encoder to the writeback connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c    | 10 +++++-----
 .../drm/arm/display/komeda/komeda_wb_connector.c    |  8 ++++----
 drivers/gpu/drm/arm/malidp_mw.c                     |  8 ++++----
 drivers/gpu/drm/drm_writeback.c                     | 21 +++++++++------------
 drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c | 10 +++++-----
 drivers/gpu/drm/vc4/vc4_txp.c                       |  8 ++++----
 include/drm/drm_writeback.h                         | 10 +++++-----
 7 files changed, 36 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index b5b186e4f81c..18bee44794ce 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -261,11 +261,11 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 
 	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
 
-	res = drm_writeback_connector_init_with_encoder(&dm->adev->ddev, &wbcon->base,
-							&wbcon->encoder,
-							&amdgpu_dm_wb_connector_funcs,
-							amdgpu_dm_wb_formats,
-							ARRAY_SIZE(amdgpu_dm_wb_formats));
+	res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
+					   &amdgpu_dm_wb_connector_funcs,
+					   &wbcon->encoder,
+					   amdgpu_dm_wb_formats,
+					   ARRAY_SIZE(amdgpu_dm_wb_formats));
 	if (res) {
 		drm_encoder_cleanup(&wbcon->encoder);
 		return res;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 77aecf4d3f09..7c64facfd799 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -186,10 +186,10 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 		return err;
 	}
 
-	err = drm_writeback_connector_init_with_encoder(&kms->base, wb_conn,
-							wb_encoder,
-							&komeda_wb_connector_funcs,
-							formats, n_formats);
+	err = drm_writeback_connector_init(&kms->base, wb_conn,
+					   &komeda_wb_connector_funcs,
+					   wb_encoder,
+					   formats, n_formats);
 	komeda_put_fourcc_list(formats);
 	if (err) {
 		drm_encoder_cleanup(wb_encoder);
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 7f5e25adf999..7e1d1c0988ae 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -240,10 +240,10 @@ int malidp_mw_connector_init(struct drm_device *drm)
 		return ret;
 	}
 
-	ret = drm_writeback_connector_init_with_encoder(drm, &malidp->mw_connector,
-							&malidp->mw_encoder,
-							&malidp_mw_connector_funcs,
-							formats, n_formats);
+	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
+					   &malidp_mw_connector_funcs,
+					   &malidp->mw_encoder,
+					   formats, n_formats);
 	kfree(formats);
 	if (ret) {
 		drm_encoder_cleanup(&malidp->mw_encoder);
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 683da368e339..89c36f1414ce 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -165,8 +165,7 @@ static void delete_writeback_properties(struct drm_device *dev)
 }
 
 /**
- * __drm_writeback_connector_init - Initialize a writeback connector with
- * a custom encoder
+ * __drm_writeback_connector_init - Initialize a writeback connector
  *
  * @dev: DRM device
  * @wb_connector: Writeback connector to initialize
@@ -241,8 +240,7 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 }
 
 /**
- * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
- * a custom encoder
+ * drm_writeback_connector_init - Initialize a writeback connector
  *
  * @dev: DRM device
  * @wb_connector: Writeback connector to initialize
@@ -269,11 +267,11 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
  *
  * Returns: 0 on success, or a negative error code
  */
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-					      struct drm_writeback_connector *wb_connector,
-					      struct drm_encoder *enc,
-					      const struct drm_connector_funcs *con_funcs,
-					      const u32 *formats, int n_formats)
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats)
 {
 	struct drm_connector *connector = &wb_connector->base;
 	int ret;
@@ -290,7 +288,7 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
+EXPORT_SYMBOL(drm_writeback_connector_init);
 
 /**
  * drm_writeback_connector_cleanup - Cleanup the writeback connector
@@ -320,8 +318,7 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
 }
 
 /**
- * drmm_writeback_connector_init - Initialize a writeback connector with
- * a custom encoder
+ * drmm_writeback_connector_init - Initialize a writeback connector
  *
  * @dev: DRM device
  * @wb_connector: Writeback connector to initialize
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index b0c1ca0d0dfa..35460a314a7f 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -219,11 +219,11 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	ret = drm_writeback_connector_init_with_encoder(&rcdu->ddev, wb_conn,
-							encoder,
-							&rcar_du_wb_conn_funcs,
-							writeback_formats,
-							ARRAY_SIZE(writeback_formats));
+	ret = drm_writeback_connector_init(&rcdu->ddev, wb_conn,
+					   &rcar_du_wb_conn_funcs,
+					   encoder,
+					   writeback_formats,
+					   ARRAY_SIZE(writeback_formats));
 	if (ret)
 		drm_encoder_cleanup(encoder);
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index c469f8b1068b..33b1bc37b362 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -601,10 +601,10 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_connector_helper_add(&txp->connector.base,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drm_writeback_connector_init_with_encoder(drm, &txp->connector,
-							encoder,
-							&vc4_txp_connector_funcs,
-							drm_fmts, ARRAY_SIZE(drm_fmts));
+	ret = drm_writeback_connector_init(drm, &txp->connector,
+					   &vc4_txp_connector_funcs,
+					   encoder,
+					   drm_fmts, ARRAY_SIZE(drm_fmts));
 	if (ret)
 		return ret;
 
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 879ca103320c..958466a05e60 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -137,11 +137,11 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-				struct drm_writeback_connector *wb_connector,
-				struct drm_encoder *enc,
-				const struct drm_connector_funcs *con_funcs, const u32 *formats,
-				int n_formats);
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats);
 
 int drmm_writeback_connector_init(struct drm_device *dev,
 				  struct drm_writeback_connector *wb_connector,

-- 
2.47.3

