Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604913;
	b=PmhIB7sO1tsqN4A1WTvD5qcI7pHy0iUlnGRuBEKtFM2l/BvB8ylYnz8dx/H+DpittSZQ
	 Z6jOYkv/+CHjbPSHBBFTyYrqIKvrI38UbsRxTmbu5ZUPu3U/Lnf47HZZh7Us3y5FcGYg1
	 9jgGYzyoHjXzjJiu7rNZnOeSWvL8RPXHmjRIWB3XPEp5aCfZjrSqiTKszw5HZCm6rdi/H
	 w+wBJokdrp3kSCkA1XkLkLv9CaTjcWYN3He4D8ArTLq3SgN5ynhvby7LdYIcorqtCYBu4
	 LJCUUwzOclB+NPQ2sZMK3QpnkEZCNRQWzZhZlGHxn18X/b4wsaBliEbeERixdbGc9Dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604913;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
	b=M7WwISEf3tsuMSYxW4o//bb8IDd4oCtflegkarg2+XWg1+mXmuI56vSa5+VrsQXjjC6Y
	 2PSBHw3RJ9KttOsXgX8TwjeZkCRis+kXHmgm4rQ7zePDz1RmSAWtv3jLg+zBkEgBm1veD
	 bvwEDVwZaVIX5gJimh0fAl9T+D0JHfjIyn1EGQWeuBK1gtsZuiKMdAQnT4x32dkXV6LQB
	 ozNeNGbS1ErN5RbiHosujhdYO6/1Bkrtkj1cvUGoIj28YyXJj8ilpyTYB8XfBOtcY5L8M
	 3eII3074DZRoKacRPTfeYnH8yFd/DPYDDixs12Yu0Y1O5Svo2lSlqI16qgxPAIVwBZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nc9uQR+j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JooTsSeq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ABC60A2604
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 11:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53ABC60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nc9uQR+j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JooTsSeq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mMw62356515
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 11:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=; b=nc9uQR+jLwGYfJ+v
	wCrebLA8CUnPykqKns+CQ2yrRQX7mBdPXHCMWPqrppNP4EEqU2xz/ZDxv4GlaaV4
	diSFgLYngeA848CL7VUmP79lf0CGvoFe7HMV9ryXoUlJgFCDYVA+vY5YqMNHvOzp
	AP64yguW96k89HPWqInNVzFmbAczwLCAuNLpnN+AtB/co6g5xKucvRnn7YHP17Tt
	nsxQo16Kb9HnPlxBxSSD/axvQB25PQ9cB8UzYqupv/HjZ1aliLqhuH91v4Qctbk2
	zFH/QuxXH5D6PfcOI6atlTGFW72NTj/SQ4NkYR6bvlOtcKnV3kbeDY4jlT8UZFVN
	H9JRJA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6a7b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 11:08:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so4682645a91.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 03:08:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795604911; cv=none;
        d=google.com; s=arc-20260327;
        b=OqobYa++78rOdtT6hrZNsqyEA+MOito0DrCew2QXBAPqVJM+Us0A0W59v01YMvYPvq
         oErTxmaenDI9Cuai1cF/pFcM0NFPJK6ZBcvGPDO2hzU7sywM+3kJkmXFfmC2V8vfdlq6
         aLcjlNJPdJTJYiGmESsqmV4xo+N6k9MmJjHlVK7EDzSHKjMhm5ZOo5OiOTHcyZ/QWir6
         l9iJ7zVZb50fjWdeVZ/bM4pddzMqUII04UhQsSq5/DhXX5VwC/AoTGjzaIHNSUWYAgZx
         IWTA42QN4nc3B/3TIrC/B7BsqzF+4wouDwamGQCyT7QmhHAkllvHxOPM6oUSGv8flpmo
         3qow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
        fh=81IOnB8NFnueCk5aEGxub2EN5s/NBiFhzbYiFDKJ5DQ=;
        b=A/yxsbkr4ngzxDfOAR8PbknXAXa7AVDZyjV0fmtxnuiIhzIrZKjp1alOQ/ASbvFfks
         eMtH3s9FcK15d9AMvjgFhZsxeII9fF2cvRKbndU3mI5nPAdBG/d2gOwYxTfRdoK3Y18E
         3V4rtOYeSZw2hl2RkiPp8r+0er1etiXh8zZDYbvatVz/Nzb5wNjKkAlBxZ9VrgqGswDa
         m0YJIxgQHjRTskSdmCSYIBvCslWVeiJ13+4w4Gi//fIdwQpxUUXZM5YiFAS7NLahPczp
         M4R2LMYv8/qFAWP6X8SPUTW55iazwBfpzSPGEFUSPXS4bYp6tn16zeAym3z1ivwwqE7T
         +LAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795604911; x=1796209711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
        b=JooTsSeq2RR1X9kQ7o0BsZFsA8NkAkFKzubTfUrfxs0AoHK0J6gRp/ranL0IYd4DTh
         qTFPTwolI/JQcnvGSgmo+MEX93AyyL2/zTlaOKAMWqGXXu/OU/+e+Nml21uA+/7i/TW3
         AdMpSpQ6HS+75nLtv4n1XMi0n4knpbPsOUxLp7zi+/cFhxR+qTBbpB5FWeoW/wz+mo1E
         L/TIjfPa4lOEIjrqRusrw/DGKvaaCaUSlWcHhH60n6vEOlahEwY4nM7VlyNTUMmgjtSb
         bJhUa4rVDCDmrO92JSSelxDCxWetV8Y/S+s0qvhkkRctw9hA8CuSIPoGQoLr5wa4JDyS
         nBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604911; x=1796209711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
        b=ghE4a9cLqKuZq7+VvhC+9kf+JStiIrHDxZU7V8Mj1TwHJWzrjPWvaXqURVDWGcKwtB
         6q7MOgxFE2jHf1a6LVGLNcPE5mnXrQhkLwbeKcrO37MMMtRtR9eFfT47ds0UlNlVMd8u
         vQ1ZlP82AawhkP/xNzUq5Ih8NfpxeC0J0fICw32bXVhih7fPGGiXxWoUIT1R6uUinYlc
         qLcGmhPa8UDrftDIPn/seZ69q91mDF8Ick70Etx8egHgz8NpH1OhnY5gMyGat31HMyXw
         jqfdU3yHSTnsRGyq2JPx7+o1s+wBYzJje+Z61C9eQBdvddqiX3mK76XpQRx5KHUTbtzq
         VPhQ==
X-Forwarded-Encrypted: i=1; AL+hErEIZ93e7tkXan6ztWQ+iSeo1aC5VHb2ntlGYnSpFWOqlg1+HCGjTw2iEL9ihDKLx0JJHROzzijMWED6oMUf4l9PPw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9TqLtMx/rAaqgT1ZqHesNP/KOKxRV0uUwqbTQZK+q7lxch/u9q
	cC7nQZAAvoh6v/XBRftP6FTrcGLqneomlRpmRFvETtnWOUhZlpa4ia3c+15CYYiNB00tE+vmBra
	MxqGfOp9LiF63kiAweR2QwGy6WCmqp69r4qNlCGlUEp9ctU78LXk5HFv9/yxi3ENfL22lWVWCXK
	s9T4qaxdvDJbcFMzE2MmRFO5GC6D+nU8Bp9xInKE9ic8Vy6o/7
X-Gm-Gg: AZFdTZeYPE77XfCMUpTHttrOPKIpkDCj/gvaQx5RHxvbhLfChPqccCW5v+c7C1aTYQP
	5CYxmsFuB4gBvC8ZMIodtG3L66Q5uLHIuYsOXUxgBYgXE9jgtgW/9SBCCUuecWvTlUNeozGuCCl
	076cXGRiTbZ7t7G+dw+VRfCRWBbql8hOrBenHgNy952Q7uZFcQ/qGKMtrGDQ==
X-Received: by 2002:a17:90a:c10e:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3b41c911c91mr17608627a91.22.1795604910768;
        Wed, 25 Nov 2026 03:08:30 -0800 (PST)
X-Received: by 2002:a17:90a:c10e:b0:3a8:13d6:f740 with SMTP id
 98e67ed59e1d1-3b41c911c91mr17608576a91.22.1795604910256; Wed, 25 Nov 2026
 03:08:30 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <16bd6b25711f0e5a4a8ff7484ad3acba83a2a2fb.1795029012.git.geert+renesas@glider.be>
In-Reply-To: <16bd6b25711f0e5a4a8ff7484ad3acba83a2a2fb.1795029012.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:08:17 +0100
X-Gm-Features: Aa3M54pwdhQzxCyuIzV30L5QTtG5r_OlDFzkU_dedYyzSv3GvUcS-vx6Qv1tWoA
Message-ID: <CAPx+jO9F6MkwODVi10HkGNYCTJHG_0vc8Bc3FMs4go2q9+=_JA@mail.gmail.com>
Subject: Re: [PATCH v5 09/15] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
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
X-Proofpoint-ORIG-GUID: GjTufdkl3fZBfhhUtBhdUdkMnmALoF0q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX73wK3um6GWWj
 xxS7iMds6D5z7iFEKBxHvUZs90Rp4QPEu82INbO0Cmrqx+9KdAolQyK+w6ZUTtlOhJRhNGF2DuF
 xYUCygV9YRuxEmz3MHDCtiwuk1xG6NQ=
X-Proofpoint-GUID: GjTufdkl3fZBfhhUtBhdUdkMnmALoF0q
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06c1af cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=LDBv8-xUAAAA:8 a=wQiWHD2DouBedGx1vnwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX+tMD5RDuQ7+q
 k0IxRFNPjlsHnFyEZIiifhbwxZLBIk5BFTa1TJ/pUjlwb7z5s7X9mc0+S7NKvaSDTq44xllCWzY
 kq4SX3W8WTzx6PTZN6o5w8+EiUVa0JIdmYVJhzLTaKdnjUUujMwNu2FvmzTtmUKUKrlgUPC9Gvr
 u4quKaC9oPt6guSjQmotTY/tuVSJo2mj/Bd3GUmpI9VgQhM4aV1NjcYlusIKxr88RJASq8njtB6
 bSZMgzjdHvZdIcawhAG1cQBqPX04xLUPQP7Ah/yz+P5vPo0HagNwe3S6OH2tbsVF7NanliRuBjo
 uYKZhDmw8RYEN3LOIWWbMXfDNy6bqxZELOEX3sifrkpDBeqFLcEMVfiJTnD1uzDwQr8O9KoRkcf
 Ngc1d2V7ZlyM8wDKtszDDxc7ES/vF5vCEuQOK+8TAjVH4Ss57LzTcWrHqrcorDtu7nf9WQlGGZs
 br5uq+ikGiYSB5o4GGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250044

On Wed, Nov 18, 2026 at 8:46=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unlike provider-based look-up functions in other subsystems[1],
> genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> the provider is not found, thus not supporting probe deferral.
> Currently this is worked around in of_genpd_add_subdomain() by remapping
> -ENOENT[2]; other callsites don't care about the actual error code.

of_genpd_add_subdomain() isn't the only caller of
genpd_get_from_provider(), hence this would change other behaviours
too.

In particular of_genpd_add_child_ids() could suddenly start returning
-EPROBE_DEFER, which seems reasonable to me. My point is, please
extend the commit message so this gets clarified.

Otherwise, the code looks good to me.

Kind regards
Uffe

>
> Fix this for all current and future callers by returning -EPROBE_DEFER
> instead, and drop the no longer needed remapping code.
>
> [1] of_clk_get_hw_from_clkspec(), __fwnode_reset_control_get()),
> [2] Commit 18027d6f392ee8d8 ("PM: domains: Make of_genpd_add_subdomain()
>     return -EPROBE_DEFER").
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v5:
>   - Add Tested-by,
>   - Clarify that all other callsites should be fine.
>
> v4:
>   - New.
> ---
>  drivers/pmdomain/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index ee8075e90852e738..c242807f62579e5b 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3021,7 +3021,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>  static struct generic_pm_domain *genpd_get_from_provider(
>                                         const struct of_phandle_args *gen=
pdspec)
>  {
> -       struct generic_pm_domain *genpd =3D ERR_PTR(-ENOENT);
> +       struct generic_pm_domain *genpd =3D ERR_PTR(-EPROBE_DEFER);
>         struct of_genpd_provider *provider;
>
>         if (!genpdspec)
> @@ -3276,7 +3276,7 @@ int of_genpd_add_subdomain(const struct of_phandle_=
args *parent_spec,
>  out:
>         mutex_unlock(&gpd_list_lock);
>
> -       return ret =3D=3D -ENOENT ? -EPROBE_DEFER : ret;
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(of_genpd_add_subdomain);
>
> --
> 2.43.0
>
