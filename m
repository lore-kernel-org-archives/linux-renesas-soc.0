Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357797;
	b=TXwYokLdGfZZuMR4p0/Z1O/KqmFZ+9BkCW83RPuQ0AAgr/zB4uxCvj6j/ixce2yuz4Ta
	 ph8Q7T0Zd3rBG6mU8yYC317VeeYCPO6+8Zft3smTLFcRrvM9RLcl9r0DiIuy0SDUYxNsL
	 Rcacgsk0V41NjzhP0AOzNd1cKLYSHsQUV2+YMmfIcUmkEiQxhr293Gp5vCPgC7mxc8CR+
	 MsM/4yR5esAZuyXw8BXM84h7qvEiewcwy6D5+DVPhD7+bnClu3MNMzyEBC6g7/tX9dq84
	 6Xtmq69RAQkBuL1khJI7DvrxxOE560e9CC9ZGB6/FaRjZSAEnT70q2p9WDynKZIcV6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g2Ef44+u2+BvWMLecS2zSyGvijAfiGu+XblURBJZ3vM=;
	b=AvUvdtf0SmlekOrYbKI9KYlxLB4drk5LTHRatpGl2Z7w+UhyDCaykQwAXwsCGrnKwt0w
	 MUYz4R8vovD0RH9KzVZIFIyf3MTuo1mvF+zcedjICfTGibCH9fOAygmcDSHqiPTqulzg4
	 DoVWHmMYs0UjdIS5iEtwq0ArZJjb/y0bZLHgnVGpsl+VAW2Syw3gAvpbVrAhQH4v73OPx
	 dI1hf8mDw5HbUBoLzIJdTIWNfZ5LQ9SPCiiKTD16vsQ0tMfkbm3FIWRKGUrc0IA9Iizkq
	 H1CvDLjUiKu6wOUKMp9CBSwa0Imc+FPPR8ysvaiV5058tkbUz3hl54fiXPlmnYVm+9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pYZIMJu8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ZJ/Jw7/s";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268BD60A2628
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 268BD60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pYZIMJu8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZJ/Jw7/s
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKcCx3060879
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g2Ef44+u2+BvWMLecS2zSyGvijAfiGu+XblURBJZ3vM=; b=pYZIMJu8SCvI0zGn
	v1MmNj3pK+ekhtK14G9CYcRKhud3pXTN7CSw/9qzQcGdmYOdLzk2MS1IHDBJjQaH
	W2VYq/HIKDQVMd9Sz6u6g76JRnvmLx6hGmofgcnf1tA3QSKEy6oR41EUUd46X8Q/
	tJETz0+Hgf/DauBbtGciOnhtN8PTHU7ssdpgG/Na0rTg6PtkY9u+na49Geho8CLk
	Fc99MxG32XZvrLqZ5Mmw+U7jHwfVx9Bj0AZcClnlD2OxNvZ/i3hmWXvn/9p/qxBm
	TUYlZYBe93JK0772CKCnlJewU1nd04ixO7/Oyi+y7+q62wpXuZCVIL4mhzW84xoO
	89tcBA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b3130p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91f03ea17f4so6918236d6.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 16:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357795; x=1794962595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2Ef44+u2+BvWMLecS2zSyGvijAfiGu+XblURBJZ3vM=;
        b=ZJ/Jw7/sxrzNA3hT0P+A9Rsu+xMn+dgWKGvbm1jlQlzlg9YR+SCqv50Y6NCamuoyCV
         6zLsgVf02Glu9p1Pl8nO0+T6LJ/fc0k5X1qTmM0z1N+jCL9Tm5Xe89guSYaq8nuuwMOC
         dVtvjxl1h9Nejk298cgd5+niNbRqSnoQCL+43xiQ33wMVN1ea0avRrJ82lwHnRNGJA6p
         61cfsG9l84WkkDxs0VS2VUd/ThFQ2FtFNgnDnQXn+h1Ob4ZRHHOy/WxjY3PShK5kukUI
         rPEuq9MtHxh+Uq3BZ2BTM12e74aWbAfEI1wlRsPVfZEeZcE5AqkVxfT7J+iZVPFw2MiI
         j1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357795; x=1794962595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2Ef44+u2+BvWMLecS2zSyGvijAfiGu+XblURBJZ3vM=;
        b=Gu7GiHzNdWOFDGxlLAxoqYU7fACf0pRViA9BHSlC4rvHmt/E4+vOHzjB/uLOdXY7Cm
         ZIcp+YCK1QgvAC3aTVvxZx+SePmort1eJg5qoAvmuQ8iuo+FTTUkUmTSoefJDDsYXAOj
         VsuY6Bh/lcFa0szpsbfrzKwomh+H0Dv0YuZYZkdgesrfiqO6ilfxbfdkqlEsjU4i9QEQ
         2m0c2v7ZahF+8crB0eya2U7D6SlWFZDoWWEVq+lK8WTIcOfdeXDqmGkdWFBReBLoj4jc
         5mEe+GRNSYyb8yqV9X4KHSqSfoW2ucq6gAPNPRP+YsFZUzW63agATwUlZT67Cx4FsT0E
         0G2A==
X-Forwarded-Encrypted: i=1; AL+hErHflj0QLX28WEyzsnfDvrT7PWAYUWqxLTZ46BBTVfp2YSJukgolDmwOzoH3KYjzRGM4sPvHIry73YXXk62Gn9B95g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9++mV8aTQjDgKGf89DX82gM4Fup+gFYbx33gDjeWlGnT88/YMU
	oCwHIjQmuUIKDbk8HBu1v4oMEem80Wpr1Bgo438xTJmk3cSfMkT7VQs3e3pAmdqL2VRRXkgfNFz
	nnXTxsBcWdekqeYrpdrI0iVdlUwQogPL3UFSmfaaYcflofmjN6f8RPmI/xhJr8cCZfUWpt/Zq1g
	==
X-Gm-Gg: AYBFou1p9MtjMKpDVxuBvsruTnJRhecdUwZUBmVpSYiJwMvGeDh8SMLrLfG+WVq0oND
	LCqUEBdT2G5LiquweE8Vpbp4SOmWkUZDQW/o7kAiYKa4+vgyd0eU/nzUgwRGkndwj9YhYJid0AA
	ju+z4wrDxfa3V4lL5hMY1Tog6ZnOTNT2vB5IDVOYude3ZEkjvBi196SsMMXXoEOIBBWDYJ5Ksu5
	lwQhsoWPqziot/qlaEJ54jkPDt7Gs/aTfzkn4YlYtD/uHzMnmiiZKJ1xRYDEgXXXy0053x6ZDtn
	jbtrQn2JPAOWP2dKj259rgqleNRb6K5xQ0f96N6Q+iFevXrOw4mn59QnWGZlRW/yuvT1+f5qvXC
	aC2+LFdTiSnpoueSHUrwN/6ZWhT97oZBNTArlaLCyHac1fCMuU7UmkA+kr0o6Rmk44VQH0WGqZY
	RnnQOQSU1B0SaeBRCIGW5pPCpB1djpdzZv0NUgSX+1YgKMG2VgCG2cwWJQo9DlHg==
X-Received: by 2002:a05:6214:226e:b0:917:aa8e:474f with SMTP id 6a1803df08f44-91f040d0e12mr17091296d6.23.1794357793885;
        Tue, 10 Nov 2026 16:43:13 -0800 (PST)
X-Received: by 2002:a05:6214:226e:b0:917:aa8e:474f with SMTP id 6a1803df08f44-91f040d0e12mr17090886d6.23.1794357793243;
        Tue, 10 Nov 2026 16:43:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:33 +0200
Subject: [PATCH v8 04/10] drm: renesas: rcar-du: embed the writeback
 encoder in rcar_du_crtc
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
Message-Id: <20261111-wb-drop-encoder-v8-4-62948ed87d13@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3280;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZSlizkHBUXN8nDew7m6LYl5yzLb4zNCOIibe7gX2PeA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oJflkjyS2l7Tu9VWxRnlVFgQGzVHoPPIAeY
 j7nNVp6JpWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6CQAKCRCLPIo+Aiko
 1SchCACQzn6uSd3HLFQMP772rOcAkgW4rhLJSa5A9i1KcT5t39kj3lQjEgUdItypDEsYxvs6RWT
 lcc6NQ5EjQOcALrZHzlbhpSQsLqTPkWfZIo2oOvcGYt1Fxe1iJC+3BKmLfCFG1Gr/0ekLPmVuxV
 jeYA5aZsDu6bUhzOXh8cmYWQWGTxXFNYclDFUrZXy+BSEVUa1qL3VxARRt8pQMaSX1n8IiZjxOz
 PYHzryzi7x8L/f8zdibA4u6iadeudXMFNg0LQU9pQU1abNwis+swWpst1rTA3rF7mJ6FSiHGMRU
 ncF5jXYdpJrS4IpOYT5fNebXGdk4sY6ym0tEuI0NWcikzXuI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af3ba24 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_cPotY8_OL_z5XV9VKUA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX4rsjGylhpS2K
 wrO68NdbtFMOWNv9crlF/JIW3D8Uj86vEV4wIu2k7eVDGtGFFDMaDug7M9u2jesE5GY4mEZiwuj
 t57nEifAKKcUkiDrVE1e3RtzoBZxT+G4FMijAmtjDXTm/G16gWrJiyDHMIITsw49XUVALwM2eJv
 IWVq9Si1ut3ozGhQ8A7Uoq7M/RJrHBREOgOVkRSknKduj4gU5qmyfVA6D4t+gwXU1I9zjziPsBD
 //6LnvAGcATp+BVxQ1WrhpeJsdXkADIN2CIB/UTHAucBw4qqRNJoBbPWLtGgse+LU7pme7M+yPp
 V0ymyCNC31MQeZXjs8vX+n6RqQbmUKUoPhl/5VpR6lVOfZf4pMfMDRaNNqMPWxXeseNcbS8KH7A
 3tdnhlO+ome3D5wl5XUm2Adjl8fhqEo3WJlK3VJTxz+RdxJCgmVt9+Umzom4AbJrY4Qo8nFph7Z
 I9CTJzvOcCz2WUcmpoQ==
X-Proofpoint-GUID: HM8sUxyQMuz4SHuTGEJhp-e2Fb5Z1e-D
X-Proofpoint-ORIG-GUID: HM8sUxyQMuz4SHuTGEJhp-e2Fb5Z1e-D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX8BrJiMYcWF3K
 DdFZfky0qt41gleLr8VmSGiqgtKvVXxEOrqJmHJQokqSx5PBTX+qiWu8fBZA+zjttkHySD0+gIP
 nLoInmEsPNBRyNBAmm9lzpqYB+YpXF8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110001

drm_writeback_connector_init() hides the encoder inside struct
drm_writeback_connector, which is the only reason that structure carries
an encoder at all. Every other writeback user already owns its encoder.

Embed the encoder in the driver's own structure and register the
connector with drm_writeback_connector_init_with_encoder(), so that the
encoder can be dropped from drm_writeback_connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h     |  2 ++
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 29 +++++++++++++++++-----
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
index 8857926e109a..d8b1dcab8dea 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
@@ -44,6 +44,7 @@ struct rcar_du_vsp;
  * @vsp: VSP feeding video to this CRTC
  * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
  * @writeback: the writeback connector
+ * @encoder: the writeback encoder
  */
 struct rcar_du_crtc {
 	struct drm_crtc crtc;
@@ -74,6 +75,7 @@ struct rcar_du_crtc {
 	unsigned int sources_count;
 
 	struct drm_writeback_connector writeback;
+	struct drm_encoder encoder;
 };
 
 #define to_rcar_crtc(c)		container_of(c, struct rcar_du_crtc, crtc)
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 0a3108965591..a1271fec9874 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -172,6 +172,10 @@ static int rcar_du_wb_enc_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static const struct drm_encoder_funcs rcar_du_wb_enc_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs rcar_du_wb_enc_helper_funcs = {
 	.atomic_check = rcar_du_wb_enc_atomic_check,
 };
@@ -199,16 +203,29 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 			   struct rcar_du_crtc *rcrtc)
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
+	struct drm_encoder *encoder = &rcrtc->encoder;
+	int ret;
+
+	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
+	encoder->possible_crtcs = drm_crtc_mask(&rcrtc->crtc);
+
+	ret = drm_encoder_init(&rcdu->ddev, encoder, &rcar_du_wb_enc_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		return ret;
 
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
-					    &rcar_du_wb_conn_funcs,
-					    &rcar_du_wb_enc_helper_funcs,
-					    writeback_formats,
-					    ARRAY_SIZE(writeback_formats),
-					    1 << drm_crtc_index(&rcrtc->crtc));
+	ret = drm_writeback_connector_init_with_encoder(&rcdu->ddev, wb_conn,
+							encoder,
+							&rcar_du_wb_conn_funcs,
+							writeback_formats,
+							ARRAY_SIZE(writeback_formats));
+	if (ret)
+		drm_encoder_cleanup(encoder);
+
+	return ret;
 }
 
 void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,

-- 
2.47.3

