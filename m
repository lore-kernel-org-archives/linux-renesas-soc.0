Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795605450;
	b=RGbvUP2J90kstQsJ8DCTMhFx2Bac2H/zbJIC5uY4x6fJK/P22PUpzTU8RYXxghMRc134
	 3ai/Rs6QHsDFftbJCEJbIpmHk0JhZlEf0Po74ckgvo5Yb8OA/VwJ/K0PegofAjPrR9Ikt
	 tg+w3Jlx+wMESxi1ZPJUouN8W9adka2aTDi1G6DMO5lMK1dFs6yyjFDlNWPl3K/xlSuTJ
	 mCsE0z9CpkKru5r6XK79GZGnTpFebrjh4hVs3q0riVewig1dl9IP8PhECE3DiBUOGjq2c
	 Iliwf3SyqizcRQm2Ov7MSDpstGTul3dxIV8msTuJrBisWoquEBARztXatey4R85SJUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605450;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GGcM3DKIo02LA8xtKEqWDCXbSDDx+E/CgQ8lPKySp7s=;
	b=hv8hUJmqUt9oreiTGKsfBnXuVQ1rcge/6q/+gxMt77BlCjbi+pYg86sGVw2VqxCz+d+j
	 HSaOzlrzNOdqGd3RjJoRZ/AXBPmk44GUPpJXtgbRkrS2qHLqUfrEjEZn5YrbaF40LtWvK
	 sBbQkHRYomzpgczm4bR8QAe07qP5VHOH4IpxP4yPR1nt0piHtkqqXCdPQMrAUPfnoxJ3c
	 aIoMuYE5HtF9v72GVPoKDkDBxyhbIp+yeVFnTBvoPQ8d2/rVw8dtlJJV5VpQckmlUHjAu
	 KNDqM1lMr//A4zypu1TIbzDFSYK6gvImBtE3u6MQacgrp4MvO4019p9wKA+NAWQTldQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W4jWDdVB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QKrZI4Ng;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EDC606A32D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 11:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92EDC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W4jWDdVB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QKrZI4Ng
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mcp5796775
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 11:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GGcM3DKIo02LA8xtKEqWDCXbSDDx+E/CgQ8lPKySp7s=; b=W4jWDdVB1vbwwYli
	084svRdTuIpZGcbEUnPgXFOT3xfX3COpD8NlOSCTDx5vbmO6iqlsSjsyj1d4GyLL
	nVOQ7ZWM8f0DKHclVqbU4ZkP7EVvYnnEXvT3wIzR4iDWx6pNq8Z1BIggEvUuYzO1
	GxNYOiSA7xj39P9WA85R+PuRN/T8BnNtIXrGD8KSW0aoV0KInDxHm0smhmzGphcI
	3lY13tpzpfmCw4yTAdbwxyIy0T27VvXtuE7mzUuS4uPS3QeJ/y1RC2M0RqeEGhwn
	KxzYHwGlf6NbPM8BaVxNMu7AyROhy/1HuLKSIiKuynlR62oYOUOeNrSDq7kvHR8I
	97krqA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rtdev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 11:17:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f09a37f41dso29297675ad.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 03:17:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795605448; cv=none;
        d=google.com; s=arc-20260327;
        b=V3KB+t5gwzJBTM97osWE47k5KIXvRhOJt1XY3HBkIGJbBpimqwB5HLBdXozRNW/shK
         mViqWB4n99mb03DhlpQkd6iwZ0bIucfMtvmoxIqQjwROndbkbR1+tEOYiwT5aWf6s1mc
         Ub29aglvKdgheoXyavY+kxxZ+Rt45kggAa44zoluRQxejLumOiXS4N34J2UhI2ULuscL
         gkZz9tLbW9DtPj5Ij8rr4nVonFKsBnyzjsPIRl88FYqLNCvV1a1uml3mi3Ra27BpdCOd
         ghkFL/4OSY7CWREW+sNG0n08o7GaRA1ue4SAphPs0yIk2M3qUqLQE5jsOh5LHt1ALYbl
         HORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GGcM3DKIo02LA8xtKEqWDCXbSDDx+E/CgQ8lPKySp7s=;
        fh=PhiNrzZUuINxFeLQbOm1pdZyXEzb+Ms+e0ssQRKfvL0=;
        b=UqkzS8QWNDrhLAzNDzPQvT1hClkDPXf3RloEDuN2HpKNtJoVR3RJQsF3kEQ2SRARW/
         +OuVbw8lUFiVoiig+6Xfz3Gc8Kn4GIawFH0o510XryXS+iWMePHdj/ltRnukXuhr0Iog
         Aa3ws878e3Lgz/ZmHPc5mM+15nc3bXa8RXSJNKnlGAV3jM5qljWu2Me7INBW4T6/KZSZ
         4Q3wmxM5aMk87tfW5gkQxO+K55QDV7mXatvQJ7ZkfczzZVsno6bvrLif/sB9pGvvqyw4
         GsAL18Z2lK8oyBNY4VYD3omlctIJXPtLfiQ+yeE/K+thRX5eRFdeoZqhutzZvqPYOXtm
         xPQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795605448; x=1796210248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGcM3DKIo02LA8xtKEqWDCXbSDDx+E/CgQ8lPKySp7s=;
        b=QKrZI4NgAhRHB370rBIbBEFXiJRt9QROPd09PkqFBWsAzoWKlBdFIThs/MDYEdCSPA
         sPezC3Mh+wdHgWOLLOkO08Lx1ylLHGANQeWY4nSZtmt6GXCMw2hsFyMnPh0wZ5fQWxCn
         RKlNQfOhbztl8N7O3XdyM4PXLMzGyROxS37zsonwNnHD1MZM/u2ba/jRAks6GZGao2F1
         RdReAizJpvZ6OFoVaGQ+FKCm7gZt2CPq2GwdAdMoj8oSh8NV8yNrfLcO58J77RoXtiCN
         3WFjxQQ1pHWUyyBRIXb4Af76MTBTdVlnzLXd1lWXI80FspcDhyCTYHZXWnHdqY6O0pt4
         nQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605448; x=1796210248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGcM3DKIo02LA8xtKEqWDCXbSDDx+E/CgQ8lPKySp7s=;
        b=Ww7U6zeS6w4ha+bxgEoEEfLBWPffsXemx9bwaRl2GcecClafIV5ai9tRhsNb2FutaN
         qbZSjjeSZLRIpmgYAWXjtHvARlOOvGuMQLj5ZaGw8dUEsZLi9XguFRXCgGck1QATXwps
         iraj3hRek3y83uyZT184htzctosOICIwLKcVE6JSFmdfdHM4eNeF03lfyn7ayLNNzLpX
         YLkgb67XfflRqatbOw79G3jFD1xuOJy8EYN5GfOfq8Yme1uTG4nZeCJwmGAu/M2zsFUP
         PmzdRCsMEmWCS4uV60D+Z/x0AXLjBhPTKC9yzne6tveDiEVEBnwGYwn1aC+AwtEg2iMa
         cxPQ==
X-Forwarded-Encrypted: i=1; AL+hErHG3WqTbvi1pWC5e/ipagx/ItgyaDOFpXIcGB8S2mcI+n152EkO/UuW4wI05X1zv/YgbPzPD8rgpIsN419bQfrg2w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tdu31x2Xs/pdm23tM7iwSRLp0t5fTs2g3/zv7ssRBKEiiULKz
	lKA/vFgTR8Cnvb3kAEPE/lf4B5eye6oWEPDMkeZKysH1PQ1uW7LicC8htIO6A0EGBDxz26Ae5va
	/ysss4t4MKHYLfatutmUKFT6m1NALwA+nl3Ux6zF+QSrpJIR94Y5kGN+NK7xKr0Au1joadBCRTd
	KnobgNh+xmj17I3K5HwefMxZ5LYX2a1Uz9U3ijV/VUZc8eiIzk
X-Gm-Gg: AZFdTZf8OGUu6DuvDfwB+UPcPiSacbTqgljLeF/gn4yMkXVbU4UgnVMPCPSJ8B2KNW1
	Ob0kifLr5/87wkLPmZ69cv8rRuWHUOLGdvXxsk8ul/3F1pz3Vi0KLpTaVemeEg+C//UzroTCf34
	01KvRDIqpYNUJtYo1hADRigA+GpcDz81HoSSenvvWDc+sbXnEkFZIegeKg7g==
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id 98e67ed59e1d1-3b41c9b9dc1mr17035880a91.61.1795605447946;
        Wed, 25 Nov 2026 03:17:27 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id
 98e67ed59e1d1-3b41c9b9dc1mr17035856a91.61.1795605447334; Wed, 25 Nov 2026
 03:17:27 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <dcdd928d5b89cd0a67bd8c1d3a60cf657516850f.1795029012.git.geert+renesas@glider.be>
In-Reply-To: <dcdd928d5b89cd0a67bd8c1d3a60cf657516850f.1795029012.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:17:16 +0100
X-Gm-Features: Aa3M54otUsCwPZ0NLSXUquKQv9JCjL7ZJt5maqUuGrgwo9AgbaI_i_khKOzQbo4
Message-ID: <CAPx+jO8EFFeGp5HwOEnQgR1rc--1Akz+ADOoqTjdba6Y8Hb11w@mail.gmail.com>
Subject: Re: [PATCH v5 10/15] pmdomain: Make genpd_get_from_provider() public
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Paul Elder <paul.elder+renesas@ideasonboard.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX4XTY94M76Xxi
 5/0LVVjsZ60Jq3aSTuhcjWHP6gfu2SCsyiaMmVr4EZt4X0hMcP/c2tI086JnRG/wfTEtRG1hOc6
 vMeWTL2mU1KYN0+EzIs5cF3P5CDwpVVrP34cAicYuysMKL/zwvu766h6QXLqEYeSgM6QvCZfAtV
 mgMuqWP2l2VGo2cQtmfFUMe7fBwxfWTW/rKL/sSuqMSFZC1Msxt3kk8+TrNEote2aboaAsx49u+
 tqeI1F1VMxNZlqZUzSb5QVWgKoRh99wmFWX/XqY5pC6Yze7Qa7kDTQsy9nUOU0kI4IYJoETSMt+
 yS1+JsAqjLQ2GQpribPxhfiT8i/tlWMoXpyVTcs3/+e+jjLRen+slq8btACp8WTP+pZI8WAsnLj
 KdiqQykkNIWJ/T35b8fJHp3oAhIFR5Ggic52J2h4jefuGXIXJQvoWVUhDdrey6TJeVaia3p3VLd
 1Zq1lL8i66zMMI76XhQ==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06c3c8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=LDBv8-xUAAAA:8 a=wx2en-tew_9JlkkAXb0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-GUID: 7yAos2LyNDiC7PXu9eZvsK0aR1CUILuR
X-Proofpoint-ORIG-GUID: 7yAos2LyNDiC7PXu9eZvsK0aR1CUILuR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX+FQ1H3ftHLum
 lR4kAakQsvVDaJZwiBbAV/w4fw2iiYq+DpdqM9Mun5ZKdJuMJXq86th+ztce7ZFdDMwK45YgLVz
 uHOTXCO/VTbiZyDjqD04rzBSG63vSFY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250044

On Wed, Nov 18, 2026 at 8:46=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unlike the corresponding function in the clock subsystem[1],
> genpd_get_from_provider() is private, and thus cannot be used by PM
> Domain drivers.
>
> Make it public, so the R-Car X5H Module Controller driver can call it.
> Add an "of_"-prefix for consistency with public genpd function naming.
>
> [1] of_clk_get_from_provider().
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

FYI, this looks good to me. Will apply the next version.

Kind regards
Uffe

> ---
> v5:
>   - Add Tested-by,
>
> v4:
>   - Improve patch description,
>
> v3:
>   - Add "of_" prefix,
>
> v2:
>   - No changes.
> ---
>  drivers/pmdomain/core.c   | 22 +++++++++++-----------
>  include/linux/pm_domain.h |  7 +++++++
>  2 files changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index c242807f62579e5b..2a44b45955dd6ba7 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3008,7 +3008,7 @@ void of_genpd_del_provider(struct device_node *np)
>  EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>
>  /**
> - * genpd_get_from_provider() - Look-up PM domain
> + * of_genpd_get_from_provider() - Look-up PM domain
>   * @genpdspec: OF phandle args to use for look-up
>   *
>   * Looks for a PM domain provider under the node specified by @genpdspec=
 and if
> @@ -3018,8 +3018,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>   * Returns a valid pointer to struct generic_pm_domain on success or ERR=
_PTR()
>   * on failure.
>   */
> -static struct generic_pm_domain *genpd_get_from_provider(
> -                                       const struct of_phandle_args *gen=
pdspec)
> +struct generic_pm_domain *of_genpd_get_from_provider(const struct of_pha=
ndle_args *genpdspec)
>  {
>         struct generic_pm_domain *genpd =3D ERR_PTR(-EPROBE_DEFER);
>         struct of_genpd_provider *provider;
> @@ -3041,6 +3040,7 @@ static struct generic_pm_domain *genpd_get_from_pro=
vider(
>
>         return genpd;
>  }
> +EXPORT_SYMBOL_GPL(of_genpd_get_from_provider);
>
>  /**
>   * of_genpd_add_child_ids() - Parse power-domains-child-ids property
> @@ -3113,7 +3113,7 @@ int of_genpd_add_child_ids(struct device_node *np,
>                         goto err_unwind;
>
>                 /* Get the parent domain */
> -               parent_genpd =3D genpd_get_from_provider(&parent_args);
> +               parent_genpd =3D of_genpd_get_from_provider(&parent_args)=
;
>                 of_node_put(parent_args.np);
>                 if (IS_ERR(parent_genpd)) {
>                         pr_err("Failed to get parent domain for %pOF: %ld=
\n",
> @@ -3196,7 +3196,7 @@ int of_genpd_remove_child_ids(struct device_node *n=
p,
>                 if (ret)
>                         continue;
>
> -               parent_genpd =3D genpd_get_from_provider(&parent_args);
> +               parent_genpd =3D of_genpd_get_from_provider(&parent_args)=
;
>                 of_node_put(parent_args.np);
>                 if (IS_ERR(parent_genpd))
>                         continue;
> @@ -3227,7 +3227,7 @@ int of_genpd_add_device(const struct of_phandle_arg=
s *genpdspec, struct device *
>
>         mutex_lock(&gpd_list_lock);
>
> -       genpd =3D genpd_get_from_provider(genpdspec);
> +       genpd =3D of_genpd_get_from_provider(genpdspec);
>         if (IS_ERR(genpd)) {
>                 ret =3D PTR_ERR(genpd);
>                 goto out;
> @@ -3259,13 +3259,13 @@ int of_genpd_add_subdomain(const struct of_phandl=
e_args *parent_spec,
>
>         mutex_lock(&gpd_list_lock);
>
> -       parent =3D genpd_get_from_provider(parent_spec);
> +       parent =3D of_genpd_get_from_provider(parent_spec);
>         if (IS_ERR(parent)) {
>                 ret =3D PTR_ERR(parent);
>                 goto out;
>         }
>
> -       subdomain =3D genpd_get_from_provider(subdomain_spec);
> +       subdomain =3D of_genpd_get_from_provider(subdomain_spec);
>         if (IS_ERR(subdomain)) {
>                 ret =3D PTR_ERR(subdomain);
>                 goto out;
> @@ -3297,13 +3297,13 @@ int of_genpd_remove_subdomain(const struct of_pha=
ndle_args *parent_spec,
>
>         mutex_lock(&gpd_list_lock);
>
> -       parent =3D genpd_get_from_provider(parent_spec);
> +       parent =3D of_genpd_get_from_provider(parent_spec);
>         if (IS_ERR(parent)) {
>                 ret =3D PTR_ERR(parent);
>                 goto out;
>         }
>
> -       subdomain =3D genpd_get_from_provider(subdomain_spec);
> +       subdomain =3D of_genpd_get_from_provider(subdomain_spec);
>         if (IS_ERR(subdomain)) {
>                 ret =3D PTR_ERR(subdomain);
>                 goto out;
> @@ -3491,7 +3491,7 @@ static int __genpd_dev_pm_attach(struct device *dev=
, struct device *base_dev,
>                 return ret;
>
>         mutex_lock(&gpd_list_lock);
> -       pd =3D genpd_get_from_provider(&pd_args);
> +       pd =3D of_genpd_get_from_provider(&pd_args);
>         of_node_put(pd_args.np);
>         if (IS_ERR(pd)) {
>                 mutex_unlock(&gpd_list_lock);
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 14e0e346c610a9a6..d65ee8b3725c1bcb 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -467,6 +467,7 @@ int of_genpd_add_provider_simple(struct device_node *=
np,
>  int of_genpd_add_provider_onecell(struct device_node *np,
>                                   struct genpd_onecell_data *data);
>  void of_genpd_del_provider(struct device_node *np);
> +struct generic_pm_domain *of_genpd_get_from_provider(const struct of_pha=
ndle_args *genpdspec);
>  int of_genpd_add_device(const struct of_phandle_args *args, struct devic=
e *dev);
>  int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
>                            const struct of_phandle_args *subdomain_spec);
> @@ -501,6 +502,12 @@ static inline int of_genpd_add_provider_onecell(stru=
ct device_node *np,
>
>  static inline void of_genpd_del_provider(struct device_node *np) {}
>
> +static inline struct generic_pm_domain *of_genpd_get_from_provider(
> +                               const struct of_phandle_args *genpdspec)
> +{
> +       return ERR_PTR(-ENODEV);
> +}
> +
>  static inline int of_genpd_add_device(const struct of_phandle_args *args=
,
>                                       struct device *dev)
>  {
> --
> 2.43.0
>
