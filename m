Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013051;
	b=HZXWG2ruxYrteVCHreq7mOgL42Yp1omElbejdzurjJrqjOvFgQxkZ4OamELAPAHrpozL
	 VnLlyznDg3ZxmvKnvub0VJTFer1gSzvszRI/VPXo4+Fxxl6URCqC9ggLGrUi/5XSd0TR7
	 2g39gXuhU+xFJ6HpoxEjCsNEiDjt1Wr87jTgvm7VVAqc0YBBrx4jzrTYkffoHErwT+Kke
	 tfs09iYwHL1x3g8rSAdLhDRvneyul2xUiUPSQkLXHNMGRXBug5qYSTT3rXEmzrktumVlr
	 WvXy2uHmFdbXAHFZ15Zev84JHpg0LnN7vycPzGs65UTdEKeMTZP0doeHgGNj6gWX9fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013051;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MgkZ3msvDETuLbxSPazzmfYLPQWjddqXDEgg3s8gAlw=;
	b=5K78P5cGi+3Wag+tG54qGzUDsWTAdHcZEhpcxStyW1MzRBYY4R0m1QsdYWv1HIDqa/Ez
	 1UkwAsC3GeNSZ0WZrz+UTIqYdq98IWn91IPk7u61v9LKD6V+Q+NftmPiEp9b8byUZcIXt
	 WZK/OWjs7MQi2NqruhMN+WnrBw0DATzoKKWUMWd9lpM3nxHdNq343mkhG/xWsr0wabRZX
	 ToCvFrfkJPd8OVFN0BhObCq48m0Cday7scKxNQYynVTbWADEpsiXRo8HzC1X4Rf69LGvF
	 NPJuqb+baX08gYuFVV6Iip58slE6oUDjsc4hFU1R9iR/w5xB3oAFFkcmlgcXl66nyYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KG6mF87B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QeVoo3WQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEAF60A5BDC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAEAF60A5BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KG6mF87B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QeVoo3WQ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt58P3562900
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MgkZ3msvDETuLbxSPazzmfYLPQWjddqXDEgg3s8gAlw=; b=KG6mF87BwDyegVR2
	WOC0yihmsTsqx8SvUZV2iGWPkp9Pb2Hvhl4NaUQ/MT7bNLzIzXIuD954aVOxfFLf
	OMTNKXXxDOWvA24nkedlrdQDM4kJKjKiOySK62sBx7WsS+iPISA0JRQJtV8Okfdb
	GnEY7lBuwVNouo1ngFthfG8CCuK7nBhUGabPBAzHp45LLtUUlhFDak0nLrhsVQD0
	QyMLX0XFCTvUhuq2/MbNjhn7TMG+fXU8+PEwgZNtSKtunZOGK80Wfe1QVjEg58pK
	TRwHwkfdEYa4/DCLVAhWEcFNUiIPqaoyvucpCQBn/PylXE25/U1hQES9i3uAjJQP
	ZVsZxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s90903-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so366153185a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013049; x=1793617849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MgkZ3msvDETuLbxSPazzmfYLPQWjddqXDEgg3s8gAlw=;
        b=QeVoo3WQWXd+JYCDA1arUbX8dV/tGtk0tm1kTDXkjrodV0oQSMzQKzwEAENetH0bCl
         VYZ3GDTr0ZHGq6vz2UVdOfACKa2sroh5FThCOUE7og3dX5SlhZWauElFBsMFyIy+ydEm
         CE8XjEFU1IKd3POctFmzWs8gv4WaeOx7dVoLbM1i6itkMx8kEqz0Mq2hsyW2PeoofH5v
         6i3+F12UyCVq/OJTsg1BTQqviQll1BlEHEoRrD7KJF6ah+BfntlRcnH4LADoTktB6Uhn
         Lx/q4+VfxPoqndJjSBrQjyOrshNN8WXZDvtJn+b+b6ns870A5gN9zCWOvcWCbGBVos+Q
         MAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013049; x=1793617849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgkZ3msvDETuLbxSPazzmfYLPQWjddqXDEgg3s8gAlw=;
        b=Nfjhe1EWEQC8NtJnc9K5mvrWFTqh1qK2OFCLjrrsMR1DK4HDHXN1P1GpKBpTJpEwWH
         Zl51MgYY/tdRjWElkyysw/W7aKTS+pUrFLsOyOwExXBOaTc2Oo9ihEZ+ruz+ChsAOm0u
         8dHPSWCxmpdIGdRvcbsYvi6JELNZLyc5qWsE33jdFmge0ccy3Er8EGIhShYupVxZKR6g
         DGbQO77ywfpTfb+uSK75/ECEg/4X9FTMBLBKJ0BlHdY6BTN8kToIhNTF4t1zTln2aLF4
         CuWeigkehM/8MZKpnMxmOoOdeDT0pUUpCg3XR91F9WXgc9YwqadiA81i4zi4BdVmub4/
         vWyg==
X-Forwarded-Encrypted: i=1; AKwUvBy1zX/+/r8KFrdAfIp9lOO17O7KwiGOvbdEmyIV9Wevp37LlELoQFGonpk6uqs748CCKkCRa/0TPfuz5KDmOpqL+A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKQlgB/HX2bXBVCjXyqsg0JDm9XYZ2oqTU267iCUCxKKp3mIpwl
	ic0h3pRSBaKEWS8q4TbuWGQ6Ht846xpjQV8hXOEUZPFL5pd9bNSuRBw9Svd74jK5uvAyRSyxWcG
	j/8H2qZNYCEQgZ/N25xMaF6I23ebRKIoaClUcDOSqqiOnZ6JpvU/pccbpFp7M7YHudftwfRCN5Q
	==
X-Gm-Gg: AYBFou2DZiLxymL2/HrUlHHpPhDzyX7k2eR4nlu3rvdQuoX2wVaTN9moFcvAm9XGZdI
	QB5t54qdtVCgeTYKj01rSMD5G5557Ymxb4s9mI3RHe5JepGQWnFyE4RQUneyAqr6HknqmFytGZ+
	xXb6n0946ABDBZXoRnVpcLGYAci4psNETXZ4byPEJVdCRRIV90QehIUgLoMC8YIbzacKBYsvDSE
	xYN8tk5Q4weGWhZMUecAvrs9JQ2E3J46HXBT1B2pNrnZ1xc3sXYgHb6j0rX1JfxdYosoWG9ZQOv
	CNewBx/ylt6cc69UFahs0Y1c7KIq2nX1H0F6aXX925zO7WHk4javq24RrWEYtr3fhJZie5zTofA
	uJEvYzo6sIpeZ5d5yKl21V/HPnE2MqRqMYNittFVZBaINsOONKF0W+gQCrnzd6p8OpPet2ZpOu0
	QQdEqb9KEQuEe6
X-Received: by 2002:a05:620a:7104:b0:93a:824:ac8d with SMTP id af79cd13be357-940ef914286mr798396385a.27.1793013048280;
        Mon, 26 Oct 2026 04:10:48 -0700 (PDT)
X-Received: by 2002:a05:620a:7104:b0:93a:824:ac8d with SMTP id af79cd13be357-940ef914286mr798382885a.27.1793013047531;
        Mon, 26 Oct 2026 04:10:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:01 +0200
Subject: [PATCH 12/35] drm/rockchip: rgb: use drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-12-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4oVr60RnAJ61z5K570gUDjVdVdyuiFoMRTG0La4ODaY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zULrSMqA/Vm72dISmZNYEmYT6M9UrSaAuj1N
 xyRpwiPNmSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CwAKCRCLPIo+Aiko
 1cuAB/413OSCmLLBtnCNxmjruuBAUTBtqGUXr10iDIhH/YKrPj+DNJCrC2d3as1Yy9C7NO+eSWK
 5dbptZX7u2Cv0Kgt5u9zSOWCxRUnCGON8JjEMUqCRQkZTRrtSyHZBbfrJWAiJhm/kcqEzv30cQ2
 xYCUvmH44dxVLVkMi7kRresJeaiUfN+NxtmmBthFZszfOuliShQRIxMVEjEEwRuYKcmfBWFfCLe
 ga+LGNl/4iffXLq1yi2Vrt0YUknyWwkxFeem9H32ix7nUmkWpfyGA/OIQryvGWfKrN4bvrBxdTp
 7hnRUYTpEhTZg/67wCtAvrKSEYzmtin/ikAxcW2GvYAAP6u+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX88eKTrR9UDHt
 Na5XsySjkFq7bbWfgkSNfNB8K1T20o+APN7Jm59O/sWPZNEc4zUIBtOMicFLYanMf0nx8Uq3im2
 yXJIydhHYYN3OAMFoAr47nG/E5rPIBeMIaqKsYBtc7ziRBRfIujXR2N+REaEweGLVgNfSKSwau4
 gixc24GfSPBBvk/E9e8SMDfNdY2GUFO//+4nsLvJR3b5vvP3emok+cggpsR4J0qqau9ozA4Lwq+
 gkpPmL7Paf/u9OqGF/N92eTh4ZkTYoLQf6WS4S4IX4prD9b6ZijyejpKTno3vXwoT2xlUzmmAGx
 9CiKJKvOhkbmcfe77XqPBArefZyFWjPwXxBo9zDFcsvKDVac7tNMOStK8H3Dt0AgjNVvs06BJCN
 1c3O9QAS9oO+0UvUG9pymubEG5dr0d2VbR8Q8FZu4y/54+lFplWROiBCo8+ca/0so9PW5BCWcw1
 p3kn1n9J6PHlhZichVg==
X-Proofpoint-ORIG-GUID: MciScE8tD9G5T7Ku0wHJPwEr1tZ2-NYS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX67gZGV3aWUlz
 5xxd0RkJNFV3Yag0noLiW9aJ9zmRV4dFpxZeL+eyXzpkLvkfmnzfFhvUIh9RlSgwuzu5fFWi5xJ
 RjNee4KwRVwp9TJsBJDEFSyDf4daxJ8=
X-Proofpoint-GUID: MciScE8tD9G5T7Ku0wHJPwEr1tZ2-NYS
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf3539 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=-QyiolZmvoSe3Jx-ok8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type passed to drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rockchip_rgb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 0e1830bc40ee..feeda68c20b8 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -143,8 +143,7 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 	drm_encoder_helper_add(encoder, &rockchip_rgb_encoder_helper_funcs);
 
 	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_LVDS);
+		bridge = drm_panel_bridge_add(panel);
 		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return ERR_CAST(bridge);

-- 
2.47.3

