Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357794;
	b=hPoulZ+TMRN4Pny3xPG93dOWecD5xKpojVLeGFPbPx4E+iU4jctOENLDL6ZJjBTQ5YwT
	 aL/BM/FhVrn9AH8b9k1LCRAX9/k+ka1y78inbYeps9grv4YpCvmAN5Lft8k42YIfCm94i
	 kirmiZBXoVZadby/TTNo3UyugozV5T1ZT2mpgxKkMhLju0tJQPTY9AYEMBq7TwZwPOQxk
	 /kbU9HPxCfzG52zYIGB7kFPiDNo9WbDYisVXj1aCJUsI3O0k5Zcjz/Fho4uOl2ugsIoTZ
	 8pBTDJYZvXqG9KYQRnWf+XzYbS+EchP8POwTiHI2eaC/kuSbyN8hWJyuNrBNWYYTBXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tYkh+z66tNbAJ8FVwlggHZ2adHY5L3co1eCKtyvHahg=;
	b=cjtAJveiKyotGulcl3XE/IjXuGOF3Gyhz+V+WI6XL2t5PGhTbDReMsuM6XOJx/gfukc/
	 +QvrgX2BuTXhyyISMwKl56IQqsTKbdxwISzy8bICZ+SoB0I3hgLpmRBHUIS0ueJ7jzImz
	 i9SEr5CsLu5leO9axDTURrgS082+026GOhhAYxYI+E9iOU3y39xtGX1bBKGB9U5r+N7kp
	 VfVzDKX9IKx3JImuj/M4YCGGJiMQNjSGSKcZ6bikBxY8Kwc/6J9hhKvRTWtssGgCBIGud
	 tmttFu6uWgYxtrB8weVOHqGAdIzlQNIpCW54F5FZFBsdsTDoOC0TgMKguh7XcrH8Erw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qu85sXKk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HmKqYk9q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E9160A2610
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37E9160A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qu85sXKk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HmKqYk9q
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB0Fpfd1689843
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tYkh+z66tNbAJ8FVwlggHZ2adHY5L3co1eCKtyvHahg=; b=Qu85sXKkU9xLdMSG
	0GdQTJjN/yjDowV2Yq2N76Fxh1YoihQsvJ/NRt+FRmlw2PvQv2FJTUY1FZ4hXq+K
	Wmq7XofYgmHzeA4hqPpyK127tENK4iIGI/wDTZsAJFk27BWTC65ehkEilO8bGuSy
	SkLoFNZS4QmULEvNZ1NNRpX0sRQtL9ojDC2cQua+/WqjelIw0KwPVjjR7hbP+BuJ
	+6UBzfqtPb4iGmOAJe6SDuNMJOXNEjeOY6y4Is+ST9rPIGkHHPA1t0lXIlKZbMH3
	SGm86B7aTK3Gc4A77iV+JtlpCThVTpVJaFEcGB28W90CUBSvgvCEL/2s1Mtj/ZWG
	PWg9hw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp02js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91eb0610cb9so35821846d6.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 16:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357792; x=1794962592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYkh+z66tNbAJ8FVwlggHZ2adHY5L3co1eCKtyvHahg=;
        b=HmKqYk9qvoaSi3zX3RTzunsCTPH22bHDazql97kfUiahIPKuB9CrW2bmX1WLaR8yGD
         5WxaSeKKuvtSSdHHvnCdqoZL4tQKug9z5hUtnsXly/zOva8zEm/Xlj+Fg+7TrWmYp6tR
         6bJu6pcuXdr3cgZzic8Ff2OoaRuU/XLK7+l3hnUVjOcGMY8KV4LI2h5/Ysug7Z8jJ3Ad
         Bu62Tbl8IRWExt+t1JaXYlEukMesT2Vbeg3lb7+pd7II9PShXmM8M+SPuipjZq984KNu
         ZLZpyAvaAAsSMcmxtz9Sz9P5sZjs9Zs198cZ4ODMjN5/UrCcoxQ2ak+OvKwbkA5gunFW
         HHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357792; x=1794962592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYkh+z66tNbAJ8FVwlggHZ2adHY5L3co1eCKtyvHahg=;
        b=odS/E/11OwMmk5ltyyA4yVcx7yrR337qVIUKaM3rHu4PwZo5lpVOtg4kczbOGQQDm9
         nOuNcF9oRSjnKJNXniIOX2MV9o91qwD3HSOkWcrW/a01MVUCO9JmoXQmClV3jdPmMtBB
         xrcfwgUk32HE+uuNtsh3nLCtRdqbyLtkf9AcAkyaXabff+sjA61mQCjpbt2iOWlWad4j
         UFYuhMQuoGGYMerZ4du1zLvyCaeNVMkCDQ8U92qrEuqFO++eo//gMkT0xXN4Z2HVyyaH
         9b3BkWKKOdf7kI3/vNO8XuCCzSszgQRC9xFQhDm+XwAioJIu6kJ4gm9c+JwRp9BJF/DS
         KD7A==
X-Forwarded-Encrypted: i=1; AL+hErEvlzSIFafNKDp4Un6hBHnxnoTxyUYy/eZ7ZblflwBsUFhMUG9gXD0grHKeEvHBCSUm5rO1WfAgIMlopCK9INysiQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z82jr4Ve2ojFwQpeEQGNYsXTF0P2bvAqv/1WX9wFZjeaVor+PZb
	/x6K9uey1LLxa4MET+yWj9os/2zrKwR4PbBUpjRwt3CFAAyogSEGdkWqA9ERbEQY8rD+/a0f1eW
	8R0qsZ1TnOsy7tBW7P5ioJY+GBuUqh8u5c6fmDkdo8vKjhyQbasvdL1qnAB9roPnjmNEqxEofpQ
	==
X-Gm-Gg: AYBFou3RvfoBPsg+Y2RLMEHfEzdgEUNkGDgWvaW9XrCLl2RSpOQmRQQ15rxRcqUV1Em
	jBIyiFj/EBOPzNtRh+XzbkyufNK9rdWreTA3ubz2oQcvrb94DdWL3fqo8CoL7As4y05ZJ0Vq9Xp
	xKyRW0ZGJ1FR9j770Rp52BYNTU8FxpGtMhixFuzj0gxI4qAdHnZEKgSkUxxzK2nRi7vb7d+ovQZ
	cAJTdRE/eQDZ2aQ4gONGkZQNxVsIvXtuZ1irvzPpcIqu1vo+DK0APWuhYLa4xtH5yCMOygkIifY
	aog44nREJL+o8sO9740UawTxL4kRO4kOAoIFOeahXlLwWoR1AV+REoyQ+JCaq4Ni1WjiMmg1j/z
	ub53gwzRkRQmTRiBGdZPOACtLxpupmU9LR0LJPt3VzwmyKFNAs0gVla8/fpIPx1v6+fc5bhKrgL
	Ty0qqlR/RdeWV2D/PPRWBes/k7HUnJEGPpA4uxzQKLDm2zU3kfXqoyiBQZDLHRvA==
X-Received: by 2002:a05:6214:6591:20b0:91f:2f6:75f7 with SMTP id 6a1803df08f44-91f0402b509mr12798386d6.19.1794357792064;
        Tue, 10 Nov 2026 16:43:12 -0800 (PST)
X-Received: by 2002:a05:6214:6591:20b0:91f:2f6:75f7 with SMTP id 6a1803df08f44-91f0402b509mr12798036d6.19.1794357791417;
        Tue, 10 Nov 2026 16:43:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:32 +0200
Subject: [PATCH v8 03/10] drm/mali: embed the writeback encoder in
 malidp_drm
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
Message-Id: <20261111-wb-drop-encoder-v8-3-62948ed87d13@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=E8fyyRc1CUF7FSoEm8fh0yWXyrNQOVyyvWVqx7oX1Go=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oHuW8SCWzKcZcT8xTfb4OdrADN2PwQ4aNlT
 eNqGbQohZuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6BwAKCRCLPIo+Aiko
 1XVWB/95Fm8C0b3IbmcoRzt1brzZIQcMhBStgGGk9rF0UfIzfwbnxXo3Ho/Yv5anFOpvp7ghDDc
 /XveR5mbKD0lhwGgC+HdhlLQm0szbOY/secPillX0Ya8j9UOFdreJYhv7XpOozMI2DufOWFJbm8
 YYlFT5m8kHwLcqqoBbRkwuQ0iUQK2AHCZkeAtYKtYIL8s9tmZhbTxCwL/60XBSKXodgn0aNV4Ry
 Yk3QyHvm81b5nC4GYAVxQpaHreE7EEcN9diCiZT2aMiO/j2Hm/ZKP79hLIxwQGO9K8FudG9rssf
 pjHrio9g4ZJylmbr8GjnA72h1BOQIfq4Ep/mo2qkpM9/reXs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX+YU2M1dmolvw
 BV6ScfBPUyc+LbTZ54QlRd5ycirVF4ngYcjo+4cC+dgGXY80yxIMs84u1fb9DAy/+86KXYJduxj
 3Pkr9l9VTpT0xNtGlqCWHS7uatQcV3M6RVSOwoSXevQpNC2kZwdy3hQt7G16rPoWl8/RBC6mnjr
 UctHowA5giKghzhdXHdlJnnSVqkijA5gG0/SI8ug4Zbu6YvJ9hJ8vHBqvLbGXiWekq+ATDx2ts4
 tfIuLL8LLiySSk8tvBrDla3sI7NEyVE9gPpAsaYBbVA6C36s+UKvbRSbNMBBEJ8bFBP9IcylDaE
 OUZcm5+pzrHlPa4G4bgk8JF87mhk5fns993RyFvK2aVULBOD03YVqFlxfJSRRDys89syrkYqmBi
 J/1ttorxC2W/mjMePn1iUdTjmKqRk/T+LkbgyqSTKASzyFCHZSlWgqcUgm8Oo8lUwn8BII/53hb
 EbRt36VlWyzQ9xEMMhQ==
X-Proofpoint-GUID: zDvWt6OBsffGdXRjFP_Ywi8vTMSK1HRF
X-Proofpoint-ORIG-GUID: zDvWt6OBsffGdXRjFP_Ywi8vTMSK1HRF
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af3ba21 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=eAXNdYJVcktrDQ6TNNUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX0Su1Z1NXsjkv
 z4HoHGGSq6FT1nc9s1z+Ajm+/0IVG9PJDbM8pnYfPlqFMxMW5O7dBRphMhGayy4SB58KaicMQjc
 2GjoFsHdqnlrg6wLHjf517nscA9XT58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110001

drm_writeback_connector_init() hides the encoder inside struct
drm_writeback_connector, which is the only reason that structure carries
an encoder at all. Every other writeback user already owns its encoder.

Embed the encoder in the driver's own structure and register the
connector with drm_writeback_connector_init_with_encoder(), so that the
encoder can be dropped from drm_writeback_connector.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/malidp_drv.h |  1 +
 drivers/gpu/drm/arm/malidp_mw.c  | 29 +++++++++++++++++++++++------
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.h b/drivers/gpu/drm/arm/malidp_drv.h
index bc0387876dea..64610f2d23e2 100644
--- a/drivers/gpu/drm/arm/malidp_drv.h
+++ b/drivers/gpu/drm/arm/malidp_drv.h
@@ -33,6 +33,7 @@ struct malidp_drm {
 	struct malidp_hw_device *dev;
 	struct drm_crtc crtc;
 	struct drm_writeback_connector mw_connector;
+	struct drm_encoder mw_encoder;
 	wait_queue_head_t wq;
 	struct drm_pending_vblank_event *event;
 	atomic_t config_valid;
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 8d1e1e3a6deb..889d0d1db85d 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -110,6 +110,10 @@ malidp_mw_connector_duplicate_state(struct drm_connector *connector)
 	return &mw_state->base;
 }
 
+static const struct drm_encoder_funcs malidp_mw_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_connector_funcs malidp_mw_connector_funcs = {
 	.atomic_create_state = malidp_mw_connector_create_state,
 	.detect = malidp_mw_connector_detect,
@@ -223,14 +227,27 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	if (!formats)
 		return -ENOMEM;
 
-	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
-					   &malidp_mw_connector_funcs,
-					   &malidp_mw_encoder_helper_funcs,
-					   formats, n_formats,
-					   1 << drm_crtc_index(&malidp->crtc));
+	drm_encoder_helper_add(&malidp->mw_encoder,
+			       &malidp_mw_encoder_helper_funcs);
+	malidp->mw_encoder.possible_crtcs = drm_crtc_mask(&malidp->crtc);
+
+	ret = drm_encoder_init(drm, &malidp->mw_encoder,
+			       &malidp_mw_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret) {
+		kfree(formats);
+		return ret;
+	}
+
+	ret = drm_writeback_connector_init_with_encoder(drm, &malidp->mw_connector,
+							&malidp->mw_encoder,
+							&malidp_mw_connector_funcs,
+							formats, n_formats);
 	kfree(formats);
-	if (ret)
+	if (ret) {
+		drm_encoder_cleanup(&malidp->mw_encoder);
 		return ret;
+	}
 
 	return 0;
 }

-- 
2.47.3

