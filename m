Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670500;
	b=U8JUf4vSqiYGcNI/nv9ApRUcUBZQOfNIfaUsGa8wcnlETKBoQK9TKvXSfJXoaK8C8y93
	 Lgt7zAv7MN8lgNK8B87S2f5bz0NOCpb+KnH9meqmp74HrGsnbTHqbcJvNnAdmwEkp1dBy
	 +RCeYzGFdDwXeTJJFKljGJDm6TWYsAk21etzXsLoflFkqLungc4OFG/ZkpiUGLxqchPrY
	 UMNI3ABfjWmFpeopj7BRqabRd6myYN5JZXp+i/NsQ0ohs0tfA+tU5RuhrtqcumsktZtKt
	 qItos5EiYzLUs1AtZcaykneOK8G6sKaNmJlTo7B79VwVw0aWDjvhmz90DHHxqQh9Cuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670500;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pQIf+MPS9ZBgM7DuW4ui8ue8uuTAAxWxDd0AuH9xB3U=;
	b=Y4GmgVUQzo26W/iHv6ZTYRtADrfNb9G9SMqc5YQbKn6d7eJ1G9vtx466hOYG2EazcLL5
	 jiCB4SzlH5matE4XzXdr2+goXJBwaGvrbNak9gYpURf3fzWtw3FtB543EKapBAU01zynO
	 PO5ZgVYHx9gssffH2JyNsMUHxVpNn8i9KWyH7kKo2tAVJewD/w6mDyQXw2MjZZmxTB9K8
	 5agFt50VdWeRBWEelQ1gYML3jNj0sW/RVZKwuTnAG45mC3cy6W+hq5AanIFBKAN81AKQA
	 yUMICrBLWrLjBWu6Fsu2gnFlRVlhsquEl7BVF7Pts+3kV0oxvltv1+2q9FZFj+OdxLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E38fEtW6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ieqs/pkV";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D53606A31A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 12:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59D53606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E38fEtW6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ieqs/pkV
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MBXhlh047186
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 12:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pQIf+MPS9ZBgM7DuW4ui8ue8
	uuTAAxWxDd0AuH9xB3U=; b=E38fEtW6rUgMIG6tTA0UfhcHk0PAIJbK6oauV0ZI
	oXEl2HtfSTi4yOQzxTR+23gcKr+3Vt6ggAXZyHqrtUwdndjUjoM8ZYx95CX5q/Is
	g7eVOwJ3lNIH1mHdgEb6iRcTPWy6Tsq7I7u5PFU/SkZg8OxqMfA4nUf/ooy8L7X2
	9VYxr+8HhE+9X9tV47N/H7VYlbjbgAllPg4eSgYSKqVhUVeum18xu4ldiwBxJxZd
	CcbqT7ouWYzPHE1dloE+7BfQKaIv0Y0lBgMWTlu3+FlMJZAksh6ZpJy918iSLDqN
	b56ty9s+BOzNV4OhTIfqJS2WMZGjdVnoqPiYCcX9VJwP0g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93caynp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 12:01:39 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso1337771241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 05:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670498; x=1793275298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQIf+MPS9ZBgM7DuW4ui8ue8uuTAAxWxDd0AuH9xB3U=;
        b=Ieqs/pkVSQ51C+XinhJyqIp1oD/RCHkg4HxA+ze59NcMiNSLDorMF+uWeGdJdU6BPR
         T7GktXimlyN/WUfF+3uOu3cYEzcUPg2T/5bDr1Fsu5iUVZMVLDZ6m38WzIxRIQ7Jgbbi
         Mgl1u0dNplHs05eK+fFWFvmX4yTd8rECxAfw3MD2TcEAubqytXsF3b4PrNmJ0vBwLlJg
         6sXAxAb8VgxeGPz+lV/NYUV4NxGNyPFQc7VnJ6mJsOw/ET4aOn0iXawLApq/YNw+uDV4
         W5AwVjbaSrBHggyueowTT3l4gVD3b7fD4/Rl5j1J+RDxNSYbvQ2DqvUowlKCaviXkEWd
         wpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670498; x=1793275298;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQIf+MPS9ZBgM7DuW4ui8ue8uuTAAxWxDd0AuH9xB3U=;
        b=Ue4xRsGcL+y8CofgZZWKF/cOM4IH4qQxZiCo8nJbQ9qJnpyZt3eBrvFRBJQAcAnC3s
         zJszY07qnykRM4aPdqwYSVz6erpoPpe0isWix+GdL59t3TJ57kp2shkUysn1CvCYI8nN
         fwlLw6XC7FscHz6Db1lgSyh8tftuaFf55kQsDTG97gVRkSrbrPv8uYVeNLki99W0CGMp
         7ygDhZc3N5RwP/sY3hFbRey4kTgoraLAQBxGfSBdu8a9F9CkIayWaNALdnD+Tv04B2j7
         71e1jsxKBVw5WOSycJymzT/qDcbF9ey/xU3SaZlG3fBHnQrwWrvEaQS/8iTXNbECqudG
         av8A==
X-Forwarded-Encrypted: i=1; AKwUvBwMoHXLCBbHWB49DLWznjoA/Fe85ypwFCmNijyYRtmP8xZjiGVQ0okVJY+aBOnPIy99oAh0g/cKepNcbBI0thiUog==@vger.kernel.org
X-Gm-Message-State: AFq9FYJTRbkB7i2J+xxa6+9awT3kLDHPXMvd7qTJo4OoD0kBruktfeu8
	55l/R2Kev6WiQAYjybA3aBBvd3ogl/RH2A/mbyQD6v6jRaCgKW5G3cOaQEbM8PHJ1X/b7BlEH3K
	KsiZHnWQHl6Wmn9bj9weevoZREKwQgbkNi2YJBseLQ0lJeQXiVFEpe2XJw+RNrtbk7YT0/Hznug
	==
X-Gm-Gg: AYBFou3IY/xD2il+IBocjnOedk/aQeANkqTwUsDaq4CNMat0SI0dGJnHI/cJJGqrFES
	+NvA5QnKT4rKiT/6z8bmo9uaQ7f69AGt5KcRNyoNklJKYpoAqLtDpaoeFVZguVBmC8dFoDMPWav
	uhRpZm3gVKwHDJYjYIAJpxJMMWY9OVLhhMuE1lOpX7g9wM/PKaNagNDfZ6YsSFqNJJ8Hp5ShU8g
	MUiCOk8gCMo+47fZhvvkljSIYIfjYZKx9a8XRa156+3/ZxnROnh3MOKgnFYVKt3w7X0+R9vg7dI
	Ci1z4PUyaWZF4/nNvZLgV4PlR9HiP1u4RYzhKdooM/uiRkYOIjGMyYHtQNpIX0R635WHR1STHsb
	ymJsB9GRmKMdyDn0VDYkYc41YHj5MXSY/VUfTRAlRgPQkN8/xiTLV8wxpEqWFugVRBBlh2G5CDE
	YUuTv7FMOFDJhu
X-Received: by 2002:a05:6102:548e:b0:7cc:2bb7:1335 with SMTP id ada2fe7eead31-7cc92740fb9mr2034401137.33.1792670498195;
        Thu, 22 Oct 2026 05:01:38 -0700 (PDT)
X-Received: by 2002:a05:6102:548e:b0:7cc:2bb7:1335 with SMTP id ada2fe7eead31-7cc92740fb9mr2034336137.33.1792670497623;
        Thu, 22 Oct 2026 05:01:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1212183sm1044229e87.46.2026.10.22.05.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:01:36 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:01:34 +0300
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
        linux-renesas-soc@vger.kernel.org,
        Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v7 0/9] drm: writeback: clean up writeback connector
 initialization
Message-ID: <i5hyqavtg6fa5eaq34uxpv4egdydcbdqvlqzn3ctpmyguy7j3h@nrr2kcd62wuw>
References: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>
 <45638e6b-04a9-46b2-97c0-66f3e2f9930a@Igalia.com>
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
In-Reply-To: <45638e6b-04a9-46b2-97c0-66f3e2f9930a@Igalia.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX9tDVqrD4bFNT
 LM+eg4algYTGTz2vttiuzldhrCFV645Q5t80RLkg1Z/xEZ0pc5pIXENQHzzHU/n/fD8I6S4AmGx
 tK+t2LFs6LCO8kR12S62/8UvZOUFHRI=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9fb23 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=IWSX7y9O8-nPMSrxZ4gA:9
 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: q7BDrUwIdQ1HHpMvQGExX_iPBc9sN-ub
X-Proofpoint-ORIG-GUID: q7BDrUwIdQ1HHpMvQGExX_iPBc9sN-ub
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX1S+RVULYtIMp
 RC6yX4vMVgW0p9dFrwouii379tw1z/1QazL0GmNerDYaU5hngTLP9WNiJEiJiSFIK129fJv+gOw
 rTte7c+Dxtc71gh+zsrHt8fs1Vyo5aAXQs+wv52BJsMb++DtyLlHbi8RIf0XB5D647aBb7RKkJU
 /9oDowLs0hXCekjLv7ZLkxOCnXYuR2UpG4wTktbAUJWSM1TGEfo8HK9zCsz+ENK0H7KVlQ1g+FG
 o2ux0w9IBFYguhB5/jYpQAnYt5eXycxFzDc5b0BNrP6LXZBhK1kr1H3/ucH8oyH7XL1bJLoANcm
 v7P4uodu1XE2jXLQipFyNBjD9EjvgnSMC3VBmSKpbdTjqQA9pIR5fnXq06zAPd6Iz7yBXWNFyjg
 5FGKahGMZqpKprVZw0bwYcOqn2PpMlk2jW3tf2L5WU0L2KdN1qOPDPg+sGW/QHOZX3cTrslDgem
 4ylASXwfQglmFcxWhWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220047

On Mon, Oct 19, 2026 at 12:40:58PM -0700, John Harrison wrote:
> On 10/19/26 06:12, Dmitry Baryshkov wrote:
> > Drivers using drm_writeback_connector_init() / _with_encoder() don't
> > perform cleanup in a manner similar to drmm_writeback_connector_init()
> > (see drm_writeback_connector_cleanup()). Enough of the drivers don't use
> > the encoder embedded into the drm_writeback connector.  In preparation
> > to further rework of the WB connectors (as planned to enable WB for i915
> > / xe drivers, which would move drm_writeback_connector to be a field
> > inside drm_connector instead of subclassing it) remove the drm_encoder
> > wrapped in struct drm_writeback_connector. Rename the
> > drm_writeback_connector_init_with_encoder() to
> > drm_writeback_connector_init()
> > and copy drmm_writeback_connector_init() interface. Then, with the
> > encoder being gone, handle proper cleanup of writeback data in
> > drm_connector_cleanup().
> > 
> > ---
> > Changes in v7:
> > - Significantly reworked series, no longer insisting on using drmm.
> Is there an intent to move everyone over to the drmm version in a future
> patch set? Or is the plan to give up on that as being just too complicated
> for the benefit?

I tried doing that in the previous iterations. I don't think we should
enforce that change as a part of the framework. It would complicate the
review. Individual driver maintainers might perform this change on their
own later on.

-- 
With best wishes
Dmitry
