Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794319417;
	b=nQVEh9LDYA8xS+X8KmQcl5OX6M/zCQlISs+PgpGo6nHr3Y71qYgao99B8ULldD/6ez8Q
	 A7JSuvpuDen7UXIwCwT3W1mUijzJnWHwtDqkJFp5cL5nnKWmo/sq3ayQFVD0SAY8vnzFA
	 HjRcG7IUFY1dfvpznyqR4kZbJS30jV/yOm1fRsB53CholcNwnThLw0+M5rAonLUpXXjMN
	 9OvizfiEeGJmVEr/e6BGUj72M0vnPUyn+LImj3FGBqTkXQoml0moUpMLmGy6RQtej16S2
	 J3gY2zszK4o1gOrfVWbgM2kQ3NMCKF+57geROkFDI7r3nGar8TPjrJo9lWf7Ag4ooMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319417;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ek5NNY/Kina5esSdV1eh8PHtvhY8sTVXt0HaMhKb/+M=;
	b=VYki4RQuhRzvKRyxOaF7j3Rf1v+N4/DTXSqbZP4Y6TmSi6Ui9eKbX9bZhrx7k7JkPgSp
	 /RXFuRr8W4SY6xicEztoH+apaKHmDO5P15ShquB7+8ghxYy4Pi3wjXua0mwHrMvPdkD3c
	 L5r27t2/Jv3yqV7UB7P1GXv33yTezKFqaRdaKDFmjzrnwxZ2ejvT6OhhYSpcI6/0hpoK3
	 UXvKUVvyUf5EnP9WVuozbZm+KktBJWMy6StGUvkBM3iMCHyn5KSAuM/mx9L0HT7EXZTj9
	 jXAkfTc6vXO84MjIbNIpTAe/881nF9xWXqkDIZAcLdHPTPQTpqjB2YUddV/dvoFuQ3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duCEkvbl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZZUliZfK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6950460A2600
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 14:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6950460A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duCEkvbl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZZUliZfK
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAGZ92688070
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 14:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ek5NNY/Kina5esSdV1eh8PHtvhY8sTVXt0HaMhKb/+M=; b=duCEkvblviFFNHrQ
	BFI3/JtAG3aSmw8heuXx6P5iVUOg/m5xN7jPov5yWeqyfAR0SOlV6YFMLu5I957x
	PNqsz+xC4i9iFpyP+aOH/6USXcwJQ04TM114LyKWkyToExiWrD2+FolaA/obNvhj
	jeiST/GFCv1T4h22OAtMko1mTykkLi8BH5rUt7mmIs6a9PSal7svLt/yZFCt+1dd
	UTsqWiBYBxyhwIgNernFyDck5yF6z2MYquYjLzpaqErlJLawSNYgjZEqhPeXeIql
	TR6/k06/k2IF83JUmQ8k/59gYxEEw2MiolPq2JOSjVHJtIGiVZCyunmNs9Iu/EZ/
	zgzGZw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp27r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 14:03:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaf3f829b3so17181135ad.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 06:03:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794319416; cv=none;
        d=google.com; s=arc-20260327;
        b=NFQky7hoqpciPmgMqE/+L6EgH902TyRRNee9WZjkVsBQSp08SGndsut7UFyE5bdhaa
         KdyqP4Oux7ghOD8xkVxhZOKI9iv2vl7s9hvy4c5ki8I6RqexRbLx/XCGV/MZdvax/Pod
         5pJWdII54tvTTWNq8CyupoVvtFFchrI6pFgJPuoqvJL+9IpThrKNpM0iv0cR0GsK/Fq7
         ql2+irudDB/zTtYNkJ8l+O3eHZo1dOkKQQXhxr6kogEAZPnv7WBhEaH6adSYXVdXKYsO
         Fc0xPpjy+n3+pYTC9TLYh1sx66mH9oM1syM4SOuEf+rxQemvzJUL6BbRoNamU8GZ6MYS
         Fn1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ek5NNY/Kina5esSdV1eh8PHtvhY8sTVXt0HaMhKb/+M=;
        fh=NL6gWrVIrOlzAb8GDqmajtiiOjd/6OtRqn0K/WSzvtA=;
        b=hKVIWval9H5bjNwMf9ftISUe9zeo8ZGKSwSyod3B6RYlO+SXzmwdZaEp31GFNduHtG
         Hwjqxu5nzgMJr2fATpjh+cF70BNdmNqmDwCxAZ9cWJ67gZWDLpATVhkBwAmnVdSzYqf6
         tZP3WC2fcp5ELAR820s9v/0tONwQ7ugR+qh4z54fZKl32T7sJa4fxZb6jct/D8XQRk5l
         eLimfE5kxMDLrM6VcXQiLbhdCCGKTgivxdLJZ43dPm9CyGnsr/ZCS8Jx+99OxDPhMWEw
         nqXcUr00Na8A813ICiAHlx+grPlZ1AeQGa5h6Z9k1w1OdE7K/ybGUy9SysBTXELu7ktg
         SWKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319416; x=1794924216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ek5NNY/Kina5esSdV1eh8PHtvhY8sTVXt0HaMhKb/+M=;
        b=ZZUliZfKiBmVwSXUrjbgWNZkQb0ZQLoCpVS0JYUF/2wNL5Q8VihSAFCMHkc58exuR0
         j9MmHsFHrnXYePaPrMdIEw1CKLcM14lwwSiUkU4ItAA2FsChIGjKbl9AfKLpeNHtzy7v
         GU/C6HRL23F9pOT8r8/3HC/kHBG6hv+nW1+yaTNyhdtKa4uYZtcY/9XGRE1Sqf2fwKTw
         2OnMu9lFn3Sbee0AEsvGrXXN7VSalX5MajV/7icl5wgzIoIB97Xe//yxFUr8nyRED4D6
         Mw+WjgLzoFY+VcEwgvhvq0Ann0hqkjHRxRqBlpiYKrPdWBXgrk5syfpc6nX0WVPx8Q7l
         8pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319416; x=1794924216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ek5NNY/Kina5esSdV1eh8PHtvhY8sTVXt0HaMhKb/+M=;
        b=N4yWdfjRsZY84+RIEOJZLRATYCqb9lUF7ipPg++/DsZ7UFxZVPkJoG9EjljPyX8Up0
         lpprWXKrXLxFqTAJmaNr6HTkUCciAvLZ2TX3k4s1RuV7F0MOze6BRc58y6eqCo+/Qpsh
         6dPhS7XR6KIxnc5OG2M167dmi9aHPtMGcC3WyVIgr0AoDV50A7CH0K8WGCyjlcJiB229
         nr1JS4UbRrwQsfn3x1n9BOU6juEDFlgiMVB/ItSuxtcuWZy6u9grINzOwdKU84Anb2Dv
         3A9jjyTBlDo6dYONVIUFp4D9cGHbs7GFRKNLl6ec6Tsn6tD+apGDK175oiy20PBiVofh
         wNgQ==
X-Forwarded-Encrypted: i=1; AL+hErFIg/lEx2E2xm9Vfmyo9zlaa1ogXB7y4cwAoM3Tbl51zDLkKCo/8VqOSN1Bz2AGcpS7wPjHHvcQ9lfPTxficfoGTg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z0VL4jvDO4lAubaFkvsQ53r9lrO1/3vmkyT88hIhJ8Jb3xMoJ
	Cdk3qpp1pgN7it63I/kCWiGS8gby0Rc2NzH0ssV9gwNnL4GoapOQ7+vJ2W7/smgddB1xMTHeZi7
	22oAYwtu/8boXPt75rlofQ8k2XS9EXtjufbhIOP77QQ1PNvECkFAt8EZSjn9/jtVsG7GxINHP//
	mZSrbr7VrglmjzdKRVqxn/Mzixa5wvTMBIRxNL3Qr4bkQOo6Ph
X-Gm-Gg: AYBFou0tVSnjeh2UzpRc66Vr2u623tCNHzYVwWrRLULgOa5I2U+7kgrh7Ue0DeEf4Cj
	azgNOpAWLwKFt1BknopDE5uDWwrYX5T7qNZNt9bcD1SkCwlfOwA9WeFlk7haCMS7hb9oLIOrLIp
	7l3fp2l5AHFowTK19qiDwRH7Xc1RN+sCI8mctN2IvZv2IWYYLvO5cYy9FX4Q==
X-Received: by 2002:a17:903:4586:b0:2ed:1b26:2bf5 with SMTP id d9443c01a7336-2edb929234bmr24126765ad.44.1794319415856;
        Tue, 10 Nov 2026 06:03:35 -0800 (PST)
X-Received: by 2002:a17:903:4586:b0:2ed:1b26:2bf5 with SMTP id
 d9443c01a7336-2edb929234bmr24126515ad.44.1794319415317; Tue, 10 Nov 2026
 06:03:35 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030143151.2916788-1-codex@local.invalid>
In-Reply-To: <20261030143151.2916788-1-codex@local.invalid>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:03:23 +0100
X-Gm-Features: AclHuK9c-6I-YAHtE9dTnl7aHjWrrxjIwBDk_O287mNrvM9-nmP2rQsZ5uVzYFA
Message-ID: <CAPx+jO-jo=1rZJ5ps127D0xoHnWmqZFmn-Nq+OkECVGvTQzZew@mail.gmail.com>
Subject: Re: [PATCH] mmc: sh_mmcif: unmap DMA buffers only after the transfer
 has stopped
To: Codex <samarth.colleges@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: bhqcMcKanxVSXAgCGqxuJSEkz7KwKZmC
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af32438 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=e049Jz8NGw_-8GbDANAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfX+PzGJUJWUXuF
 1m8SvxENiWa+bBi3NCtg1pwjHnI2n5QWtcei4uqO7bnt6PBKb+4jOg0G2DGC4xQIpP8mY7Ln0nZ
 FIu+tzLy1KzZwcppdcJD42Qa5vZRnCljTUrb+VOP3md7y+5cbnd3eV/ufBarfn2ecZ98PLl4fVx
 UE53BeLZYtDb+SEMwrOfPG/RQ985BgegQJwBcs4++j9xx+4HRSj/s8VZeDAfhVr8gV9NuLOVRag
 yNM9DqtmqAYUhutvUykDFel+DEaURoMLHBVlHIhqwRdzFTvrDtnc2s9qS5XpP+z3CLgphT7kH+/
 9a+fkZJ4dxPTrlS5VslG57t77UnZW8NIZj8A5VaBMVDRSDtSnSGLbIQPhBta62dVjfzR+k07nzI
 xBkvosHQ8R8ZNEbNfMocs6+0L/upHxtCsB+320cJ2zaBg5PeZSmcojRx58iwxbJSNJb7HHD5rku
 qJG27fTlfsd9ZuMtfuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfX94WY8VE5TQIx
 t0UIaQBnL1qgPA/S41N+U4TigZ6GFechpJE7i+cBo97Ic8+vAsHjz4s1rcGW9cozfcoK3dRcoza
 iXsnNJRbbRtPK4+QWHgfduG1jpb4jhw=
X-Proofpoint-GUID: bhqcMcKanxVSXAgCGqxuJSEkz7KwKZmC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100055

On Fri, Oct 30, 2026 at 3:32=E2=80=AFPM Codex <samarth.colleges@gmail.com> =
wrote:
>
> From: Samarth Narang <samarth.colleges@gmail.com>
>
> When sh_mmcif_end_cmd() is woken by a data error interrupt or a DMA
> timeout, the DMA descriptor may still be active. However, the function
> unmaps data->sg before clearing BUF_ACC_DMAREN/DMAWEN and calling
> dmaengine_terminate_sync(), potentially releasing the mapping while the
> controller is still accessing it.
>
> Since data errors can be triggered by the card, a faulty or malicious
> card may cause DMA accesses to continue after unmapping, potentially
> affecting reused IOVA or SWIOTLB mappings or causing premature cache
> maintenance on non-coherent systems.
>
> Move the unmap after DMA termination so that the mapping remains valid
> until the transfer has either completed normally or been terminated
> synchronously.
>
> Fixes: eae309836509 ("mmc: sh_mmcif: Terminate DMA transactions when dete=
cting timeout or error")
> Assisted-by: LLM
> Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> This issue was identified through static analysis of DMA lifecycle
> ordering and has not been validated on hardware.
>
> Since the request pages are not released until mmc_request_done() is
> called after DMA termination, direct-mapped pages remain owned by the
> request. The potential exposure is therefore limited to the DMA mapping
> layer, including IOVA or SWIOTLB slot reuse and premature cache
> maintenance on non-coherent systems.
>
> The fix also relies on dmaengine_terminate_sync() stopping the channel
> correctly on both MMCIF DMA providers. However, shdma clears CHCR.DE
> without confirming that the channel has stopped, while rcar-dmac polls
> the bit for approximately 1 ms but only logs a timeout if it remains
> set.
>
>  drivers/mmc/host/sh_mmcif.c |   23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
> index 8bd9cdeda..7b33f832b 100644
> --- a/drivers/mmc/host/sh_mmcif.c
> +++ b/drivers/mmc/host/sh_mmcif.c
> @@ -1173,15 +1173,6 @@ static bool sh_mmcif_end_cmd(struct sh_mmcif_host =
*host)
>         time =3D wait_for_completion_interruptible_timeout(&host->dma_com=
plete,
>                                                          host->timeout);
>
> -       if (data->flags & MMC_DATA_READ)
> -               dma_unmap_sg(host->chan_rx->device->dev,
> -                            data->sg, data->sg_len,
> -                            DMA_FROM_DEVICE);
> -       else
> -               dma_unmap_sg(host->chan_tx->device->dev,
> -                            data->sg, data->sg_len,
> -                            DMA_TO_DEVICE);
> -
>         if (host->sd_error) {
>                 dev_err(host->mmc->parent,
>                         "Error IRQ while waiting for DMA completion!\n");
> @@ -1208,6 +1199,20 @@ static bool sh_mmcif_end_cmd(struct sh_mmcif_host =
*host)
>                         dmaengine_terminate_sync(host->chan_tx);
>         }
>
> +       /*
> +        * An error IRQ or a timeout wakes us up while the DMA transfer m=
ay
> +        * still be running: only unmap once it has completed or been
> +        * terminated above.
> +        */
> +       if (data->flags & MMC_DATA_READ)
> +               dma_unmap_sg(host->chan_rx->device->dev,
> +                            data->sg, data->sg_len,
> +                            DMA_FROM_DEVICE);
> +       else
> +               dma_unmap_sg(host->chan_tx->device->dev,
> +                            data->sg, data->sg_len,
> +                            DMA_TO_DEVICE);
> +
>         return false;
>  }
>
>
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
