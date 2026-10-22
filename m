Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670370;
	b=euHRoaU+Cs3wqFlez0Y8p3Q6G+r/rZHcyM0GUvXYohX2IixmKrB/WetzgRAneYNi0LLI
	 5hUq0jzrbRaNb5YbfOyzPYGjRmbNNYeo4Yf/kp+Sm5icgSagGuFwDqQphbYivC18AR2u6
	 +GCU3+ZsYCFNNEFz/ag8mlIDyADgJO1z1A31QjHMSJ4UOP3WTlJZeJt6mc6lP7gBYfL5m
	 pXevycVSGbSDakqRCk795irr6+iWmVx00emr6hIdpwXSUfeavRpBxekjFW5rcnu9je6IE
	 gI6DGQD8VxjOxnANnEGiRbuXFu5OjTzUZ6QBBVL33odEKP/PtDt/ukyBV+B5wnHYSXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aPE/s6P0svckbKbkPg294wPN+bCnxy9mUDtCKQb3Cvk=;
	b=RTwkTLb+QkXPGE7DNOcXCeeRRnU1ZyA0RqtMjajK4uZGVC6cFk2N10KJvw3YCsDOQu1f
	 YuAA7fPU7yulFxStN6ZyGv3VkbWmc1tcqo3mbZiQNJ6GwYByW/DwVe3q4WTovTyIxknhy
	 E9bEYP3cP0tecjQjf7F5f2qjmcnWhziQtocolK8pkUQrjnHIYkm0s++PEtEsLp9uoAcOq
	 vGWZKgpJXn7HQ1QZMBv2sPRPH2GCYX7JKI+5BRjRu8vbFUzDIh+3FDUTd6OE9eZYyKysA
	 3yFNZeNI3wMdeK8kNoq9Rfsl/TOzAaU3Mye4d4vecw+FUbsKy4NFX3kE6QL6ChmkpxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Par7Xu1q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IkCTlfuJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BAD606A319
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 11:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39BAD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Par7Xu1q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IkCTlfuJ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA05I23427058
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 11:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aPE/s6P0svckbKbkPg294wPN
	+bCnxy9mUDtCKQb3Cvk=; b=Par7Xu1qoevn8z3nPGjiV5KdFK0FBaEyRpwV76VE
	XGRuwy0Lu2kpYODoox0SU+jVM2P7MFEMMtiFHFZ7RkE97F+nuoWXXvfr6GtyoJPc
	vLI6afKNFzZv/os2z+ZIx3ocCUgI9uZfDaPrPpPY7jeQd+62LOD0PTq71TfSQOt9
	17QMYOMPtEnRT5ilsJrZNLa7reoASTXKljuA9EySM84j1UR5+ZSyiZW7JtCEM67i
	O8URo3Pmo6PZGp/sCiaRuxD/HDDNkVXArnLamvIYm/lUbV5bUnoy9itQuo2hgYhW
	3PCwEIz465UhVyGfBaT3boW9mBdrU5Z/aso6OnotODBdwg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq1n76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 11:59:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91bc57d4d11so42136336d6.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 04:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670369; x=1793275169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aPE/s6P0svckbKbkPg294wPN+bCnxy9mUDtCKQb3Cvk=;
        b=IkCTlfuJ6w2eatTw9w/zM2HMD8z9L7ZfjsBHrDOYEnMVzQvqaEvff9tmNZKeDqmNVm
         oXJ74xauQHtRvIxpmrTHNWJ1iMGaz/pIBM9wCyWzghZ3aICdMZBvEtUvAYXaRsuFK+os
         XEjgpl2N+qLYc1OA3UbLGw4v7NpIsjXRIGcspI8q+/pg/TBnMXn5OEOOaiN2JXWlQnZl
         zeESyRc3D31gf6b890uH68Xr4kLL1zU5UMoqeBphpdyxVdECzXR766iL98nVz4nzfHT7
         YDep9og8nwfQbIOhMBX6DwrNjaEy9MXm2eMP4yxZNGa3Wbw4lJD4oE+YYRs1zF7M0KTy
         m2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670369; x=1793275169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPE/s6P0svckbKbkPg294wPN+bCnxy9mUDtCKQb3Cvk=;
        b=RPSzSZ38m1h1sECJQmkZX9cdPZh6dU7Dgx7fNrHPAsHe9XIumQWnTgubeELQB1LlSS
         ZH5TrDFIkvRew/TCcXsYN/2JSpOEOF4unXRmMQodgduyzljcpJ4A1jEHcKybtbb1T+rv
         oRbH7PfUHqYpOPFpLg0qi8NmkxQEzvvhxuWSr4mVVTTaAtn8oN7mBt3g4OGhePpv/xUh
         YCHujLQLZmTvrZRhMJzZg9FEzKoJC2lTVHxbvcPxik9zslRxHB43tdm0X6eZjJ20Ajo0
         TEz/a02PuKYO0JcXXwHBWtWHLqGxKTvl59Kumg3RgxQ/wLs9O1T6e+GUw6i4kqDE5Lgs
         JsPg==
X-Forwarded-Encrypted: i=1; AKwUvBzF/KHzYveMH3ZUTVawz3EIEPe5QKB/trZ1tRian8JZCxL948+IZlKYHZ+4fChNIQOGV6EwBIPgQyrdNAyHpWknWQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIsbCMDn0H8kJwKP2VKdBl2U0Z8+hK2Kfq9LtYBflDsA4LImHSl
	pHqKk+GjKtO4+yecWiVxKCwRGvZyg1WIHHzLydsCKTx4yrnERWnzv3i+jwK6Q6AvQ5ukwGuFkwl
	Ots4e507nnnlE9ohThOjeQJJiA73Qj/cfr5ElQxFuY42Ay+/5uqk53x5L2s7ak4c4ICcxCaRMTg
	==
X-Gm-Gg: AYBFou1cg/VVenx0euzw6TWqIm3LjHiqBT40NEI0gTKMpYN3L7sI3Yi/Tp4Lwjsz/lZ
	wcrD1302hgmlE/eVWwZqhxw5nXJioSltTj9nEjI+utWTLbmg5ppG8wJMnAe9AbZB4DvxSn2I7wR
	F0vXsLpvAdcqmXUPmbYzgSm3aUDIzH1szES27M9/QeHNCJWcA7iI1f8YIo2choDx2szqwEoP8po
	gv/Xi5ZgRIeRdytIJS+qH/wBf8UxzDWtKvzFWYx394EqR7J9ozZU/nV2qIEZW6F3apMwthhGJJQ
	+O5J5dvcKzvN+0GJwsfJwqF0XfzausvodPf35+Q++JuBTmwfoqDr3vwSB5LH77iHrj4lxrH9VMc
	kXIJ1dHMjuqRug6BRYrCz7XlNnlfdfYEk4z/O8qI2VXIwMOI0xEJtAQtwKhsVzXbZgpaDxIa3Al
	Td3XEQP1b+oWMw
X-Received: by 2002:a05:620a:4086:b0:939:733d:cbe0 with SMTP id af79cd13be357-93f57e5e514mr788970985a.3.1792670368791;
        Thu, 22 Oct 2026 04:59:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4086:b0:939:733d:cbe0 with SMTP id af79cd13be357-93f57e5e514mr788966485a.3.1792670368330;
        Thu, 22 Oct 2026 04:59:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa4adbb65sm626196e87.52.2026.10.22.04.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:59:27 -0700 (PDT)
Date: Thu, 22 Oct 2026 14:59:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: John Harrison <John.Harrison@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Eric Anholt <eric@anholt.net>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Starkey <brian.starkey@arm.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 8/9] drm: writeback: clean up writeback connectors in
 drm_connector_cleanup()
Message-ID: <gjeqgaewd5omwhdmepqcsrjq3pph722j6rjtoedot5rqsjsaht@h55ako6z42dt>
References: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>
 <20261019-wb-drop-encoder-v7-8-d4288a26eb54@oss.qualcomm.com>
 <d792066e-c857-4e80-8587-44a58ab75815@Igalia.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d792066e-c857-4e80-8587-44a58ab75815@Igalia.com>
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9faa1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=dAgu92QZlaad2esalq8A:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: hTl00ZgLF1w4B4Debl6PdTfryvCPAV7X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX4ErY6HZMMDwQ
 AQqcoVz9AY/mBVD0lt4wcESqniHWxEYtBD4oGoD9MHzmjzkBInkKwU9++DVP7P+eoYe+hpYwiD2
 iT9KWPU26Ugt30cyKZuldTsLK6ION9jAfoHjKOocf5choG5w/BcR909Gk05/PhwBT6QDFzC6x59
 nX9XLvnpnIUAt1O613MHAFERhGca1OrrrIrzJTqa1tzHY0jBCz7uNRXXYLdSWH0mL9XhMrhUFUt
 AeY+lZQin6wccssZeFACKm6V5AKwPWAyh2K9Ljpkza0Dh6dfUhLFX4X/PHZ3c4NMCpFKv46Wjrf
 FfoG6PQ/kGPPxin6H4Fuzp1MmJkKajw6M15tDznJgH5NeJD6Pg36iNZqrQG1EBeBcAKSbv/FTab
 lN/4LMTnWfTCaNuKvdmm/3plmWM2oA==
X-Proofpoint-ORIG-GUID: hTl00ZgLF1w4B4Debl6PdTfryvCPAV7X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX6GWG6w0n+sB3
 Sn4hwISWuTugoDYrX/qBs56HPtBSHrv0bjkU7AeLvNC13k38bzlNA34KPx7OkRpC7MXW8DkUQM0
 PR2fCo6B7PXfvAtRZ5dvh2YY0TBybFk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220047

On Wed, Oct 21, 2026 at 11:22:48AM -0700, John Harrison wrote:
> On 10/19/26 06:12, Dmitry Baryshkov wrote:
> > Only drmm_writeback_connector_init() registers
> > drm_writeback_connector_cleanup(). Connectors set up with
> > drm_writeback_connector_init() (amdgpu, komeda, malidp, rcar-du, vc4)
> > never drop the formats blob or free the jobs still on the queue, leaking
> > them together with their framebuffer and fence references.
> > 
> > Call drm_writeback_connector_cleanup() from drm_connector_cleanup() for
> > writeback connectors, the same way the HDMI audio and SCDC state is torn
> > down there, so it runs for both kinds of initialization. The drmm action
> > now just wraps it. Clearing the blob pointer makes the second invocation
> > a no-op and also covers drm_connector_cleanup() being called after a
> > failed __drm_writeback_connector_init().
> > 
> > Fixes: 935774cd71fe ("drm: Add writeback connector type")
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/drm_connector.c     |  3 +++
> >   drivers/gpu/drm/drm_crtc_internal.h |  3 +++
> >   drivers/gpu/drm/drm_writeback.c     | 30 +++++++++++++++++++++++-------
> >   3 files changed, 29 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 893716a9e489..1c2bef5e0636 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -929,6 +929,9 @@ void drm_connector_cleanup(struct drm_connector *connector)
> >   	if (connector->hdmi.scdc_work_initialized)
> >   		cancel_delayed_work_sync(&connector->hdmi.scdc_work);
> > +	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
> > +		drm_writeback_connector_cleanup(connector);
> > +
> Could this be done via a new connector->funcs->cleanup() vfunc or something?
> Set that inside the writeback init path and it is guaranteed to then only be
> called for objects that explicitly requested it. That would be more robust
> and would keep sashiko happy. It would also keep a writeback connector
> specific declaration out of the crtc_internal header.

I'd rather not do it. These are the generic properties of every
writeback connector. The answer to Sahiko would be that yes, currently
all DRM_MODE_CONNECTOR_WRITEBACK use drm_writeback_connector. Once that
is changed for the Intel driver, the condition might/would change here.


-- 
With best wishes
Dmitry
