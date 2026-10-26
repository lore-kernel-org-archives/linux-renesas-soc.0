Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013095;
	b=fzJiqTSfRFl5YqhMjGgdNBBz8zRrUmah6YQrKUkOL+whNObg5DEFKJZqlTF6r1dHeDjQ
	 P9O2NL6ONev9kGR1b7Jozwo6cqhhms2Cy2jYgvwRkLrqqkcu7AFQpLHtFo+QETVAow+QN
	 6KdlKgWILybX+dfqc+z40QY3j5ow9oAkr3nH6ZaXXwoCLmNuXQhpDbxHbcmlZIZXyoQAW
	 A53y6tP9dGHUeNjdIUw5tJNYMUwdSvVDL6rjKLpAdOt3NYBg59LKZLvzhZA+yiPm8hvrv
	 gYbFX8WcCGQAVMH+cVH7o8/iodPUOoBuEYozANp5WcLXbWuQ40Bku8CFbfbfqMnQ25w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013095;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z5YZFYelaCp0S0t2iFd1/TBQhefjKNohLtgK9G9gaag=;
	b=QBo2/FZgbPMd92zINUeEhGu07S52Zkzr91Io7zs9Rqzx0Koe3UGMs/iXY4Ix2B6fl8yh
	 M11mUtvm4Fl6AcB6mOAewVyeUMadq2mHQnwFwdO2caQGqEddRGrJ3jw4PuwTnUkk4Xe+J
	 OubZj4pHq/MPsm0agrXykYbk3bOsGRYZAyaEK6RnFaGOxH3CZaIs9vXi/zAF1/D49RDk0
	 ewQg6YVjw9ZotMv+GPAsKi35PbygitrgofGh8bhVEagtT22N+yZXZK3R3e84XaeRM04m+
	 lpnmeVDjVs3uR2ZyFxbIUhd5Hk7hlkKJEAdHjH0hX3L0yVsCyvjzYC7qtk9lDFqHObA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MAwCLMxO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X9vqtu15;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFAD6072BD1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCFAD6072BD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MAwCLMxO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X9vqtu15
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt0GB3033852
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5YZFYelaCp0S0t2iFd1/TBQhefjKNohLtgK9G9gaag=; b=MAwCLMxOo+pF+xVw
	ujcXLzcdpL1N/34yRX8go9512wsTLh5exv3+HDiMhSWiGRLg7FS+ohFrsdVdiYHk
	9VQc8WSRgmLrUistp94jlhakjPKS1zVcLbFlj1xGqB2999yrFY7M3v3iLrZstDRw
	iPCEo6/JaIYF+v4dbhwRp+O7fLa/cC0W991VPBNn5RkufTxzvZxtxlEh4sHMKb5L
	MF1wh9pI2VdtTiL1uZcQwp4bigUW5Da2YqIHVD9gB5NbWWC5otd7RyatDKUT/IY1
	Z9uiBawrsqcXyJ0NqNFs/efwPyyotF3keQ2gkrC3PQh2oTh1f0o6lYF6DOGbXw3d
	+xoIUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y04ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e49a1d3b1so364980385a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013093; x=1793617893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5YZFYelaCp0S0t2iFd1/TBQhefjKNohLtgK9G9gaag=;
        b=X9vqtu15rUU1dSDpK8+AOrmhEr0GP2hrx5eQHX+KPvHITKevRirqWGFd8geiqra/eO
         aOaAZMdVMqXuanzSZ9dExTZc3dV1HCaRk8q7ech1ZXiE9Qtct4stAz6/hQsgyJaH1/7f
         EutXQmE3xe7B+dOyhvrK2uy8Ad4rM3UmvS8zGUpOq4w/8PdoplZu+4kw2hkJQ0MXmaGQ
         Fd5vyRTC0ub2TubCWJpiqTTRy6sXSM9kwySxMI3aVfoR7PJ5LhBJYbhMJ26FZpDHz22v
         rEen12FJzkdWVLgfBtkH8w04R4Mqu1yL5tjHFaVp4uiqpzhE0XzrabSWkH18DehnS0np
         ASYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013093; x=1793617893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5YZFYelaCp0S0t2iFd1/TBQhefjKNohLtgK9G9gaag=;
        b=oOVfKZXgMqqSiecz8sNLHVaCN0ZnPTRuJKZoKy4a46mkQgQ44hdLvIo74Fg60SM8mb
         hqlRVHsRa6D67gw7pfDv94CTmpgsM2bBo6kcGTWRdHcUuZBTQiFuubIusRCkxLMQ3fmG
         9/cI2RDS5mTVZFalXlrfy0DLdjzMW36xQHRK+/GhXtZDDbA8bn/oyKjCaDfm05KLzWXn
         n8f0I9AYXdgoQqcKsorSar2/G9i/7BCc5yVJgoM49OuydEMNEFWmpDGvz/qTVrmkkJDK
         9fPRKQOAjefwpmQFoVom67ZQaSFhR83UztlKgK6Gd6Vjnxu7u9e0Nb127djmESkIcEPO
         8OCw==
X-Forwarded-Encrypted: i=1; AKwUvBwS/7LIeexLmm34PQFN9dKQ8XA+c46Ogc2Bkq0obxLkpEDoFak3OF7w03csPr5LwzRIlulOymCKZ9ZsVUPwoXu5rA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIVRnDYZKQVzLKIxDlA9wXZN/pvnTDAcxFRJvYN+aixXq2i8mkb
	EIw96BenLeadZ+7AaY5cB5B4Y7IEyLDMy5FC8FMGNRi+GVqCSBj774yXuANtJ/Jzjlo6hYni6ck
	5Uwz3X6oYMKYpyySpLdmF/O44h8ltMDeYg3KRc95EfXmYhf/pPQpN4soc67MGunyj8HHV92WWvg
	==
X-Gm-Gg: AYBFou39idl91oNfD9CZbabdL7vxU3wshivdFhciRGzqDbDr+qKuSrGvVBJKUqGeMgQ
	/YSTHJHfAShrrybT1KfBDcgvtMQsIWaXN+l/6HRdWhW6m7G4wglkN5JPJTKbtEb5No93AMjZIne
	K0wo9x5on7CEakvDJc2OfAiUvYnQn2KJnaRiFPG6GORDPhqZkY0A1W9hR/eSARR4Ake5IHTqKZY
	cVjoVbaYB8E299c9TzMUZcDsMnpxmeHIVC8TrjtZ7NSyntuUP1FwfgxflIVh2rs4Am/6vD5CDhc
	rZV0zkvxnasODatjb/JLM2Pseg02plgIkXxCTO+STCh0qmojiI2GzxDCBh7j+jVe0cqev2S60iN
	uJj7cpSvL9902gw9mDTjJ2hr7s4SE1C3EDpbnf+fhQZwPTNV8jzFtYGvhoOR58FWhKfTPe7N6iW
	jpPxGJMhusC4fr
X-Received: by 2002:a05:620a:628f:b0:93f:34c9:9248 with SMTP id af79cd13be357-940ef8adbfamr970681185a.22.1793013093054;
        Mon, 26 Oct 2026 04:11:33 -0700 (PDT)
X-Received: by 2002:a05:620a:628f:b0:93f:34c9:9248 with SMTP id af79cd13be357-940ef8adbfamr970667785a.22.1793013092405;
        Mon, 26 Oct 2026 04:11:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:16 +0200
Subject: [PATCH 27/35] drm/bridge-connector: let the bridges set up the
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
Message-Id: <20261026-drm-panel-funcs-v1-27-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AQGdPHb5gyBnobGv+f6DreCCZFLrKneWqxoZPFxxWcs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUTUbk1R23nCOd8O6zZ/MtcgNxowkU4eN1Mc
 5Cnj43j4lKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81EwAKCRCLPIo+Aiko
 1W85B/46cJ4Sdk7p4J0zoiGZrHCbRYA2cPPlDcsPtE5Z04M4uiP546ooWW0HhZMFzzagUL2YSHD
 RJaZdzs7jv87tvD8PlGPUFUZXtHIIJB+DtBUeGwP8PmcUaM2Txi2MWRYPuDE6GViHH7HbBV9byE
 RdfjHPweL9TYvTw1yEwGvAKLF9DSA4B/PL/efch8Z4drVb3CZ7b6Vj4aPNQ67CzvqOPBvqNcp6q
 pdszfnU1ADzM6XzxOqHfkZUgJzJ+kVLBf7HpqKrHqwjS/kfhJrhWwmsxYVPAxFAEFziZIE1nXA4
 R4tXF+UF0FKjfU8MLRD/MxLcnN3D5cT4ZF3PdKwRy0G1eG6E
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX9e8Zq0rHeYBE
 jGvzXw76bx8qCR38JTVinUVQotoZZZNCVkx8VbSFUX90yXiLYVn2R6rqP+fAxZqpwQ5p9S4ITdj
 qWAeST+3EmZi5bwbz59xKGBCKHqqvhE=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf3565 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=7DjRQ5CzWl9msXBk5SwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX/DxlKScF0l+Q
 8Uyff0sp1pUu5b29xQbVBOL0TcslO5SCNG4LaN4ZU4oKNKSQHlN1cYW2lcu9bZPLHpySjhBzp6g
 vM15hIjfplqD+dPsImgV4c7XrGblF4hps2h3gSv651DyomabKav8NyFx3uXF83+4+ZGS7ejlXaq
 72lJfJ98DLD3zihCQEPBv+Z7Lnf9KKmlZ/oDFB6bmpPe7wdY3n3HdVfBZ+ps5KFpLcV1DLaPUI3
 mg7MYiTVUUVvXURLR8cBa69l1U8U3nwmOvl3ARDQ89BQcR46X2cKU9qnNmc11+a3n4IbThw197U
 8QxpQCDgYBRV1e6NQwy/pjGyjtifzrkJoumhSyOGFEp09OsB3gqo8d0Hf/qAQasK8obm4hbfPkb
 Vh4ZQFY4QYLM02CCAaL5YKqudyn3b6teiISmgUn+xRczyqRxOCWEJdtolWUJj0bK2EFFnIT2bxV
 ll03AfxX0rnLtNfmOjQ==
X-Proofpoint-GUID: _5A5lGMoKMfeStpjOiGKmDlLBWSstStg
X-Proofpoint-ORIG-GUID: _5A5lGMoKMfeStpjOiGKmDlLBWSstStg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

Call drm_bridge_chain_connector_init() once the connector is initialized,
so that the bridges implementing the connector_init callback get to set
up their part of it.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 81f3e26f6fdf..2d982c7109b5 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -1141,6 +1141,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT
 				  | DRM_CONNECTOR_POLL_DISCONNECT;
 
+	ret = drm_bridge_chain_connector_init(encoder, connector);
+	if (ret)
+		return ERR_PTR(ret);
+
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 

-- 
2.47.3

