Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357789;
	b=34jTyb600fy5CGmAcxg/sc9diY+FOhOlTA3tW8SkZlRxuOZDR97Zn3zusPsC5sfyIBuI
	 LJ57smpwy7ZHkQQ6SDibw9Xj1fP/GrbLh/qqsJ/ggBH/E9A8unBuuSIuRNP7/pAV2m9a7
	 ldULDWOPQHDKLmREnki0ZqYqJEZxNM/d8vLdAK9RSUQp0XdfWEzuxQOXdgeuvf4SX3IQq
	 M7iG/S+KNIcLvO/eBMoY6QBKl3+sVLQuLqU4w3l3PE8HG5wDNd+KtEB6PTYRJ4nmoI3+9
	 X7B09GDpf2ZyOWe/2n8otXGnk4EYoIjWiOKt+JG2jqI/e4jE7WnhQR+hLcQRn1gI7Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357789;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tg4X3cdll5T1S7kugUAtHU1yiOSVpqm9E/2y7Atjkho=;
	b=Wi8K9HL2S9LgjCdiRCzXNvFZD5FsOz2lSKsnBPZ9Q/OXi9Q9nXrof0VrphHNscB18xpY
	 4B/xiwF8124Yg6uz10pByPqCqtvDDA+LlhVc/lBzi86OVLHheGVh2iwIgbi5vNjmWMzUw
	 ts3oLj5Pm3a4w/hTMXU6MlI/4WCiDZhST0PMagDQ8Y0iaSQ8TlLJf/WVUi86coELEfW3M
	 AiiqdwCELKSIie96t4593NwN4WIYTHgi2uxb421U7vXCeXd65CeHh5mut2ChPVU6hAWKV
	 A2AMmoe4ElJhC1PA3SBv4xStmaKN+MQNrsiabUTyhypusAr8eeD19gBYMfVzfgNbEBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cEsksMOt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+KuP+US;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B22E606A320
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B22E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cEsksMOt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+KuP+US
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKVE1443728
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Tg4X3cdll5T1S7kugUAtHU
	1yiOSVpqm9E/2y7Atjkho=; b=cEsksMOttxjAKuSzdboUbArSKwAsz/CF3eqM/9
	9jFuS7edg3Ynh7bPrA1UE7NFTHKIxC1U9GNFh2o7CGvroD2GJagqeZdKDGxZPrAt
	4OHM2hI5GSzHrjPmkpAytvP6s25PnL9J+ohO01joGrADV1EoV6GgBgoVMTokgdYi
	dVOrHPTE8urO75toSDGj0rN37AVEB6N3Hn0XtZPnVB7D1BhafCZOiF0mDByZCEaY
	AxaY2i+86Ij/YZNaVaRrtIG/jAld4Wbh1eXeyJn+lJ0oj7cN5x0UaaSGjRrXOxFh
	fGfWArXj3aTVsnqXjF2KdyLuWFML+3Ru+gvg3hx9o1Kbv3Jg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufujg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:43:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91eb16ea5c3so71567006d6.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 16:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357786; x=1794962586; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tg4X3cdll5T1S7kugUAtHU1yiOSVpqm9E/2y7Atjkho=;
        b=B+KuP+USSTD2IE1N16H9mGGafWz2rNvLS4evJJt53nBnrBY4g43VWqvBL35Z3DPsh9
         CA6BLRY6Aa797Vf3C1npAuN6B9aJxell5K+GCnNErsxtkqKFpRdMqBe5JGIPMgzEmnIG
         /K4oNTLQEgpQmZ1oTxb72qB4l63YNUKtbMVG18weUpSryEdsKSt8PH45D8ySKmi/Im56
         2zOhR0ioNhXJxQ+uaAUU30m2PGWVi4r6lYqsUK1vdoL/oJtHi/6OnLhiTxrzJqE15WVn
         Hatbwb7GpueAw4tnQ5nGxVuiQJMoYnPJIkeZJRSDannbeGqecRHpWR6NNNkCHStwHfaE
         nP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357786; x=1794962586;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tg4X3cdll5T1S7kugUAtHU1yiOSVpqm9E/2y7Atjkho=;
        b=cU0ykGoWUE7ts9T0XSfTiUuM3khhZZESANoElqVe/aIMdmmGDskL/nefcu2ruq1KEN
         6Mat1pBIW/HjaDsUBmKurwy3gV+6CTOMBNJk8eRfXpXP4kIMJvwatonn7/1eEJfO7qrf
         /E+M2fbiBJksNHyMTw81ebBGZwkKk9OrtE8PWInNoGK92S/qUBbaDncZUMQXriq1nPJJ
         9jzv7qSRFsRHmldE/9ipbP4xq/xte6Mp4E0eQHt7bi8GnyUsibDZBcjRh7iBCj0r9D3Z
         ktWvprJImwwG6BsZ2foZh1qBQ/pgyZxFMiRVACwSbnKuFkylm4FxF/bue60xdj90aQAl
         eqXw==
X-Forwarded-Encrypted: i=1; AL+hErEdYqRHxcJ9VLGsenSE/2uSRIgKmcGAoQungq/gVINo936QE91WVYAjCKMePy0WzdCk4MgUyxatfVftddr/Ofay0g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+p03cYZrMbbarKgSRUBfMe2vzs+h/YRnYoyrjJRaSFRHALoCt/
	ME0TlLxNJRYLDjZ/MsC7DUlHV7uwEJjgMEiGwUZHnjH2Np/+D23lW6/GFCEYhskN9LLzo8mRzwo
	GisK2kUSbiQaRgrY2JeVI3VBZyPWomPCWYJXBY/xGGE+YkdFMazE1RgyXUpeV62AJ4fESalQw9w
	==
X-Gm-Gg: AYBFou0Xw4v5gYDFHcNX688qMmf1qFd+K3C0eHxU4KeD7eehiJAmIDdp1A+ekaIPp1V
	+/12xI3I6aPdE77OvQPKwoyamqTIl610r140Ii9UUMvxzuHOPjAfPuyLDsSJMEYCqHEJiOUpJNr
	i27R06Ycv6kubxEl9DeP5L9qBdskv6DwMGXzBOnIC394nwASwidR5l7LiqjSxySXdjM48vXdwCf
	sCRoWxGopYMvc/pyZqr7kvtxvQBUtpjX2Ikzf8uiQ8Xmz6wBw8XxwxbaSqGcqfR/vISXo8943iV
	Qw6PwD+1nuKPivuyi1xUzK5RSwsGOXZBrKldhIo8Ec3c2uJIykLYw1iYD79X28ioUR9+4Boo1Y3
	qoS8G3RHkZ9WqS/ENfTo0i3mkfQWxSHw94UUGr3ub6UjVdr+c55gUJ9vSmVH9cu/D4xt4rXRD69
	lCTZB8+PNK5TXSCGFdcaNynKZZ7x+K6DyVaZvgz/KeSDnzeRGtbeD5fADl5o7yyA==
X-Received: by 2002:a05:6214:4109:b0:91e:8cb1:b842 with SMTP id 6a1803df08f44-91f0416afc3mr18101326d6.49.1794357786443;
        Tue, 10 Nov 2026 16:43:06 -0800 (PST)
X-Received: by 2002:a05:6214:4109:b0:91e:8cb1:b842 with SMTP id 6a1803df08f44-91f0416afc3mr18100956d6.49.1794357785839;
        Tue, 10 Nov 2026 16:43:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 00/10] drm: writeback: clean up writeback connector
 initialization
Date: Wed, 11 Nov 2026 02:42:29 +0200
Message-Id: <20261111-wb-drop-encoder-v8-0-62948ed87d13@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPW582oC/3XS327CIBQG8FcxXA93OOWvV3uPZRdQYCNZW4Xau
 RjffajRmdTeED7C+ZGQ70hKyCkUslkdSQ5TKmnoa9AvK9J+2f4z0ORrJggoQAOjP476PGxp6Nv
 Bh0yNstAq4bzwitSpbQ4xHS7i+0fNX6mMQ/69PDCx8+myNTEKVCOXXALHqPzbUMp6t7ff7dB16
 7qQMznhA8PknMHKRCOYD8Ajj2aBaR4ZM2eayjiurbRRGWjcAsPvDEPUc4ZXRmiPOkipDbAFRtw
 YCQLEnBGV4SikcqpVNuICI/8ZyXDOyMqY2FjBo2YNgwVG3RkGz/5GVcZz1NqiDE7wJ8zp2oYcd
 vtaq/FaCeJsCfR8KY2blc8d7VJpX28b2ofDWEdPf380LrSZAgAA
X-Change-ID: 20250801-wb-drop-encoder-97a0c75bd5d7
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
        Suraj Kandpal <suraj.kandpal@intel.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        John Harrison <John.Harrison@Igalia.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6121;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eaXxqDG4WrpTkfdaiMoy+rNXi5klWk6+CeDvCurUMK0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87n6hOU2QvpLiPujdsHCYHYfu8QrSQipqUVwh
 rP0H5Xo42CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO5+gAKCRCLPIo+Aiko
 1YvTB/0a9YP74Woyq7Tx/JgbG6dxAN/qjgPFsMEZehC+9i3MVe4qiudQeHjHIGfJQvTduTO9Xqk
 tdFImxF3Hgmud1zSHt2T9loQX8oTx1pNCacq6kCaciiI64Y6SJ+d/N0vUyVVUpH77b0Nqw12ESP
 kl/TbEJKOBH8xPUzhMrDp8T/Pc7d3r64JpEgNO8lHLEU6Ts1z+j8neRmLLYq5T9Fb9iE0gaW3kI
 GfP9BXJtkeRj5M23Zcn3EyEa/S3EJqpa0deIEt/yaP+JFeGtn5+NZAwlYlDobyduHTYEIcIoXJ+
 WhoS8YRnyTSA1orhhwRUBgKDvvyat0rVOikzuzu5bOQkV4Em
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: n80-f0Y52Vw2MYEBiSWk28k3VntfACsx
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af3ba1b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8
 a=V2sgnzSHAAAA:8 a=zd2uoN0lAAAA:8 a=7CQSdrXTAAAA:8 a=P1BnusSwAAAA:8
 a=RF00TdSWAAAA:8 a=P-IC7800AAAA:8 a=-VAfIpHNAAAA:8 a=e5mUnYsNAAAA:8
 a=wUE-LUHtHEr0u8wc4aUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22 a=Z31ocT7rh6aUJxSkT1EX:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=D0XLA9XvdZm18NrgonBM:22 a=_nx8FpPT0le-2JWwMI5O:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=srlwD-8ojaedGGhPAyx8:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: n80-f0Y52Vw2MYEBiSWk28k3VntfACsx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX/2K3tSg/hgkV
 8De4yU5Jof3SlfYrPMKNSk/XZALU+mmKl7Aincjx4aTHbCgrl0E+3HecWtQd5p0gAZDFlmz2i2d
 Gvktp8gLiSDwbAKChck03GGYszZdy9M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX5vgpQGVInRGa
 +7K9KKcil3aegDCXB/3GP3StEpNchwEVHzoAE6gGbFCgH/bMNGss6+308HVin+j+z3SS7lDER/j
 QrvKjS1aRgWogJ9egAxxj0enGck4NNSs0tHVqdVky9tuIq9JSm0m2F6TBzMnOaBYZX+u2POfjDD
 otIjBBGKb/LahG+Ak+h1FyaAS42VvJRDbvSIqYwpYkgjdJ7KX7mxLKUJlyOxWfN6pu5K+/0er9v
 KvcqbTgQFAEaI1ER+VvynxspdnMWFxdpXZDslhl1iXBxcUXY5r2E2Nt2LA+bRHCTnxJjfz0JMve
 0qmEDwX1HQMNE2DMiVRi1gWEN7Z3nhYJ4exdEJNmVjKdie7UVOv2qXbUtExqK39J1LUFO1DdZ2b
 qB6IusAOBMh50skYKCjVvrfEFNPTzs4WKtXMo+kDbpWJmuaS8mU3YJ1QZ/yvjxzf7RWejSWyDic
 PfuW2wXUgl13GMhXmwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110001

Drivers using drm_writeback_connector_init() / _with_encoder() don't
perform cleanup in a manner similar to drmm_writeback_connector_init()
(see drm_writeback_connector_cleanup()). Enough of the drivers don't use
the encoder embedded into the drm_writeback connector.  In preparation
to further rework of the WB connectors (as planned to enable WB for i915
/ xe drivers, which would move drm_writeback_connector to be a field
inside drm_connector instead of subclassing it) remove the drm_encoder
wrapped in struct drm_writeback_connector. Rename the
drm_writeback_connector_init_with_encoder() to
drm_writeback_connector_init()
and copy drmm_writeback_connector_init() interface. Then, with the
encoder being gone, handle proper cleanup of writeback data in
drm_connector_cleanup().

---
Changes in v8:
- Fix the out-of-bounds access Sashiko reported on v7: track writeback
  initialization with a new drm_connector::wb_initialized flag and key the
  cleanup in drm_connector_cleanup() off it rather than the connector type,
  since a plain drm_connector may use DRM_MODE_CONNECTOR_WRITEBACK.
- Clean up the writeback jobs outside job_lock so the sleeping teardown no
  longer runs under the spinlock (new patch).
- Link to v7: https://patch.msgid.link/20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com

Changes in v7:
- Significantly reworked series, no longer insisting on using drmm.
- Link to v6: https://patch.msgid.link/20260612-wb-drop-encoder-v6-0-9f3a54f81310@oss.qualcomm.com

Changes in v6:
- Dropped applied patch
- Implemented suggestion by Alex to use drmm allocation for the
  writeback connector.
- Link to v5: https://patch.msgid.link/20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com

Changes in v5:
- Rebased on top of drm-misc-next
- Expanded commit message for msm patch, describing devm vs drmm issues (Laurent)
- Expanded commit messages, describing why the drivers are converted to
  drmm_writeback_connector_init() (Laurent)
- Link to v4: https://lore.kernel.org/r/20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com

Changes in v4:
- Rebase on top of drm-misc-next, dropping applied patch.
- Added a note regarding memory leak in the AMDGPU driver.
- Fixed a devm vs drmm issue in the msm/dpu driver.
- Link to v3: https://lore.kernel.org/r/20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com

Changes in v3:
- Fixed subject prefix for the rcar-du patch (Jessica Zhang)
- Link to v2: https://lore.kernel.org/r/20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com

Changes in v2:
- Switched to drm_crtc_mask() where applicable (Louis Chauvet)
- Link to v1: https://lore.kernel.org/r/20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: John Harrison <John.Harrison@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
To: Leo Li <sunpeng.li@amd.com>
To: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>
To: Christian König <christian.koenig@amd.com>
To: Liviu Dudau <liviu.dudau@arm.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maíra Canal <mcanal@igalia.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
To: Mihail Atanassov <mihail.atanassov@arm.com>
To: Eric Anholt <eric@anholt.net>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Brian Starkey <brian.starkey@arm.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org

---
Dmitry Baryshkov (10):
      drm/amd/display: embed the writeback encoder in amdgpu_dm_wb_connector
      drm/komeda: embed the writeback encoder in komeda_wb_connector
      drm/mali: embed the writeback encoder in malidp_drm
      drm: renesas: rcar-du: embed the writeback encoder in rcar_du_crtc
      drm: writeback: drop excess connector initialization functions
      drm: writeback: rename drm_writeback_connector_init_with_encoder()
      drm: writeback: don't destroy the shared writeback properties
      drm: writeback: clean up writeback jobs outside the job_lock
      drm: writeback: clean up writeback connectors in drm_connector_cleanup()
      drm: writeback: drop the drmm writeback cleanup action

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |  27 +++-
 .../amd/display/amdgpu_dm/tests/amdgpu_dm_test.c   |   4 +-
 .../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c    |   4 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |   3 +
 .../drm/arm/display/komeda/komeda_wb_connector.c   |  24 +++-
 drivers/gpu/drm/arm/malidp_drv.h                   |   1 +
 drivers/gpu/drm/arm/malidp_mw.c                    |  25 +++-
 drivers/gpu/drm/drm_connector.c                    |   3 +
 drivers/gpu/drm/drm_crtc_internal.h                |   3 +
 drivers/gpu/drm/drm_writeback.c                    | 156 ++++++---------------
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h     |   2 +
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    |  29 +++-
 drivers/gpu/drm/vc4/vc4_txp.c                      |   8 +-
 include/drm/drm_connector.h                        |  12 ++
 include/drm/drm_writeback.h                        |  22 +--
 17 files changed, 159 insertions(+), 167 deletions(-)
---
base-commit: 41b5458595c60143d0ebaa1e032c9cda5d764dff
change-id: 20250801-wb-drop-encoder-97a0c75bd5d7

Best regards,
--  
With best wishes
Dmitry

