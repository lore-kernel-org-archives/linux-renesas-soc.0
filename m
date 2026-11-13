Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559369;
	b=rUC7DTfBUfx+W7vwZd+YLfIV4N0LHmA32trdxSfiDZR99Qq9CYYJdYOxDyQwQnPYkHwp
	 +ogICNjJ0Il0KxuCsPYxPWa0x4oMEKFRLHmliGi2Yf9ycBSESqzm+J1Az11NPQF0F98Ba
	 ly8YxWFLGXHHycG5NuzZ6T6mtqF3tWq6ZeFtGjLhyJKmVLIfOPjXBwc+JbLrRoBPvYR4z
	 Q5xRFywA89bBy6Gr/fZV8xbz1tp+jxEomKo8RaLkHGzeKAaAqZ/QFE0ktnwQnxgUNtgFh
	 sotdH0yapuo4W4qv04N7Zh5SmT8KhZp9Vt+Uz9VBkvp5FHPL/pPIZ5wYYUFvGGAX7QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559369;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Zj6Lfev/TdBU/zEXLj+kc1uAUPkAbh/imhN2XQWfV6I=;
	b=HfVpfcPhSbJfAGFEzN3z98SxcK+TfLpRn9AnBYA00geJ8n47AaWxkkCl4VWZI+9H/D8f
	 nePzdPjZGc6uYCBAEgs2Ob288e1e3H3eKRDGGtqnWzqtjtYnyPeDskWS0dChrYR8jI9G4
	 uAZ5XAuWH1set8V9y3jBiTBXuA6qwsl9O0NuBM8LkE+deqw7GmRgVVMNvegOHG03zLjZ3
	 XGRnF39mXSkUvQjxBo2oNvUOhXqmBIFSBqq6e3cbKhT8gZF6XrCcnOUcohM+96NtJArkH
	 SUJl+PsZaSkwpMy6RclHDpNmTSOFantP4Uu7QlLatbRohqFTMf9CyvRFBVIS2f+fNXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BFxv/2el";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDxoavHu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F5D606A881
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 08:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F5D606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BFxv/2el;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDxoavHu
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VM6W2515758
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 08:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Zj6Lfev/TdBU/zEXLj+kc1uAUPkAbh/imhN
	2XQWfV6I=; b=BFxv/2elWgyFmeXiRUl/ZnEYw5Asosf2uGldsRiBRR2cxr7JO8C
	JY0Dc2mZS/EtPpamG0M1NW9gMrao70oNCbr9XRWcGCvks6v6Xj4TE2Bz4oZJdXmV
	cXbP9XDVwPco3wPRm7Rf9MsOUV4y9OkIBGm/jsC78B0ZIPfJhqIks08UK0VZ6VPx
	lW8HUu/CY96lcV+Kh0dRNp3SWTklDEp0FfZVM0g3txP4G6rwMyie17zr4vHtsqho
	GH0JdtCJ5zOw0+SdPitM09FRnC3sIvQqwl0eRvvzKL2alexDmiQTUog7HHn9NbiC
	GgUOpNVrRoqZbkj+03JTUSPKBXN9QrCir9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bb98d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 08:42:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso156101285a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 00:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559366; x=1795164166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zj6Lfev/TdBU/zEXLj+kc1uAUPkAbh/imhN2XQWfV6I=;
        b=GDxoavHugapPAUI2n7UPHrX2nYJf7c2KUQz+kZhdOJHja+hy4rHzzskfgzo91eTO5Z
         qI9mZovxLUZuxR2KP5peAJ+yGmKxySn8ut8/xH0Y2nyybrc3mnZr8vR/Gs6bAXRuVfgg
         LGpyL9uH0vO75xHxYk0qmorcb9D+6Mbpd5MzMHsdmjQR5+C8Y56MKFarRzFle17HwDSn
         OTUB6MorNtF3lDy680wUcSQnpQ+vWyZadSBt4r23ka3rqL5fgjFh4jKW4yYGPXAJJKXj
         iEuigGNXgGiyo7ZnQD4ni5HDl1vjfODgbvJo8B0JFk46qH5Jy5Fo/2zjyRmgyfCKNg3I
         tcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559366; x=1795164166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zj6Lfev/TdBU/zEXLj+kc1uAUPkAbh/imhN2XQWfV6I=;
        b=lwuilMPo+HxUskkyK5murzVI87Cude7zas7hday7VpuBFNnCcZGl01MDRfv0jDox6L
         3UzFO6ToEXOZeQt3+t6x9JaCnAQ4M7Q6xagdNryUvzGAWRQNeTFQsBKsnQD6Y3QvN4zT
         4sRQB6PWgjQFC8KOmOvjg2xAkptRQvlHQwAuRsEC02ZjcGrqDB12TQLnpX15flztqiH2
         uuwqvcqnLkf1iRKObU53S/lbjLR9wHZmru4KM/k8iIu5Z2vKakkwN0YUVPYk3lXrYG3i
         E359ubLp1BfxPLuqeY1WY5vYqTmoiODr1WoWh0c+uWnQC5WwpiceT2lPtoyWOpMhwrHu
         u1Iw==
X-Forwarded-Encrypted: i=1; AL+hErGxmRYfe5pVnJf3tExf0VxuwhSNTnIBmcLQ53MCVastVe5liUi/a0MHG5KDn4A5LOtKGZeCYSu/jdOMQ0qypxV0tw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+XRg7o0GPAZFrIpA1WTv7vHYFW8c4hwcSFRk0W05zN5stp+KtQ
	mvFlebAwfu541hLyVgjqBAGmGduwiSxNLLz5gCtheQ2357B+IekNZzZf/9Y2AMrlH2OyERagH5Q
	ZvRkWYEEMf8vc7CAqLyXO3sQI9hnFTiur7yj1aIc6bUwCFWM9Ooh+Y7xkXUgUQ0gSZph8iblbOQ
	==
X-Gm-Gg: AYBFou0o2L2dMY//+ro9W59fE9VMdCfTIxf9yg87pOHuhCPkYXWQjpqKm7ua0NshyTL
	706YI+O0OGLtp0J2xKvyt1TUUWbSGetVFJZ+f9Tu0sUETCqUNQOY1ENHzZa2HXBb/CB+7u5rGbn
	HtSWR9ZBF0+kfLXDEbrlzXbNm3bW1021KkegiRwIuZT1xGI3Fg6GC9A01nvsZM5PFh+jfMttyxE
	7HsNI+hvXboi+eyCFLLsxjRzhp83aXGr07VfHZI/AW5q+BT9A7MB0Ik82duG91XjF/InB36jM0V
	5qU2BQe6eH4OByz7Qb5r8zfKTpOf3Hn/hMHJ1FQHXbQ0P+S9lwgrigD7tV/7EQu7PiS5WqcwKni
	iyPPlpXjFhMpv0lbEReSTk1eeuLsiWUfDXfpUv311loio9yePEMTvHuRc+dIFwQ==
X-Received: by 2002:a05:620a:2a06:b0:948:e2fb:8ffd with SMTP id af79cd13be357-9494bca2bf8mr306699685a.75.1794559365853;
        Fri, 13 Nov 2026 00:42:45 -0800 (PST)
X-Received: by 2002:a05:620a:2a06:b0:948:e2fb:8ffd with SMTP id af79cd13be357-9494bca2bf8mr306696785a.75.1794559365289;
        Fri, 13 Nov 2026 00:42:45 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55afb6absm47272505e9.15.2026.11.13.00.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:42:43 -0800 (PST)
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
Subject: [PATCH v3] dt-bindings: display: panel: Make DSI panels port optional
Date: Fri, 13 Nov 2026 09:42:37 +0100
Message-ID: <20261113084236.53336-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=22989; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=vyEXcnZlyz2BzCHBQuQsLKzJktBY7VmoyeJZnBh4mpg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9s18BfhzPnHdOVmlTpnspDEoI7fz49K2Ntujz
 YIuzIUebiKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavbNfAAKCRDBN2bmhouD
 1zz9D/9CLmIgwmNedvhYPlFE+Vrso9oUGQvw56usemijYw5KhF68NY00YOtVlJHK1Qnsus61qOM
 3urYa+wS0ZAueSwyz6qw9wHhWlCgucji+sm4TdUhSfZnayHv7EXRm2X4HU735TAYkh9yn6TxxuD
 53jcYx77JBRE7DiYwBf8fv/+ZEbO/zpcKUkDr0fatGxcz7kESTNKx9HAh9/ZSaz2D4hiMrpJ+QP
 JV1O0p507sBPgbGooSTyolEYD3lGsF+P0LIDOkaDXOwTvEnI1eqSE9T65rrPICa1t558cdMC3xn
 6A8PLAiF8qDLoD9LkYXRmQpQp/NZtfAgAateqi41l9WboTDGHHt/8bqF+XjPAbhY+ARJIhBszXb
 xBIHDryY2rxpQ81Lcp+tDywqu7jYqvsJIzYyuoxongGrle9eCYSf3HBPz3CwY+0B/XnG8RNKfaQ
 VarGsXLl0mEFGbyZ8hjC4ex9NbhRT/1JtfDIZnYNehuNHnxIRQWCYzWpfG1yMvp0OOXovWPkcKI
 k21v0crkffIjWWYfef69C3ppr8ciwIwrVR/T5lSHephYagwckaotY3rV4jDUOkTQl5MXPUM33c3
 IeCBfPhBGr189Ejv/pmi42RJ0a/bvSSvHT/3qCEXJU2Jew2MMBlr9AVJqZlmrtJWS9EiU2A0eBi jKVs+Kcui26IFhQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af6cd87 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=r20e0feN5VoI4vvULvEA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: vfzPpKLUVZltWXLrvUmCv1ntOfmVhIT7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX8vxJNTTDJdv9
 KUSB6j938ub8e3ScfrzNfAUIeBFHF/BHSe1yFNm02ep91Kut6ASOsHB33VrtukyGlDcMKqZq3+b
 s3mNhCcMz+R+1CEeRPthEEZ6xxf3g5L6bXy0GjX+y6RsPc8lbK7gxff80SvDRqhN/f9/Z96cgXz
 tWUndVNUljkVs2NZXsKKGCWjysY88YHEI61f6GfPGwcMW7IQksVSd3+0jR6r4V6/6qCpHrFUCH4
 iR4ya8kx4F6GreZDBGPGiMyef3UIfdX8aVHkuAZB7RuYRWhCaK3Jt9CpmWmfK56qwJYcpZ5PBu5
 RoA5UF5OKFyVTRNRUKvveycH/SoCsCCAbBqJYmX0r+9vMK1zjjhy1lz1HhHbEZCi47p5CIF2O7C
 U8y6sFtL5xEg2XLr5SdWb3jV555uJVY/XzdYu1cu5Mt3D70HYo2T8cplI8+ChNmPAkmb9CVl0QA
 jsV9yRhCot2t5PJjCCQ==
X-Proofpoint-ORIG-GUID: vfzPpKLUVZltWXLrvUmCv1ntOfmVhIT7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX96vFLmfdjboa
 aErodPqSEbhL33/CoDdloIu+r5LVf3ItJJjos8h+LSkhLtHoMpqL2ZuGDiu4opZk0s1+vTYvGzn
 AxGoXe3cC19xtnLUchL4H+kx0CwgmiI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034

DSI panels can be placed under DSI bus directly and some of the Linux DRM
drivers will work fine with it: mipi_dsi_host_register() adds device for
such panel and DRM driver does not use OF graph to configure lanes.
Examples are Samsung Exynos and Allwinner DRM drivers.

The Linux panel drivers affected here do not use OF graph, either.

Requiring graph port for such panels is tying the binding to one
specific implementation of Linux DRM drivers, e.g. Qualcomm DRM which
requires the port.  That's a mistake, because:
1. It prevents usage of such panel in DTS for other platforms,
2. Places the constraint (port requirement) in wrong domain - the DSI
   host needs the port, not the panel.

The port is not needed for the panel hardware to operate thus it should
be optional.

Suggested-by: Romain TISSERAND <romain.tisserand@gmail.com>
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com> # renesas r61307 and r69328
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Change in v3:
1. Require port for the SPI-only rocktech,rk050hr345-ct106a?

Change in v2:
1. Rephrase commit msg
2. Tag

Remaining one Ilitek is fixed in:
https://lore.kernel.org/all/20261109160706.2272332-2-romain.tisserand@gmail.com/
---
 .../devicetree/bindings/display/panel/anbernic,td4310.yaml      | 1 -
 Documentation/devicetree/bindings/display/panel/boe,td4320.yaml | 1 -
 .../devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml     | 1 -
 .../devicetree/bindings/display/panel/ebbg,ft8719.yaml          | 1 -
 .../devicetree/bindings/display/panel/elida,kd35t133.yaml       | 1 -
 .../bindings/display/panel/feiyang,fy07024di26a30d.yaml         | 1 -
 .../devicetree/bindings/display/panel/himax,hx83112a.yaml       | 1 -
 .../devicetree/bindings/display/panel/himax,hx83112b.yaml       | 1 -
 .../devicetree/bindings/display/panel/himax,hx8394.yaml         | 1 -
 .../devicetree/bindings/display/panel/ilitek,ili7807s.yaml      | 1 -
 .../devicetree/bindings/display/panel/ilitek,ili9805.yaml       | 1 -
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml      | 2 +-
 Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml | 1 -
 .../devicetree/bindings/display/panel/novatek,nt35532.yaml      | 1 -
 .../devicetree/bindings/display/panel/novatek,nt36672a.yaml     | 1 -
 .../devicetree/bindings/display/panel/novatek,nt36672e.yaml     | 1 -
 .../devicetree/bindings/display/panel/novatek,nt37801.yaml      | 1 -
 .../devicetree/bindings/display/panel/novatek,nt51021.yaml      | 1 -
 .../devicetree/bindings/display/panel/raydium,rm67191.yaml      | 1 -
 .../devicetree/bindings/display/panel/raydium,rm67200.yaml      | 1 -
 .../devicetree/bindings/display/panel/raydium,rm69220.yaml      | 1 -
 .../devicetree/bindings/display/panel/raydium,rm692e5.yaml      | 1 -
 .../devicetree/bindings/display/panel/renesas,r61307.yaml       | 1 -
 .../devicetree/bindings/display/panel/renesas,r69328.yaml       | 1 -
 .../devicetree/bindings/display/panel/ronbo,rb070d30.yaml       | 1 -
 .../devicetree/bindings/display/panel/samsung,ams581vf01.yaml   | 1 -
 .../devicetree/bindings/display/panel/samsung,ams639rq08.yaml   | 1 -
 .../bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml      | 1 -
 .../devicetree/bindings/display/panel/samsung,sofef01-m.yaml    | 1 -
 .../devicetree/bindings/display/panel/sony,td4353-jdi.yaml      | 1 -
 .../bindings/display/panel/sony,tulip-truly-nt35521.yaml        | 1 -
 .../bindings/display/panel/startek,kd070fhfid015.yaml           | 1 -
 .../devicetree/bindings/display/panel/synaptics,r63353.yaml     | 1 -
 .../devicetree/bindings/display/panel/visionox,g2647fb105.yaml  | 1 -
 .../devicetree/bindings/display/panel/visionox,r66451.yaml      | 1 -
 .../devicetree/bindings/display/panel/visionox,rm69299.yaml     | 1 -
 .../devicetree/bindings/display/panel/visionox,rm692e5.yaml     | 1 -
 .../devicetree/bindings/display/panel/visionox,vtdr6130.yaml    | 1 -
 .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml   | 1 -
 39 files changed, 1 insertion(+), 39 deletions(-)

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
index 2080d9e0ffac..410322f4ad39 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -33,7 +33,6 @@ required:
   - vdd-supply
   - reset-gpios
   - backlight
-  - port
 
 if:
   properties:
@@ -44,6 +43,7 @@ if:
 then:
   $ref: /schemas/spi/spi-peripheral-props.yaml#
   required:
+    - port
     - spi-max-frequency
 else:
   required:
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

