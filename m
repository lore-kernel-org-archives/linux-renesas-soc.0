Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B813F39EB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371514; cv=pass; b=mtZ0U6zyldABew1D8erBaWuXc/Eygloj2sRy1vCyMwaExs6DY+fRjuIn/yfR8hsnSTV+r/cxByG8ssR+3NOb0c2eJzc4RaClqV3JRLOlfEpVKqntdV81eMD+ZjAXUXKZHV3MrYNgflcPTuG4LxN2wBmz8O8k47bWuSe3E9anbNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371514; c=relaxed/simple;
	bh=N7XTeoAtVgCjUbyUhH6HLUqT7VK7d+dE1+VQTCpWBb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apz3994npTzmNUCLkrVefu2m1Oxl9sELrt9ga0jrOTjnqKa6TLlN8NFloMlAyea5GneDbNW9LYgna1dYEqnCvXkjh8s62yVhJFsu7TFIF2AQrhw4B6B7ING1nsj7GJm49UH/mqjyaujPEcqieSZd1WbfYqVo1V7RTMKcwp2Ck84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsMXW/8K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GuwZJFMs; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsMXW/8K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GuwZJFMs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjTiH1596785
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=; b=OsMXW/8KgmMjHbZe
	AoyvJSO+/JhnfbuDbQ3oyZaLWo0zwkbPAE92jJ3Gcl2Z4Lyh1s71hM5J2MK86gxl
	yQ5J968Sy6B8pvKwAkUzmCImTUoyzjD8uc/RFc2yMqmMEGzxJ73unFlywxF3s35j
	fm6D112FbvpstBUAzFhOqwGrZGbwu6N/dcYRlqDNM2Rn/LI72bCvWOEJ65FlpXru
	umj1WBkHDQauhGpT7E3QmSzO2M+xDGp2mPW4jFuEtSvQuTBUJNcB+0xHks1HwLYU
	IUI7CPLh+giwbX8KwYlr1Pb5szWOTEstMLKUvKQrNiw2AFC2yImIgtvZqkZlGltt
	ltiA1w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v6syfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:18:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-907c59bd65aso9101486d6.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786371509; cv=none;
        d=google.com; s=arc-20260327;
        b=tAJT6EV4LT58eX3wK3/LUYnktG7WqYBx1N0u/fZnnTiPRiaLb7ugLhUwF0Mrj/9rk7
         eVtkIxEtxat6Fh/iFdfFORz7xrNEWHzNFLIzvEZB8fGyVqRuRs+5IZhpMLc+fsv+DWam
         b2Y3H+K8zW/t1T2zx7qg0uGA6zZad/1Ti9DL8zMz75Ch4ZplJVWHXuL5Fr1ktgTqkWY3
         jYqmLJWJtWmkjlgIg7/qKz97aGfZpCotL4nsxTV0aleK/RdLxb5mkWmgRW9uqpdB+1eH
         bH7N0GYLPqGs6YNiOaf3vJaZ9OS1jiFee93EwgRnftytVMWfRD83pdGJI+6rfjUEzcIu
         BU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=;
        fh=hukCtvcNCzKCwSRiEHco/uP2CavuXdbFpDELE7K4pfs=;
        b=qu0bKoUMhYteSRWTN9hL+cl+EU6CYdUUlTTUSg4pxaN9jg/4LgX7yfnCKys4Cu1yPv
         3dyn1XQVRUVwCZwXOfYS8S5bkBxU34GzaoBzJalYUEBM13Ci2WmHeRVtJkaDnWFoOeFf
         C6ZOmuMEa+IDZkjjuMYuId0uUpahx5OGoElTc+ztvKW9SrvhYhF6Xknt5V3u32S3cYVO
         pYC2IP8SXLzQm1sXJ/zDjgJPXrn2RLilp49QMjeh7d36v9u3B3JTeATKJ6F7Q6gtPXHR
         p3Pc1prhoOV4jokglaaTL6UpSFstSRSQUvlkFHwJCNG4CF4Sp4JIARfTa7wbylySoX9v
         NLXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786371509; x=1786976309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=;
        b=GuwZJFMsXA+arwwgHyOEyTtEk4r7meN7fo8x6lVf3365kuM3IsfngGK7LYY/oBkFh+
         88x3qhy8Uds/1pZka5sAgBcgL2DbZmAzciazj+MbqV88w2oXv9hWBmjqQEGQgqhUuQVp
         4axLyKHat1CeCgfz+bS+APHK4hhJqj91O3JRp+HHzNHoWJq1Axiir5MEZz1hi9pqlsqh
         zW/JlrZH30WqJqPvtZQsdpeXTz7/xZLW46SOvGpQS4LYDYbM2RyqCYhBGfS6F9aZ9J3O
         LgS+ZuCCtKuvgM8K7UO3XzOqBrr4zj8LZ8CCt6o39kra4QNvIlw+cQECfr5YNwfwYZYq
         JICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371509; x=1786976309;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=;
        b=s3eUmOgLitqoiXvJSCoUQfnn7le4F+F1Q+x66Vwb3gHccFBVcIZA4SRmLJ7e5+529h
         e18QCR3xtb1/yQrMWnteEfSPy2kz5FOo4ErpSKYx5F2XUcpPmXJ7v/++sazX3jMX/WfE
         MpHtG2n3cpYBs/wJOhiYENE1CjFIUHkgbcP8g/oeamnY1cmzZCfl4ePWivE1ORqukTX2
         CgQq06Gjqdp/u/+JHCSnmfcTbt4wJ8w7nsDJWMactqcPQ66EUC/c2FQYSBXRnCMf3qO9
         7I/HFhQ0Ppp+oRsWD7qRkauWzArcvrguRHQmP4H9QEDrNiBJ32P9enqI3SOfWQox5+wj
         +iWA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+hUaXJY9vze06FuS6jLshsfuGZ4Dt5B5EDeDkHkCZMrATDfv7krZWA3Q5mb8KjC1+1oM2ButohI0Y6WQUB/PE5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Q3e6LGBQ76MPBfnf4KQjkYSYKsjhbq3Ha9G3kMaqa4IO5Umm
	J6/UaGnYKNIAVcVFdC+WplrIrxbyID6O0u2OlCXTjJQmQGTQvNkY4c+THDXX3aiEohkjbgMlNXt
	ugb4hfnhoBQDLAbhapxz/nxWISYKP/kAXlhmv3ymT8Uo8CtciG3PZwUs+ZjmeNTLUu+fiQm0sHP
	zm/8fkDd9bzfgT0BhuOxxsGZfFNjm0NVogLLIxkAruS7kar1pv
X-Gm-Gg: AR+sD13leDXIMb2AfobJW4Y57ytgKxV52hUwStH3UIiLGej27JI4IzUzxn99R+ZJ5k7
	WXuMPuV+HkmsSeIXqgDVnZ65MPxhGaHKS+g6FisLBHmQsikcY5XRCdOC6EmoryRds2M3l1RAJKH
	JNfPGIWGi/YCgyHNKwJeet7ymPoxbu7lp7kWHrDvaNoE+XLkht4Efsqguz/Q==
X-Received: by 2002:ad4:5c8b:0:b0:8f7:40b8:e8ab with SMTP id 6a1803df08f44-9088108f7dfmr495729076d6.3.1786371509584;
        Mon, 10 Aug 2026 07:18:29 -0700 (PDT)
X-Received: by 2002:ad4:5c8b:0:b0:8f7:40b8:e8ab with SMTP id
 6a1803df08f44-9088108f7dfmr495727846d6.3.1786371508926; Mon, 10 Aug 2026
 07:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785941595.git.geert+renesas@glider.be>
In-Reply-To: <cover.1785941595.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 16:18:17 +0200
X-Gm-Features: AUfX_mzXC69ugD711wUFTUYf8_epBYn0SrqMBsnLPgmbzyeuCwMrcI960ZDYq8Q
Message-ID: <CAPx+jO87d7H92KSR7R7ObR05sM2JcHBCo+YuUf_1gE-KwhR7CQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] R-Car X5H CPG/MDLC support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyMyBTYWx0ZWRfX1k2LpGUaWT6k
 Lkz5e1Zn7RkKMTf1i8U9ysImpq/meK/q9APn22NjwupNxc45P66G1n8DjVbibetPvLcS246OXLh
 5Hv0Q6nCKW5gmqE2Z2itjBoK+rJz/kg=
X-Authority-Analysis: v=2.4 cv=PvijqQM3 c=1 sm=1 tr=0 ts=6a79ddb7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=HDY4BLWKCFmduH3Fo1AA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyMyBTYWx0ZWRfX3bH9FCr43NmD
 SLe5ql3hUr85WpmAqZll8BXuy5tPySnCJNsZ/ENi3w2XiXpTTrcndoSrvrQlX1/aqN42Jr0rpx8
 1+IQvpuJmCpTd5bcM/qVru2LC1TQ2pM06ciqcFT8pEP2c/YgdY8neyHJ3VR6a1xqawqNo4Z22x0
 tVs1rftZA9YoL9Hs7lFl2WuyjY6wVtqcrxedvGDMbCcP/KqD11XETL4a33kkOeZ01fiBmxjXqEk
 3w+FqUKmfX/L3QJmMaKLInvay8pLHLXxY9rgwIWR5+0yMcySAlUAupk8IZwUXDOcZszL8U7/hvB
 BRv1KkH7bZT/7Z6Bwng9/m/+sNzqjqJls30fQS/C3WvPmo8x8P7+VPhGTE0LXPcF0lzICqgHB21
 UQMlsXbaYQmkTAPnzwGozCyBy0KuQjbLZquKO6wVAvLDQaX5NVh/IJ1xfCxhCp1nWXocXdgF16q
 VWBh60bhJxBel13bXqg==
X-Proofpoint-GUID: RaTAw0Epolf4Uw8BG_9lEzNyHrebwJ9H
X-Proofpoint-ORIG-GUID: RaTAw0Epolf4Uw8BG_9lEzNyHrebwJ9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100123

On Wed, Aug 5, 2026 at 5:21=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi all,
>
> This patch series adds minimal support for the Renesas R-Car X5H Clock
> Pulse Generator (CPG) and Module Controller (MDLC), to aim for replacing
> the dummy clocks in r8a78000.dtsi with proper hardware description.
> These two components are closely related, in the sense that they are
> both supposed to be accessed through the ARM System Control and
> Management Interface (SCMI) on the Ironhide development board.
>
> This series consists of three parts:
>   1. Patches 1-2 add DT bindings and DT binding definitions,
>   2. Patches 3-4 add minimal CPG and MDLC drivers,
>   3. Patches 5-6 update the DTS.
> Note that this series depends on v7.2-rc2, due to the use of
> <linux/device-id/of.h>.
>
> Changes compared to v2[1]:
>   - Add Acked-by, Reviewed-by,
>   - Add fixed-rate clocks to kerneldoc of r8a78000_cpg_priv.map,
>   - Use devm_clk_hw_register_fixed_rate(), drop unregister_fixed_clks(),
>   - Drop fill_clk_map(), as it is not really needed until SCMI remapping
>     support is added later,
>   - Replace <linux/mod_devicetable.h> by more specific
>     <linux/device-id/of.h> in v7.2-rc2,
>   - Add a comment to document only always-on domains are supported,
>   - Consistently use /* sentinel */ for zero sentinels,
>   - Drop trailing commas from sentinels,
>   - Sort MDLC nodes (alphabetically, by label).
>
> Major changes compared to v1[2] (more detail in the individual patches):
>   - Add default support not using SCMI,
>   - Drop everything related to SCMI.
>
> Note that this series does not use or rely on SCMI in any way.
> SCMI remapping support will be added in a subsequent series (old version
> at [3]).
> Full hardware support without using SCMI could be added, too, if anyone
> would care about that use case.
>
> For testing, I have pushed this series plus additional work (including
> a rebased and updated version of [3]) to [4].
>
> While I know it is getting late in the cycle, this work (especially the
> DT bindings) are a dependency for about any R-Car X5H progress, so it
> would be good to have it included in v7.3.
> Hence I plan to queue the clock patches (1, 3) in renesas-clk for v7.3
> (Stephen still hasn't merged my earlier PR for v7.3 anyway).
> Ulf: It would be great if you could take the pmdomain patches (2, 4).

Patch 2 applied for next, but I left patch4 for now as it didn't apply
cleanly (drivers/soc/renesas/Kconfig had a conflict), thanks!

> The DTS changes (5-6) can wait for v7.4; they have a hard dependency on
> the presence of both drivers anyway.
>

[...]

Kind regards
Uffe
