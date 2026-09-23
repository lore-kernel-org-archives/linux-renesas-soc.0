Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B886C499F16
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 12:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165549; cv=pass; b=Dc5rSyyZ6O9s18CyqkEvtmiBr3AVMKyPTz3mxHoOVbAvn7mUG+MGBOJLgaqAJdMF6P9TX9A4IjObb6RWfKsi+4dIxKkhECT5UcfKCL3w1fGVr2gmzNTmUPNnDkMVkGd3heGzIHjDA/xaUjl0yqqoGM8UxbbDDQhhWCazAqUm3Ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165549; c=relaxed/simple;
	bh=otl8liIb8W8IWl9VhhkrAOQ4oieAS8mQOQ3oJNhRrPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C33V95HZ1AEi7QApMpL1iLG7CqA0eKowJu3G7er2JKe79bsX7nEA25mgNEZuSg0Yv6iFXeI3hwdVs+9bK5zPhqw8n5Q6sPZt3sEBq5smcCevZmE1HafsE9iyiODJg8V+pAT7KTvA+IkPjmoJ6c6SfORtUv1evAYKirKw5TkuILk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ng/mumkP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hk6gL75e; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ng/mumkP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hk6gL75e"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbXYY2466633
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 12:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7V7ql5bnTlujjDYznFGFQp5Hg4A7cbqQcUtRXp+0cs=; b=Ng/mumkPNmTwMVxr
	KDEczxhCcBHu0SPYMHfl1XD6OpmyhbbSAaOBYgcj6DOTpqB7516LIONMW0BCMtND
	bfMX/E+RVovSWDdTQWLyVly0kdNGMw+gmhbBPciZR4kwOUocTudjSTCSky2j+Ncr
	Ga0b1T0/EG+/R/pXlLbohmeeG5XpJP6+Jbr512R5cYWQIvmGjL0sRTWCHSo4ZvPj
	OMQw7v4/xvkFqXUjKT3NNXH4fCE8hopPX9d07OnpGCH46NXnPjaxrp24SdZsC9PB
	MeXMs4uixQx+UInUDebGVMVAxE9SraG9ganD+4VqjHlADW4nLoJ0MfnXrBu1JiXL
	/SHvFw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c3wsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 12:12:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1155650a91.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 05:12:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790165545; cv=none;
        d=google.com; s=arc-20260327;
        b=LDOzeqK3b2uSxCSHbU+0ELwTLHKrS8ENC90CXhkCp3eWFBmlx1W6XSTvG+i8hNB4Ia
         KODRbqyHIfhyUhXcqt0W0780/3WnEfqo5y5JYzWuZMmqOrZUSMrTdjCsYoCMWDMzW6lx
         GRiizSv5WLXha5jV84IPRURt1ldBYOGeVoJn+dAhN5LLbA9V6cfJIyam361bKNVQ1K8V
         Z8CbUbRVBTOf/OoBHrPvBVvkLmKlomo5KlRWyn+7vCaDw9JkfYKya1/IfEHke9u+kBez
         vfXz5dqGf3v/nx4CTYhxJnaydNxiLczcfKMkNsHDMALlb5DVI1APlCCmDYuJs3FU8xH4
         CYNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n7V7ql5bnTlujjDYznFGFQp5Hg4A7cbqQcUtRXp+0cs=;
        fh=nb1lz/zehr8endaX1P0Np7APqYpoGxPuwxYo1KSX9iM=;
        b=BPOgy+DA5NSy/uWJAHvZ0tl9GRQRSWpFALnrnzY/lcVg2SS3GeOuCjQvGCIef4D4B8
         NOq+PokjbWvwnuAsl70KtlhskN0vvIGVv5w2SvfCfUb8CyBPozXrIjl8hy+gLKz8OyZi
         7JBRZJYMTJZ6zbHJXC6NRc45lQ73mOOb/wIx7xD3i3HdTv+PCw4gIUanJD9BtrVq4mZ0
         N1Q1VrsuRx/V1PSHbl7vwgi8/WUht7bzcn2PDqyIlv9NVWp/s5rYhFOH4Cxk/1ZI2t15
         YBD2qikcpUCmCgbUVCV/xn5rezvthLHBER64qRO27M0FXKl58qi318dB3GjF1/yZSa38
         jgDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165545; x=1790770345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n7V7ql5bnTlujjDYznFGFQp5Hg4A7cbqQcUtRXp+0cs=;
        b=Hk6gL75eW4amJ6F7s64TXMB284uLQsBDpVIfcdNywSg87ikbo++y3ILvm++50OQav7
         cwNCmZH+gB1YMk2felj5gBNJw2eBwROa4m7JEusZ1oxlMGw83Kgs+OdCpKBePsgUL0eu
         6z7MD7iki0lFoKjxIzvCD0d+kHssVcYP3g/Joy0uoJPh8hQqIoWnNAD1i0QwlbrRtnz6
         xXfJxOpHltPBPTWEurJ+7zOFyL24RBsDpdBvrtE4idwQMFD6o/Ddf7gFeXsIWoUDaobh
         FQRlEe3F2lGnMsU1FzcmBNhZhB65D6b37hXJV//A3yhdu6O20d9ex4UlARRiCyC1WzKe
         jP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165545; x=1790770345;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7V7ql5bnTlujjDYznFGFQp5Hg4A7cbqQcUtRXp+0cs=;
        b=2tbrX/sPbXmxQFJ1hjezu8ublUTjHasGAEH//WY69Tlbmzpv6kYFLcx/AUkynvfUua
         uBkJqZsDDDZYZgw9XfpqxmA0hoJyvE1n8MHMhSyDHG4LcaPeD54mTP0NVL8jQFOOIjsf
         8Odl/eE/KvPeGXyg7JlVDRa1dACH6IYFEDXOB59TOJNCvdusceKgdW9YLaHUT1B4Jz4n
         mzjwHDFMru29BJxKqCPlNmyFLbAa0bXQS+PvNK4lf0IJwBIzGeFZPZ+s7ap4/gqm7vE7
         KVIBqou7OnkujekPg6FXHa3riE02j1b5NQ4L0ZCxKKzkZc4QQmEgthc1FoCBPLJtcNkM
         SMaw==
X-Forwarded-Encrypted: i=1; AKwUvBxrKH8y80cQ9Ga1wfajDnsigK+dxmbE+nd+m829nSVPTG3SaHWtZ0lh4LRtjAks9JIvQtwDIyO3ppuRDnDPCqFyjQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lJicbIfMwrAZje2M2i2aw13YSczgJ8DjUptFYyDmVJv0ywSDLr
	ehv0rNDbrXIHK7exYPLnEzHHU7tv/B56oOg/dluBPtWnLBBwZGZ4bzokacIq5OFB1mHPg+DjHX/
	IiMyHaz9dbIRp7ld7rXsOutz31Yxj+p/Y8rqd0J8OYt02ET6Tv/5LELH8vkNoRSeGkb2+KMtP2j
	cl7N+cMsp+/Hmj+1Xt6O3fGu1yoXX51+Ie/lX673bvN5eHNqzG
X-Gm-Gg: AYBFou26bsX91XU/K644M/sEMBVKXymUyiT+HfoHJCvAvUBVZBN1JBBuMInfI5Ur6TN
	7pDsbnm+W7fzKv3hjIgfyu6umBgWAGohZnylFrOgzCoHHI7J+XjBywuSWAGrEp73YDO68LV+orX
	+xP1IUpWFGGchCDLvgokBAH7x0azMrgD0GVoZ5kdQdpecKkGo9V6OxJfxLVnEzUZNOhOtz
X-Received: by 2002:a17:90b:3f0e:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3a07e5606a5mr2042097a91.24.1790165545084;
        Wed, 23 Sep 2026 05:12:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3f0e:b0:39e:59a0:46b5 with SMTP id
 98e67ed59e1d1-3a07e5606a5mr2042073a91.24.1790165544489; Wed, 23 Sep 2026
 05:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
 <20260921134432.50338-4-ayman.chaudhry.kc@renesas.com> <CAMuHMdVkh_qpJKqD7N=njG+35gS+rE7cFfWQ-kS3aRoTByxH_Q@mail.gmail.com>
 <CAMuHMdXmJWu5DD5sQ0epWX8FnWc7zt0CTvJ5_jpjj-Hnvgg_cw@mail.gmail.com>
In-Reply-To: <CAMuHMdXmJWu5DD5sQ0epWX8FnWc7zt0CTvJ5_jpjj-Hnvgg_cw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:12:11 +0200
X-Gm-Features: AcwNN1U1n7SQ18uSpUqLgK21GdYB7lBiWF4g5o3P6GVe9OMu93MP2iK1mK9PKiE
Message-ID: <CAPx+jO99DnXLzarD_rWgr43e6vzWCJjYWaVFh_hhr6rtivXxFg@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] pmdomain: renesas: rcar-sys: Add r8a774a3 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: JbFc6WUm7rjzE8skFBkbByQsCJXZgObv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX7wop9Jh+biU3
 hB8HSQy0fujhyK/cxpVuHAhU+XAgM10tkqKyf+iongciplrBYxRQbPI409aA8BKlqxFREBcM8T/
 CmvnJ+YD0ZVKtwq8elEuTrE6ZKDICd0=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3c22a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=tBb2bbeoAAAA:8 a=yC-0_ovQAAAA:8
 a=gynxR62fjgbsPHoWIaoA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-ORIG-GUID: JbFc6WUm7rjzE8skFBkbByQsCJXZgObv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX0ePbIktbxW9B
 641WwVWVIWRe2ZGo1Pr68tQdKhvUgC+fiC8SdoYqBlC92MM8pXWuhsx9YLhY8geZydQuXiq0OSU
 v+y7xC3msq3FK948uKP0He9Ev/m7GpYOGb7alcXTOPuq7k01zuZeURFy6Ziw2JuKcaT1YzQk+au
 tIEzf0BNB1D0dUNdG1X+iM0GvOgZzLGM+TmlijFqLjWEnoJNOutpjLIVX+I+kl1/CLx6GwjbalF
 9sEHpoqMMi9JJrfUP3Nz5CMmtoC9YPFHkJ9EvyG4eClLpdxFO/ZONrug5uP0EjL1qR0WBbR7QIU
 zcvZittqF0xUhYzi8w1hWbPyA+4+NuwAwzq7+TCpxp7vKfpHMTUyB93yzTBJ2N6uKwjfMgXGQb2
 W/zjnzO/FrueHbWtEiil3pgQazLZjTZtuNOp+6l53TxX7La8sJGBxRD2rm1Rp8c/CY0K5JpZb6p
 xekFmpv+XnVKKDQ3k+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048

On Wed, Sep 23, 2026 at 1:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Ulf,
>
> On Wed, 23 Sept 2026 at 12:33, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> > On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
> > <ayman.chaudhry.kc@renesas.com> wrote:
> > > Add support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC power areas
> > > to the R-Car SYSC driver. The RZ/G2M v3.0 SYSC is similar to the RZ/G=
2M
> > > v1.3 SYSC, however it lacks the A2VC0 power area.
> > >
> > > Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v1->v2:
> > > - Added space before closing brace for `ca57-cpu1` area
> > > - Updated include path to SYSC dt-bindings
> > > - Added Reviewed-by tag
> >
> > As this has a hard dependency on "[PATCH v2 2/9] dt-bindings: power:
> > Add r8a774a3 SYSC power domain definitions", I will provide a shared
> > branch with the dependency to Ulf.
>
> Alternatively, I can just collect all pmdomain patches in this series
> in renesas-pmdomain for v7.4, and send a PR for that, similar to what
> I do for clk and pinctrl.  Up to you...

Usually I pick the corresponding power domain DT bindings and share
them via an immutable branch called "dt". I would prefer if we could
keep doing it like that to avoid confusion and special cases.

Note that I already have a couple of patches queued for the renesas
power domain driver this cycle and whether this series conflicts, I
don't know.

That said, I am planning to pick patch1, patch2 (both shared at the dt
branch) and patch3. Would that be a problem for you this time?

Kind regards
Uffe




>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
