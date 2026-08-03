Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A554D3FCB2C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Aug 2026 13:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762552; cv=none; b=ffH+2hkXCronKmX7TwA8TpndDa0v1PSCQo60ReKKi4bPVRPaWmC6snVXZ1tKECplpd4ryJc8lASbfQ63vuc6TNyai/SuTk3U/vUgk3OsiZuxutCDf7SFSyxiAGNn+09zp2h5ppRqVzTFK/iq5zgPCTI1jbpFgm4vHt1y+71qEEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762552; c=relaxed/simple;
	bh=Z6AoCJziUAEBoKdWqdaCYWruqsYRcNZY5aqj6IIJg50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFLlaKaOS6wJ8krwW/A7a32gPuddcO15KBx0DxN5nye5+4k9ZAnR/fch3l2uJ0j6efV126EEog1h2rdNtt+VRY0MWG1831QGtJ/FNEX30OS/0O0gMx1lj01dmhThCBLiRem8Ew1ECWPpNxhxBbNUO+Jhq6FRW2NzF/FLw5TjMVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYDjTupd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LVyFMTYf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYDjTupd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LVyFMTYf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4U7p1722040
	for <linux-renesas-soc@vger.kernel.org>; Mon, 3 Aug 2026 13:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+bEBKAJA/+cRFgI8e27Dj0HsJfWCLd+x+yu0XT2bSxw=; b=WYDjTupdLXwjDaaB
	77kSPC62DtFX4L/1/uW4rAnfpKyaDRjNDRqfr2CRyhKrU/PbcSOK1plmP6CxQMKb
	6634pT7H3/dpmSw0c3WPH682pmP1jRWSegSNdRIXs3CuSa/XlyUMLjuQYeMa0GNd
	v/DRuhHgAyKOPdk4xY59DVzJsUbkZ/tG08nygCB+uvsD/4H1UkVRMxK8Lkr2kbDm
	ogZCV6ouI+Zd0+vHHb+TRNNHAELxBTioWR7CN0y7xTlwzXP/bDZO5B+HXJUWhkLz
	2jjeP/t8taobp0wTwROY2c87cfEa0lCaVRJbwT4h+7floPpPjdq8HyYp2ObVnpzj
	FjaHZw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9faka2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Aug 2026 13:09:09 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738b76cfe03so3145228137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Aug 2026 06:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785762549; x=1786367349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+bEBKAJA/+cRFgI8e27Dj0HsJfWCLd+x+yu0XT2bSxw=;
        b=LVyFMTYfjWe4N0ILNhJz+bWSJEsE6IvsqRUNbiVsRCNrn9TOJv5qehcvoBzlKBd9uV
         UyrRT2Yo2Hpf/vEEl06i2NzGyhgo1pRTEvon6GSrOO3dGj0J2tP1QjB+ztAijKWd3fub
         4mi1McXMMtYZsW4JHeN1SEu4ReSKIdCTbUu+tj36eosfABb06rJNDtwC/fvplB92iU3Q
         BFEbETRfob5UD3H7Sdg25EqCjR2R5a+KpwZ3bJ+O9J46N8eeMA47kAmw/b1qIurbmWRA
         aq8h2hkiCi2NO990O+xX8GX6FbAVPft0kgxpP/wsmc8Rcaxk0i4hYov5Grs72edwLlQa
         YWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762549; x=1786367349;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+bEBKAJA/+cRFgI8e27Dj0HsJfWCLd+x+yu0XT2bSxw=;
        b=gOhzkTunI1JK0knIJkZnEuMIvj1w6y6ZoECo1U4MNmi1rpI6P/s+0O8cbsNO7Yrp98
         kgJ2Yelvmzmgu7R1Ji76+eWIopkhjBNEAV+20427CGZLJjxiZgyHiS4lY9/m9EpbmBWa
         QfyXR5/zT/9VcMrt3ckKF8avOEih6hUR5nNiMF4CcEDpnRvY0r29DLmTqLkfXj5MjlgW
         9QgkeWok+vGr2LcXWILbBEdrjghSA/LQd6xTKcD+FURaUCg767zBU1VyqTR7uE3N6bdk
         gZ03GG1WJ9XaDu3Ngt+PrvGzsL1Zba/9SSobzhNjxGtspHlhz98EfHCsSs8/MMwn+jPG
         vHDw==
X-Forwarded-Encrypted: i=1; AHgh+RrONKYR0ihCHAbcQ4SZY8hopj0kGvNyzUEivgY4np1kY1R8vC4osjcZBs4YQTDC23zijEVg2r4xNPdFGpLRpdbZQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIo2GpxnSY7xbWe91mOkVchAHExGNhRkDXCansBgkXbDBj+d6B
	3DlrgmWjbBOrRxoPhF3JEliv44WgzPVjZFCl77TxHJCLBpBygx4wXfnE+sTTZ9zc41TKetg/ttu
	KED3OItPim43djLgOmWmmdTPMW9eYM+5LJY4vzB6gKPD8JdV/s/vLBO8aOQu/8c1vBUr/ZAvT/w
	==
X-Gm-Gg: AR+sD115KEbRlKe0M/zoW5Gg05OP/d+dUb69LcEtrSaibn1uFxi3gDj2uCwLj7RvhGx
	nQ3XiOrp2ZhV7/ZjUPJq4ukkmPw0JymQF4XnGXK1bY38fe0k67X6oTBQfVELEO/mN0+AEt5912j
	PyegpPBfTe+T8Vfr2sN3gr5qfNNbJHKI1gXLLyRFHy6hik59XurBspdIYuss+6ryMUFQnLB9lkN
	+FoxFhpzdG7AeG+A/LArCofZjIVaeOniRiUCXpQPeMcmrv4TcCVL4NNLzvHH/dJAseEBWzMQ/XX
	aPPBHzbH9NoHn+V4D4Qq2NriocokEB5bBvWvQbuT6FOvapvvjn3IgOcojb38leW0mCGTUvOQ+hV
	KL/L+zUxwd0TUXrLKDd1txRAWqwtfSg==
X-Received: by 2002:a05:6102:3f45:b0:744:a3fd:410a with SMTP id ada2fe7eead31-75b24071090mr6439626137.14.1785762548565;
        Mon, 03 Aug 2026 06:09:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3f45:b0:744:a3fd:410a with SMTP id ada2fe7eead31-75b24071090mr6439460137.14.1785762547623;
        Mon, 03 Aug 2026 06:09:07 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3cc3ea1sm541388166b.26.2026.08.03.06.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 06:09:07 -0700 (PDT)
Message-ID: <862f47fa-628b-49dd-b8a9-873955ce5a13@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 15:09:05 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: renesas: rcar-gen2: Fix double of_node_put on phy
 creation failure
To: Felix Gu <ustc.gu@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260803-rcar-gen2-v1-1-9aa35c36d7d7@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260803-rcar-gen2-v1-1-9aa35c36d7d7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a7092f5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=gU5Lm4jXYh4j8fgtNvcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: Y1hZ-p24vZdzj7yenF_Hc8ws7L29nBdy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExOCBTYWx0ZWRfX3/1/Kb7ARmss
 C7O7ymMDxnSAUyZy09k2noKR79uNXi1Sr8RMvtJbJ1NAfxWB8TNvirZlBZY1uj4aGQ7ZDAA2SvX
 2YGO8GICKQ/uj/yCxTwsTjAEVDtMR/Q=
X-Proofpoint-ORIG-GUID: Y1hZ-p24vZdzj7yenF_Hc8ws7L29nBdy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExOCBTYWx0ZWRfX2K4QCuB5beFO
 CiKGLpIoYUmSfnaorK2o680mBLZvfTuDvJXTWR6nS5VH9RT9Tf4Dx+woj9PWMqizYGn67JjsF51
 ohBD/hbN1/jgwMsC4Xz6b3jtle13I0/04BfY6eQwiEv0T2UNtaj453rtmQiqYgBrorjHwPgdtoY
 rJI3inMl3hewjx3nJ6zk2HInq+GgWpA1xvX9ypavC/zczh4IfDpDQJAcXss6WUHRQp+Yo52fXvl
 d6IuUhYSOpuoH0Gnb7aWC0q+M38O8FC3s89GCNYXptPiUmJILTwiV5dYcMx1BNjemBQ6yCWq6ZN
 Kxe0d9ITJi3fmtLjkZp896zEHP/R+CIp0z1/R2go4Q1Guv8ZOXHdjycwr6dWiYt2u2UpvrJPb7q
 AUAfQ0UuA+2JkJRE7B+YmTRBcthwxRJ13FEja1qLwrgsGjYevF2g4MkMEdbsDoqOELqS3hXAMqD
 6J5Jct86vxn5HS/SooA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030118

On 03/08/2026 14:43, Felix Gu wrote:
> for_each_child_of_node_scoped() releases the node reference on scope
> exit, so the explicit of_node_put(np) in the devm_phy_create() error
> path drops it twice.
> 
> Drop the redundant of_node_put() and let the scoped cleanup handle it.
> 
> Fixes: b64b32791fb5 ("phy: renesas: rcar-gen2: Simplify with scoped for each OF child loop")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/phy/renesas/phy-rcar-gen2.c | 1 -
>  1 file changed, 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof
