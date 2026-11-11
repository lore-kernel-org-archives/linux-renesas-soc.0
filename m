Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357810;
	b=aVe4Hm1ZlSrWDYma6i7LLgKkUwIGHEDRQjGY0aEW/nn6iZ82/DNNeE3ioGuewP/x3OWs
	 mdwiuYny6uyramzTr6OWRo38r77zeoiPqV1gwg2xvhMFeeezKPikgPoqqOxGvhHO4rGiC
	 EojTiSjzvjTDkJs4LAt3piITu+8fGqmg44HzwAUbazuBvuI04mbRlTrTHrk+EgxD50fm0
	 EQpZzC1Lg37MTq57pgigxW5q1NaBlgCUMDUGQwNrTjw5owPd56SXxwV+XBCWpq2I5EfOw
	 IEVRLnXrCaplJhUGgeFqVJwFjQ3wQuZcMYsjuXXCx+PQYx0x8l7X2hUlZWddp4cnxSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SdrgOO1kZ/LJgG/yaXawlqaJ5/GwT+jqCvdWQyL4krg=;
	b=zuXUeCkbRwFIq1UgLX4mV8ieqzBhm9o9zQHF8DBDrFL3H81V564nNiCng6dz7zy/JVDF
	 L00Z8WQCtcOSbRxzwdYz5V/0r2xUuJYP75NxdlLtz26WJYkITtqFPQU49BgBeuA8OohIA
	 K5HuCGA4HH8EVXONof1FQOjNNrY8p6935fjx5Z4mbQPPfCmWYRI3Y9NP2NsIiXVDBV7Ej
	 W/ooQ6jwvZZ87DSNfFjkDhurgsfawRmd8XfkDrBGl0jQ93Z8ycKMsp044GoxU/LU816qO
	 U0tRp/zJ2XL6QC+z7B05DB8YOdR+QpbgDlbRssKUeRkXLoO0nzxUPoMtgmKsMzPHAoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h9zqxJjF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYeNAajF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5B360A381C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F5B360A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h9zqxJjF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYeNAajF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAML12E1116998
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SdrgOO1kZ/LJgG/yaXawlqaJ5/GwT+jqCvdWQyL4krg=; b=h9zqxJjFYhD28UvK
	Ij1h7eXNmw3UsK6AJTLnInELHhMXwJV4xlb5zOl7B0hwd5BQUQVMFEm3m+6hKpAm
	PgoplbjppNcWr0Hma8+6CyRL9XWbceQW5EHbX/4uGZW6DT9fMcNpLd1G/qA1Rzt7
	0ZA8eGER2mgnTZkIc+/Lj6Rpke/j/hwkD80D5tjMoa98fSC5LGBwjIgAUR8duttr
	vriHmTxpxCbOOONW94S7mTbSuC9YCp04TzdEgPIDdtdVVp6U88RMZag48Ny4dA88
	B2n8s7+LCLRufK69P4G65o8EVywqZtEYW9+mJ8TutVO2mLi6qW1vbhAII8928jR8
	TgkXAA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pvaeqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91256a7b7b3so41337096d6.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 16:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357807; x=1794962607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdrgOO1kZ/LJgG/yaXawlqaJ5/GwT+jqCvdWQyL4krg=;
        b=dYeNAajFTlGbT4An9ls0M2LzHp8bUuhRZxnS/R8QzMDnGU6VhaHc0KdWx8OtZhO6uw
         gKp8P4M0v03a70/sPz1k0kscMEO1HT/NCXhFF6q4QBNJsGGHRjhwb8xsJmh5qZNQVm+n
         N+eeG9vdxHgYVN1YXycnu7zZujidXYFkvykVYdBxaoaCakSvLQYnFm1LXwBO0gG5CGly
         JiT7IdoUyDMxlo966JIx7SHUfGrKUtLV10IwxHs+b5Fwk36zzW9CCT/3FZsGX58mx+M7
         x+bih9UW0D2rFlTwVdZD3NAaaThg+gS2YgMVTZtVaZ3Hn6KrHH6lKfRxmaB0jBfxoVbm
         m2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357807; x=1794962607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SdrgOO1kZ/LJgG/yaXawlqaJ5/GwT+jqCvdWQyL4krg=;
        b=CphSp/aWJFk1T2cD3iXeE4Gfoi5OVfYeOQJDcZYCKfkuAkxmriFe0Jw0Wlw+1PGzhM
         dhSl+8hjIc/rPIUmVvJ8h3ZsN4jY+1y2oIb0bQ+1hiJ9W+JSQ4ZxN5JQXuRP/3WoaAhA
         mQyIJ/vXxFK5XvUZNrjpOCNLU7HOuSAxKl86OTI1K+Pld6RV7zY9WHqtqz6k47DEdUqy
         xLpi6KPVn4+NHAAcdY/ZfgPh5akNIvr+wM73+UhiyuqVxyRk1sDjpH10Gob5TQJUxdwx
         J0LaZKmfLQWSTC5HfTbBazCBVHQ9xKSDLJjStxg7tMIwoL7oZTo8U5D90uWU7ths+VDz
         GlWw==
X-Forwarded-Encrypted: i=1; AL+hErHAZWOwO1lRTm4tlzgC1BBV83TltCHzT4UzjtId/0vrGVqLDW+j1EnhTrbpNrxetvzkjKj0G9fivn+uy6VGIcCWuQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9PCErnBKWFwkqDibFOCSIVgL5oba9/txyp8k/08bSKNVvQR0Yq
	t+MbyLE3K80Hp/RiWIZ9tvcXPI21uKBaVR3rgq1ufCS5aoLoUkGqoAIZ1IGmqyMK/ZuEES6v+gV
	qvB8X0Jsh8jShOYy4qy1Do8qylsB9pAlH8JIEQapTiq5kAXz6PxClHJUkLFRGTdQmHIi0XK01vg
	==
X-Gm-Gg: AYBFou23C1l5z8lWbyQBzVoEB3afl7sN4CVqYmppKi1EW6L0UD5XdzqmFSK3gtTRoyb
	pmw1gNYnC3pOifnXiIslHtvKQS691L4c0h4OgxOQv/oeNNTUk4TfkOCRCq1i/vGZL8QlrGadQLW
	ddNdkr5/GjGXUe6GTTHWysgH9CEjL6Qz4atTiBBJISDXcOJJqR+Kg20Mu6lK7/My0JpemsAbh9F
	uDdqT3ljQ8q43AF0rRhtL/uLgwq6JP8AF62Y6xmg60ekBvMCfuh6Z7dRpj6sZv+cVFYQoCXKXIc
	iG7eOl7+QFmiQJPmbcDLP8XFW77M2CArGRlE1HgEScjBTav3xbwlEGvuTlwK1yF4jO059muD2LA
	Mwl/pAzIrZ5W13kv2FDiS5QG3vUR2KX5PVeYTQoAq+vnA78N2F0aw8AswA00ukdwPl+Ds3MadFU
	/7wvonf6mj9YhaDd7blr09wneZyP4NpzexdvWy3lkCtqL/qIcXj3endgvKqATEaA==
X-Received: by 2002:a05:6214:529b:b0:91b:8025:6827 with SMTP id 6a1803df08f44-91f0411d3a5mr17363656d6.21.1794357806518;
        Tue, 10 Nov 2026 16:43:26 -0800 (PST)
X-Received: by 2002:a05:6214:529b:b0:91b:8025:6827 with SMTP id 6a1803df08f44-91f0411d3a5mr17363256d6.21.1794357805821;
        Tue, 10 Nov 2026 16:43:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:38 +0200
Subject: [PATCH v8 09/10] drm: writeback: clean up writeback connectors in
 drm_connector_cleanup()
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
Message-Id: <20261111-wb-drop-encoder-v8-9-62948ed87d13@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6133;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BrJAtr2wc8dHMLrCB0wAes1muKcDYhiw7YM4ATkNvko=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oUuxLWwzl7qKvchquyNbQBCvVpstIV7joS1
 cWcAHzvWOiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6FAAKCRCLPIo+Aiko
 1Wv8B/sGJZubZyrWIr8blvtjJMU8+jiAyHEiOmDkjw8ca+3HLKX5PXHhdcyvjOJV0zMGRqIsYjc
 QvO2VpNtsYZsGNufKKGpkIn2XxThPyValQg4HBWRAJO6QyKRisuON4TTSWX5tfJ62QiOFljnxTe
 JHXbO7pwXsDTEJTI0+ul5F3/NaPUs0AewITBLCbBYAolgEb1UJKRtxDQpFbt/iPoUp0crdAv/AU
 +ol29ENhA+qhWWYHzEM1GwZjozk5EvSxoJ6ggs8hRMAiNcJW3fhI+pWnmG3q7AaOJGpX32LYz9n
 cAPm24H35pLd6+L3IDtHQmYkBsDrpgm0Uh/8OTJgCQMXRulk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af3ba2f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=6GQbiVArWzZUabU3hp4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 6UAzT__zFf5hJKaBU15B3Bjt6HWN0Grd
X-Proofpoint-GUID: 6UAzT__zFf5hJKaBU15B3Bjt6HWN0Grd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX/Gc6/Lkr6w9j
 J/E1zk81l4mUBQELQ8jIUbpVtdFxfXGygc2u+Nm7NtEHmxgp+utI9erMY2tat20shTThwKiPeSM
 Fvb7+a03KxCd77zukjD5gIEQJZ+lh6M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX4e5tOLab+vf7
 B2FkqrONhhHuHZrC7WahHAEakbEfLxUqMtc1BtT+V5xJMk+kTrfnAQf6ilLbpjXTsqfhsdpiksU
 2SMvTc5zySBA5FBhnD6aR6wlo3bEvsIJJc+ZMR/35LQAdjCFXQgdUbLWY9bIfTP7Zz+1irs7WJz
 aDs6ZH9VHxsrPnlcEVs2Fn6fZmOV8595lUqYDnx9fn/85p44tCVlmBapb8yUjUP+5ChxK0372R5
 vbAfb9z6gtwQ7k0+ILBCEdtu8EJ8FDpJ9Px9yNEYLVWYYuf5eDOBPS47W+ZEzG81SznhSqmdeKb
 5n2iZjFrP6mSEq4KGMc0IZdMRup+GrDHy53MjEnh7cLSm6/ANBdhvhPfACpB32ZzKnVWBfO/2M/
 sb/OKj0Q5EVqPvQvVpfJ5pg3ZRUkCMcpSlvZbXzLvqH7p2an5rL5pwc/Ug7HahCOItdq5cLIrwt
 GRpvLy/wstrTig/TKCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110001

Only drmm_writeback_connector_init() registers
drm_writeback_connector_cleanup(). Connectors set up with
drm_writeback_connector_init() (amdgpu, komeda, malidp, rcar-du, vc4)
never drop the formats blob or free the jobs still on the queue, leaking
them together with their framebuffer and fence references.

Call drm_writeback_connector_cleanup() from drm_connector_cleanup() so it
runs for both kinds of initialization, the same way the HDMI audio and
SCDC state is torn down there. It downcasts the connector to its
drm_writeback_connector wrapper, which is only valid when the connector
really is embedded in one. A plain drm_connector (or a different wrapper
struct) may be initialized with DRM_MODE_CONNECTOR_WRITEBACK without being
a writeback connector, as several KUnit tests do, so keying the cleanup
off the connector type would read out of bounds. Track genuine writeback
initialization with a drm_connector::wb_initialized flag set by
__drm_writeback_connector_init() and clean up based on it instead. The
drmm action now just wraps the helper; clearing the flag makes the second
invocation a no-op and also covers drm_connector_cleanup() being called
after a failed __drm_writeback_connector_init().

Fixes: 935774cd71fe ("drm: Add writeback connector type")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c     |  3 +++
 drivers/gpu/drm/drm_crtc_internal.h |  3 +++
 drivers/gpu/drm/drm_writeback.c     | 30 ++++++++++++++++++++++++------
 include/drm/drm_connector.h         | 12 ++++++++++++
 4 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d66188521881..da0b16f25ac4 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -921,6 +921,9 @@ void drm_connector_cleanup(struct drm_connector *connector)
 	if (connector->hdmi.scdc_work_initialized)
 		cancel_delayed_work_sync(&connector->hdmi.scdc_work);
 
+	if (connector->wb_initialized)
+		drm_writeback_connector_cleanup(connector);
+
 	platform_device_unregister(connector->hdmi_audio.codec_pdev);
 
 	if (connector->privacy_screen) {
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 3492787c3697..f60216adcd31 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -329,4 +329,7 @@ static inline void drm_panic_unregister(struct drm_device *dev) {}
 static inline void drm_panic_init(void) {}
 #endif
 
+/* drm_writeback.c */
+void drm_writeback_connector_cleanup(struct drm_connector *connector);
+
 #endif /* __DRM_CRTC_INTERNAL_H__ */
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 6487f4a104f2..6ea3e55a1962 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -21,6 +21,8 @@
 #include <drm/drm_property.h>
 #include <drm/drm_writeback.h>
 
+#include "drm_crtc_internal.h"
+
 /**
  * DOC: overview
  *
@@ -215,6 +217,8 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 				   blob->base.id);
 	wb_connector->pixel_formats_blob_ptr = blob;
 
+	connector->wb_initialized = true;
+
 	return 0;
 }
 
@@ -271,22 +275,28 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
 
 /**
  * drm_writeback_connector_cleanup - Cleanup the writeback connector
- * @dev: DRM device
- * @data: Pointer to the writeback connector to clean up
+ * @connector: Writeback connector to clean up
  *
  * This will decrement the reference counter of blobs. It will also clean the
  * remaining jobs in this writeback connector. Caution: This helper will not
  * clean up the attached encoder and the drm_connector.
+ *
+ * Called from drm_connector_cleanup() for all writeback connectors.
  */
-static void drm_writeback_connector_cleanup(struct drm_device *dev,
-					    void *data)
+void drm_writeback_connector_cleanup(struct drm_connector *connector)
 {
-	struct drm_writeback_connector *wb_connector = data;
+	struct drm_writeback_connector *wb_connector =
+		drm_connector_to_writeback(connector);
 	struct drm_writeback_job *pos, *n;
 	unsigned long flags;
 	LIST_HEAD(jobs);
 
+	if (!connector->wb_initialized)
+		return;
+	connector->wb_initialized = false;
+
 	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
+	wb_connector->pixel_formats_blob_ptr = NULL;
 
 	spin_lock_irqsave(&wb_connector->job_lock, flags);
 	list_splice_init(&wb_connector->job_queue, &jobs);
@@ -298,6 +308,14 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
 	}
 }
 
+static void drm_writeback_connector_cleanup_action(struct drm_device *dev,
+						   void *data)
+{
+	struct drm_writeback_connector *wb_connector = data;
+
+	drm_writeback_connector_cleanup(&wb_connector->base);
+}
+
 /**
  * drmm_writeback_connector_init - Initialize a writeback connector
  *
@@ -336,7 +354,7 @@ int drmm_writeback_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	ret = drmm_add_action_or_reset(dev, drm_writeback_connector_cleanup,
+	ret = drmm_add_action_or_reset(dev, drm_writeback_connector_cleanup_action,
 				       wb_connector);
 	if (ret)
 		return ret;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f656ed8324d3..07218ab26c9e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2688,6 +2688,18 @@ struct drm_connector {
 	 */
 	struct llist_node free_node;
 
+	/**
+	 * @wb_initialized:
+	 *
+	 * Set when the connector is embedded in a &struct
+	 * drm_writeback_connector that has been initialized through
+	 * __drm_writeback_connector_init(). A plain &struct drm_connector may
+	 * be created with DRM_MODE_CONNECTOR_WRITEBACK without being a
+	 * writeback connector, so drm_connector_cleanup() keys the writeback
+	 * teardown off this flag rather than the connector type.
+	 */
+	bool wb_initialized;
+
 	/**
 	 * @hdmi: HDMI-related variable and properties.
 	 */

-- 
2.47.3

