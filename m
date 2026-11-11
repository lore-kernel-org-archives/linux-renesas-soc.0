Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357809;
	b=xm4s1TTJfzJOlGsox/RyXHMxbSS5M1YxwX5yybMfkiKQ4Mn5L020Lk2TzAentMLK1rse
	 WXjnmFQWNC/erqrt4ww9s7F0G/Fol1qw7p0heLsjwGyLqoYWir16quYm7tuIW+n+XFzJB
	 m2VmQWj6vq8RmtqBDgkapdwYDUH7g6r4HGQHro8XTpnYD+eReRWKWue1xUxUL8gHuz7ta
	 tpPSUrVlAWHwlqfGJbYsncKaVSSH5j9ltecXp+ephFJYOe7qVLSseOuL1b4kvZwxTmbcJ
	 lQhGw1h5ScNB3h1CVM5vRxl9vJ5LXdlh9qTQTem8wcMTcer9ekBVEe6/5KdaURbvMMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IqrKT0cA3nLDIjgKp7KtkPxQyzK/HBBzs1wgJJzWDiQ=;
	b=0humf57NYFsM9SJlke6I91a2ZmtalAaJZpwOEgrhlPKSQUUGjEQ9C5YqhETNTwKdqoyg
	 ijVg1bRu0xsQnOdAYFcmDAKxat5VF5/9ry7vI8qW3puPIotwfmcDUrpaeng+GppGVJmEK
	 or0lnlOaGqDnewR+lR7KjLL8rlRImTKcVC+G+pQ3+niobUQPLOZgxU80Ea1vuH+Ik8XE0
	 gMT+Np5cP1EBrugBL2Di6T17J8KVTQW1fZau1J2bak3DT7FkgW9ckMZDxqF+LoiFWSSyK
	 aN8yT1OuHwJhviGT28iSEs1ABUoevIAFQU33ZjUnwKgaBIQxPko3SUnYckScFMkNT2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hvwrJspI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UqvYVYam;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780F360A380F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 780F360A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hvwrJspI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UqvYVYam
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKo8g1113908
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqrKT0cA3nLDIjgKp7KtkPxQyzK/HBBzs1wgJJzWDiQ=; b=hvwrJspIEHTugiEx
	IOFiIc5IM9EZ1hAf88dfpNx/HTDPm9kiBCa1bT8f633Yp1Jxsezg2xlKYxXKdnGN
	nAfHduuNtmPButDXy/GsOpu16W3Al7oT70ccsi9rlCEOr4v4yeNoIJa9E8UwPTDY
	LI6nJo3+MOHnh9xEI6wVhnOH0IaczrVnywc17Lc6Xo+mdsp76tCtx/l8cC+UtXX8
	mYohnWP3SPyj8h2gOfIwg0VRQHF26zTiaRbLlOANV2Dg5xRv2XYWU50bUH2svnKO
	RXEngv6FLfBkmwVseYfso3CiWsdiVS3fNScXx9y8c9hBFt9Pe0yIKYdX2X6sZHzD
	Ao9yPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97c955m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944101e6367so494493785a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 16:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357805; x=1794962605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IqrKT0cA3nLDIjgKp7KtkPxQyzK/HBBzs1wgJJzWDiQ=;
        b=UqvYVYam1lz0KEQdZI7n06BjFg1Ebu4EBY6IT4qLetaCR71Z5XxYI+mUrMJnF72tgz
         rASbYf8DXRBKABuhYX+vR5sA/wlrk/7u47OCQtYfPhHf7nFP+mpEdNpCky3AtFy+h/3S
         bTqUn/oqc4bXBh+ZoPpVg7VdJSGdQLK39HaSdaYFieyqlZFjPaW3p3KLdOpPi7wA6si/
         3iTDDoEbs92pElGfpKyrU3xw7PdbGE4n6xmMtQ+2Pz11vKz9IXofHj7cyeX3hy/qqMip
         bZL2VlL/3YuU5K+t5Q3Ub1Cvaeyt1Awyx8Sd65erhAcwmi8BcC/KWRH3IblSRXEE6QoW
         kBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357805; x=1794962605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqrKT0cA3nLDIjgKp7KtkPxQyzK/HBBzs1wgJJzWDiQ=;
        b=IiynoXxRcY4fNpgauy2XMlMUG7YZCpUbUIQntFAS0XgqFXedgG+3T1lPRv1f0JG+Ts
         jaXCfR4RFUGrx3yQn2J0t+K2Hfgc3AXHEO/gUh0Q2gjwSrknpWUtCRbCCdDYOEbG6s8W
         vPjgTOrV4FY9rmxwqnv8iVKohAYkNUk9bRfJN8uUYVDXOCzsHfoPP4bkA5lfs3zb9Uj5
         rbJG/V7yxndjpO7owSrweHfpQatJCPs3rW4XwQf/hycp0ehfZAHt13g6xjYzbpb1cyU4
         CXBP+szLFMt9PSlS26pqV4/flOoGt+3gh79oZCQ8MRRjPTjhywxHs9jNHujqCCe+vnUd
         cYiw==
X-Forwarded-Encrypted: i=1; AL+hErEE7Ipbo19VlAkkXqHJSXCE9KGJX/WvkA7GNY/WskPo1l+tMeCtpSiHlj1RE1txM1IHDO1JEJ4Sv5jOjraVr+a3Gg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8m07XIqXsogJ7RoCPXeuu6T2yUhd67nPHRmgtCk++0x+wkqjz/
	z381956hRXio1LcbrrMduwznugI01kBGRpxDtIqNmK8AvhO8VkcNgkchZ7BOirZLAmCzuxegpDL
	7g1GMMrz1vJLLFDbOwz4o6IOh+wj9Zi4UPYqGS7b9OkVpQ8gpPUkkAf9fIcwxyu9B2t1UYZW97w
	==
X-Gm-Gg: AYBFou0ROW6p6ATOYJWpLxvjHjvFXm6NkMETbxjmRba6FS0qZUURPSJGe0E42xdI9iF
	W4PmCYgS/G3aCFAOv9MP3D4JBy7MWreFkXM/Avk9n4bLXrwPqUXuyD3LGMb3RdSpj3kfEdMxL7z
	bj0IkJjpOVGCwSJBzawStdZn9K6qSUT0EqqEVVuAMnoi1sg9bYks1U/QoVbNRDf2mLA/1epx0aa
	D//2krXq/vup6HeUxO2iwnE1kBHCXX+tZejAxJ7DCB0Shr15UB8dL6Hw27RHa0C6/Y8cq7gA0KB
	ezBfikLko6kvsx4uAMgucna38PLUpJT7y7s+loUYdmxi4rYA3UCiAIWcJx888H4C7UyAhsWjbT8
	6Tt1NrhkHRSzQqoU+GhCeAS8+btfwBum4DsinvEUImY6Pg5mLEwEQO+fU6UZRihhU6uqEh0/kV8
	06Hw0oYqj/0tx9qvnXR7a2ZeH46L5ebRccLheHHGyA1OcGLY63SAXzpr3k/mzPnQ==
X-Received: by 2002:a05:620a:6c19:b0:943:7e61:fd9f with SMTP id af79cd13be357-947ae71ebf9mr202913685a.1.1794357804761;
        Tue, 10 Nov 2026 16:43:24 -0800 (PST)
X-Received: by 2002:a05:620a:6c19:b0:943:7e61:fd9f with SMTP id af79cd13be357-947ae71ebf9mr202908485a.1.1794357804205;
        Tue, 10 Nov 2026 16:43:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:37 +0200
Subject: [PATCH v8 08/10] drm: writeback: clean up writeback jobs outside
 the job_lock
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
Message-Id: <20261111-wb-drop-encoder-v8-8-62948ed87d13@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6lI15A13l9Pj2MhuBcjzRiQ6NpV3/1ulOmfHPu2OyVQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oSIbjxQ/q7RrVd2MdTNVg0HuzllSpgWim2B
 aZWVwGStq2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6EgAKCRCLPIo+Aiko
 1ddnB/44pQGZq4MXj/3mf9607WzgcNauTKE2H07IKpYHZawQRixcf9lDGxnbcHjUxmBBs+TX42E
 rqXYXuzrynwYs6NMvOOxo3eZmYe4Fb7cFDyIjb7YoT6h9Rhb3T2s3pL7O+HzEBUPLSAjfvQ38Vv
 9MoJ6vDGDkIWI09pjGY30Vu0HguWoVduaJ7Q//RneKQBF1BpmsU0enxhZIMoB1GyOQXy4wDmebO
 7BQJdPJc5AIiPECtyetj8sok9eXrnw/z1C4LuZJZI1QIJYr8YvOYb/6lXSNolXuV1N1w5I3KOkI
 Phr3Y1GDLdliZ7ZUNKjYEkGvOqvEzEX1BNIz4lOcXNL2Ktxy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX3sgv89wrMQNy
 2AJ/WMCR7GMPcZ/2/kyIU3xKMu68m3/UwbA2DWSQUhzy3xvUpPIeLu06ghtbJ63vqQZ16R+F3rW
 llh5Ub2Lw46Dx7EVRAksdWiEuYtTwZfPHNb9H8ptKLhzzKeBf2Mt/U+ug8xkTAoL5iof2ci0qA8
 zUPaR7ANY4Fa2j6m96/w6yrROhIdX7ZsNIviOicjBiiodK0tX26xsnD86L5wn42tmEUPSbIOs4p
 ffqGB61FfwrlQj9NhLZYjWl7aJjPoSRpBJLwHpnkTz8pAWEWSySpRVrNS1rd2dWb2rHcrxT50YZ
 hgwbqbJERePfiEwPtHWFcXC2JAlrYQh4yfniybXOuqurAk8ehn5jBNyi9Nq9gSdAlpTutHhxn2+
 5vjEPSJeJBjP6Vrt2PU6wCJ2K9YkrdYZ7e4wMZfaryZ3ZgnOVgVBEwfu20yaaG04zXuOoSJteSA
 WQmMeR16N0apdoIbjOw==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af3ba2d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ByKfqPmZO4XEhVLTLvsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: zIsXKGGANhJKIWSHu6NYDZwUiwEpB2zH
X-Proofpoint-ORIG-GUID: zIsXKGGANhJKIWSHu6NYDZwUiwEpB2zH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfXzlaeccQcQPYQ
 QYdypJ7l0fI81WOp/vA1THl/TDUTFd0v1rS6cvBW89et6/0nTE8o+pHsHqE2aRljMYyP7FS0t6e
 VHJ+JE2eiNhKqc4+qnKyUxLyr7j3TAE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110001

drm_writeback_connector_cleanup() frees the jobs left on the queue while
holding job_lock with interrupts disabled. drm_writeback_cleanup_job()
may sleep, though: dropping the last framebuffer reference takes
mode_config.idr_mutex and other mutexes, and a driver's
cleanup_writeback_job() hook (e.g. amdgpu) grabs a dma_resv ww_mutex.

Splice the queue onto a local list under the lock and free the jobs after
dropping it, so the sleeping work runs in process context.

Fixes: 1914ba2b91ea ("drm: writeback: Create drmm variants for drm_writeback_connector initialization")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 2f6a7b50336c..6487f4a104f2 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -281,18 +281,21 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
 static void drm_writeback_connector_cleanup(struct drm_device *dev,
 					    void *data)
 {
-	unsigned long flags;
-	struct drm_writeback_job *pos, *n;
 	struct drm_writeback_connector *wb_connector = data;
+	struct drm_writeback_job *pos, *n;
+	unsigned long flags;
+	LIST_HEAD(jobs);
 
 	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
 
 	spin_lock_irqsave(&wb_connector->job_lock, flags);
-	list_for_each_entry_safe(pos, n, &wb_connector->job_queue, list_entry) {
+	list_splice_init(&wb_connector->job_queue, &jobs);
+	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
+
+	list_for_each_entry_safe(pos, n, &jobs, list_entry) {
 		list_del(&pos->list_entry);
 		drm_writeback_cleanup_job(pos);
 	}
-	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
 }
 
 /**

-- 
2.47.3

