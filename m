Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013067;
	b=MSiO3lGkYOEPHsoEe1gBAMu27bEBwWa2wR7qw/d9jJbLMlHaKH0E/BhVn8t7CQi4LPAg
	 CWfDDZoVEPLLKOExfq7CusujfiHgBjIewD5eDvmABTYjnkYY6QSWlt8BG+IoFQtU/UxYQ
	 JcIbrQmsKeGAZA1pvCsTkTvOQC0eGy//STC0SX3l7A6Qh4agHxTsThtcKeif8o0F6z2h4
	 Bt/dQIoUqCzpGjNDo6IxXnBnEflEpBWm2U5lnwzS4MJ2oGY7q2dW7lAYKuDvJxR/R60MN
	 QhOs2qDntdoC/VNVrzEchXW3keB2nhvJ4JxfEAHnwAkGau4Wy/zmmy6sWgTPwTCh7xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z+AIXvczawfI8EmCH7mB903AvReMzPtUT6kwOSKhzOs=;
	b=Agp/966EBNMqRVPUoMy3I57SyuzROWkFf0tzqfiulcYuWtxkbvkpks+ZMQ0XyPhhhuAD
	 3Yi6xlL/woZjgiNAwQJAAQCdrZkbLOBfor/SMzU9VcRTd6/yvIjO8wG71Mjz5TYLjW6a+
	 1tNYETtnnsrreCybueN6Pe92Z0TyhHRyT+pjTBNwx553Ndsmopx+R3rP3OiLV40VI2FKd
	 Fun27jqbeXrzcw2+8LvyE+jwJtSCe6rI8II3qwMRaABqo4zbXaiPNCe0V0cRBdlickxlJ
	 Ge519d74mbrru0AY2pTHboUfH1WPUMJEFNNuWu9vR55wiXUrYqJm0Xk/ndiHRhtrCWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SoOl5FT4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QUnjui7X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEA360A3815
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BEA360A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SoOl5FT4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QUnjui7X
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtJu23563655
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+AIXvczawfI8EmCH7mB903AvReMzPtUT6kwOSKhzOs=; b=SoOl5FT4oUwWlrup
	w602dzJ/8d0kluDERn7rgovsGk3r3RrwLNwQY1CGhhoo1cP0kQrBjgHAValXUwzg
	/nXzV3W953+C71g7MRN0LcfE4CEo9jT1GuCfnk06b89a/woNyI++7gScIFEAXtXe
	iBU40U15wQItKd263vXug6XGe1F/e01tDeKIxRGvjOqR35y9cpdgYQXUUb8fqkuu
	xg0spNtF1KCFop80bJfrQH13wlV56QhqN8bw39wHLMVAyJMVJ5Jb1zvjAjpmDZL3
	A+U9NqRS2GAIdMQak8y8608vMdKzlSj/UtHQP2JtpbLO9fpjLmkf+VaC3vtMr2xG
	JLbPEA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s9091v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f62934ef6so365739785a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013065; x=1793617865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+AIXvczawfI8EmCH7mB903AvReMzPtUT6kwOSKhzOs=;
        b=QUnjui7X6DOl8UXWlO2p5/cCCOe6yhc7wKRF6xsZ6BehAn7hhpPi22obMG1zCZl7lF
         SIT3MofOVOePFBouO7vlF5g5EOngFA0vzGFKadMxfmGAop/bljabTMo/fYbfx8ZLhQVQ
         qPcQ28KgZHM6VYV5LDW/R4i/OfP060tC9ov7Joig3Dgg7VjdSu2OZpm4pYMkSCQefpPt
         Hoknn2mdN7Vicd00zGSgg6/Y5UplYic9ExFyzeJ35H1GC6vWxQtc3v+q2sI8+Xk4TpHh
         tku8s7E/HE/RfTwXK681E0GU1Np0Yms+3CVeiX5HJdX5VPS5DRLTawpNCSq2N0kzfzCl
         W7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013065; x=1793617865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+AIXvczawfI8EmCH7mB903AvReMzPtUT6kwOSKhzOs=;
        b=HvNuW76nsn7AXhdcdHtF8tqrqwUbm5KdcTEkRd87iQH5CJGhDrRvzNGyhe/a5efR6+
         u0Kse28BUn5hbkLX5EHOhI2PknkR8z3QDaBh+6fVJZsah6lvgvcYjTY3ms1dYjVsASwh
         Qj+g/rnDTj5Yua1XCTVMFNjrR9onse0DnuCNj61QZFKn3bRhe8HiBZZXkP0kWFbwq0ke
         fj+HOWG0S4MfOtnxDfSdftsnxMQznE2Z8Nw+Nh3Fg0ZHXF1va3agkIEK1Gb8977VTOgC
         o6rZ8GmZoSWDZ6CH/Y8/gkmSLzGhXNC11QA+ZyRsTMdZrul/QCe2nfympAdlY+znm8Pj
         syFA==
X-Forwarded-Encrypted: i=1; AKwUvByWw6Y2Lbr0G3oCgGCU8ltFjvDtgIZszGiPGvQO4EAlWC6EuRNdey49f8WY5A0uT43TtL6MyimevTZZWokbuKV9tA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIuTDhIz7zAt1UmXU9TZ7WqA5y/8dXwKdIFxeM9iBqoHyIgMoy8
	RgEocVCqIJdnUJ8zgrv8KEA6r1csKh3Obs0UE/7WtKemrUpyrbIOR1M8T5OWlXhGFPQzCw5fi57
	1e7qsLU5DExbayBUaQaDVUojaUT0V7NoX7NSJhJeV85LVapMnShm7LWC1h7UvScAVih4OPrgAqA
	==
X-Gm-Gg: AYBFou2Zq2nFRa9T+1O2g2mrHa/mV9hEp4aZqi7wmI/z6dVH7eYir1I07W3D1zklNxj
	sHT4egHp4aNMYLnkUg649eCVTnRW1gWSNTjZWEzqnnFtfUmKqNixrruWZJTq/gdX6MY0+OnlKQn
	u0a14HATpqOZk6M6QBX/G7okm+N5LvORhgOicGGR8bPvgW37U0+e2pag27sPi+I6wmEBx0cRAxF
	laODysN10r7GhghndyKQ/DllAWa8ZwFVvLIhqZi3cWXjQT/KZ0xhC9pafApCmTuDP/b1VQ6phRH
	1vSPh9rWiweSytF7obLzbwqLEuJHO2rZiyZKxM8SQMWdBjqaNNPstIrK6nVcMXpMQeB1W3mnZqe
	GuF3f47wTNYB+kiDNq8QJKeLQpN5eGEqSeM1iYjvMPclP1Pwt6IC32HW5vCXe5XenSD8iKKVsBK
	hH2nIgYQjd6DSn
X-Received: by 2002:a05:620a:4016:b0:93c:8e3f:3036 with SMTP id af79cd13be357-940ef795b3fmr912285485a.4.1793013064576;
        Mon, 26 Oct 2026 04:11:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4016:b0:93c:8e3f:3036 with SMTP id af79cd13be357-940ef795b3fmr912276285a.4.1793013064036;
        Mon, 26 Oct 2026 04:11:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:07 +0200
Subject: [PATCH 18/35] drm/logicvc: set the panel orientation on the
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
Message-Id: <20261026-drm-panel-funcs-v1-18-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qdajy+ZxizCGYRHwcySOH98TyzKssLnXiyy5l4MYQ6w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUOSPb5SkROiJ1qgWHeJ/0zI3xpF33LRg7Kl
 3E+JMtrfDKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DgAKCRCLPIo+Aiko
 1fCrB/sG4pFH+B9sQNL86lviJf0md4fWW8kPrNEAXeSTrNauPGWoN+5qU86gqZnym81fcvJGHWt
 eidB4GCk2J5yvG2doNP8Mgu5fQwLl91HF7cy1j/D0y3dqSMl3DZ4Bx6bni/p1jmv25RYm5RDwWV
 9pUznhEgK6pJdKm5YVNoOIlduKYbWWVGMEvzwSvXdNTYFH8RiG70sb4ThrUeLCmKUSF38QGdbdg
 SqZrAkA4nt1QYH9Y9EVqohUn/NIGzsKGvBK8yURwP9QQvtHIFXvTtWwnoT+jm71gG/gkc8aAvk3
 5dwraj1xDfN8EgWs5GT3ujM5ENWatL+090SyEKJp6JNnP1PC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX/saJd8wDED69
 L3L2szf758tuysK9Ba7Xh73RhzD4qqqGHmZ2QYik9VDoxco0wC8lL0mLp+aopBnzyngKwG/AKrq
 rTmWeEA72lvPQK1twnYKhpA3wfxKaEKizlrNdOMsnqIEe2YQkLFwlCrAIZaD5HDue3Xg7NhWE6c
 8jNsMAkkw5N6t5H+wf1ISJGhsinNp7ZV7mEy0OVyHMlUTvU1gDeuzaHpSD7ZZbVaF/KztCFYH2F
 S0bY+nEHxkPSrOy1DiSqY83iXRHb6IwoNYjqoGYbBG/w3QwZWZxDgr+JMlPr09/iaNWA1OdyJxr
 G7mFb2Dm0Y8IApBXBjkw//ZGa/v7IGuehtS4kJIvGJ7MPgX48Nb7l/i/194Ck/j45ZKnsouuLMP
 GaFtv3B+ZVERt8FTrRPLjuC74VGLJ6pSj6iUbiR7yDTsdSPJ0fH2oz1vS4vhWv3Hmh7ijGzxwGN
 ioiUWvgT5FzqcPbmuxw==
X-Proofpoint-ORIG-GUID: Uc-8y187vU3tWlZhcKKq0xKoAAD1m-yW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX+KuoSqBfO+69
 W92XbHoskq81aLETYAc3+Y4SlhcA8Ngy8ItOQlvnp18HMyTyjINwmOhwihNA8jA24hTlBRgyrtS
 Jwvath+sO68UfCoYvEEZvUyX1GjcLck=
X-Proofpoint-GUID: Uc-8y187vU3tWlZhcKKq0xKoAAD1m-yW
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf3549 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=1mv1z9nBhO4L486rGt0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/logicvc/logicvc_interface.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.c b/drivers/gpu/drm/logicvc/logicvc_interface.c
index 81f760dc07f8..bcbb837c9675 100644
--- a/drivers/gpu/drm/logicvc/logicvc_interface.c
+++ b/drivers/gpu/drm/logicvc/logicvc_interface.c
@@ -194,6 +194,13 @@ int logicvc_interface_init(struct logicvc_drm *logicvc)
 		drm_connector_helper_add(&interface->drm_connector,
 					 &logicvc_connector_helper_funcs);
 
+		ret = drm_connector_set_orientation_from_panel(&interface->drm_connector,
+							       interface->drm_panel);
+		if (ret) {
+			drm_err(drm_dev, "Failed to set panel orientation\n");
+			goto error_encoder;
+		}
+
 		ret = drm_connector_attach_encoder(&interface->drm_connector,
 						   &interface->drm_encoder);
 		if (ret) {

-- 
2.47.3

