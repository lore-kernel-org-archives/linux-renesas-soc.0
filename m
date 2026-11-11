Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395035;
	b=sRQA4NDkI/B7NJBc6+uPra6yZGdpZXbmY5CJO1b5EjqvU96FbUCZgvv+HVXiFebhrNWm
	 Oi7hL+FVg1ZWAiDI1/HNvTy+WgzRThfX9aKNiAE7sF+kKgcxZ0GTCUqw6QpCyRFBLhzug
	 bPnvRRXQCYs3Xib6tPEHj3zX54MCeICkK4sNMYl1UVCmxE4+x+Cd1/LzeIh/8paB0YyS1
	 oaTzAkQKc2GumoOeYAgBsDt5bUjsw3xLmmJemdc2gNMfjSSVNmd4rLU1nne671xKXg5gU
	 5mk8AJqVMd9p6AIwSmiQ9LILYeAhGbgEatYDD0cDo0+3sJc1n/Uku+iVEf62Q9vmCNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395035;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oR7ofXD7hcLsHpP3nU/UZ0VmhGdCFJ5QiVNnKCWGnyk=;
	b=x15UI+Ho2Q1wvQVSr0PHFz5LKpkf8kuRH6a5ONDDQBu6dPRIBOyHwd06gX0eSPcHag1n
	 lI38eiaQjdtsgc7edK5DzSF6W/DxioFhW6xF7Sllcp7tzP2dyZW2QvMGetua+bb4kbHC6
	 QKJrzkptW0/XcG7rjqEFfqhnTInYW8KQv5psYgpnuouFCRcjLRuxKus/QHlCM0+redGfu
	 bUkbfDQViOw7fSsPPTLV2QK2Gx8Tx+qdBl7zhtJzR5JjGfL+izqusaoWYHdR4cpBFn1y8
	 Y8tklnAgqxZoIabrGcR4I+WUFkxPIl65YGQqvPrbcESSJt/K6UzRvmMc91vdOpt9ttw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPRDAeKW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J29zy2z1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F835606A327
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 11:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F835606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPRDAeKW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J29zy2z1
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABAp24N1386443
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 11:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oR7ofXD7hcLsHpP3nU/UZ0VmhGdCFJ5QiVN
	nKCWGnyk=; b=BPRDAeKWK1PxExJwYmbAZHFwV74VTscqlH5QziPIw0xJyExUiFO
	M1mAydYfKt3SdY6qyXqV/maIPMWELaT/zLu2KPSjAtGo9xnhE9EEABgbZYiOSPuM
	/lD4fHhv/7lsRg066qIP/94YpzmePKnbSYgZEJptCIWMx8CBYsPaWHB2DRxLonKP
	g0A7rkSgvb7J7K00DFBMdsnmkw9NZWaXIoXaIYODbD6WEA6jNncrNBrAfGJCD62n
	PwHNk3uq9MZbHW586/jMa/vt6mmgdvUBtfp7U7MlnA1w2XiiKxVsi5NSI309XOWc
	2LJURrQFCjzcsW8dExT6+hS4nlX2NTGgTeg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnma8ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 11:03:53 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9984a7eb3ddso2166831241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 03:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794395033; x=1794999833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oR7ofXD7hcLsHpP3nU/UZ0VmhGdCFJ5QiVNnKCWGnyk=;
        b=J29zy2z1fUubPTT/NtsbpPtKkVvoihP8IMj+nyGuOkc1UKjUupSus24j6RDYHCq5UR
         njd0zI31Til40T95J66orBKPBpi2IYsVEatPqe4Llcsb+3XGJbcmdmjVeEx5jaMiGKer
         zBsrbGsYqA8QP/UyDBtVAGMZtibRBP2bmWoaQW5OlTXzau0gIWC+FQTHajKr1GnWDyci
         sIFLsZgoDDiyT7jJQDdLWAF/KtY5Myu2kkOgyeZMnwGdqOhTNTpuFtBQV2qrbgMj06mN
         AJRGjmT1yvQhHcU+qkr5sn0ove971ZXun+sEF18MF5iLRQWschRfEqXAP98jWySbv/Bd
         /78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395033; x=1794999833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oR7ofXD7hcLsHpP3nU/UZ0VmhGdCFJ5QiVNnKCWGnyk=;
        b=AI31800EabkB+qpYNcWAjJqDD6jq/ZOnsnEBdtPF14S8e3qMuL5d7RfavLBY9W+Rf/
         t264pO5TLKZK8FuWYg3MECjxzhZHDgVR7Y1R6KAkJUActZu58tVas+cWlkOr7OERJACH
         i4tiQslPm/DDnmhO+XIwPcuKRDzme4UfeFFrhod7rvm3LBbBz7aMaH5z7rhtuWXdjG3a
         XG7M2sgOXLC2SuKDQEMwQTt2Md2OEXz0rM71sarHLKHZ6jCSX3r6nyA5hzkGPPzKPmAc
         Lto8/jLTLmw8sBe8xwNwaPEQVMwlsP0vJTCjUcUstR1i8OOidJRPoyFo0YtP6LuivZKZ
         SZbg==
X-Forwarded-Encrypted: i=1; AL+hErHg7AppM5VW0ihEc3OKbdgsniFCWqhvWM1BM4QxQeG7KtaP8B5UxSQ+2BUDfAPnfT0GHvNnUgpnqV/GBSbETZABLw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+VRi/cu9+bnF1UMehHppEYJ3nI18+twGqlg+ADjoQ5vn8/QkEC
	XKmC2mQgycsu/xlNZ6gq9ziTfsVaQUyP0vhKSDc+nTQXNdW3URW3R6QifTQQarbFuzILYga/lj/
	25Y52QVAuEvWWRiSPYjoSlwfpb/70uDMp1w5/jvSPUYkzwJEbFkXcRwnnY/oW0kz1DK4km0MzHA
	==
X-Gm-Gg: AYBFou3IGCLXiXpoXYsExfqFn6HlcBGrh/2r3MfuO7H5HjN9PnBuzzPmkmmXcS2vKNr
	FL9qlxuJLDUMkuFlbneQA4jAQGONFhTXBXjFWgp8wn/g3iDwsVPscKgw8fBExafm9a2AF/doxKX
	5vtdLG6TclbhUB2S5qWyoq5UuD66P9sLKcVf0p3w5h7tqEfrRaUUYbeZ3EQCgbrCZh4QJiXZ1Fe
	WEbaIvOgs8d1RSQI/bdGA5Ks1FQ0+eiFPc3kS5dNeIkd7tsgG9SK8cPIcEic0Vxj3AcanXaeS5U
	vh77VQmX2jIBH6GRsmkXaWSb0Ov5tB65HugRLqzMAt4KiYejSWSPRsEUIzammSLTNmysX0DjXad
	HFzkXtHv9YCoTy4JVtiH/ZN0WFcp1R5O/ZhX3pZjBICGRMDQ4YNBtIr3rp4mPnQ==
X-Received: by 2002:a67:e105:0:b0:7d2:8cb8:dbf5 with SMTP id ada2fe7eead31-7d5061826afmr438913137.36.1794395032110;
        Wed, 11 Nov 2026 03:03:52 -0800 (PST)
X-Received: by 2002:a67:e105:0:b0:7d2:8cb8:dbf5 with SMTP id ada2fe7eead31-7d5061826afmr438889137.36.1794395031512;
        Wed, 11 Nov 2026 03:03:51 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm151863665e9.15.2026.11.11.03.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:03:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Michael Walle <mwalle@kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Jens Reidel <adrian@travitia.xyz>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Shawn Guo <shawn.guo@linaro.org>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Alexander Baransky <sanyapilot496@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Romain TISSERAND <romain.tisserand@gmail.com>
Subject: [PATCH] dt-bindings: display: panel: Make DSI panels port optional
Date: Wed, 11 Nov 2026 12:03:39 +0100
Message-ID: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=22405; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=H7HnLID1pY7xSXQqmTAUpifJiHurway4bvVjjIzs81c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9EuKq71h6H+MoWwyUDACyfYs7GKfiodNRYB49
 93AiDZ+E7GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavRLigAKCRDBN2bmhouD
 1wuQEACVlwVtLdEhg1NYRdTPp1UeAlQeaZctrfMxkHObK89ZCHf5kgYlfyFqxJAmk/Cw9mmf3Nc
 gQ82IKy/26//JOLdXw3sImdPjrSMGaruAooZMtGyGiRgk8B+Yk1JFAU9ShaWV5GpjNMWApasrke
 0k4xD9tZXGPl3dGp2VQkYavGYU0xrTZ6+u//35U5ngoCW0rurzOzNMx2UFTE0f6l+6RLlS60EHf
 idX5k7WbQHrAAV4M/TVuc7oUowTd5Xuq7mCSYQjZZ5zK5KNbahZXaf1tH17UGciZFOi2y7ToXeG
 sgLMOZqHIexJYQBsGf5rE4qRo8SEmoQZlof/gHxgscos9v5/iBdG6BLML86TxSQOFzY5Lfcyz/o
 Adkx9vj1xPA7clq34v2v7qba7qP4liV0OThr3hAR1i8l3s2qYcO8XEnLFTm2UCNnIjPGNxjfQpi
 uK1VgBjO7PxLWtZ/QA7kkIJcMDKjyIlUJwXh2LyTR1sBOB6npBnlAOX0gYxcLvPE2pV4FA0/Nkj
 MGKACUo/TohBTaf/MNuIMLGk7cEdVoFzp0E2deIG1CC5scrJYr0knwHLLXlP7FSxWF2PovOj5eS
 lq/YNcK+71AM8mWMZYWKk4GOx7gRHSmoeC4lyMMY++W0zQBYinZ8yQ44cBcyeG+nz0Cjq1C+siL Oqo1UKUkIotOF0w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 58kcv95bgrZOEY3nRt-PtNVKr3C2C4OC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MyBTYWx0ZWRfX0mJCC3Zbbbuv
 lHFA8FG6DhTXbgEZbHB6TRX0v0Owfcvs6QeqU3+/wIMpogfhgTbxhLRYESeAqS2iMa71IoZg65A
 PennsoSayp0sUMkXFJGyb2CpB5ce4k4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MyBTYWx0ZWRfX4wGA8ySNXWMU
 1NxVnbRABsVttUDJnojDMM6klrNXYqmy4gfA6I6g5JWXCb8s17oE05ogfpNVTLHeggF6K1BYubA
 y6JCAgzkSLFa6138+75LoSkkXZJqXv+idQUt0/1JU4v3phsJ9i555qqGW7F6wVXwWNfqZ+6uagp
 8AmlNdhLJYgQFIXQIwh7rIvZqYcy62rzUr6ckgXz6nShW4Oc7N3FJJna5Ez6WDgNjak3FwlwIw5
 eh5Vy616qucENtCUBUlWS8ipxaWPRYqaVOxXeNsG0ZtVlEjCmBblRz62oqKOAc5PNuj08JQI4k8
 oAzr7vLAf4Yt/xe5+u57YPNQ0qOcpC1cVNHe8Wtp1ow/9Hrsdd/ZfCgGAoMAa03PDFtFVaeU+UL
 XSwDYbaFnqABhbdBCE5ztrqC8ppPVzGp+domRvct9V3LDa9qKSYIzbvrMYmkEUGlphrVuw8NWf5
 /V8kKYLewNOMQdYa87g==
X-Proofpoint-GUID: 58kcv95bgrZOEY3nRt-PtNVKr3C2C4OC
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af44b99 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=mjsFznTw3OI9RgeBSe4A:9
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110043

DSI panels can be placed under DSI bus directly and many Linux DRM
drivers will work fine with it: mipi_dsi_host_register() adds device for
such panel and DRM driver does not use OF graph to configure lanes.  The
affected here Linux panel drivers do not use OF graph, either.

Requiring graph port for such panels is tying the binding to one
specific implementation of Linux DRM drivers, e.g. Qualcomm DRM which
requires the port.  The port is not needed for the hardware to operate
and for some of the Linux drivers, so it should be optional.

Suggested-by: Romain TISSERAND <romain.tisserand@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Remaining one Ilitek is fixed in:
https://lore.kernel.org/all/20261109160706.2272332-2-romain.tisserand@gmail.com/
---
 .../devicetree/bindings/display/panel/anbernic,td4310.yaml       | 1 -
 Documentation/devicetree/bindings/display/panel/boe,td4320.yaml  | 1 -
 .../devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml      | 1 -
 Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml | 1 -
 .../devicetree/bindings/display/panel/elida,kd35t133.yaml        | 1 -
 .../bindings/display/panel/feiyang,fy07024di26a30d.yaml          | 1 -
 .../devicetree/bindings/display/panel/himax,hx83112a.yaml        | 1 -
 .../devicetree/bindings/display/panel/himax,hx83112b.yaml        | 1 -
 .../devicetree/bindings/display/panel/himax,hx8394.yaml          | 1 -
 .../devicetree/bindings/display/panel/ilitek,ili7807s.yaml       | 1 -
 .../devicetree/bindings/display/panel/ilitek,ili9805.yaml        | 1 -
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml       | 1 -
 Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml  | 1 -
 .../devicetree/bindings/display/panel/novatek,nt35532.yaml       | 1 -
 .../devicetree/bindings/display/panel/novatek,nt36672a.yaml      | 1 -
 .../devicetree/bindings/display/panel/novatek,nt36672e.yaml      | 1 -
 .../devicetree/bindings/display/panel/novatek,nt37801.yaml       | 1 -
 .../devicetree/bindings/display/panel/novatek,nt51021.yaml       | 1 -
 .../devicetree/bindings/display/panel/raydium,rm67191.yaml       | 1 -
 .../devicetree/bindings/display/panel/raydium,rm67200.yaml       | 1 -
 .../devicetree/bindings/display/panel/raydium,rm69220.yaml       | 1 -
 .../devicetree/bindings/display/panel/raydium,rm692e5.yaml       | 1 -
 .../devicetree/bindings/display/panel/renesas,r61307.yaml        | 1 -
 .../devicetree/bindings/display/panel/renesas,r69328.yaml        | 1 -
 .../devicetree/bindings/display/panel/ronbo,rb070d30.yaml        | 1 -
 .../devicetree/bindings/display/panel/samsung,ams581vf01.yaml    | 1 -
 .../devicetree/bindings/display/panel/samsung,ams639rq08.yaml    | 1 -
 .../bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml       | 1 -
 .../devicetree/bindings/display/panel/samsung,sofef01-m.yaml     | 1 -
 .../devicetree/bindings/display/panel/sony,td4353-jdi.yaml       | 1 -
 .../bindings/display/panel/sony,tulip-truly-nt35521.yaml         | 1 -
 .../devicetree/bindings/display/panel/startek,kd070fhfid015.yaml | 1 -
 .../devicetree/bindings/display/panel/synaptics,r63353.yaml      | 1 -
 .../devicetree/bindings/display/panel/visionox,g2647fb105.yaml   | 1 -
 .../devicetree/bindings/display/panel/visionox,r66451.yaml       | 1 -
 .../devicetree/bindings/display/panel/visionox,rm69299.yaml      | 1 -
 .../devicetree/bindings/display/panel/visionox,rm692e5.yaml      | 1 -
 .../devicetree/bindings/display/panel/visionox,vtdr6130.yaml     | 1 -
 .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml    | 1 -
 39 files changed, 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
index f820dc2f732b..1d6bf6da2ca8 100644
--- a/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
+++ b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
@@ -31,7 +31,6 @@ properties:
 
 required:
   - compatible
-  - port
   - reg
   - reset-gpios
   - vdd-supply
diff --git a/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml b/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
index c6bff0ece360..90f0d0bbe91e 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
@@ -36,7 +36,6 @@ required:
   - compatible
   - reg
   - reset-gpios
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml
index dced98e1c69a..45f3205ed952 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml
@@ -33,7 +33,6 @@ required:
   - reset-gpios
   - vsp-supply
   - vsn-supply
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml b/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
index 80deedc01c7c..9c6a4d5e9f5b 100644
--- a/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
@@ -41,7 +41,6 @@ required:
   - vddpos-supply
   - vddneg-supply
   - reset-gpios
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
index f4cb825d1e96..d04ffbba359a 100644
--- a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
+++ b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
@@ -32,7 +32,6 @@ required:
   - compatible
   - reg
   - backlight
-  - port
   - iovcc-supply
   - vdd-supply
 
diff --git a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
index f288fa2390c9..f36e866a1325 100644
--- a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
@@ -35,7 +35,6 @@ required:
   - reg
   - avdd-supply
   - dvdd-supply
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
index 2c60d0cd704e..008a94608c42 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
@@ -40,7 +40,6 @@ required:
   - vdd1-supply
   - vsn-supply
   - vsp-supply
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
index e58bb3d45331..bc1771efb6e9 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
@@ -40,7 +40,6 @@ required:
   - iovcc-supply
   - vsn-supply
   - vsp-supply
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 83c343b02835..41dc3f39f42a 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -49,7 +49,6 @@ required:
   - compatible
   - reg
   - backlight
-  - port
   - vcc-supply
   - iovcc-supply
 
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
index ba8c5bbf8ffc..3bace821bc8e 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
@@ -41,7 +41,6 @@ required:
   - vddi-supply
   - avdd-supply
   - avee-supply
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
index ff67129c9466..4bd76a411639 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
@@ -32,7 +32,6 @@ required:
   - dvdd-supply
   - reg
   - reset-gpios
-  - port
   - backlight
 
 unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index 2080d9e0ffac..9a2602ddd906 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -33,7 +33,6 @@ required:
   - vdd-supply
   - reset-gpios
   - backlight
-  - port
 
 if:
   properties:
diff --git a/Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml b/Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
index 226974a4077f..70243c087410 100644
--- a/Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
@@ -35,7 +35,6 @@ required:
   - reset-gpios
   - power-supply
   - backlight
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml
index ff6fdad7febf..a00aabc7f583 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml
@@ -47,7 +47,6 @@ required:
   - reg
   - reset-gpios
   - vddi-supply
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
index 5d16d8511725..3263e21bf72e 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
@@ -54,7 +54,6 @@ required:
   - vddpos-supply
   - vddneg-supply
   - reset-gpios
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
index dc4672f3d01d..bb10d62ac2e4 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
@@ -34,7 +34,6 @@ required:
   - avdd-supply
   - avee-supply
   - reset-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
index 1b38c1d0af68..ff7afe5467b6 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
@@ -36,7 +36,6 @@ required:
   - vci-supply
   - vdd-supply
   - vddio-supply
-  - port
   - reset-gpios
 
 additionalProperties: false
diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
index 7754a8cb1e5c..a50f241e0186 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
@@ -54,7 +54,6 @@ required:
   - avdd-supply
   - havdd-supply
   - reset-gpios
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
index 4825792bf712..511cd2b64fe7 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
@@ -47,7 +47,6 @@ required:
   - compatible
   - reg
   - dsi-lanes
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
index 97b7fbe05c07..cefb5fdee826 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
@@ -40,7 +40,6 @@ properties:
 
 required:
   - compatible
-  - port
   - reg
 
 additionalProperties: false
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm69220.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm69220.yaml
index 3c94db88f797..44b416260f20 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm69220.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm69220.yaml
@@ -42,7 +42,6 @@ required:
   - vci-supply
   - vddio-supply
   - reset-gpios
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
index 616a5f3ec9fc..91336e17a059 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
@@ -41,7 +41,6 @@ required:
   - dvdd-supply
   - vci-supply
   - vddio-supply
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
index 3d7761717b74..aff691fdb771 100644
--- a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
@@ -55,7 +55,6 @@ properties:
 
 required:
   - compatible
-  - port
   - backlight
 
 additionalProperties: false
diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
index 740185f778a1..c28b671d8721 100644
--- a/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
@@ -38,7 +38,6 @@ properties:
 
 required:
   - compatible
-  - port
   - backlight
 
 additionalProperties: false
diff --git a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
index 694037301583..b17b7ce2b29e 100644
--- a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
@@ -42,6 +42,5 @@ required:
   - shlr-gpios
   - updn-gpios
   - vcc-lcd-supply
-  - port
 
 unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
index 70dff9c0ef2b..5e1fb1edb3e0 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
@@ -45,7 +45,6 @@ required:
   - vsn-supply
   - vsp-supply
   - reset-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml
index f5b6ecb96f99..3a68324a2b69 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml
@@ -46,7 +46,6 @@ required:
   - vsn-supply
   - vsp-supply
   - reset-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
index 42634fc3b5b2..25eadff02816 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
@@ -29,7 +29,6 @@ properties:
 required:
   - compatible
   - reg
-  - port
   - vdd3-supply
   - vci-supply
   - reset-gpios
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml b/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
index bccc667aa072..c0a44e69b37e 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
@@ -47,7 +47,6 @@ properties:
 
 required:
   - compatible
-  - port
   - reg
   - reset-gpios
   - vddio-supply
diff --git a/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
index 032a989184ff..ccfc0513eb4a 100644
--- a/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
@@ -52,7 +52,6 @@ required:
   - vsn-supply
   - panel-reset-gpios
   - touch-reset-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml b/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
index 85c5dee65383..85977dfe8b72 100644
--- a/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
@@ -41,7 +41,6 @@ required:
   - negative5-supply
   - reset-gpios
   - enable-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
index 7fd9364fa385..4c7677f6b154 100644
--- a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
+++ b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
@@ -34,7 +34,6 @@ required:
   - iovcc-supply
   - reg
   - reset-gpios
-  - port
   - power-supply
 
 additionalProperties: false
diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
index 2fd6e0ec3682..6a0c7518531a 100644
--- a/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
+++ b/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
@@ -31,7 +31,6 @@ required:
   - avdd-supply
   - dvdd-supply
   - reset-gpios
-  - port
   - backlight
 
 unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml b/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
index 49dcd9b8f670..ea79ea070adc 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
@@ -45,7 +45,6 @@ required:
   - vsn-supply
   - vsp-supply
   - reset-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
index 49ef45c03593..281333b781ba 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
@@ -31,7 +31,6 @@ required:
   - vddio-supply
   - vdd-supply
   - reset-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
index f61a528c0413..bcde74217e1b 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
@@ -42,7 +42,6 @@ required:
   - vdda-supply
   - vdd3p3-supply
   - reset-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
index d4b4672815fe..ec393d15423f 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
@@ -44,7 +44,6 @@ required:
   - reset-gpios
   - vdd-supply
   - vddio-supply
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
index 682f30dc9ee4..979c5b95fac9 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
@@ -37,7 +37,6 @@ required:
   - vddio-supply
   - vci-supply
   - reset-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
index 9c9743a23500..13ff075bd2a6 100644
--- a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
+++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
@@ -31,7 +31,6 @@ required:
   - compatible
   - reg
   - backlight
-  - port
   - iovcc-supply
   - vci-supply
 
-- 
2.53.0

