Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795582444;
	b=xlpBkrDfiltbzLqt0nnUYYMtcNHnpABpiMwc7tPwa09+ayc6YXvmEJG2yB0Wk+GSbfHX
	 PhDmafMYIIxPnE04kOX6WnW3x1sv1LwbhYUwW3qyV3G+tDsGB3VGeaAXWgecLcKdwcaS5
	 vbRTAQueAPnSjr7c/18DqKDQ6udazkuDt0jV0a4wmR72sJrDwFqhd3JTNJsgeNk1Nbv+a
	 U6Kiqw5YRUx35gZJWJNl4AYh+Wb2268pFp4htaR75eIeBUVMAfW9UlDAueNJ1FuB5wRAd
	 1PRINgUs3h/bdRt8jUyTUSk30D/RxcuQR5j1+4PEblLBB4ILgCc0GpjZb3R4TnBHLfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795582444;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xR7RhWJqTr/aczzO3EIq1crgEudqfPhwaC9mSHTF0TU=;
	b=IfaxUuX093SiE2rk9HcKwjM1Xmfp23V/jnKZhmsM1onyMC5fXaOUCypZjjOI7Gy/xpvR
	 BI/u9mZIiEX3rV4DXqBCX2u+u2WE6d/+TmU4SUyjJSK/D6wJvlqhTygfJXlSlKkCrFDsf
	 BJDa3KgmRxJEfxA7C6s/tCEipqwsDrg/dfAgphbpWT3JoC3f69NJzC8qnMuAqaemg/GM6
	 5vfrGXakQx8W7+AmY0QX7qrBLLCoafgDFYaKSaAbNtGOvsN0FGvwYWNfzdjpsOuki2mkY
	 OUw5pMe+ej3gnCs4T/f5+Rh3QwlOO6BTbSSdSMHrizmNTONRBGIoGiMD+iXoe+mCJ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l4KQfzU9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CJFmXCZT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513DE606A31E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 04:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 513DE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l4KQfzU9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CJFmXCZT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2Av9K3286426
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 04:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xR7RhWJqTr/aczzO3EIq1crgEudqfPhwaC9mSHTF0TU=; b=l4KQfzU9Rc99lK+V
	nzj0GpWMR9ZTrp+ng2TtKfpbVTLmMGKE/7Xq7JL3KIUBubUG0ACAJZPToxrlD+sQ
	3pu0vOv/lBWMNfHDGgTxkN8BfGVxREQMD0OuGmohCSHRoKMQTZuiAPq0gBmZhBq7
	HaqCbfXV7EE5oD2cuyNMP4ASZKI/yI2lKoGExHLw46voeEF6SD8pn4/BaXB1V+HC
	uhBUkk0IIflK8NedFUpB8LMPsI9fKiTlDRLZo3QdFV/FuT39GETZFrRu+BCSnnFl
	McRY2fZiqlknjN0ZviKBt1NVNPsj0B49N85i8UkpOtdO8I+l8aXGiCBWbTzIFzJ2
	OTi/aA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkay4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 04:54:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92179251e32so8243026d6.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 20:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795582442; x=1796187242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xR7RhWJqTr/aczzO3EIq1crgEudqfPhwaC9mSHTF0TU=;
        b=CJFmXCZTjsbQrVl0wz30WjqVWe2WcQ+8G+HouIqhcKPeRdXXw/rkzMHnjyLBRK1oi9
         5c+x/tUcIDdQS3cNrAbr48mD9QOycLw4ut11ywSq8Z64i4ecdoK3fyK34zWsaUCagBjA
         oqbMgilB6T8MIEDyxNKppfxAQlr1x2k0PVYWx0vl+CboQrqGg/l7R5IsAKOh9U2TTYv7
         7OcWVnWWMykCTQynrAE2rf4boPzl43BVnjvNuqoYvadBPfObbDJRKIKZdXjJXHT4rj1x
         +f2nTVkSNurReKKddPcUGYLdWMFlRB6iQ9b3/cGCjf7hf1iLxhbUroiA0JogGvlG6T0U
         cKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795582442; x=1796187242;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xR7RhWJqTr/aczzO3EIq1crgEudqfPhwaC9mSHTF0TU=;
        b=yiJ/IOWzppbU5PdyoIPA+CND7kODD1sxZqvJqF/eEypYyttG07xaEvUZHNtvkJTqS5
         54Ez60reZYGGTXZG/55l5pg3yjCCA1lJIyqEpYCYDI6CSGXCUiho+10F8UHOO66ipL9J
         KVKg2rU5I6xuN1LLHbJnojjxI3DYKtEbxSh3SONGs7Eh2Az7NMAMSbI5tR1LWciLWQRz
         186epTQKSMccG+OcVKeic9Lz/m7LNS+tIhWtOzIWpkzurtVnYAp3uZ/H27XWblFTHdbq
         2+f4zKJBzG+JnOFfBEgZzQs3ak82C86f6xAn7hXOkBkpP27CdysNFzmarUMo1/t2IKn0
         ilHg==
X-Forwarded-Encrypted: i=1; AL+hErGCvu/dUEVhXjBcu3QHj593yLRhfCcJ0Tjw1rFVUjXcdBQzHG+clmAcDkvrXSNE43zYPAV1DztOs+eschtiLzhXNQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9JZigOdLWB+yPTW2/AThAfHKXux7ffOUsL/ND4TSgYNhQNMo3d
	0+gZTT0mxXJuBZ1FobLkodo9z6ibsxlTGBC3X8AikxNJCDPc93AqO5wPddxb1WY/f50NcN36ICX
	482XMBhWxDG35+gilrUQU4rsBGl+qwIPksIaA7VW5LXkHkYnHhGBNE5vUnc+hHB8fTD1Wl44fZA
	==
X-Gm-Gg: AZFdTZdmu11rW5QMTo1PZJMOKbISyk2e0IQ7zgRpxwzK91H8u2ZtPxgn2I90INMLQeH
	qIxmrl4jYsEEEV8xq3iWG9LUjNR1rk0YMpAOBppVH0waOdspkIR3uYpJR+fK/Lg9d/nHS6Lqt7H
	P4TPPBK6fWIuLrxOnJjAplBKRcpq9xkJVPQQ/sQ1H9J2IoK8L9o4V7dU82yx2hag9o985YcOZ/3
	nmDwglQldKwD2lh84aLL7mv46W588V6LLCaSxhzvRWolDtNCmbDBiNdoED2nZGMkkbAIZNEwryD
	yqCC/HDgAK2tc55Hzq2IeT2JPQHP9hdEFqHwazaHM1QFZCwTkRYbEk/cUF9C8r+TLYahS5jDz7M
	w1mf2FxNZr72BFR095ax5sh5WO9FVtiK/o7RSwEB5ExtQ86sxDh9Kum0EN1QcYeXhZedWnk3EJ6
	n+pEa8vBwIDQKwGnJB+2wS+xhpryTgudhud6O8MSvvS/Ntd4SqwU6rTFhx91HJAQ==
X-Received: by 2002:a05:620a:a408:10b0:94a:889:5a41 with SMTP id af79cd13be357-94a08896148mr24607085a.71.1795582442559;
        Tue, 24 Nov 2026 20:54:02 -0800 (PST)
X-Received: by 2002:a05:620a:a408:10b0:94a:889:5a41 with SMTP id af79cd13be357-94a08896148mr24604185a.71.1795582442056;
        Tue, 24 Nov 2026 20:54:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff6e32sm4243023e87.17.2026.11.24.20.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:54:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
Subject: Re: [PATCH 0/8] drm: writeback: clean up writeback connector
 initialization
Message-Id: <179558244050.1572056.6952667613622271304.b4-ty@b4>
Date: Wed, 25 Nov 2026 06:54:00 +0200
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
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxOSBTYWx0ZWRfXxaz+FOWu322Y
 o4hIF9fG2IBMeJVyonUAHQFPdviedRvRhyHBaJbc2zXF7vlHFRXioUxawlLKHx6lbOugiEK3CGD
 /bd5K10Ml9hHAp71I+BWZ5dzxj0oMxQqcKb03FMuR87b95sJka8cxf6ax6HXpiEmiwrPFfbpFuZ
 /H0Nnv66auHpw2ZdtHNTnRctnD7xRjtKDAwRUdQcJfHZ0n1cZRl/iVmuhsFqdiZAQjwYG6zqCcy
 0xgNC9qE8cDTo6Zeg6VJWYHycmqSkwW2I4DljnFFMvHwDDn/l71uprthFIScDHaI9Ux2yD6pAtj
 5XIPEWXC3FjmWVTGaBUQIlu/aNtSQbSUiwM9z2pCnN3TMOQToYiy2GnJrAMh8B4q0HjhhAdSIjB
 Ad9Fy2xFWCrwvOxOOf/HFAun2GEkRzl/XhmRADkAispqtbEJ1y3FzwePKKObmYN76nCHVvNRCla
 xnrF3A1hBb0+G0UTwng==
X-Proofpoint-GUID: FSraoqsvmTIdpOd-izMJcVn1IIJswohA
X-Proofpoint-ORIG-GUID: FSraoqsvmTIdpOd-izMJcVn1IIJswohA
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b0669eb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VUr37Z-sP6Vbzkouko0A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxOSBTYWx0ZWRfX4GeFzC355kmG
 /uf2mkZhb8/zNWVYR6ES4YD2ARqTCZbWfU+h6rjyLuqD+/Xbfctc6EefFJZRmULa2Hq5TrdEStV
 2qOUmgEyE7575HmCg58o+rNPx59alGc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250019

On Fri, 01 Aug 2025 16:51:08 +0300, Dmitry Baryshkov wrote:
> Drivers using drm_writeback_connector_init() / _with_encoder() don't
> perform cleanup in a manner similar to drmm_writeback_connector_init()
> (see drm_writeback_connector_cleanup()). Migrate all existing drivers
> to use drmm_writeback_connector_init(), drop
> drm_writeback_connector_init() and drm_writeback_connector::encoder
> (it's unused afterwards).
> 
> [...]

Applied to drm-misc-next, thanks!

[1/8] drm/amd/display: use drmm_writeback_connector_init()
      (no commit info)
[2/8] drm/komeda: use drmm_writeback_connector_init()
      (no commit info)
[3/8] drm/mali: use drmm_writeback_connector_init()
      (no commit info)
[4/8] drm/msm/dpu: use drmm_writeback_connector_init()
      (no commit info)
[5/8] drm/msm/dpu: use drmm_writeback_connector_init()
      (no commit info)
[6/8] drm/vc4: use drmm_writeback_connector_init()
      (no commit info)
[7/8] drm: writeback: drop excess connector initialization functions
      commit: 7bcb37603df095e56e87d6144201179fe911e4dd
[8/8] drm: writeback: rename drm_writeback_connector_init_with_encoder()
      commit: 81f61b4e0467ddab3695be58a94fc322c8bd559a

Best regards,
-- 
With best wishes
Dmitry


