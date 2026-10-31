Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463587;
	b=e0JmeS8Xi3zEVB3phR2eD25k6xD/6RLZDljoIUXSbwHhXnzAD2yhq09sDaAYXcvQJwjJ
	 nPiCHXauCYJ2+MsiLyUy2fx51AissLZmzidc29c7jBrz5gmdorU7nqCfl950Nmr4fpLHM
	 B1x42bnts+QJvuuT3FVAbb+agT+JUik2W70w2v1FtJuCiUcxJ6pZng2p9pbAabcRB69OD
	 9tfC7kJASx/u9N+sHxeewC2dV1b8DEH92lBhm1kmUzAsJdvF5ZoOQCqnlb9paIr4KfTYF
	 9Q7wH3wHC5u1dausotsAJShQsHB6bzcBqt83sQ5yItP/MigD9bh1CmQoCD7nYN4rqwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463587;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zvoaKP+xUkSGJRscR5IFcdreCABepZREPTFbnRV1kJ0=;
	b=gscoP2HLwEjlopfoNyXqc6k1tQjzT3JEK0HhJzw1lMtXY3UMF5KLfKhc/0Ekif0a+nrO
	 xNghXKFiKWf2Id6IP5YWJzaYu68NLNAfEkW3gYETTtN58AjtQ3+R5cQCSq8MU2YtLzsJJ
	 4+9KMREfPKGxAMFVU9Wc+VTiTNOcgjT6vie60Si89PBLiDoD1V5v6TGU3dDo1390fqox+
	 UPNxKBf5dGoMlND1xn/3TD6S3/+Lz4WeuMm60ZcAvC5itC2yuoAS8I+fc8EqFki2fbB8/
	 D1NXTOy745F5TwWfhJ80c2jtV8Bds4FAsk23v1Qvy35Z8gzfoXPOwQAXABhcetqYQKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mym7SJzv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MNT7zDKW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255DA606A321
	for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Oct 2026 16:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 255DA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mym7SJzv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MNT7zDKW
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VCxwpK2765516
	for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Oct 2026 16:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zvoaKP+xUkSGJRscR5IFcdre
	CABepZREPTFbnRV1kJ0=; b=Mym7SJzvPJhBrW8cTjXDr3bK0JGoqkt9BOS67c9H
	AZsqbfCMihN1+Nnb64lqybfcq1t6P3fuqhRNPe4cbhfvNEsAwr+aXeQz7KIiVmOZ
	y6hpGPvDX/0Tm6yC8PcRy37IPLDwoGiLsX/G4SlKxq7/kkk6Ac6MSmXubqc3gwLE
	rVFQ3IeE1FRc3g6As8OjO0KUeklXIsmdvXMj8p12gJosHwJMgVb9r9YHH429jBqQ
	kQrIUFT+6LBDdr/FdpxCEWjLCfqiYFCBXo0lhlwQ6OnNsViWUejIKg1eac7xszF6
	8OcJsSUAO+yAIIg01Iw/gZopm0LimI9h4jcFJYlYQpYKpA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6hn14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Oct 2026 16:19:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so469940885a.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Oct 2026 09:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793463584; x=1794068384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zvoaKP+xUkSGJRscR5IFcdreCABepZREPTFbnRV1kJ0=;
        b=MNT7zDKWVIBMg3LVpF7ZxXSIQsOSnJXNcMS+WBv25npD6WIyY4VXpWoYIECmhj6bg4
         TzTSVZGDFhky26H4mtQU7SBkDmzh4B72cCIaEd8AQMvXCNxYcoT13+WP0gxxvtsa+zya
         U5jJNNP4aFVfOKRzzhyKNnvX0vX0QfOBdhBI1N24OBGXf4gBc50K1DbaDdt0aZOt5n5K
         Vn2kwCo9MWRYOYHhWYF151j/yNpM75A1liIAMMXdnwO/DQZDmfpu90w4GLSx3hXPOxq5
         DwKOXjSzvRvkYSCY5Fh4qdj3kaeyD0H2sVaJc4cAst2Y17flSN9h/YHvSdYumKnDYHxB
         xrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463584; x=1794068384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvoaKP+xUkSGJRscR5IFcdreCABepZREPTFbnRV1kJ0=;
        b=f/NyRrnKZS0V095VvgHq5Y6+wH3q34zw7/QRWXImO3hmjxaA55sAL47DxqKbzT8iGE
         PEDAoT6zNsE4G+9Tsc3rgxTjqd62tCjlmVGJMRJSlWWNf62UlokG7Ezs0+P4zyOBLW3t
         fkwwgH/I7J75KpbyEp66kLP6pAEC9JdGKbDTeWHQpSyY5wC01b6VtI1dg1pHyEuCjdMv
         EOEn+GXXlrTEhqoGjoklxZargZKIe0CYn2I3CAp9TKA1nzk2ctP111AlLf05BMt2DARb
         uJ/GfO7o4QlM0Vc6AV49JwhuHmhXIiOKAn5EK5ayqIWSMo1Xv26l1cyaFOB3IWCc6VGb
         pljA==
X-Forwarded-Encrypted: i=1; AKwUvBww5VidyQsl5VMS0Buh2ZW+RifZKN3m+/Ug2okq2yHwmybWJZDK3YVVmSb1mGg0AzQMJX78pR1zC8Rrq9SKqlWH5Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKR7lcU19rTiccyeI1iYUZn1rtL5Fo0UIEFb0Gyg/QpEcz8tRFp
	KBNd18Cm45rFeQWsdydJBzQo88TSFYs/JzhQP2p76TmCR6hmhG6XXBQqRtXUifVGRq1qorSaCNZ
	WBmzH58lomGJf1+T9Bf6N+7qWRzXDdwS4jzQEdiEFBl1VdjAX1vRDkWs2f0vVefgClhs/bUkNGg
	==
X-Gm-Gg: AYBFou3gr7jqa8Bppgld0Efbk+a9W1PuugCsE010xEwzkAMEPLHVvAN/QuqTDj1HDoA
	Q7BbOjRJOeG0Gkcdzf7SOjQ3zdyE15qSW0G6PMN/BlP05qFChuoBKrM/17bz3DoS47/ibL9wg5r
	+SRZJa3aB34dTsY0LGTVUA8F8Whg7iZH9dY0ZPsS7XSBiVd5WxTwiW1qYwBbtQP8VZMi+aL8aUS
	QywmAjwOyc1YxFbvatwWlTfOxm2PCD6EU2Yvbe8ucGfBykG9/B1+Lw8I33ubZJwJjxCgRJE50tl
	BCulDolQsSmIeBaT6d91gL8VD1Yvaw5JgK0a51pTfIn2obVLJ8w1UizfQ9AsowDfy00yGDtB/kO
	jTQhg2QCUnJb9+eohuHIz9t5StH7/ZDgzahypNxBeWzVk+tIFGedpitapgj32frBPeyq2xfodzD
	fIBiac0d12TPG7l0xT9ZWdXDYKo/p/MV9f05SCXXndNfGQd+ktdE8lCDyJ/Wk2Uw==
X-Received: by 2002:a05:620a:1793:b0:93e:5e2c:8c12 with SMTP id af79cd13be357-944216f3483mr979233085a.60.1793463584169;
        Sat, 31 Oct 2026 09:19:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:93e:5e2c:8c12 with SMTP id af79cd13be357-944216f3483mr979220585a.60.1793463583497;
        Sat, 31 Oct 2026 09:19:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbee0094sm12126731fa.20.2026.10.31.09.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:19:42 -0700 (PDT)
Date: Sat, 31 Oct 2026 18:19:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Douglas Anderson <dianders@chromium.org>,
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
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
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
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
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
        Yedaya Katsman <yedaya.ka@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 15/35] drm/bridge: anx6345: set the panel orientation on
 the connector
Message-ID: <45e2lt2ngv3ozvpapexui5gicabcvhsxfhrwwq3pdakmdiyxnf@mag7bgkjplav>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <20261026-drm-panel-funcs-v1-15-5e3070a3478f@oss.qualcomm.com>
 <179344372467.9825.11469688608855257522.b4-review@b4>
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
In-Reply-To: <179344372467.9825.11469688608855257522.b4-review@b4>
X-Proofpoint-ORIG-GUID: LBJdHTL7x01H3WFjPC8CLAuypFZbFdrI
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae61520 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=1b4m9KtQkR1i_e9s8qgA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: LBJdHTL7x01H3WFjPC8CLAuypFZbFdrI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX7PZcxUoy5RyQ
 2wmAAzuEirHcyd0VhAYX4NOOvHF10YRKp7F1HbS+tfyMLgaBLoeEmNGKpdoLpvsRyYrj4QvDEaO
 FmvwP+Qm3/3Pp8d2om9dXcv7zr2qL18=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX26zZtJjUIhv1
 h7E4C60gSXG0gbwGil9tNi5lXUgw+VZ2HGXEJVvYL2A6t5X73j3XrxrIQksprrf/o76CJXepsai
 njqXe55DWdaB2snRUpT1ztsXrrSYU7zv32yfNUCLFAgx5zcesJejWHanpfUVVaZ27gys/fn7OY1
 W/oXs64vww6U5BoX6LFjYQgwidRr1/w0WWekQbVSbBtEk9eR9SS+GoorNycd1cPN1o/h/iN1zz5
 DSB9ahB7FsJCtLpI8+LwRYc2ah8t/Ikrs2nL2FO0Aj92Lk32hG1zsUYTGGBv5Dw3IhVwQGK6+IF
 G9/M1G3F+Wv8ObYyVtfIzCTkbwEDc+IrIDqbEMTdrjU3YBBGT5YUMjzmX3os8RZJRUjBE5h9FsQ
 BUV7tHuGrMoaEvsw1bw5N41fsGpT/Y9LrBSU4HVSi9TgB2NjHj0MXklgl/XWcBlpjVcrgLRqvc/
 bf8bcCmWuCs/nrKzqJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310064

On Sat, Oct 31, 2026 at 11:48:44AM +0100, Luca Ceresoli wrote:
> > The panel is used directly, without the panel bridge, so nothing sets
> > its orientation on the connector apart from the workaround in the
> > get_modes() of some panel drivers, which runs too late.
> >
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > index 407834a03b63..91ce1a877bf8 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > @@ -525,6 +525,11 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
> >
> >  	anx6345->connector.polled = DRM_CONNECTOR_POLL_HPD;
> >
> > +	err = drm_connector_set_orientation_from_panel(&anx6345->connector,
> > +						       anx6345->panel);
> > +	if (err)
> > +		goto connector_cleanup;
> 
> Muy understanding is that this driver, and those in patches 15-21, should
> be eventually converted to use the bridge API instead of the panel API, but
> that's a significant work and so for now this small change is enough to get
> to patch 22 (workaround removal).
> 
> Correct?

Yes. Refactoring the drivers to use bridge API is different, bigger
project, which can be undertaken later (or in parallel).

-- 
With best wishes
Dmitry
