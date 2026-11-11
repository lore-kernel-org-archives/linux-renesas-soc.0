Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357811;
	b=fCJ+5MGM/UAQuNVG2NXiVq2HoNQWGbuqQtVyRGCiNLddOTKyV+Q3wMTTYpE4k5LC91AX
	 4Q3I4YahgrLsc+vg15S7dpu34mjg0saPcR86hX6M2DxmKrROHAC4NP2HaDcgtN1ssdDt7
	 3ZULRRR8+CV+msurNyCkSMdHagyg2h3cvXdNPoDW+Aaz/YLX79UaAh0yRjiHSFfW5pwPv
	 6qZTCHiVXoqigw3jy6REFbzuEGz799RMlcpUN04bA3No/84WEh1A89fnj/IzctoVqJDxn
	 HFDxZNYBR02sTYHAX45Lg1w5n4weu5HzWz4BXNvNpd4+XreY7yblcktHkOQo76Zspdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rem+nrfKD98GZM8ZtF/WgXdv6SPv/ujdk/JlCqHr32o=;
	b=iKxgoN+OwNe8eMWc5qsirxS256lbqVnQ4T/jziu101y4y8hEIsBAxpx3GD3eNIU1TqwL
	 NBNFm6UICDvDD6lBh7Z50cDY8prCspDyR6cASZqhCw3TuycCqvqVUohtCJnN6GtDYIU0l
	 Lm8nugmaR0FJi8aEW28Gim9y92c3hKhsIniZQHGo4y5027SFlWXkhyrQKp2BDhFPwaexs
	 AojjvZhkzJFvAF3sTDT1vP01ItPPrlp0M0CBwQ7pdnvPXX8UUe/0zEAel1rTU86F2i1bU
	 dKSCWBLYLGcWmRh/ChHnOIQb2zQNQAzLi5Gf5On9cELWGmA/bpO3wwpVAjAzdCF2rBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n2hRQDiy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQnRacl4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E8D60A3828
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5E8D60A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n2hRQDiy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQnRacl4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB0FEXl725833
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rem+nrfKD98GZM8ZtF/WgXdv6SPv/ujdk/JlCqHr32o=; b=n2hRQDiy6GFShLEd
	hSU+67EAvYYb1h6YchOYKSuTjMCeNR8TqEIQks2zfBEz1Jp4K2zLdG2d9BFxRZMu
	XFgBc9G3dWDpHFjhhgGhBZ/24BkgGmyeucBoZSghmMEtoa4y3ckvaBuqsji39c1w
	imS7ZEyUFUxuPadtPthUCleyU/NiaBGireIIDsjtQ54pF2QHPjWnbqnVyjbD+LjQ
	gR3DnrRYVxeb9qKc8lPDqsLNVd1HmRbCTBGzqd1xFDypA2yH3knNgUg6qi0Z4YqB
	dN73YKI5uSkYqO6cXwzk0gCPwZgXWNUs84VSNI0YxN3h8YwErxm1wQt29QICBhhk
	MZWgug==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm82nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91e987a4099so54766476d6.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 16:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357809; x=1794962609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rem+nrfKD98GZM8ZtF/WgXdv6SPv/ujdk/JlCqHr32o=;
        b=FQnRacl4IQK4jyV9tQPmlKyMZMsZHzq9XidoGLwKGcAzwkbaH88rosNB/QV2i9UpMt
         bR04H6KMFctS+/OTinyjOaeb46RBV9AVZsy07iZ8YYt3rqB4GDfcfF75RrpU0M7DVWLE
         SgPXyoSG8AHzL3swPgn9s+pgpuQ0pbnmjCFgI295o5qFwHZBPewpQ3U4+NXKUL5uYraz
         +hy7aKNMMuEuNXrZvFaJPNBAv8sG7n8A2ECDgiPjZELxNa4F6sQQTh2E4VRBOepK86Og
         UJb0N7S1guFEaWMkc9mev/+tZQ8y9mhs4G7cdWVHc3Ksj/WWg9BSuO209TnON1C3tUGA
         Exeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357809; x=1794962609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rem+nrfKD98GZM8ZtF/WgXdv6SPv/ujdk/JlCqHr32o=;
        b=cK+QuQn4nHHV4iSQj3KjL8fvsue3mmgyUtwJ7pDGYqgfvK2fk4tbnqdLKtPpjaCemk
         f6IcjyG64Sig/Vto5svv7d8rVuIZAzWPADmTBnJANNBzrtPLvQX+67xSqGF6hVfSk8bU
         qvcRP6AWXftvaQZERyLAZOTB2jM2qb3ZFN+9lqNsEsT7HdrOfib03nE0LJrSX0rYDBaj
         ejx3H1Ohe6VmO7H3mNIEhmW0lYcuPGGUZpIktroqeKYBWJE64iOTG+pnmHwdkAofWCOR
         yQ4YoFZ9zhEEZ5iYjteeSGzTV2eqKvx53TOGasN0dZ4ZERDaUsZOesgQ+4YHdf1AQwnk
         +l7A==
X-Forwarded-Encrypted: i=1; AL+hErFM0qKevfSpG/KK6j/4pBKiZpKOGcANjNdxqWb2/fkZ1TsAWFJCkU0C5AWfNRl0bg2Dr2OqkyB/QIZGVMSct710ug==@vger.kernel.org
X-Gm-Message-State: APuU4Z97rMb2oVHsxSiWKUQ7pXoVoaRxAO/GVJVYatmiT4fK5mYYPx8H
	3hzrMJPkFL9Jzzved+mPqIdd1sHdDFzrtCju8DVPUdr4qEDWZaY3RxUmWni6FrCZ289sh3JUa0G
	0d9qy5dlKW2+h0KL6lt2JHU68+s9yQbAIe0X6EjxXCwxJxDatETH5fHRz4XeWLRU7UaeuL/+peg
	==
X-Gm-Gg: AYBFou2aC+jrW7+6d3EZBgYdeJpRZEqdYUX1lTCzdJQg+eYC3ho0t1dKL0OF6GJyz5A
	io3KD25X7DFavSySHRhKwXWpzvtBZexuoeHzU7Gf+HitH059F/FNyay7VWMCVKqv2r0eLHVImkU
	TZV1b9mYyKxSTAgUnzvlkbBd+w0xLEU8oI/XOIO0ivaqDJMPdXxzsxkT1jfVow4LB+uVDWJ9/+Z
	SKWLiLWpU81f0uogvj5vk1WR9X76LIHRbDsE76LESD4AA5URqL3qQebdYqhtS7O0T3n1iWl6Kwl
	iDop1S5X/BV55Eyz870uAZGWfVdOrXy6Va8k1s2Wa5jp3N+nwyhzCLlutPkfEI0vTNmXbywm9lr
	KeL0HXLNaixWr0KkqT6DrJQHW1fWgWsHSu+opsnbrPDezFaQ8iGMPrVq8ayNIum/ByGZffg2iav
	R8OLpEHnFoGAEmQ8gjV4EbTrvJzYNFURvUqA0LL6vRm/CCzy3ZRFmzAG3g3YcPpg==
X-Received: by 2002:a05:6214:4109:b0:91e:8cb1:b842 with SMTP id 6a1803df08f44-91f0416afc3mr18113936d6.49.1794357808892;
        Tue, 10 Nov 2026 16:43:28 -0800 (PST)
X-Received: by 2002:a05:6214:4109:b0:91e:8cb1:b842 with SMTP id 6a1803df08f44-91f0416afc3mr18113656d6.49.1794357808309;
        Tue, 10 Nov 2026 16:43:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:39 +0200
Subject: [PATCH v8 10/10] drm: writeback: drop the drmm writeback cleanup
 action
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
Message-Id: <20261111-wb-drop-encoder-v8-10-62948ed87d13@oss.qualcomm.com>
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
        John Harrison <John.Harrison@Igalia.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2573;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zFchQ2Tm6mpR1tJxfS8Ahms9paw4/2N65BwMaqhRGdY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oXF36VJi20ypSJvvq0dMWU2n97wmd2BNuWU
 te4JTfo1TuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6FwAKCRCLPIo+Aiko
 1YW7B/9R958+trlT+7V42rGUF2nKBhOCM/QjmDp20lI1gchwVYH/MyskiElts+RvZ6vF57MfsF7
 s2GB6G8nopGMASP96cG94rLE2QB9YR12H427s6ulj21GBbzS9PNLYekGjpLwHxOWbAzhL/Nz0nC
 fdMwFIwlEzLwQgKnWLX9aRAaRdObJ4UTPD2sE8lrGgn3CYnGMlL6HoIatUuOHEidXdfjcHmxgGv
 0i3n6pgfNBPZwruEmZp8pZNdd9wq4OWN6vg2M/gJ0bf8JI/glC1xcvJJm+ljqyn/UTNqFw87cLD
 aRfnet3H/pMM9TfanUoMF8hT8roQsmUP1X97qRM4ryneWyKp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -fUXmAjE6J3Sz_DM9UJKIhxFUnicEzCH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX4KO1glCgr1af
 zWZApDiipFydt+w1DqwtuyyAiGGhiIfP6tlzq3anUotZ+RtE1yq1533PaK+/A8l2JdVZcWelJz6
 UMOQ/AgMY37qZHzLUNOQ6Yo5xrP8E4g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfXwLur9fnQLEzr
 zDpcnkAPGOw09nkhPKBdjDR2Saq1nunFX7A41RLhk+Vks+xQ3cbummlCxEaXQwA29i0Ph1yRoUP
 A+Bislv7YDei+sW5nb7XH39lHUQneitg+X50y/Y4Pnr/fEnUk3wwGUUjR7alI6LKywNBq1xtC/O
 Xi4tBiqVVVsWp6ho1VIO58actQIgSkt6Iou4KkJ+QuEEfiUPWTarSiD+q7ymQPrjobHOR5hgUs6
 PMhD/u5dlxXMLGTnLwVDN6dEWdSeKIgQOUdWCbeU7f+/hkrYdKdCjQUSZbAKYhV8kOmuvU/Uo51
 qUvWbI31bTGFIOa8QNQGlk3h6yM78K36YSaJAGMyS3a7KXRJq4v3st9MQLQuQ5ocwasMg3D0H7X
 CJHfi0YLF6dSao1OoBvPPd3BOa7nNyshmu8BDT7eikRz3/6TEcly0y4N+Dr4tEy230YtuvH4GhE
 055GejeuTLK5+uVaq6Q==
X-Proofpoint-GUID: -fUXmAjE6J3Sz_DM9UJKIhxFUnicEzCH
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af3ba31 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=V2sgnzSHAAAA:8
 a=EUspDBNiAAAA:8 a=jfrLVL6Nzc9eZwqZ98kA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110001

drmm_connector_init() already registers drm_connector_cleanup() as a
managed action, and that now cleans up the writeback state too. The
extra action registered by drmm_writeback_connector_init() just does the
same work a little earlier, leaving drm_connector_cleanup() nothing to
do. Drop it.

Reviewed-by: John Harrison <John.Harrison@Igalia.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 6ea3e55a1962..097d480d6187 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -16,7 +16,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_property.h>
 #include <drm/drm_writeback.h>
@@ -308,14 +307,6 @@ void drm_writeback_connector_cleanup(struct drm_connector *connector)
 	}
 }
 
-static void drm_writeback_connector_cleanup_action(struct drm_device *dev,
-						   void *data)
-{
-	struct drm_writeback_connector *wb_connector = data;
-
-	drm_writeback_connector_cleanup(&wb_connector->base);
-}
-
 /**
  * drmm_writeback_connector_init - Initialize a writeback connector
  *
@@ -326,7 +317,8 @@ static void drm_writeback_connector_cleanup_action(struct drm_device *dev,
  * @formats: Array of supported pixel formats for the writeback engine
  * @n_formats: Length of the formats array
  *
- * This function initialize a writeback connector and register its cleanup.
+ * This function initializes a writeback connector. Cleanup is automatically
+ * handled with a call to drm_connector_cleanup() in a DRM-managed action.
  *
  * This function creates the writeback-connector-specific properties if they
  * have not been already created, initializes the connector as
@@ -349,17 +341,8 @@ int drmm_writeback_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	ret = __drm_writeback_connector_init(dev, wb_connector, enc, formats,
-					     n_formats);
-	if (ret)
-		return ret;
-
-	ret = drmm_add_action_or_reset(dev, drm_writeback_connector_cleanup_action,
-				       wb_connector);
-	if (ret)
-		return ret;
-
-	return 0;
+	return __drm_writeback_connector_init(dev, wb_connector, enc, formats,
+					      n_formats);
 }
 EXPORT_SYMBOL(drmm_writeback_connector_init);
 

-- 
2.47.3

