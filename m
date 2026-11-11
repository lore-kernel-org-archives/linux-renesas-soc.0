Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357794;
	b=0LAXJ4Yz4NpUaeN4+EyDwXKHKjTRVVxnnH/kJ8Hg4XtODx/7skFvWqrQk7JIImhrnaMH
	 0SsgWPny9ePHmspbBbw0ycztf77cqjRxNjEzFl5kBWV/4WffhG2zU2wOMFCWUHQMJQR8b
	 Q58zQa4I00/acoc5Fk5pIBn1A1BV6uZgS7bLhcYW6aWCHOtjMKSbM+Y/LNJgvZ8tmlpMp
	 KxlC3AgKN/E1xPEnU/fP+FqMm7wmETlv3139hfHSE/wKWJ7jR8Xu9dOimruUzSmDWbhQc
	 AGPrq6RK4ytp1bEGhNsce5ySfdjBTGsHF3bre+njTjfA9BZJdHfOpK9HBsEUU/91dKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5Ku/OeLUuwKWykyNmm/Fqp8Hct5JXh1hluRcLpnXu8I=;
	b=RhFMHZL7nKGLycbvKGb3CPF3X8MUuYs8g/Mayp6WB1NYbOh19essmkNfOxIKzm9+MUzV
	 0mxwMkSNEpfErLQDqXM5MdWvikCjq6D3wLCw/z6cZ17BeVzvqDCYI7pji/lI3VH1nI/3J
	 VBwXxnZ9leJB6Fr82QWENd00Aw2KV5nrOPVaQYdjyDu34NoA/atJ/6z9xRZExFH0N6O8c
	 77FRc6X7Zy3l1h6FTMGuhD1FEe6s+dgpv99M7PZxFrW/FpgNRTJqyqCXAv/O9A9Gi5XyK
	 8yZCYFpnJdi8ZP4w9R4A5DNtz2xsXrUHkXQ9bu/5Uwtsh894C6iYOYuwb50ql2zk1PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BzEn3sYX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=itzYPyVq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF3D606A332
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF3D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BzEn3sYX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=itzYPyVq
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMLKpr1117430
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Ku/OeLUuwKWykyNmm/Fqp8Hct5JXh1hluRcLpnXu8I=; b=BzEn3sYXtylI9PAG
	bFLzzWAaxxhD0cV5SmM4T3QaXi/ykeLX+DvlqAZfLceRvCkxwmv/UatR0gyo1G6h
	Ws4E4IZDHKZtEc6xNSi8R3gmGm5UD2BJ8Q7oBXl2lxqSUi+EHDQw09Gakg493buh
	ot5IUIM1sqvIrN2MedGEqS6nSRFwk8KGZJoqwLZ2aVxutTqVC6NOrJ4yRhnIRirX
	6ghyk29JOVn5J/abqQasUDoqktZhRpGzhC5nMSjmOf+H1XOb9hWYlB5DXJT9H7WR
	MC/RzcAN0hRAZcTVKYJq97yIbxGinJpLuA8Erxd3PhTFKkNNR9UIc8A5HupNQL3a
	FvqYUA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pvaep6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91eb556c8a0so52566816d6.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 16:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357790; x=1794962590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Ku/OeLUuwKWykyNmm/Fqp8Hct5JXh1hluRcLpnXu8I=;
        b=itzYPyVqghlqPT9U5jX4JkptzGqF0Oj3KLcd6etfSitbNtgmhCC2/r2V0w+tifpabf
         5zh7DD07DO3k5U/5lEd6s4lQvH/1btaaxHMJJmcN/RQcQjl2RqzElHfhOLi4Jz4ZQYvT
         7YjDQ3Vp3JCFABqnr8D5XG1JkeZy/0+w4JhmPtz9fVD+cQHAC4Y/C9xewUsqarF8flgd
         paq+lbAeLYzEP8/zO1sakQSJBTOa7Y/MSAiSe6Gfrm7RhaOPKYSpRH4AURG9ceFeUy0V
         jREYJD7iDSPm0TnzLXZm7VmqvtCfIdc3i1qBlQp3nFkvYfPY3cDMSfvbarUer8y9RCbJ
         wpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357790; x=1794962590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ku/OeLUuwKWykyNmm/Fqp8Hct5JXh1hluRcLpnXu8I=;
        b=bRWCsHCRsQu+P1bv7OJK/j3FIAImSoYlcHOvZ4J9lU3NLJyKSQMfrnTwhhl46JMO44
         hiPSVoeL7yjQaSzvddQwYd+JEfXFwu7hakPIJqE4W9PdZKjyukkNtiEzaAlr1SXSWONY
         nxZhf3vCIIuwQ/iUVD0psusvHC38OsrQeBgIwTwydihypibzoxQIZxGww7tTScE+U5/Z
         Dvu1SXjg7DylC9myvleIjd8HewZ/ZxKH60XMKjDPFBWW3T2u5MWgKrnwWZ56ImQISuSC
         0wdjmdliLENXC0IdeTwMw0NDLxRTMP0E2p14AFtoa9/aIMecXRD0I2zxaip6K9JzvA1o
         cycw==
X-Forwarded-Encrypted: i=1; AL+hErEg/m0m78aNFiNJickwNPkxd5z5qVlHyrH41xScntpQGWU24fwU1CCJcmY7L1xHNiUN5XX4eVUbY8zXr2nM+y1DRA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+CJMJuH4k+mshcAUCbkuACIFjB4fzZAN8ldSBDf2dh3aCysmd7
	BHrylO6ZqcNl8ABbSnpgm03ntPmTJXfa+8/rLhzsYWIBvwETMzWWkrP7K6Oc0oRQq7Z7ri+jx/k
	eJyYTdhF0Zpz3s1vf1EtiI09eAF/7q+TeIWVIxrCKs6cucAUfGq07w5qfFh9qaixxPE9EIjeoAA
	==
X-Gm-Gg: AYBFou3uTfMNuME3rhz0t5oVg8MGJjCDSg6ep/Zyt57tFXfB3MWwWcuEbg635s/h1nb
	H+ACoWKGd0nGKP1qZ+otorqj046uExxqcm0Hq/6IjiCh6B8kmBlTYOKoeg0o0GH+5AssU/LooYV
	1foPMr0Rwi1p93oRoeS6t2u1IJM6TwM6bXx9O7OgZhMAIZr99X9rUDu6gAm6cUvwrh1I0kHauIH
	ZYyV5RMiPXHy/H86/YtVyTYBiZlwb6zwvGRLV8J1kyKiGph5H3uN0S0pgmHXM+Cu+5Cc/vHDa7d
	zdiIaJlXqHbC1XBo3go1HqX0PzbsyQpUyROWsfbpMcZ35CwFtHYZlyhZuRRbKiY0yNE75DQddYn
	sXkApH9GLHlDtZLWigIH85YSverNWtAscbX6kkGNfVXud+Zffipz24qoNfccd32IrXGipnXQjN4
	ZCu0bp2Ok2QVLt5+5s4q+LbY5Hys0LGFjbQnFEQ4a6QO7pGV+/la8YgqZE2lh2kQ==
X-Received: by 2002:a05:6214:ac5:b0:917:9507:79a3 with SMTP id 6a1803df08f44-91f03f95964mr19072806d6.10.1794357790194;
        Tue, 10 Nov 2026 16:43:10 -0800 (PST)
X-Received: by 2002:a05:6214:ac5:b0:917:9507:79a3 with SMTP id 6a1803df08f44-91f03f95964mr19072186d6.10.1794357789523;
        Tue, 10 Nov 2026 16:43:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:31 +0200
Subject: [PATCH v8 02/10] drm/komeda: embed the writeback encoder in
 komeda_wb_connector
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
Message-Id: <20261111-wb-drop-encoder-v8-2-62948ed87d13@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3202;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Lp5iF1wPYd7ZR8ysGkNPRlB0R91IV/1mJqhjApWljyY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oFQUeoBmtk6hec2D1ovwQhovn+pZClwRUT0
 IfxlZPJrPCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6BQAKCRCLPIo+Aiko
 1dkNB/9CDgJcldqxSzpsV7Qc9VqdxHn6PoP3wfLRkab4MtPk941bI7DFn3D03sxocMvsHx8+Oz2
 pfDhhaEqrZIxElUkax9GdttGEs8f2s7gWHfVetlaN6gpr6vcs734kR8w8GAUm5Sf5SSrzNizUKs
 pCh5f4jShzqnWpqtkz+DdtbaZ2idcaLnGij8btMM4FnFQtAlatU/GrtdY3VX6MalndcGPLAEWor
 5ZggC8gfC5UHWafO17BCTkif6J8udp0/F+n0jnyyWDSGm6f8RDH6OKIh0l4/nqAz1rSAdImA1XN
 qrmP4Qo08K0QO+bolao6yC86tSgmQ8VsGH2YHR5mniw3sskt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af3ba1f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=eOsO5XS9GAZRO-ePzeIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 60wNOFCKpr7bowbo7e2DPQEd1fQulnHo
X-Proofpoint-GUID: 60wNOFCKpr7bowbo7e2DPQEd1fQulnHo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX2le7i+lzJyXh
 yVC0GcWmCJBEGb6sw8uFcTzs8MoxEkGgTKqmw6ADqeAeCgeozXxFchbYqU0nkLIov08S24Px+Ky
 4nYMeuYRXApCdTADnNcRHg1CEKnp3dE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfXzpY9l9g4zADG
 zqktgVxxmUcyQ7T05Mjt85s8aEUwWKXq+I7lGAbSwoxm29kfk5BRob3CVjgkPl/8MnkzjlEKazF
 ahple+GFvrP1xV1SxaT065q52tpf9OYvbcnYI62kojDHNiAGhk77P2mCChQ/QuA3c20QxUlnf+C
 Br8wLOLn4Z2slp8FS7PAuA6XZ0Hatk/CySCUVLy+8gA9UjNkA26z1c0lRUM2cYjtZJRCwl8limi
 zexRJJOiD6bhafAn03d1qwPVPhIFvd6XRs6DGbp0nidvTfJIRlKqdDOAoikCelSmqzCNwQQX4of
 xL0QO5CjaPf6NKcpPFAw+h/yNX9krQYEwrbNMazHGIhPXAeKxI8fjF0yKrW8fDDztpgKkfaNXfA
 gWCe7F1+WU9qoi4iKTH+iN/0LmbTbkwkHVFUgRdzKU1no8bI136kofaugRnH402YZSXb20eC5nD
 gjzC3V7/HQdN1aoUDOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110001

drm_writeback_connector_init() hides the encoder inside struct
drm_writeback_connector, which is the only reason that structure carries
an encoder at all. Every other writeback user already owns its encoder.

Embed the encoder in the driver's own structure and register the
connector with drm_writeback_connector_init_with_encoder(), so that the
encoder can be dropped from drm_writeback_connector.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
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
index f394971c0edb..7b795e1c5705 100644
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
 	.atomic_create_state	= drm_atomic_helper_connector_create_state,
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

