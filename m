Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586E1420475
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Sep 2026 15:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277579; cv=pass; b=G7DfqhNW2iQvRQazBfZZBiui8/fEFcjePH4ch6imP/2p0kI2HtgHsdNmDc8DSXaDmPyN7ecqJem1V8MfiXc2iEd7M+3K6ql8oO4nY2G9RwyYfJEp1+3ad9m6mybXVN7dAMLAfkLEJKLA/+kjaq06Xwe+S/TrDkgMPGi0GeFXgeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277579; c=relaxed/simple;
	bh=kBO/AzoZx1ofZasrbnMAMlpidRtyOjDHcD5P0zRr+dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePWcHx0YVrcZCR92GUx/JUo9q+UFI6bC1/xz46A3Mrn+90q0OmL0n8BplBdEyeI292kp8i6V668ucR0ksomZkfSBxrt5UL1iuHcyy0H2L0Z7leg8lK/aebS/pS5HLp/w83y1LpEaMb7DzzuLPBhFU3Dx+IIXk+uRPyfNjIBIj7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n8d7mRg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aXz/ab7L; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n8d7mRg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aXz/ab7L"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8YFd2270330
	for <linux-renesas-soc@vger.kernel.org>; Tue, 1 Sep 2026 15:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DXMurLz1uw6v5dbnfD45z53kR9FFKD293CZNB/HTMoE=; b=n8d7mRg28ll7i78w
	GqCzjFy0bizbLYoxqeGEpp6HFGBcrpvYeGy0TgT44jO0MzXaTLOz5lSZQRx/cifK
	Qp53mkNeloVnt9XCz8Wkl2Z2UjvxruvtLNSWce8M5UCfS2XYre+q28svzAdUAN1a
	oO0WPu+sbLecb5I3Yl/150I4ELsWPMH2+2EEJF9sywBuK4Le/v37rX2UlYJrXRFV
	whYQjE1yZFKS/Lona50Jy1d5URXP5IqnzVgObOGpy6OmC5WelxY9gdSww8RbVmeJ
	mko9TaWKwNKqgfguXDScgTLVfJUpaSjTAq5CaDMajq5yWdPM1KFYXyfoaMDJAld6
	XRrawg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx443x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Sep 2026 15:46:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so1537674b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Sep 2026 08:46:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277576; cv=none;
        d=google.com; s=arc-20260327;
        b=CBYpYTvIO62OU7SLlnh7AGXosxuEJDQWrXwKgJS6cQoXzd9IA8UNyYbLOkqMC2H6f9
         jYjFSSr9ODDC4xyL2ky7QllKwJ8CLR/oPt5MLD3qxJvHqAmi/9r+uifvfG5zdfN7XLat
         cFbIWYH4UUMHJIuIT84mAlCqkXJqNLWmPRkkk2bxjZAH4e7suliCiheudS0pGzB4UFdF
         i33wppoTWLyCPQXqHMQbBzJdv48Gn3mUGsfEKWrHHYQNspr1x/xztiQ0FeJkHZKpGq1X
         GCuvItgvRH7BjcxdpAGeuntCpWwL/oXC4SM57tQHJ6D/yMV8oMsJ+bpT2cZqcPRSbr89
         ypHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DXMurLz1uw6v5dbnfD45z53kR9FFKD293CZNB/HTMoE=;
        fh=aw0tOYOLJqaHOOyhHCsko4GBjPN3iFAqAPGsN+WMaQo=;
        b=kGsNBaoTJIIuzzlQ8mGop2a1M6uAVw4Jsz6d7TFhGn5W/fo0unUv29w6hvMdvqO5Qv
         7ZK3owMq/argWD/DBLpCcJl5AKZq4xqhFJgt/ZyA1s3/6FSq7tGwSgnby7V5W6RelekW
         WG5X2eXRhRu01liMdwaLFnHho2wSCFIoMqkJbXUhaCL6JioPyi/KYWTRvtgtZTwjI9db
         fiHPFg36236SGcEZ6Nz9mfeJUhBjPRlRcQYBJCGarigsfbAQaNMz41uG4CPuRYqN9Nof
         rfmA5n0QglzJwN4ODRB/8SfpnGJQq2JgSHzUcB37Tv20ckYl3g50Zq3L2QoQOkpvI+F6
         /GGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277576; x=1788882376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DXMurLz1uw6v5dbnfD45z53kR9FFKD293CZNB/HTMoE=;
        b=aXz/ab7LQl9y63RellizNIOD0WjddTGovZcxQhYNNMJ95HWsOXIgbbHfla3sHhexE9
         BLTIvmt6tIh4Jem5KJ7xQ7hypnZbtlssFTgdX/2xLLaZl0nWd8nJNQz79dRaQLXnnfZA
         CQU38jXVEx3x3fPC5f99WHkR9iHdyZTpBwSwwl9JuGCncNYZa9AIVwWwjQNHPLGLi/xU
         pHuCNWHDL3xPEkMek7cGnnJzHfRNTLAMmvXB/TSb212/h6Dm+zbm87X0uDoz/yMy7fVa
         8Dx8MigqsAp0nG8S1DIxeTeVbm0OcTJde7IY82jXeykkf2l8+rsGMQQM4gso5ISsQkyH
         Yfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277576; x=1788882376;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXMurLz1uw6v5dbnfD45z53kR9FFKD293CZNB/HTMoE=;
        b=bHS3AFe9nc36FZx8N7z1MHn3HE71LFBB2CjrRIo+q+V3IkqrbS+3V/OzirKj1HC3Bp
         qRa5M4p+0H3qwt2jdLCmDJunMQrVXhBoJw9Z96fs1t2hp7Jcn3Q1KEeyQH3+5FLgJx8V
         w9lkAnHtgt3MHx5U2sXdFU4WtDOwbEb2kHuFHRUKSwNjtcUkwJQgFENWzrZdmHwqMYlx
         y5xfbub7pSzwnvhWtya/IW7LmTwFBTpDGUGjivKpfcfBrLxpKAhPlhrm9sqBDldeJnU7
         /1TxTJgTJLkXi1QLLKoobXdkg0zfFs4uPcHsl1/yNZgcM1YWP6a+ZQgBa9wnPcdNcnet
         O8cQ==
X-Forwarded-Encrypted: i=1; AHgh+RptM/L88kcniwpdqaS4uNUOR4+KdTQWx73u+qdDn06NCKuh6fG3rGRVXZKJwXuQXDjaLnJ7zwGTX0DjaeT2JqlApw==@vger.kernel.org
X-Gm-Message-State: AFuF++lguCLIXAy+FJ8nMrAF7F+AdNY3Jw0t0awwDzMpfsSW2L0qEBC9
	M6qe54wGsJG15yd1tvtlRxw8mC4SFTX2IxVsPj5bYHE0AbBfZq1HjFGYeN3xLx9ZTUjTKGsWIIM
	oNoLZI/j/NM3KTbm0yuzO8T20ZZtXtUkdhu5k9pmjJ2dfEEiGUokQ5ZvIEHdXcYwqMahOMkHA0j
	hvLxutq28wb7JhmzCAtShEXE4DeWn/ARt11iKByh6Qpnb84nJG
X-Gm-Gg: AR+sD11BUB/lFpwKtu7iPDMs9G43b1t+8FLhpBjI/oeTAHr1+1W5LVHxPnfA31kcRQC
	Llu83g3NOdUsESPLVbGw5vb6k4tlhiYBsyYvCVYfS/1P/3gUIDskprCXDem9oM6MxRkty1rU4ji
	fX0qK+f68cJNTtaVQbk2PDBjwyvOVQ0zku2UVLwOayY4CFq23dwXyWpui7Pw==
X-Received: by 2002:a05:6a00:4191:b0:853:430e:6b60 with SMTP id d2e1a72fcca58-85bcbd8ad6fmr5717520b3a.14.1788277576245;
        Tue, 01 Sep 2026 08:46:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:4191:b0:853:430e:6b60 with SMTP id
 d2e1a72fcca58-85bcbd8ad6fmr5717449b3a.14.1788277575650; Tue, 01 Sep 2026
 08:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826101316.22193-1-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260826101316.22193-1-ayman.chaudhry.kc@renesas.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:46:01 +0200
X-Gm-Features: AcwNN1Wk6oa8z3X-T1jHCneIimH6M9AciAx9hJy1lSv_z1qxgSpmHgEf1Fp22kk
Message-ID: <CAPx+jO8eNBgcWf8d8xUhS6n=a4ztLV1ZSytTyMMqj79f0SFLeA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pmdomain: renesas: rcar-sysc: Update description
 of chan_offs, chan_bit, isr_bit
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96f349 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=yC-0_ovQAAAA:8 a=ftZ7uTllurLVGgvAASsA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX7siOs5UzIHiJ
 ri+TPShyF2Socq7FkkIHG30wYDwb59FMDTP5SXtHyx0Z56/E0Kgut1O2OHcfcfgtxZZT6NsxaAZ
 KavCV4uQlqZyWTaxHrzICruUiFXX6js=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX6YBF2B/5g0kV
 iQl4hjGCAMadCmcwET5InHuKQzPg6RSquvFLFOI3/l1pMykDVGKXqpq4vd98qAerT/BVC/98fgz
 Ny8dDRyGpYB6tD2E7TAOA4C6Tqy6+BkOlJkLgqDYQqDp7XOTcJN46gDlpTX9M143XQRpIBu8T1b
 Mx7BDzvFuN/JNBB18IgA4KrtPIIcildpbzDnkA8o67t3wx51q8LjZxp153f0ilb4/A1hILMo+is
 VSKVoyw4oqMbCkCDhmFXB4oPt+xB/3VxNI0m06FVniSNCbSnjRNHdgVL8Co5tp5L0FhzIkTZBiQ
 z+19XSIdCJyGyX8Lp0xaVMUdpJKWxnxVXLwLqJrW3UT29I0dptltVD0q54uk6qRY5kb3WFR9CrF
 BnjddGaMfy/fGVq3CRKz+8ecuM2v8Nr5fiqbyNl47mF/Q1hNXaqyFXYl8VHzPqBOO++GowOFetN
 DD1BpYPo8KDMEOBsZvg==
X-Proofpoint-GUID: km9POEXO2fUU_hz0zglbq6t1i_lOxoqP
X-Proofpoint-ORIG-GUID: km9POEXO2fUU_hz0zglbq6t1i_lOxoqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010139

On Wed, Aug 26, 2026 at 12:13=E2=80=AFPM Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
>
> The descriptions of `rcar_sysc_area.chan_offs`,
> `rcar_sysc_area.chan_bits`, and `rcar_sysc_area.isr_bit` do not clearly
> document how these fields are used.
>
> When `rcar_sysc_area.flags` is set to `PD_ALWAYS_ON` (i.e. `PD_NO_CR`),
> these fields are ignored, therefore improve the description of
> `rcar_sysc_area.chan_offs`, `rcar_sysc_area.chan_bit`, and
> `rcar_sysc_area.isr_bit` to make it clear that the field is set to 0 if
> power is always on.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v1->v2:
> - Updated commit title and message
> - Changed the description of `rcar_sysc_area.chan_bit` and
>   `rcar_sysc_area.isr_bit`
>
>  drivers/pmdomain/renesas/rcar-sysc.h | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/renesas/rcar-sysc.h b/drivers/pmdomain/rene=
sas/rcar-sysc.h
> index 9e93a1f98f68..b264e727883b 100644
> --- a/drivers/pmdomain/renesas/rcar-sysc.h
> +++ b/drivers/pmdomain/renesas/rcar-sysc.h
> @@ -29,9 +29,15 @@
>
>  struct rcar_sysc_area {
>         const char *name;
> -       u16 chan_offs;          /* Offset of PWRSR register for this area=
 */
> -       u8 chan_bit;            /* Bit in PWR* (except for PWRUP in PWRSR=
) */
> -       u8 isr_bit;             /* Bit in SYSCI*R */
> +       u16 chan_offs;          /*
> +                                * PWRSR register offset; or 0 if area is
> +                                * always on
> +                                */
> +       u8 chan_bit;            /*
> +                                * Bit in PWR* (except for PWRUP in PWRSR=
);
> +                                * 0 if area is always on
> +                                */
> +       u8 isr_bit;             /* Bit in SYSCI*R; 0 if area is always on=
 */
>         s8 parent;              /* -1 if none */
>         u8 flags;               /* See PD_* */
>  };
> --
> 2.34.1
>
