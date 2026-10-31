Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793465059;
	b=ujSc0bmNq2bMeLh4uYJ8VjoK+t8HZjYJGQBg3GyVPCZuW39vw5/D23QIafgsxo8Kl5it
	 seDAVAj2q/F4KzhViSDNFK4FfDHlcTdNz+K3GRdHmQ+60b0cGUj2EWInLoce6PEyVqr2q
	 8RjATEYmizoiipLjDz37qAnI33/LxKQ6GPHzkBPzAlE2L3FJbiwe8NvrOlTtGrkWI+cqV
	 GcrCPE8s9WeRQfhJQgubUw8yIwEIBkJRgM6VEGuJwbw3g7Gy0LZORQc1IsB93XJn8Laxp
	 pudj88WU7ZC7iYwdmJ4V2DVO40LbyNQDhRfhO/N43QT9bz4C2JmYkuV5dADvySW0+0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AxPaqqR7JQ477yDdRMMPNaR6fhRM87wS+96sE2dqDu8=;
	b=L0sMRyIcCcBIb/pI3eMkwexsxPBlLQV6qY+s+TqPgImKbf/dZt7wipsSUUlHnmKRUXWI
	 uYI2nALfQo3Lswiej8699p6fu1BZuNawNs1R+4pqr3l1QngCy9H0pwJfB+hij3cf/yTlG
	 4xZ4pqy1DlVSeGzN2mRDOlVjtqC9L2fTKXPR5RFy1UfDwFB1+QvWbo3QUbDTm/RmwtYHg
	 rLjyjwCoE4D/kDgdq+jLAbbfgBQsrFSWunwQsxhKOXyTvg/cjpAXYWYXD1y3UWgTP7UOI
	 0nRWxUSf9VYtNUwTfsjWg+aKqGUAyGxLtZ2v2QDp52D15eJELV9PkJhISJvWd942+uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdWMOV2z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwhZbRLK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38A0606A327
	for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Oct 2026 16:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F38A0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdWMOV2z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwhZbRLK
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VGUDtj2626759
	for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Oct 2026 16:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AxPaqqR7JQ477yDdRMMPNaR6
	fhRM87wS+96sE2dqDu8=; b=DdWMOV2zuAcTmxoxESfa0mRiVck5d3ot4T6wTvkn
	yr7gIlkhDjxYophT68C9VCeg5uY00oW5ZoeSXPnEjEaqePR2Q8nbQW8Xa+qS0dig
	wyFR8xvA/YcJsCQ/A2m8uQD+qG0Hq0Ph4zLv0/UvPovKUHRsiJQ3x8JrIjg+qvBy
	8W7X80/OYoIl9M5BCR5yGjNYS27fpc7/yearZw2P4HVKmW6XIanjK9VlT6DPIKvW
	bB3nWBjPKKrSOdO468EAHhmlrMPpgBDB6+LVkJ8UgH53hlHtXymHV6jhjq6sWWEq
	tbexGPO0M/CWaqqzHd4e5fZObFGADZ/+RRPuvLLrJhF3Iw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8du9jct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Oct 2026 16:44:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso374215385a.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Oct 2026 09:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793465056; x=1794069856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AxPaqqR7JQ477yDdRMMPNaR6fhRM87wS+96sE2dqDu8=;
        b=iwhZbRLKl7XfZWeuQ5jm64yJ+D7hIqc+mz/a5Hf6xA/0E9iwo0evXHhKF9MDfEx4D5
         fkhwbSNWVeuSBFBozpgNs/01PJUW/EdiqHhlaBbRX4Tg77xKsoVkyhL4h6PNEKVbfK6S
         0Ok2u+JQbGTIfZc9cBytMpYv/B9wPxUm+LgkQAw76JT5mwXXCFRVZc2ybYkLBytKrdDK
         O1P7txqH7SARE4CbvbBxrXhxMsqli8cABcrEsktee/eZ9IqfKGT7GlkeUFgzsGcpHQee
         /I3OSE2K6o3VbMnoqWuFqOR5YoyeW45qIf7Nbz7Rq8t2H/tEftPk9h6aEclHucIcIph1
         xiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793465056; x=1794069856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AxPaqqR7JQ477yDdRMMPNaR6fhRM87wS+96sE2dqDu8=;
        b=zyx5jSv3rf2qFlDo5nGq1JOkEXLg6ZkHDz5pWPn4Vw3E/h8G7b8T/d09qCXe1bMAXn
         YWNNl3t0C/ezMEqua0IwYryrkDxIzAxMQwtFpCfRuJJKXGnu6Z7MD+74jMiTOpIzhRZ9
         wRNN5xVH+LWreTUL5z+oYK2bKO0XoyRbwRuvEzuOrTIzOt8aht3ek2sl9YEDEB3oCxKm
         LJOemD0mrgYN19874sQMwbWlL4yntl9SXd3CVFH+HLZrGEgz3yNQ685+VR8uKVgCS/a8
         rd/Jc71vLgZQsWgqzQ5vPSylf/t8zfLg14a1viCOThpqHkuC4LSonaAY0XbvNJA6Xbad
         zdzg==
X-Forwarded-Encrypted: i=1; AKwUvBzuWh2yI0ZCxVLtSLCYu9otMOtHIdq5MFcNPOszaGXLBzo/T4BnSvbWBxa7Loj5uOo0ued3S8u1TF2GKRpEdOWrow==@vger.kernel.org
X-Gm-Message-State: AFq9FYJBh2qzgYACmdW0SDcO5sq1YHVyXX4ONSk0NiL0RS+6I0m069cC
	Pfe/orKrqy+TEl4zMQeyoCZeUmpyjohHyjVMyqrIYNUIY5bZqL9V7oJYtNzSQL2rGpJiQP577+P
	KVGnV3ejF38t56lk/cdw/olYm95XwXfKC9yk1ELqmJPNtXKHT5mhpdWlqmB4p7v/ouwrmfcfB+Q
	==
X-Gm-Gg: AYBFou3OsjaRLSj+tiWlpGv47XJxndp4xU7+Cfss/EN6DOkNszkx8VZLbkcdGAXW5q0
	TkE1fZYe6C0460XAOuQ33ZXXHAugfPMm+bA+xpZBPwLMLaySgUErJ+2oAiBYEFxY+f4ZK8VW1of
	Vici1gGPduVR5rKd/rWI5ZN3lAkdUrD8eWL0B6iIWbbe+W/RPRhfJ3i1Tgj8itcqLHsJEWNCWNj
	aPcWnMNZgJH2AcQ3cC/bxTsRIzrRD8I7YFEf+dxC3UYA1cTix+WaQaDzPMtMOn/dr4eOYsTt17L
	r9eVbB8MJegKuOYTToK9r3flZQwWkgJCURnB+3k586FOyispCn/VUd/AH5/bs8di38rXjQqzFQg
	lrZrYq8Xpd+Qn9KWS/V+KE581aUWU4/5AUwnTttgEiZtvdyl9qv37k3jQYocaYKj9YHMLyFpOd2
	Gr3OIWH1lJ/GrDCdnBroNEF9AXNu4TNLuCByJrHcSxQXZY7307dn68CjeeP/XuMA==
X-Received: by 2002:a05:620a:1a17:b0:93f:3120:6c82 with SMTP id af79cd13be357-9442186437cmr915823985a.78.1793465055934;
        Sat, 31 Oct 2026 09:44:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93f:3120:6c82 with SMTP id af79cd13be357-9442186437cmr915810385a.78.1793465055075;
        Sat, 31 Oct 2026 09:44:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072d1a8sm660313e87.32.2026.10.31.09.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:44:13 -0700 (PDT)
Date: Sat, 31 Oct 2026 18:44:10 +0200
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
Subject: Re: [PATCH 00/35] drm/panel: let the panels use the atomic state
Message-ID: <py3tch5wmx4g2zjpebzbgtpwji4ci3vk5obeuy44fbi4vw2em2@gpjmxyvwpimn>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <cxsgo7u2hfb4jskscqcbeaaneiyfh7bdmlvku2wxwtduekwhxz@3vsizgxvekw7>
 <DMICO60J4G03.1QBH2T9SQ7XEZ@bootlin.com>
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
In-Reply-To: <DMICO60J4G03.1QBH2T9SQ7XEZ@bootlin.com>
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae61ae0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=0sqqXKTFXRObX0Cx7wsA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: -IDajtFgACFjYQyQCtwcbHul7VwCx_Zb
X-Proofpoint-GUID: -IDajtFgACFjYQyQCtwcbHul7VwCx_Zb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NiBTYWx0ZWRfXwzdKYL+QIbsF
 dCGGvynlm/bgr+NNz+NlraightAiEksk43FQD65P+ZHjXBuEDu8ntLoD59K3BQTfFh8mazEFQwa
 7XuYTT7Wmbl3wSnl8Qy34XO/Bligoqz46rraAaSbp0xfMpwXBe+JzMw8jdM1MtnlZ+totwqA26Z
 HFCQ935rh8qUJumrE78ZFtP4RSCk3/NyRraqo5FCO8Q02Oi8uP2vRJeDGaQyE3pQpsGcO+g9pYS
 n331rU7DOF8q4YvXkU0xZeHXkLV02Ma1P0KTtch+/kJOw6Aww8nBlgZvmrLavqWh5RZCc13M0SW
 otA5+c+L6qUeenn+LrIb7vNFd2eRPAayLgBbIxgiCDoAEglybJa+QZPMLTZidz8diwHMb7FpGWs
 86Q2TUrQ8E6z46GZsb7D1Yfcw5QyKXaBeVBW8oP1sjRzZUEasg5kLQfMWGmLWeTu+RgpNDhPun+
 AJX+IMR7zu3isnMz2TQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NiBTYWx0ZWRfX3elWYrb7QJjA
 NBbK4Uw6VO3foF8TU3hSUo/FKTBVHB3RzjkK9HmM35Yc+UXCGdjq58/6maEfBKwehjFUTA8nJ/Z
 NBRjUVadPzXkf7Qs0uGh59SwWbb8g+8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310066

On Fri, Oct 30, 2026 at 06:31:02PM +0100, Luca Ceresoli wrote:
> Hi Dmitry,
> 
> On Tue Oct 27, 2026 at 1:02 PM CET, Dmitry Baryshkov wrote:
> > On Mon, Oct 26, 2026 at 01:09:49PM +0200, Dmitry Baryshkov wrote:
> >> The panel is the only element of the display pipeline which never sees
> >> the atomic commit. Its prepare() and enable() callbacks get nothing but
> >> the panel, so a panel which has to be programmed differently depending
> >> on the mode can only guess it. The NT35950 driver, for example, saves
> >> the connector in get_modes() and reads connector->state->crtc->state
> >> while being prepared: without the locks, from the current state rather
> >> than from the one being committed, and with no way to reject a mode it
> >> doesn't know.
> >>
> >> Every panel has a struct drm_bridge embedded into it, and the bridge
> >> already has all the missing parts: atomic_check(), a state object which
> >> can be subclassed and the commit passed to the callbacks. Rather than
> >> growing struct drm_panel_funcs into a copy of that, let the panel driver
> >> provide struct drm_bridge_funcs for the embedded bridge. This is opt-in:
> >> the panels which have no use for the atomic state keep using struct
> >> drm_panel_funcs and are not touched by it.
> >>
> >> To get there the bridge callbacks become the entry point to the panel,
> >> with drm_panel_prepare() and friends calling them rather than the other
> >> way around. The panel core still has to track the panel state, notify
> >> the panel followers and handle the backlight, so the driver doesn't fill
> >> in the power callbacks directly, it wraps its functions with the macros
> >> doing that part. NT35950 is converted as the first user.
> >>
> >> The bulk of the series is the cleanup of what the panel core and the
> >> bridge need from the panel driver, so that a panel providing the bridge
> >> callbacks doesn't need struct drm_panel_funcs for anything:
> >>
> >> - get_timings() had no callers.
> >>
> >> - The connector type was stored both in the panel and in its bridge, and
> >>   the display drivers could override it while creating the panel bridge.
> >>
> >> - The orientation was read from the DT, stored and returned by nearly
> >>   identical code in more than twenty panel drivers, and some of them
> >>   also had to set it on the connector from get_modes(), with a TODO
> >>   asking for a better place. The core reads it now. It is applied to the
> >>   connector from the new connector_init() bridge callback, which is not
> >>   specific to the panels: other bridges have properties to set up on the
> >>   connector being created too (HDCP, DP link properties), and currently
> >>   have nowhere to do it.
> >>
> >> - disable() and unprepare() returned an error which nobody could act on.
> >>   Worse, a failed unprepare() left the panel marked as prepared, so it
> >>   was never initialised again.
> >>
> >> Behaviour changes worth knowing about:
> >>
> >> - Panels with the rotation property whose driver ignored it now get the
> >>   orientation property. In the tree this is the Motorola Mapphone panel
> >>   (panel-dsi-cm).
> >>
> >> - sun6i_mipi_dsi, sti_dvo and the Tegra DSI get their panel after the
> >>   DRM device has been registered, which is too late to create the
> >>   property, so they lose the orientation which the panel drivers used to
> >>   set from get_modes(). None of the rotated panels in the tree are used
> >>   with them.
> >>
> >> - A panel implementing atomic_check() can only be driven through the
> >>   bridge chain. The display drivers calling drm_panel_prepare() directly
> >>   have no commit to pass.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> ---
> >> Dmitry Baryshkov (35):
> >>       drm/panel: remove the get_timings() callback
> >>       drm/panel: remove the unused struct panel_bridge
> >>       drm/tidss: get the panel type from the embedded bridge
> >>       drm/bridge: lvds-codec: use devm_drm_panel_bridge_add()
> >>       drm/ingenic: use devm_drm_panel_bridge_add()
> >>       drm: mxsfb: use devm_drm_panel_bridge_add()
> >>       drm: rcar-du: use devm_drm_panel_bridge_add()
> >>       drm: rz-du: use devm_drm_panel_bridge_add()
> >>       drm/mcde: use drm_panel_bridge_add()
> >>       drm/pl111: use drm_panel_bridge_add()
> >>       drm/rockchip: lvds: use drm_panel_bridge_add()
> >>       drm/rockchip: rgb: use drm_panel_bridge_add()
> >>       drm/panel: remove the _typed() panel bridge functions
> >
> > Gmail barked at me for sending too many emails for too many recipients
> > in the middle of the series. I guess, I'll have to split the series into
> > smaller parts. Please consider reviewing the posted patches, letting me
> > split / land the series in parts.
> 
> The first 13~14 patches are nice and fairly independent cleanups. I guess
> they can be sent separately, or just be applied. However I'd still want to
> review patch 14 and do some testing next week before I consider them ready
> for applying.

Sounds like a plan. Would you ack the patch 14? I'll review and repost
patches 15+.


-- 
With best wishes
Dmitry
