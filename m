Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794400677;
	b=I6xRRTCUF0bDwkXJSMgnEKq4gO0mWzqHlKXFzhBmV81qt/P4KguEqLMr1EVycCUlv4zz
	 L1lpX9Fat3L+lKeT4IZoSA+YMeA/xTPYXeOl3+VDeyKsbIFWo5AvWOSP4dunyXk8njfMO
	 b+0+uPxG3s3lCbAnCIXCWcJv8pq+lgcpOd2v0867O2cNuQXWVX7i8e1+6xKMHME3jh9//
	 sY+0RGqj4FpFwDEoErDMPRewvXBkYlXpPf1YODGgv6JAqOc59wCE3cIjRcKrc/wU+olX/
	 TTkGxPLYGH5PyhtMiK8bePRrSS10tOYnOerdKTGm7MTpVICrCS/IFZMbc5F5T/L5vwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400677;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Gul0DZZy2os3Oi+7MpRNBs1ymdpKQ0Ark8+uU45of0k=;
	b=hqCUQlokiJo3TwVoRL5zg8u6EBUU+UpTCmANpelNRvqvgoukfA5/vb5KtKtgQbCgvVZF
	 uWhFVj9hLnDNI8cNssD9s+UXlpWK1AbplV6owmLHAUkk0GdCShg6P1kqso/7QQ19yPhY9
	 93Cp/yNvokjTWxc4gB7uEB8LUlEoi7d/G5/A0h3MfZzjHRPY5GnCQD4wy50VV2492zpJ9
	 IAdLj+ZK8xf3Si9XTaZg5VqsEYcPxwWYEWWttmjbFR6aumUFz9qaTD0HSi8+jP8oCNFHg
	 ZneHixpyjf6mjwhMLi6cyUjxndkrxnl/+JdF761TKbNBClb20uMFEgHCohyLV4GnXHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ObCDNI7m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d8SCx8aw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E138606A33A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 12:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E138606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ObCDNI7m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d8SCx8aw
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYufJ1806586
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 12:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gul0DZZy2os3Oi+7MpRNBs1ymdpKQ0Ark8+uU45of0k=; b=ObCDNI7mu00vdBlM
	BdBftEbOXb0MFSAzbf38IabYbXVhCYnZv+YNaCYl7C4Q7AS/dDd5M3CswUF/aHGz
	OAIQ1Nh/zwCm4VIaM1tK9AidZpylVdpLwsvEkGHcUB6ceKGi/JvBnZ4fqZyQ+Mar
	iuCNDgxdNDWqL3Fmm3k+67gBLEvrriB5uKBnhPxJ+6rLV1b3mIJxe1Mbf6F5cS0j
	M424PRdc8UuxPAcrq/2q35bmVPUVqcYr6AlcR7A9kOlxmK+Ip9zCPrJ93BSkSEBp
	48JKJbHtDL0vSEiX4oRyWJxON+Vu/kFzSqLBAj/dzc5PQhQ5IGHpj7nuEv32lYYH
	BmRZ0Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawj4ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 12:37:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so2859642a91.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 04:37:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794400675; cv=none;
        d=google.com; s=arc-20260327;
        b=qWX7NSz13j1s6X+nJ5dvf2+dU/5mHj5GuDsZoKjuQg3C7dnhqKQD4Ab0UU+PGLfl+U
         ElU1ehdbnatpK1q79MKMbOytAfcARjO9MJB9B0nFVLFY40M1DUp9SmTQYthwWMomsRmf
         uGoG3QmWi2KaXAewBEmpf9mn2SPpco1w7sL0ztKdMYwE+4BXISA0nbTZoqPSF5WrGHlx
         FyNF0qdRStVNO3EqmYeKtRudJlH/QgXekruhSZXZaLexxvdCjm50JEHVjtM0Dc5yAVb9
         IqEbUaZTQtsVYFwTCpfL4DYW2e8sG6cRi2ngcMTIe/+U4hhhMBKZYKoIG9nSbnFjl1Ze
         bA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gul0DZZy2os3Oi+7MpRNBs1ymdpKQ0Ark8+uU45of0k=;
        fh=YynoBAGSyqIXcACBMmUaBwvNxHkl9bZcVsuGiKe+Sos=;
        b=Ad6WcKt1WkiiMYMxG73/lAHlwjn/6bsMErw+XmMuz1wQMd8a1oYEvOIqYrat1cFnjh
         ouZQxFmtUhIAidjH131LiQ0TB88YKVCj1A1aRcLtuAfHX3IsKSLAFPjCMh0MRgqZuVaR
         LTveYp1Qv//aSUD/8SbDqF8vdqzIM+55OgeQiKFPT6RMijo5e2gndeRMDI5bO4hTw0nG
         NbKl4H2V4/tFUOOrBtM4Z/MZG2sJxCeOT5Put+XOJ4tQ39/ykISummeVRICLCPMLdFMV
         jpRFFusbcvIGLOOkeRxiv+0i8HcY+sR1Z4E1ZzTCGaLwkfXFIhaqKs9wL38Gqzimfxnx
         l3mA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400675; x=1795005475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gul0DZZy2os3Oi+7MpRNBs1ymdpKQ0Ark8+uU45of0k=;
        b=d8SCx8aweQlwQ2YxeaMGmjD5J7/IfmK8T+IN5kjZRKgZPojzsT6xY1gEDFdpg6m2/K
         fLAtMG9oG0JnGrsALGFmjRjj2pBCG+CAKTfzb5eT9i4bS8fNo+EnQEo/gpgF8Tte3CAG
         hPQ9BSWfMu37R+o854ad0wJSj+2os9GQ2OWKL1JpTBHdJUlw6OYyvX/PJZSi5vwsuTd3
         yxFQ/kx8iHWfeKbqvUK+Pg0eEVRrpGhTXkrUS07U1q9bYfy0BKtdLrthVEr1CUlue8sz
         l8IHGRQCU+TxAcXGFd7/1GkSH/TFjVciVgmMd5Y1yCy68aHe8BaOlJTigZ+kCmOgORLR
         d+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400675; x=1795005475;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gul0DZZy2os3Oi+7MpRNBs1ymdpKQ0Ark8+uU45of0k=;
        b=EXtjvwt0OkKqF9zbH24SzGs/MglccowmtiUxci9XR2dCacWl/6JovRTyesCjWj2VNd
         FzGGpk6EcStvvinZ4XVqFi0IzdJLY6N3Ce5vSHIcL1RVkr5E/XO/GP0amwTSRW+Wndfd
         pNWjc7Y0onfR9lyM3K2JiYRKmUPfqathPXiRtrsQRrrAY61mtsEuqu7DyS0cijieMsm/
         hl84IRz3f1yq+ajujx/2ZeZ9WsZRpTVKZ5debOzNIi4ObkkgL3Ni1TVq0Vk/NxppZ4OB
         V06gO1pF296tKEc+s/s4SpAAmH6W0avGyVSBBdfdyQw7v1exKSdbafMGCz3VHNuhOaqe
         Ap1g==
X-Forwarded-Encrypted: i=1; AL+hErHqIWWLf5/mGIwN7dTMxtLA6+2pJZw4sCj5cmT1JNzSd5rYRhR+J5SrDM2+KCHk+fTuNQszRXeO1DT9qFhwoCzgkQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z0U7VOGJou2Et9TX8YKv2glL2+RQwG8jGQq86sC0GcY7FJe94
	H3Qfidp7WbrOCoNI182/7ImKPx19ZUsp9YAvoY5H31lPWtx2gv3ZbmBYMpkQdPcJAh+CQViiwxM
	SUNY9q5Yy/3gYGEXelQ6HdEvr+DxDGA+iL6i6zkFTwvqszvgegodIHrXbTl7uq2XzEzge1kHMST
	TTUYp1++OI1Z/NHBnyD94Z6+9RQJmdhFgB8glrIPQNsmxzkmCr
X-Gm-Gg: AYBFou08QF35wU2HrRfUogBvZH6Nmr0NPdfDfX26Fz2M+9j0qt7dCQGht3Kqe/6XHgt
	/vVxt+40MTWvQmUHGgL4oP3Ryiu9rkRPy6S25UZnVaEVrut304W0lKWHJoBRuAA6qnthaI8/FID
	6mejGUGQ4w94sNs7I2fn9qVJF5rO09grGSzeafNyWiJIT0l8RH8uPlmNuhCg==
X-Received: by 2002:a17:90b:51c3:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b182f9d62dmr1559002a91.39.1794400675202;
        Wed, 11 Nov 2026 04:37:55 -0800 (PST)
X-Received: by 2002:a17:90b:51c3:b0:3ac:9ad9:6afe with SMTP id
 98e67ed59e1d1-3b182f9d62dmr1558976a91.39.1794400674641; Wed, 11 Nov 2026
 04:37:54 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
In-Reply-To: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:37:43 +0100
X-Gm-Features: AclHuK8o0uVdfxHZAmhvgIoBqg4smXNKTRXKoYRu3--Rc_VHFBtg03dl4JTb9lM
Message-ID: <CAPx+jO-Fv_qnq_ibUP9A4iY7k8d9u4W5D=2PzF+w9oF0NXDDXA@mail.gmail.com>
Subject: Re: [PATCH v25 00/11] Add Renesas RZ/G3L SD/eMMC support
To: Biju Das <biju.das.au@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX9rJsSm9FMuru
 WYSbdyjB529pkx9uEwPKcLEG//qdp/HQf8NRjHZZgibzCl6HvGZQVtaAO46Oe1jonVBw3Tpxg46
 pR4nDkzNT8InBJyD2Lt7eG+0TdRim50=
X-Proofpoint-ORIG-GUID: OIIJuw02NPpGEEXCwCOr3TX61w-P39LH
X-Proofpoint-GUID: OIIJuw02NPpGEEXCwCOr3TX61w-P39LH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfXyd4DwwDNTHID
 ayfI2Sj82SVwp5PvDHRNZm61fFs+pqIXF0CpB78p/m7SFu1kDUJ7XXX7RyRCtTGkehLdnzE3wM4
 ofiEWppr+V/mbx/e9tk11K0BVfoD7BNC1HndENOBN0AImqf4Umle3St/t9R4DezqNXWa3CUOxSP
 hJZfG5xM724M2d0rjoh+UJsZ7TJG9y7w+CISmBRxBa197V8vudt+PHN5h47V8FsLq2BhcXUmNQU
 4lOt++pSwoAuhaT/fPSFOB+t4qqRuzssnWwynCMNz18XjyZVyo7srdAqHnlBa5OU+ZjR67Doz9x
 wEbqZGz/AFuUomuy6gNSHqYuN2hjl6iEXNA/7mk7y94GBHywqJ5zFhEz1gDbuCKcB8g74NmVI45
 Ycpy0MyjKRlEaZNUzURIqrV85FF+nAPs7jkIiAxBIeMW6Xhxuc26h6LReHFQdWrvYSO8nesJcKd
 v9BFshfQyVs/zOJ/XJQ==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af461a3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=F2NunwkvNQPXbRNSDdIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110050

On Wed, Oct 28, 2026 at 1:51=E2=80=AFPM Biju Das <biju.das.au@gmail.com> wr=
ote:
>
> Hi All,
>
> The Renesas RZ/G3L SoC has:
>
> Channel 0 supports SD and eMMC (including HS400/HS400ES).
> Channel 1 supports SD and eMMC (except for HS400).
> Channel 2 supports SD.
>
> The SoC supports a maximum frequency of 150 MHz. The SD0 interface does
> not support IOVS and PWEN in the SDHI register (no internal regulator),
> unlike SD1 and SD2. It has an internal divider for all modes except HS400=
.
> It also has a 2048-bit divider compared to 512 on others. Moreover
> RZ/G3L supports HS400 enhanced strobe mode.
>
> This patch series support all modes except HS400. HS400 support will be
> added later.
>
> This patch series tested on smarc-rz{v2l,g2l,g2lc,g2ul,g3s,g3l,g3e},
> rz{v2h,t2h}-evk and hihope-rz{g2h,g2m,g2n} boards
>
> v24->v25:
>  * Added max-frequency is a required property for SoCs with internal
>    divider.
>  * Retained the tags as the change is trivial.
>  * Restored struct of_default_cfg.
>  * Updated commit description for patch#3,#4,#6,#10 and #11
>  * Dropped initializing clk_mask as it uses the default value.
>  * Added suffix ULL to macro SDHI_CLK_MASK_DEFAULT.
>  * Fixed a very low or zero clock rate from the clock provider that cause=
s
>    an infinite loop in `renesas_sdhi_set_clock` by max operator.
>  * Restored the data type of max_divider from signed int to unsigned int.
>  * Dropped initializing max_divider as it use default value.
>  * Updated mmc->f_min calculation with clk_round_rate().
>  * Updated the comment using "ilog2(max_divider)" instead of "{9,11}".
>  * Dropped initializing clk_div_mask as it use default value.
>  * Updated renesas_sdhi_set_hw_adjustment_delay() with force_clear
>    parameter
>  * Added a comment in renesas_sdhi_execute_tuning() for tuning delay.
>  * In probe, if the SCC registers are not available, it clear the tuning
>    delay flag.
>  * Dropped default masks from struct of_data_rz_g2l.
>  * Dropped renesas_sdhi_is_internal_divider_enabled().
>  * Added a comment about the internal divider in
>    renesas_sdhi_clk_update() and replaced 'clkh_shift =3D 1' with
>    'clkh_shift--'
>  * Moved mmc->f_max to probe() and made it fail if max-frequency is
>    not defined in DT for SoCs with an internal divider.
>  * Updated tmio_mmc_host_probe() to set write32_hook() to NULL if
>    TMIO_MMC_HAS_IDLE_WAIT is not defined.
>  * Added macros RZG3L_SDHI_SCC_HWADJ2_{1_8V,3_3V}
>  * Replaced the quirks sdhi_quirks_rzg3l with sdhi_quirks_fixed_addr.
>  * Added helper renesas_sdhi_sclken() to handle 16-bit and 32-bit access.
>  * Updated renesas_sdhi_set_clock() with max_divider check for
>    TMIO_MMC_INTERNAL_DIVIDER instead of SDHI_MAX_DIVIDER_DEFAULT for
>    consistency with tmio_mmc_reset().

The v25 series applied for next, thanks!

[...]

Kind regards
Uffe
