Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4E54E0B9D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166969; cv=pass; b=K9pCxG8EJKkESsYsh6v+JXBbYX1Y4bmsZkD6a8O2dVVdcl1yxls2UG6k4xGqhA8GQl4BsHJPw2Z5RINztbkqQJ7Ud31I7JvNA/r+SR2DidduLBgZPrAz0fbJyUfCuaiioGlNyDxE/R7abwjkzNIWtmQFTqdoxqtqVlC2Q7QA/4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166969; c=relaxed/simple;
	bh=kAPdjmKTH7eqeFmV0zKwPKmA6nvla6tA6nD4BePMtPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9xKKiCjtokHV2R7GHSHkP/f5ZDqkBMnzkJG6sQ3NJ4S1j2v+xL88EDDPwMDqCjuyZXLWJ1UoviJTS0GtFhiG6Eip+JlRkSVI61HoPM5sb1buQH7WGpeTyVfDm+kJVyv9iKnzkoFnw4z1jRuMHD+uOO1pgVzeDG8MhySvDOJlwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bM1JaKye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cceZCZ7q; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bM1JaKye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cceZCZ7q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbvri3029285
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 12:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gNa92BCPlq8IXNX/OUUDOG7IciOgTK+a8rk8iMF8zE=; b=bM1JaKyea60UL0Kc
	DXuMbSUsclXr2hnJ5fU+MlsgOKh8j8cAm3Sua2LrFXdYLdH0hfeoTXlKlOp+aEf3
	b9N8oFoho2U7VqA4DjTE3qfoGIDes9XNinQaXAPn+jKkqTsKer3n3+b5/QJ2l6Af
	H42t/WiispXcsRbiEJ+G93472KD9TUHv9i6YMfssKwZ3UWcY6owbgVEPS+uQb55N
	IwEYwQIH2pn+yPZR3ZfVnTfpweDxW0+XfQcFAgLMkcZ0zpsznxUacs6hqx39iHT/
	v3XXA4T3CCignWW32iDgiYg3Twf5jwTmn51vXHXSTTP2nyU7hfQhXv26xT9GyXyR
	5FfHDw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwarthd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 12:36:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3dad7ab3so821804a91.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 05:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790166965; cv=none;
        d=google.com; s=arc-20260327;
        b=DwgMBU285IlU4WShoIYtNnkleuCbseE09Vl00ERBmIemy7yTeTehpl/X1uMHRae7O0
         XyA3uYlQXdbMbTMasVFudxlsAqVos81c9HrS0SaG0L09Yw2S0VliyFpiGpURBncATtPg
         7soLM/XMPvkSQZqUAMC7T6afYiF8zuATyE19RWURGSCAdn5C60G2TbO40Lh6ItwvDI8L
         3VCHn6zkaq3MJoAF7S2DlvPHJnaEyvSHIKSdt4a22AoV6/tRusIvTVB3UOlKimgfDKdo
         nZer0iAn7HL3vqT68d5tPZeMuK+s6/3szIedjX39si3F8ro7o+78hZfNPouzfuKLLYau
         FX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3gNa92BCPlq8IXNX/OUUDOG7IciOgTK+a8rk8iMF8zE=;
        fh=Q9Yy8gWeqxwxSPImFGyhIkRrE1ScCsGIv5AWDkOr3n4=;
        b=q9mvBvPagsZsfG34nP0dQVxjl1w9USt648O0ggz1FCgRwsueu/OWEE7EtMI9hubbGX
         J53Q8M8VralfIl94jD2v1iotW+J8zt8oCOwBD9jcSe+uwM4Mt4HWvUHSdfbOfptUbBuL
         xCWnDlnj2C1m8Uhh+mLbnV+IZxxlO6OYM/3jVTpm8clsOFB0CX609XS8FoixW29kgSNo
         uGLaFYcZqS0v6SvgpI3inneaklTE++WOVhrbXi/8OCUHAvKPJEZsjutMrqxnZV8hK3WL
         Pvgjl6su/7bEpdFL/z25b98K5ko4UvonXVwG2RSX3rRNdx5b684TW2PRHeDtmmzppFWI
         bzTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790166965; x=1790771765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3gNa92BCPlq8IXNX/OUUDOG7IciOgTK+a8rk8iMF8zE=;
        b=cceZCZ7qmFB4iURNoX+1dYWiLkTI+v1XRh7aGeq3ImdcA3ELnJDC6HxPGjJ9VArde4
         bevANjzf2veez7+zMYFnCNy1zdBq7lK2fB/EjRImL2bGlTJQTDj/esqZc4YwGcJU+eKb
         pQK+BNrAj9JuB9mkiDCrIBh2+mk3CTHrGWQd8QmUvFDJjTCZpCcVrDD9BKDsM3OdcFR9
         0reqCG2Zt8y4VDB1EEF049nGBqvW7wKN+u4PjAMumWxJfb9cbSQ2zruSg/qq6zOm134y
         yKlHl/d4daMfesRF1rrjOiuuEAG82Jge8L9r1LKvoOXLU9lr5F10pCKl+ne6yhDRj4OW
         MGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166965; x=1790771765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gNa92BCPlq8IXNX/OUUDOG7IciOgTK+a8rk8iMF8zE=;
        b=Zbo6RdMCPOfGnCX7J76+xY9joAg7R1R0cpx5Q7W5E8N0cwvlRs+Tc1pIG2YUstG7gG
         vm/7dE0NCeDAUemUo3jS6kavjEQKB5z0wakA6P/87xB5RbhDLTd+Aafm4VpnXBDDmAdQ
         Ets1R4K6YaKPI9PzxvojdCQNqe/q8f/7oEstm2qzQ1AsX4He/LX/Nb8WbTL9lDIlW+q/
         s/aBeHDBhLEWgGZPWybGh4S2kwBP6BUHGAhhxrlL0BCyC3WWsXc11LyRMDNy6GTGKjbD
         sNl8b4pVVVY+X5HdDRiCyhzIxUQG7O/nUMkzq94bUMfq8YppuxNjWQk9CYKqAfNox6ZP
         koTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqM9TKPB4T1iHlpAfffwVF0tf0orhlabdLgqUC1J9TjnfKzpzlvGI2KAqS5dhJjXTGkohMNDQEHGq3qXhdXg+o7A==@vger.kernel.org
X-Gm-Message-State: AFuF++l6u5s9pDpkzfo2QjbPmoH4PVGYpyl8Rp2TwNCKo/R/FBkTfSDk
	zVLpYHSKeZWSOxrLMJFEbJdvpXteNlXogY4ef1s4Dsp188ymQHNMTx1joVBefGm/q7paBq9vqbz
	Y7D+BTjYqN5f/JmogzxmxWFrWNKKaqXLK7rrCGGJiOsRu6lJ3TVJDQfS13WZ+vGUFBLNjbj/AFQ
	+SKxfQ5Q04hGSu5vazS1qXRPBIGIlSdaUxbrAti0b6/s27hK7/
X-Gm-Gg: AYBFou1rxE3syPurEq4xgamApeRdzW1i96hQIJwl+kTFn8RkZPR3iEtuRw+814omVPD
	x+7gV+hb7RISW7wqd9SVJc5YD7j/wZLQs9kSYBU1w6vWKQrfZxzC1bYD7BlpLpWS2KDjb4U88D8
	8lCgHS0x/VcpXExoPD49DTO9Dgs+4DoUXt0TTroq81rxDg3Hvw95kFVBRe4g==
X-Received: by 2002:a17:90b:280e:b0:3a0:4384:adff with SMTP id 98e67ed59e1d1-3a07e51cc3fmr2120247a91.23.1790166964755;
        Wed, 23 Sep 2026 05:36:04 -0700 (PDT)
X-Received: by 2002:a17:90b:280e:b0:3a0:4384:adff with SMTP id
 98e67ed59e1d1-3a07e51cc3fmr2120217a91.23.1790166964203; Wed, 23 Sep 2026
 05:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:35:53 +0200
X-Gm-Features: AcwNN1UTraLChGyH0jiZy9NpxD1dSBXWo3BNBqcJqSMmiFGJ2e9xHGPipMKPzII
Message-ID: <CAPx+jO9tx9CStEnZ0kiMEbN-XCRD+XAx96i4tJf8LZ=CHP8D7w@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Add support for Renesas RZ/G2M v3.0 (a.k.a
 R8A774A3) SoC
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX492nmrOa4jRO
 GX9ptArViu4DXDpsGX5+0xpN1RRy/4AVt4+/Ov2uROTC1eHk/kKxNXjdCA80CPFLN7VbNBzZnBB
 drlaxi6TlKZMoQlXwYu8qzXK6bcfpKpCwMTkEbUQ9M8sH9OUOWrMbIRtuhoxxukFR4VhVZjKvOZ
 kFn7tbZh4kNoMOi/AEmWQnX1CHUZBc0otxk7XFVRP2SEgM+hbLP5NEXsPiAUGfgvWaskWuVxs8q
 9T/rjONxcrwjt6ZBIvQs3oVszLskhKtMjxjG3UTlf1EuYNnn5yhUJNX8xbp+C9ZS7ot4TWi48Dr
 8UvkfLze+zLWereq/YR8Tito4vKmVml1WbOXaC20W/dMqNkBkxG0VwKqRabRCw4WjqmFkmlO/Q+
 PKwYWjVX6oy3rJgVwyFByccrFtG8mO7L8RLuATkEj8qA6FtxHyBPZg1lHV/I0hwx8JLu3CAaSGo
 f1mepxl7ix8RHy5GJ8Q==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3c7b5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=yC-0_ovQAAAA:8
 a=kA1v2ZBIVzPyHwuz2UcA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: cw4Z_FNOMNfE_n3pUy3p2xSWNVeSwnkv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX+IQu7A6Cg/vp
 N98Lk5Co8E75yWLLldtYPpkO/zh+4IzX4B2M5QUZNlcBDTjQKNOJ/6XfjD/QXwxXefXFy5yMMdL
 Jdik+KDLpLguYSA1VZ6FSkIfzC29qVo=
X-Proofpoint-ORIG-GUID: cw4Z_FNOMNfE_n3pUy3p2xSWNVeSwnkv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230050

On Mon, Sep 21, 2026 at 3:45=E2=80=AFPM Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
>
> Hi All,
>
> This patch series adds initial support for the Renesas RZ/G2M v3.0
> (a.k.a. R8A774A3) SoC, which is similar to the Renesas RZ/G2M v1.3
> (a.k.a. R8A774A1) SoC but does have hardware differences, for example
> the System Controller lacks the A2VC0 power area, and CPG lacks modules
> like FCPCI.
>
> v1->v2:
> - Dropped patch 01/10 ("soc: renesas: Identify RZ/G2M v3.0 SoC") as it
>   has already been mainlined.
> - Dropped patch 05/10 ("soc: renesas: rcar-rst: Add support for RZ/G2M
>   v3.0") as it has already been mainlined.
> - PATCH 01/09: New patch.
> - Renamed SYSC and CPG dt-bindings to include vendor prefix and updated
>   all references accordingly.
> - Added vendor prefix to include guards for SYSC and CPG dt-bindings.
> - Updated commit message for patch #2.
> - Added space before closing brace for `ca57-cpu1` area.
> - Replaced underscores of node names with hyphens in DTSI.
> - Updated patch #7 to not use odd sizes for the sizes of registers and
>   also removed the leading 0 for the system-controller node.
> - Added soc: label to soc node.
> - Dropped bootargs from chosen.
> - Corrected indentation for patch #9.
> - Updated licensing to use "GPL-2.0-only OR BSD-2-Clause".
> - Added Reviewed-by tag to patches #2-7.
>
> v1: https://lore.kernel.org/all/20260821150408.73829-1-ayman.chaudhry.kc@=
renesas.com/
>
> Thanks,
> Ayman
>
> Ayman Chaudhry (9):
>   dt-bindings: power: renesas,rcar-sysc: Document vendor-prefixed header
>     paths
>   dt-bindings: power: Add r8a774a3 SYSC power domain definitions
>   pmdomain: renesas: rcar-sys: Add r8a774a3 support
>   soc: renesas: Enable SYSC driver for r8a774a3
>   dt-bindings: clock: Add r8a774a3 CPG Core Clock definitions
>   clk: renesas: Add support for RZ/G2M v3.0
>   arm64: dts: renesas: Add initial SoC DTSI for RZ/G2M v3.0
>   arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC main board support
>   arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC sub board support
>
>  .../bindings/power/renesas,rcar-sysc.yaml     |   7 +-
>  arch/arm64/boot/dts/renesas/Makefile          |   3 +
>  .../dts/renesas/r8a774a3-hihope-rzg2m-ex.dts  |  14 +
>  .../dts/renesas/r8a774a3-hihope-rzg2m.dts     |  49 +++
>  arch/arm64/boot/dts/renesas/r8a774a3.dtsi     | 302 ++++++++++++++++++
>  drivers/clk/renesas/Kconfig                   |   5 +
>  drivers/clk/renesas/Makefile                  |   1 +
>  drivers/clk/renesas/r8a774a3-cpg-mssr.c       | 168 ++++++++++
>  drivers/clk/renesas/renesas-cpg-mssr.c        |   6 +
>  drivers/clk/renesas/renesas-cpg-mssr.h        |   1 +
>  drivers/pmdomain/renesas/Kconfig              |   4 +
>  drivers/pmdomain/renesas/Makefile             |   1 +
>  drivers/pmdomain/renesas/r8a774a3-sysc.c      |  45 +++
>  drivers/pmdomain/renesas/rcar-sysc.c          |   3 +
>  drivers/pmdomain/renesas/rcar-sysc.h          |   1 +
>  drivers/soc/renesas/Kconfig                   |   1 +
>  .../clock/renesas,r8a774a3-cpg-mssr.h         |  59 ++++
>  .../dt-bindings/power/renesas,r8a774a3-sysc.h |  30 ++
>  18 files changed, 698 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m-ex.=
dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774a3.dtsi
>  create mode 100644 drivers/clk/renesas/r8a774a3-cpg-mssr.c
>  create mode 100644 drivers/pmdomain/renesas/r8a774a3-sysc.c
>  create mode 100644 include/dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h
>  create mode 100644 include/dt-bindings/power/renesas,r8a774a3-sysc.h
>
> --
> 2.34.1
>

Patch 1 -> 3 applied for next, thanks!

Note that patch1 and patch2 are also available on the immutable dt branch.

Kind regards
Uffe
