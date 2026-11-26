Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795699951;
	b=xCso8YjkRB9xphYmq/KV8lJiD6dr4TyXQ/1Uyds/Dpn5+sKpk8RybGcqNiq6nnwDzK7j
	 DyVO7a5JpOE9w/xqu0foCtg6CfhnQ2WJvpIoItIzGXUjefEBKtp1NcCIU9knRt18bbVoa
	 rDV7HpHu/nI/WqSDzDI8DY/pPwDXBnDuWVUhTV0nfHy0R7r4dflv+24TXY/szKPPYnF13
	 llPxZUscj/YqYyPPWClxISIsw6Lvh0NZof8qpmd2IMxFdLIibiV/C5LbYAG84SQjgZf6q
	 8uKqp2TArfOXpNtFio/QvHO8La9tajiRtUnjnEIm1wVvEKP1B3rYEoZus+Sak+2i0SA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+9miH9ajMglEU1T9v/p5qaesHmImKy2AVWQklFfrU8M=;
	b=b85WOpuGNor6pYiBzPX2OLHl3eP5d9+U1QbHNe2pSG7uQj6MIk9jN97wBYcB7Vs9M6Zk
	 wAWk8KLmC57QcyaPNwKIHkOSR2SPHDZe/eAMmWhbpzXAK3WA8ftyzoMoJkLudcnN8Rr7N
	 GfIrLPU7czissZj6Zl4Kn2IAtjQ4EJYaChNy2gb7uRr2zP7JpAlx2XZeSiF8nDCNhbmjJ
	 9HR6axxyRBwB4pF2QqlbX5ubIL8QRkuUFDvJoxxEa0SeGhdowaEi9hMgXYQ5Wunv748oo
	 4kA0K6ffo1Qk7lWmtC/69RicKJ1A3SuP4Q19xwikuvb4BPaPOnnmkv2xygc94Xxg7Ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O474cMuf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cA1zTgKv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A007606A332
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 13:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A007606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O474cMuf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cA1zTgKv
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVQE23277988
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 13:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+9miH9ajMglEU1T9v/p5qaesHmImKy2AVWQklFfrU8M=; b=O474cMufGk2k5Rvg
	0oFgqz7ZcI4auS15ppYaNM7jq1lVpF5Ok5M3nBClKNX3UPt2yJ6YX5/VLaVqwBRr
	Pp3rwzqBe953cG8DD6w0lKCKi3DjXZE48rkwHKnVASb7i9p3Sr+HM6UGnj9kuxM9
	j57LbTPXlcLV+pBeKWlEoFRxikEYWkdgmfnMdcec6SGSCxG0AsKXNgR9URVz7Cny
	x0Nt6m51lVgR+IkxmBb6AUdPfdCwzimOYok1t5bhnFJf3fkhNsVQVXdkypG1aRgA
	8NQZvFSa0794u3KxPuLmO2WoeJbrzEWY22RF04hNSrbo5UA4i9zt1eQB92nR1Jyc
	yYfU7Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g9458-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 13:32:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b4139b7abcso6188784a91.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 05:32:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699949; cv=none;
        d=google.com; s=arc-20260327;
        b=V3AKJBjcHeZE+GaYQOb7WYexWnUxlG5ty4ehOzrU2liXq6AJzYBenw7lHVXa3bE1r5
         Mx2YjGvuPaHPwvyNOqa5e1N9FJdaLkLuYZQFlONOkQ2ZQ5ZKRAL84pS6fJGNgvUirodI
         G5nQT5MS7Q/qgEO7tjD3JmHTb/OUeX8kyQbDCESOdsPO0f75rXI3pg8qz6XneIf3x5cF
         QwT4/n2PLF1yyz2kaUXzLyhsXqOn7wj2lCp65vBLuK6NWwukRc2SjliGedABpq3agb2i
         hPX2j0PHiPu1/z7GFF0yc5P2glz2frIf0EC3n6NJVWH9a0xQBNBsEVDwo6R+dK0RyaP1
         aahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+9miH9ajMglEU1T9v/p5qaesHmImKy2AVWQklFfrU8M=;
        fh=8KYce4Uwi4iOU+A38l39nxg1zztuUxBjZ6f/AkaLwMQ=;
        b=O56ekmSjWczFeQsyYK9C97l8fkH9FE7n8c81b5CJ1ZbCYoC94KwNJsmp6EH8FBaAlN
         n6A7GrowkEo3nSwB+ndBK3bN8fxCyePgShjcD3JNUE8xV1OPDEsfEfqRHl6Fd3QNeNf3
         buL7ZIES3OqwBVPt89klkwcSImYgyz/wCRigdTTPt5o/2kgfga4OPybtSRwylZQtARHU
         uSyrYCTenVhE748pyiC9ZgkTULpQdMA1raW5CHKAMUGWEVtjOGY0vFFhEZWqpTtmsLCu
         kPT6l67U+Om1ky+ryoXztLARor5C/i/59rddaAmzDerwbzm2Afm38UEiTC3k7gYywgl0
         zDcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699949; x=1796304749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+9miH9ajMglEU1T9v/p5qaesHmImKy2AVWQklFfrU8M=;
        b=cA1zTgKvCEoGBovNCwpez+mvNVbXXiitOsgbg4FK/DNdaEKyPuDYWbK2h7Hotpd2VD
         d3LbTIhc+dxCD/7lJOMiRqUlwO+7iNL1c8kRy/eMEQd9hR8pzwboOMxhH3X50Ft2bWRa
         90cRtKodwYNklqqZ6PgrA2cXVkoQ9crQFEkGIfmhEzbzUdm19U1krZuVUuOoqUq+t7gw
         8jRdVpVBAHh3Q+/aJvoxSqVlCBJfzdcad26qfQ+Co+J+KtisuR4bSaA4yiKbHsIytnj3
         YHKV8tYvD7ljqt3GdTTtigoUAalTC+o1mgqf1Gri4f++nQDRgFjeQEKrwFn/Cj3NbK9h
         YWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699949; x=1796304749;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9miH9ajMglEU1T9v/p5qaesHmImKy2AVWQklFfrU8M=;
        b=ANWLgV7yRWAvXKRmd4FL8mPLD6shb6M4fJDB9FP+oekMdSEVBJldIKsv/HmVNrhEsq
         RwLpw7sKt6P+vYo3q2R6o6mpXV3ylcQrETlgOvgOOcRolGSjs2B+tpF7C3nomYzoMk4U
         ebEzx2lbL52Xt7W9/TOeizVZjpxUxBXfaIQTcM+E1AGYXvgbYmY86EqnOfpVAeaJ9N1O
         0/uqw/cv2fx7HP8nAisrlnPOKTaLBkXBcNLYwcNArP0XxdaWpD9sxBH+f5f+LYDwSKf+
         qVxUoGBMF4xxHL++LuCJJa41jMatEndjMJ42tZspeYF210U4hd8DyEuccQmxFcQ7OGS0
         0eKw==
X-Forwarded-Encrypted: i=1; AL+hErGq5BDA5ShcuOiAvyO4tUqPeBI6+euCgaeYVMeV9yI3lZRkU4w6m4ptBA26j3vMyRbTupENFNq/iWI6pWgaefsqIA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9euNGLZpbqvHHjf2wR4bdOE2hQpxP5SKyancy/V5gD5odTyrZl
	jNlEAgcdQlJJFJBmoAqUCIg4isJx2KNNdZvX4xVYBqTYMUVKbYDEhIVNjzI0dMvORc04s7BGVKW
	R04cyEr0WjmBZH4ATANPs/epGBEcOE8ifKZEIwtUn322BlffR6cyJRLM0MmJBHH8OieLJ1ba2+r
	OiGZnk51y6PuOSbK/i2qrcgUlW+N1KEfQqc15oACusgfq9AuQL
X-Gm-Gg: AZFdTZf3AtkUn799dyCYqGpa28EJK5z4fLjM568CVr6PG5LlFcpIPpb+IjPD0Vi/fk0
	dTfwASoN7Zl2/Jtb8rfN6yC5G1Kz2EV1MWRpI2AQeHEoZUQhoXRqGAoVQfZxE38gWT5kDkka+UD
	BhilRHge8TA4xKb3O9AkQnbxfcEMhOxc/4/qEKD7JmJAneTZMFSnl+WW6hdw==
X-Received: by 2002:a17:90b:2cce:b0:3b0:9a1b:b709 with SMTP id 98e67ed59e1d1-3b41c95f64dmr21453823a91.54.1795699949051;
        Thu, 26 Nov 2026 05:32:29 -0800 (PST)
X-Received: by 2002:a17:90b:2cce:b0:3b0:9a1b:b709 with SMTP id
 98e67ed59e1d1-3b41c95f64dmr21453795a91.54.1795699948555; Thu, 26 Nov 2026
 05:32:28 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124153811.338437-2-oss.patchbox@gmail.com>
In-Reply-To: <20261124153811.338437-2-oss.patchbox@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:32:16 +0100
X-Gm-Features: Aa3M54pyOdadrKqsWTiJ9nCAOq633Eo8wIVAGtc33LTwbXCOnSylrRHJagsfEfc
Message-ID: <CAPx+jO_zWB+QyYC0GBOA3YFbeypf9Pb6KteagPBkksr33_ChYQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: renesas: rcar-sysc: Fix CPG/MSTP node reference leak
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: -aeQn0O-35YHm-U5pdcfTW2QcsmDcg1s
X-Proofpoint-GUID: -aeQn0O-35YHm-U5pdcfTW2QcsmDcg1s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX33JrvnewcPtM
 62XV9GG7sAW9+cFBYiKwHnCmsE1SvTAea2Bpx3LkvUkPZm+VIDlCf1c9nnFcPUWwtGZhm8CrDkY
 7AU8oh6o3bZsbQCT9E1EnqBZ4U/QveolIEjjsUgdSeMdysCgX3YKCGycfbMwEAMzRRqEnYWAkyD
 yTWSXWDn20F3rXduOTZBq3dfw8KgSOdIiQAX69tb9A+tp+Bn7kkSuGbNeE+g/r5TcN20Qr96Vuk
 vFTBwFlHeHHXCt0y75pbbPTEGgzK4+lAJw+eFuhQp1B9K6ds9dDOz1xr7gbz0GcFJHmT3asAKoj
 WooPedqywHbyjA1VCfa/vu24ZPG/TjrR+MeFVsE+D8dELnBmQPyr1jbJy7WHU1RCknE8XjUR/x8
 WmvuSTsajmFJvu9YfEMtX1zgyJW8nhgKqVa/h7QDL99uSTbsqrVzg0F/ekwAahM1zy5Sv6lIMF/
 TpBGkDg+T1ZY0M9eQig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX4SwQqB0hR078
 1hd8gviLJaoRxIjWnBU4qJO7DYA1toNysRz6sUTRw0FeenT0kb2m4rqeK7VPHGA+3sbBW1TODLp
 dmcKn2lUt2rfOxxEMFk1ABkHtdczpIA=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b0834ee cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8 a=iPbxsK-MUA0o8_X2VUUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

On Tue, Nov 24, 2026 at 4:38=E2=80=AFPM Yuho Choi <oss.patchbox@gmail.com> =
wrote:
>
> rcar_sysc_pd_init() checks whether the device tree has a
> "renesas,cpg-mstp-clocks" node by storing the result of
> of_find_compatible_node() in the bool has_cpg_mstp. The returned node
> has its reference count raised, and the reference is lost when the
> pointer is converted to a bool. rcar_sysc_pd_init() runs once as an
> early initcall, so this leaks a single reference at boot.
>
> Keep the node in a local variable and put it after the check.
>
> Fixes: 1c8c77f52d10 ("soc: renesas: rcar-sysc: Enable Clock Domain for I/=
O devices")
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> Compile-tested only (ARM multi_v7_defconfig, W=3D1). I have no R-Car
> board to test it on.
>
>  drivers/pmdomain/renesas/rcar-sysc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/rene=
sas/rcar-sysc.c
> index 3c8a44c6d772..20acc9dece6b 100644
> --- a/drivers/pmdomain/renesas/rcar-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-sysc.c
> @@ -353,7 +353,7 @@ static int __init rcar_sysc_pd_init(void)
>         const struct rcar_sysc_info *info;
>         const struct of_device_id *match;
>         struct rcar_pm_domains *domains;
> -       struct device_node *np;
> +       struct device_node *np, *cpg_np;
>         void __iomem *base;
>         unsigned int i;
>         int error;
> @@ -370,8 +370,9 @@ static int __init rcar_sysc_pd_init(void)
>                         goto out_put;
>         }
>
> -       has_cpg_mstp =3D of_find_compatible_node(NULL, NULL,
> -                                              "renesas,cpg-mstp-clocks")=
;
> +       cpg_np =3D of_find_compatible_node(NULL, NULL, "renesas,cpg-mstp-=
clocks");
> +       has_cpg_mstp =3D cpg_np;
> +       of_node_put(cpg_np);
>
>         base =3D of_iomap(np, 0);
>         if (!base) {
>
> base-commit: 8dac6df92a2e66e2098bbc69061964cfe7e8375b
> --
> 2.56.1
>
