Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013064;
	b=lMrxax8w3pqglmGaFSPrauycb8/Y5Epp7Kieyjb9wMkYE0tPofzDIQwNqLfYlFssGstu
	 JpBljZUHeVqlv7sBWORn+YdHzB43neGwmXCQhokzhz/KHdQ59X2Jv0CjkMgk9SP+nadmr
	 wY8/xOdcAYK7VyNB8a7Il840AwxJH9e107Oswm2hl3C2WLkrttCa5drgnMhnJEyKM4vno
	 GZq3wY4umje2ypgwzSz8WGhAAF2Ci2bkJbKqBq34aN2g+pqNeKCbZ5jwXo2i447q+CHsV
	 SVkIW8G81slBf/VdQ+oQGJ0Ov8nD0jACNp2KrJ7CMz9aFdEGqFNPIcwWN/byeQKwYDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vY8BWoJH8w/x7seYGIIKWtBAXqP7TPJ+H06hDuNNvmY=;
	b=VxSN3eSbboIM6WLq+unUa5hmpsZC7Y6CZ/L0/qQKGdqJOfXfrb1HvsNy9V2pOF/dQ8Iq
	 jrZY/GgEKFa7GQSSlQmn9WxlDK5s3HySVGygU9d81c53RcEfwUFU/GSyviumk3EtV92OC
	 aj+DMZgfqko9ys1SmvqaDyjqkyRSZzVCzKpJaf1i8K9g5du4bKKWxhVgw6/LgC+JG15Sp
	 yKyhF8XQjvAXenDFnucCWEYB0Dq3TRhu0EK3Eawb1s7LAmeCyw2cpwIUmGKjQoIgnKajP
	 x+NC/R1f8tEoHe4z81Wc6CiY12avRru+nr76vz0drhUNveLl/Abh47ORtsAuuDF8pSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CoNVTt/w";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G3VVpGSk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013CC606E73B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 013CC606E73B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CoNVTt/w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G3VVpGSk
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt9XT3049885
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vY8BWoJH8w/x7seYGIIKWtBAXqP7TPJ+H06hDuNNvmY=; b=CoNVTt/wg0dZFClx
	IKMDZ7tlMz+/NZn73DytzEzpH8rMCz2JqFK+bpL6iVSbKYS64sMCiau/NPeFLMQc
	qaN2SPZosMEXZQQ1v9n13dzA/0NLEdG124wtfe+rFuOoePloJRl0awLDq2OQOs+W
	SO7D9J49wPSnd3jrDGRH1LCsmpURaI4vpnbP1t74IR4R+dsCcHJAw4wd3rfhhZQs
	kR5Tm9g0mkTjSEDP82haOZuYqFwIWpAGnTjYpWJYlLGsc4GudFJFYaJv2hop32FN
	Mm26/TxHtuMTR6+s8OgmAPhPN92oZAkirFyg/Yy4tebL2tM0kdZ/Cq1BGjqSqUsj
	wZZ7cg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9u7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c0f73807eso42904066d6.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013062; x=1793617862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vY8BWoJH8w/x7seYGIIKWtBAXqP7TPJ+H06hDuNNvmY=;
        b=G3VVpGSk6UKh6s0SeG5WW6AzVP8rIm7HDhuuyLkxLALU/FOW0U6+EGSSnoWMd4zpth
         ViyCQh2vbDZMDcruecO/gVE/+iEw7IlwkBNa+nwWqbz5v7CpPsAe1IGC2mIXmlap/EBE
         5ma/HrHYO5HZW8w+KEwccjpzlE1uO7YVQPC+pW6bHrCtSw7lSP1lzVPEH/ipNXWPxg48
         JIMsZUvJuz+bUVEum1WCG+onexOieGyoLpAYkx2lMjrc5vosOhRiyqdOa/0QUaxn4LL0
         DhuySKxOm0jMrGIOyHIgbhUzAXsl5oB8Ss77Vv3qwquuTq4Om0YrKvY9FTfWcDr1UFB0
         sUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013062; x=1793617862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vY8BWoJH8w/x7seYGIIKWtBAXqP7TPJ+H06hDuNNvmY=;
        b=mdbcQ1ipQ715oVbXqiQUYcevDwhDe+bF2ZW7X2i6CzRcwLK41jTxNiadwrQIyd1PMd
         hFMvHgtcVmKYmI+k9Y+r/e/yDhLoUDRWrC8idSuyA966ZJEfpmM60th6psZ94G+8HrZL
         m675538o8pEN3p7X1S6KI8HlP6XFGREFqa+9cpu6QTn846f1D3s9A3lYhMn35U3teKYA
         1vqExoT+g9jAvZrwNq9YOdQU78ROtjTvErs/gv95JHsvs2W3vv97FntyAwZvk/t6q1mL
         TCDrlMH4goukQy5T9QY3Q5e4p2fvJHEgSIBSm5xhwO0rZ8g7s1Tmzkynh5Yu7XzB0Gwx
         q90g==
X-Forwarded-Encrypted: i=1; AKwUvBya6NdJzaZXAEI4uES7exBF7vCYHFOhrnW8/Q3qMGu2+ImEUxzbOxLHdoxnYsOfwbLVbhRnVG9f86fSU9d4YKqRyw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK28GCG9Q2VnfT3MpIX8aez5QIEiNI6mw+lY4i3NorDWR0JkPi0
	Eb1mGnUmJcr1UYrxYw07WhMgcXDpXOc8y1H5ImMFxY37u4wstrFZI9GoYAlQ9XaiIYmg+HesfWP
	VDhQsFMlt5wubqP9xmeqUHrCyrTaisRaL12y3CfcNuSPhhphpWa1B09wGI+/jD3WQc/BSew8m9w
	==
X-Gm-Gg: AYBFou2N1qZeKL/JawAqJMVsjzADuIfPRmNZ/tiPWP5bNSlabF6nEUhyOw8w1fpwx0P
	Wa1KpUVAOKUWwA9bNpmm+8+GC5NOYnM3dxA3k/PwH+nxbFsZGVVAnImt85DCjLS6xUExM3Anvb1
	T7LUN6ZMprsnMSWqEUOzKm6+GoSbG94Xk7TakCmh+OwjrBWWt3Jdyl2revGHeZXXxJtJpcCqZJb
	WBhOQQrgU/11tOcRdCT24156GpFkAN1vEAahzM8xd9vAQa09gkrz+MaIWM2XCPQxTun+WD++gLD
	A0ku4I7044Q0+27+uj//p0RkUEfVrDoOXFP6+K6vTIaw/hF9rtQVCbb2VSJ96HnX5dBPgsqOqDN
	MBCrVY4oGgvW7TVJothrxwt8ewQ55ZQctYz5/lUmCzZU7hvyS3sW599qcdqvD+DzrWXQcYREkJb
	EuKmUQ62qcO9Z1
X-Received: by 2002:a05:620a:1a12:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-940ef9add84mr1002518685a.66.1793013062082;
        Mon, 26 Oct 2026 04:11:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a12:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-940ef9add84mr1002510785a.66.1793013061497;
        Mon, 26 Oct 2026 04:11:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:06 +0200
Subject: [PATCH 17/35] drm/fsl-dcu: set the panel orientation on the
 connector
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
Message-Id: <20261026-drm-panel-funcs-v1-17-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
To: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Alison Wang <alison.wang@nxp.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Igor Reznichenko <igor@reznichenko.net>,
        Michael Walle <mwalle@kernel.org>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>,
        =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Junjie Cao <junjie.cao@linux.dev>, Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Markuss Broks <markuss.broks@gmail.com>,
        Artur Weber <aweber.kernel@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Yedaya Katsman <yedaya.ka@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NybjcCZxaVBV8YlLKaTAyHmm87V6T4TYtZ0TLbzplQY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUOmRe8CEbGjT64KtPnEJZg/5EMluF4tX1Lg
 9OIb9ldBJ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DgAKCRCLPIo+Aiko
 1QpUB/9uR3l3GfVIvTKbA10ZF19l1tvhKCRzqc+3iCVH6xmO7vqg1/9o/l9+GRVdBZJb7Qt+ZoV
 ryAW6z5syuqvIF6XU/Z1zs3gzoaUULDp0z1E5cxM8sHDD2KSmahajUh8mhN5hQpY/NdAmWWRybN
 HhPwxvxRuXM6fIyMbV0HOFGjniWA2/TJ/A48YxNlva6uqAIq1y1+Oj2SbU1jrQCnlvCiX1xkb1B
 xP7jH7YQUa+wkP9/hVqiOMclVILAluZqPYKKB2nJJuKsiQaDPiYAjazAxr+x+vVIC0RJVQaLdl/
 BiAVwbiKmq7eT5KFJTtY7a4PdKMB5tGgv5ni4kck/fYLVSrD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: up3Iqf9htmIfHSWYvPoV-yQFmpgeFETv
X-Proofpoint-GUID: up3Iqf9htmIfHSWYvPoV-yQFmpgeFETv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX0k6GSuNgyhBa
 eQnONdozo4ZL+wxlB9K/qa+8qqaslJ4MpOCkKQef12eY4YmCnV5So67UWW+NYq0at4uDrPd+lmG
 oL/GVLjmk6WtJ3vQr0hn3HT+iKZHGDnB/CiBJbboS/AZ1yEvcn3XthfIaFM6ycEFJcoMK5Wn9gc
 1jvL9eWq907QmJfOuQHisrTi7r55TDIiVQwCUMMowMz8PGhKB1XRl95XcxtAxyDl2T90zuG0teF
 I3BouhEywmN2+ND2/qTMQ66gYBe9S5h4TidqIYuhReBScumdXU5vws+saxUkuwJFX36E3SbDkT/
 AArWfQiWtmH8oZSrqvOL8neyA7NGVCzodmn5IX+/xUj/nZtmX+OX2qsUQkDvsph5MaIFSa7qUNm
 BTNzGmr5qvABVsYjbqkhL8TJwobOW81pe0N9W3nvL0qdKTEvLAN24boG6AtkFEG23rYzHiIMsE+
 vlFUZb5UMiFGDZZCdMg==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf3547 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=vjBfRQYTh69vIXlwGnYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXxHQ2+9UT8lV0
 B4SbBgn0MzYSVuAqB4DZHPycIPjU9eYdAEQsx4i0pxbBqcBE10JwYZ3r6rHyBzev6PHjaiwM4si
 ALuiutNqAFSQuckLuqGnrBwFI4ub2wg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index c64264541fe2..6d42376a57a2 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -96,6 +96,11 @@ static int fsl_dcu_attach_panel(struct fsl_dcu_drm_device *fsl_dev,
 		return ret;
 
 	drm_connector_helper_add(connector, &connector_helper_funcs);
+
+	ret = drm_connector_set_orientation_from_panel(connector, panel);
+	if (ret < 0)
+		goto err_cleanup;
+
 	ret = drm_connector_register(connector);
 	if (ret < 0)
 		goto err_cleanup;

-- 
2.47.3

