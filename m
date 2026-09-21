Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C3C282F16
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 14:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001191; cv=pass; b=B4/HAnYiQpTmAK8wGKsJ5+5S8jufYufUdfyFrH101U7RJjcZ1cvMi19RcMag8v328HfJhAIE4PPIKopYmnJrFnu6Agakv1DmEGAYfs4XMEqKh+QEObgIlMpjqvn7B/olq272xKz+pTqUpSpw1RFGSEUcM/CpbKSz+xlJe9VZ4wM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001191; c=relaxed/simple;
	bh=r7lm+CiC9wEa6BgamTUuhlEQwcuYZjSsoJngwi1iaKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0pc/A3U9bMmETn43ZQVk8I6CK3oaptkVZfMP07XbrqcGkbBG4S+ktziCL49YDmfzwONRTrHF87FJ/um68HhkNYkmGl/G+BeNAR6AC6NUIidPGjYt9fZOs5NgfJdywEvVj/R5FZL2wcPPMBERopBKPrz3sccmCCl9/iQyno0+Ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLjFj746; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NwZ7Or+U; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLjFj746";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NwZ7Or+U"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGP7i1553104
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 14:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+QGpMDXbC7yeJzKIVYaJ+2yrvGf7V4gzLzdPmK9D7H4=; b=PLjFj746DwgTYYE6
	F8bg6eKr3tc7fjVnCufAGwWSW6nQHnZFdphyiMUDaJ7Re7G1kv1cmBaC6KV+pHL7
	Q7mcAejuGclMvGvBA9DgSDpomiaB6RetrcIQLVd4P4GnCH60Sj0ycVyapOVBKylp
	8nIH77l40LqoNpMmTj9GhEZMZQbTKtPtYRnNqbENC8cowz3OQ5ZWcyLzj+Ih5Rrq
	Y4Mga/LHN9ltTgvPfJWUOngovFq1Ii6mRjdMrsvcBEoSktA6aCyuc89q3fzxXEAU
	P+0EF0l3m6MbIN5fJT/+Aplej+jfB1YgK0X/ie7LUULZAS0rQKaAOjxWIEJw/VN7
	j2F5IA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csgts1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 14:33:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso2660643a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 07:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790001188; cv=none;
        d=google.com; s=arc-20260327;
        b=XpraWuF2EN86QOq1ktt/0H1cw4x2jlR56NWD2wT3GBKig67a7Wz3WDUe9cb6wGxmWO
         6XmhPc/jaBvWoHvOiiJCHF3YVCSGd4ZNMWa47CW3gGEQ82m1Ora+Z+UQcloAPmjAeIq4
         ExpyD7dx3PztFRyFbqI30c3ykl6CMj05NKszGnxEozRSzjmGg5+M4FUaG2ZqMp9AINDX
         bKd9sU+wcC8zsPKY/Pvh5d/p5nl+ZoxYzGuQrGXbG1k0Yp5IHN31k4BtswoaHDVy9tlm
         HdPZ8XdqwwzT0YUBLYncw3RpK8RyyZxwyXSLlU5k5cUFk+blC9aRpParme0M+X8ngLf3
         FdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+QGpMDXbC7yeJzKIVYaJ+2yrvGf7V4gzLzdPmK9D7H4=;
        fh=0ZSNRtrWdlb1MHBPwuDnnmOTki2uVRDtW0RXxROw4gw=;
        b=kqOdhy76azbigK1/z/jaVJ8FNt6pyzOtQraystfFBA/pqFp1SNlPupd2WcKJg73T79
         WkPQTNYFvwZa+20lPRdB5WZeeBqd9h8Joqljc2CDpZVojQTRwanzrfUCyUPotWgYhF5D
         bFtxTS57odrqHJhGO1bFWYAWTTbm3E8OqetVOdBy0kpOj4ljC6o5auinnAQlKQpoor8p
         Qw8GRw4Q3D0pSeEtgeUURNUWmIZCcTbQbwiQwrl+xid93WA6dKtpHrn80P1WqyJO3Gkp
         0372wqidHnY+oL22whmGIobd6tHIket5vwIvhbx+bbbxByK8HIszzrvo/YC1nMxY5WSI
         7WBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790001188; x=1790605988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+QGpMDXbC7yeJzKIVYaJ+2yrvGf7V4gzLzdPmK9D7H4=;
        b=NwZ7Or+U8p1YsFysVQRk5nPjjSP4wWjl7ViBnnoserHjRX4BSKXqkiP371wFoPNIfP
         467ofSdLBGadDLW23OrNj8x2mWYb35aQv2xG5RfZNiFFM6AI7hcMhsQn5r0FJmKC6HTv
         oJHbJWlaQ6WL54nSE+oYs7eXP50dDHMGIu5Ke/13oQtcDqXBCKWqsNZwmB0DcjZDCmvo
         we9r0VvHgmD8ETYg0EA9jUJCsXWVuItzmNxvAh+pgTiAodxEZvylvSJuZVmdxdIQvH4+
         3sQOb9h0wxW1F2Iu88/NP2JwNvoMbOauxIiKpP0kzex5bT8zEWXabzqVdK/nJ7JwqHzm
         YiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001188; x=1790605988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+QGpMDXbC7yeJzKIVYaJ+2yrvGf7V4gzLzdPmK9D7H4=;
        b=fcj3lLDc/QnVqfkzDLkQPyLsIHx0OFTe/Bs06tKE8mbZh9hKlYWkRuzhXG2Zz97/S3
         ucRjUEeCfDbqTPH5XBjfdt5h27I9LxW42kEnxDHZmKTSIbnxQ4NHlRM0/1rhji3/W+1b
         N/ojSJAKIKqgLPnXCGtjsgE5/+14HsQSrxEIXSHVahWGv5qPg7J280fwsstMqx+baXW7
         iMMa7VEkNgT88CGQX5+xmRFMQiEyX7J7K+V3Psn9zMyjY7NpOiStiiCXaVwnVRSvdxpM
         c67IhBLh7AstPjh138DBHim7ONJ/ksve1PtOqs0W5eGSTLLkGZMM3gIHwwLSVFUbSDpT
         R48Q==
X-Forwarded-Encrypted: i=1; AKwUvBwbTzW2MhYcZLvY8XtG0T/GRvaC1K2bbcEsgwzN/iXrph8FaUApeo/M/Q/aHsa9Gn5qKvwlGMxhmj8BvNd/2biYTg==@vger.kernel.org
X-Gm-Message-State: AFuF++ls4gpwe7LLm9FZK+oS70avG24iJteqAKX7pB7LpY8o/kyho3oM
	XTWISFfkYgWG++DEWvf2WTsAI0Yaa/2/nZtpcezyTRZTKsgAhHji9A7yT6GOBKQULeBunbO1gEa
	4Jgf1Ba9nkXhDl09rRy9UZTUfN0wmCHt3jgKNgHwRYicv18zobN0e9eY3EmtLRAyZeF4Gx041JE
	g3oq5+3/1qaDSriCAdG8Nolx/z3I5UXc6bmp30NTroSFsSecvw
X-Gm-Gg: AYBFou1hxr8ra9ejPfT1enhgLcBgWoBumD/3Mm+0pSZF/jDnDHiJHxs21YP6aSG3orU
	6TdA8djLYfqorFoQE2bsVFg/Jl+rcqJmBeHbPhh3MgS1TekW0UBLFW4SWsJP8ffODAhEsnM28d7
	TnqFgU66K/MM+IxkuZ1wkXlvksz0/7BQFOIIu9b78I4T9jOweCI7xsKyy59g==
X-Received: by 2002:a05:6a20:6f90:b0:3dd:a195:dd5b with SMTP id adf61e73a8af0-3dda195e52dmr11030332637.61.1790001186031;
        Mon, 21 Sep 2026 07:33:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f90:b0:3dd:a195:dd5b with SMTP id
 adf61e73a8af0-3dda195e52dmr11030295637.61.1790001185527; Mon, 21 Sep 2026
 07:33:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fbe8b4a4d90f0b555285cfb4ed18b6a2afc38b74.1788436280.git.geert+renesas@glider.be>
In-Reply-To: <fbe8b4a4d90f0b555285cfb4ed18b6a2afc38b74.1788436280.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:32:53 +0200
X-Gm-Features: AcwNN1Wm7QptWrQP64KBLoWANiDzhteUPebkkzrS5dFRZNkLVpmRMtVpNjJdPcc
Message-ID: <CAPx+jO_N5oTL4CvU3NokCRK9QgKbxsEwHfz=JLUTi-rRGhStwA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: renesas: rcar: Make area arrays const
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX7gr/Pr8MJaMt
 m5wR/wnW1TXLab3oyVVIWD8K3e1DZhTK8dRJyOaUOK3kPsmhkhI42WGFOCeCDbYYFhjJTwZ9OJ8
 OJIwzGkdSkt1BQh8HliYPKLVjn0zUCY=
X-Proofpoint-GUID: MAIb6hmhiIBs4DUida8Gp1xrX5i2726u
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab14024 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=H6JtXQTsj1a3jlPKj3wA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX0QR0zmoaqBuA
 2c9rckvtXZjO4Hcd+yGMLitwmDCjHXiviY31Yn0BYLvaTjE1jK0+kEbl2Xd3pflluqYoUh/iNnl
 aTKKbk/t2wGAN8dOlNyXjCRjZhhgL01YPejV0/pDp5mmiWckW2qbagwSXKMQRLwABxz9fZYUH7u
 9kUNiJefEDwG3Lzgc1HOTzGq7FAnfi1cXdeDfKpxmsadzQX2dYmOIv5tYG5bXvss9/bE1bWFKIv
 ps94j7BAbO27YGTpE0oHRz5E9SCn35BRPCeaFzEdbtjWNjnzsn0zibs65gJ34WXOlC1Kgri55HU
 TsVZPyw6ekxTef9Z5tzvE9fGowUmkCRnFCWK1CI6nGkLWzbQvXhp2X9FpBbNTegakIVveB/ESCR
 Md8htL2XrtVWnQCTxGR9j2tpDq6IlcNpKqRo6vWp2ls7/b5IOfM1PUyctTcFtJO/adwoeIRZ2rv
 9RDbV6cWxVLaQ5A+SbQ==
X-Proofpoint-ORIG-GUID: MAIb6hmhiIBs4DUida8Gp1xrX5i2726u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210211

On Thu, Sep 3, 2026 at 1:57=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Arrays of rcar_sysc_area and rcar_gen4_sysc_area items can be const,
> unless they are modified by quirk handling.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/renesas/r8a7795-sysc.c  | 2 +-
>  drivers/pmdomain/renesas/r8a779a0-sysc.c | 2 +-
>  drivers/pmdomain/renesas/r8a779f0-sysc.c | 2 +-
>  drivers/pmdomain/renesas/r8a779g0-sysc.c | 2 +-
>  drivers/pmdomain/renesas/r8a779h0-sysc.c | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pmdomain/renesas/r8a7795-sysc.c b/drivers/pmdomain/r=
enesas/r8a7795-sysc.c
> index cbe1ff0fc58393e4..2ed377b58846628d 100644
> --- a/drivers/pmdomain/renesas/r8a7795-sysc.c
> +++ b/drivers/pmdomain/renesas/r8a7795-sysc.c
> @@ -13,7 +13,7 @@
>
>  #include "rcar-sysc.h"
>
> -static struct rcar_sysc_area r8a7795_areas[] __initdata =3D {
> +static const struct rcar_sysc_area r8a7795_areas[] __initconst =3D {
>         { "always-on",      0, 0, R8A7795_PD_ALWAYS_ON, -1, PD_ALWAYS_ON =
},
>         { "ca57-scu",   0x1c0, 0, R8A7795_PD_CA57_SCU,  R8A7795_PD_ALWAYS=
_ON,
>           PD_SCU },
> diff --git a/drivers/pmdomain/renesas/r8a779a0-sysc.c b/drivers/pmdomain/=
renesas/r8a779a0-sysc.c
> index 54cdf250f7c2d143..5f84b8d56a3282a7 100644
> --- a/drivers/pmdomain/renesas/r8a779a0-sysc.c
> +++ b/drivers/pmdomain/renesas/r8a779a0-sysc.c
> @@ -11,7 +11,7 @@
>
>  #include "rcar-gen4-sysc.h"
>
> -static struct rcar_gen4_sysc_area r8a779a0_areas[] __initdata =3D {
> +static const struct rcar_gen4_sysc_area r8a779a0_areas[] __initconst =3D=
 {
>         { "always-on",  R8A779A0_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
>         { "a3e0",       R8A779A0_PD_A3E0, R8A779A0_PD_ALWAYS_ON, PD_SCU }=
,
>         { "a3e1",       R8A779A0_PD_A3E1, R8A779A0_PD_ALWAYS_ON, PD_SCU }=
,
> diff --git a/drivers/pmdomain/renesas/r8a779f0-sysc.c b/drivers/pmdomain/=
renesas/r8a779f0-sysc.c
> index 6ed13cd1cb249df5..d22cbc33a6048c9d 100644
> --- a/drivers/pmdomain/renesas/r8a779f0-sysc.c
> +++ b/drivers/pmdomain/renesas/r8a779f0-sysc.c
> @@ -11,7 +11,7 @@
>
>  #include "rcar-gen4-sysc.h"
>
> -static struct rcar_gen4_sysc_area r8a779f0_areas[] __initdata =3D {
> +static const struct rcar_gen4_sysc_area r8a779f0_areas[] __initconst =3D=
 {
>         { "always-on",  R8A779F0_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
>         { "a3e0",       R8A779F0_PD_A3E0, R8A779F0_PD_ALWAYS_ON, PD_SCU }=
,
>         { "a3e1",       R8A779F0_PD_A3E1, R8A779F0_PD_ALWAYS_ON, PD_SCU }=
,
> diff --git a/drivers/pmdomain/renesas/r8a779g0-sysc.c b/drivers/pmdomain/=
renesas/r8a779g0-sysc.c
> index 249cf43af45b6445..96d39a3ac46056af 100644
> --- a/drivers/pmdomain/renesas/r8a779g0-sysc.c
> +++ b/drivers/pmdomain/renesas/r8a779g0-sysc.c
> @@ -11,7 +11,7 @@
>
>  #include "rcar-gen4-sysc.h"
>
> -static struct rcar_gen4_sysc_area r8a779g0_areas[] __initdata =3D {
> +static const struct rcar_gen4_sysc_area r8a779g0_areas[] __initconst =3D=
 {
>         { "always-on",  R8A779G0_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
>         { "a3e0",       R8A779G0_PD_A3E0, R8A779G0_PD_ALWAYS_ON, PD_SCU }=
,
>         { "a2e0d0",     R8A779G0_PD_A2E0D0, R8A779G0_PD_A3E0, PD_SCU },
> diff --git a/drivers/pmdomain/renesas/r8a779h0-sysc.c b/drivers/pmdomain/=
renesas/r8a779h0-sysc.c
> index e13372cb80eea857..3775735854f29fab 100644
> --- a/drivers/pmdomain/renesas/r8a779h0-sysc.c
> +++ b/drivers/pmdomain/renesas/r8a779h0-sysc.c
> @@ -11,7 +11,7 @@
>
>  #include "rcar-gen4-sysc.h"
>
> -static struct rcar_gen4_sysc_area r8a779h0_areas[] __initdata =3D {
> +static const struct rcar_gen4_sysc_area r8a779h0_areas[] __initconst =3D=
 {
>         { "always-on",  R8A779H0_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
>         { "c4",         R8A779H0_PD_C4, R8A779H0_PD_ALWAYS_ON },
>         { "a2e0d0",     R8A779H0_PD_A2E0D0, R8A779H0_PD_C4, PD_SCU },
> --
> 2.43.0
>
