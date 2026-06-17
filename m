Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFB13F0ABC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699826; cv=none; b=Gvv/DdG2D/hcvIkHoDYn/WYSVpO9wIUxX/pVYAjXdPQDzNGLE8wTHcWQ336Pn0kBe9pfseuVTkmIOhmTdnzLby30TfW3XOY+QsrcVnrPfiAJDg1TUnTwl5NHEiVT+UkYKFU9bYO11E5UVMkD6Mh4g/VRoost62VEPPjxXP8pWTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699826; c=relaxed/simple;
	bh=v82ZYuwMb2xVyLg5/0OZvOZP5AwSn0n8+YZ1fAkQCy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGf8GyTUorYPpWlAcUjd8fSfODvFHHrNub/adU4ccOssu9Hd/itugjJfqxhmbI/rY4I0Frj/K874qqmRTGUJzrEMxlr6mhiuGGaVSyZZnuzfYlnBhy4LRTvZj9Ck4JD/DhUEP8CwNH2/MkNVwGVapIbpn12VO6XBXy26ySHv9Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkB4l1Ud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmHlera/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkB4l1Ud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmHlera/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8VqDq2192032
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 12:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mi+7F6MOp31T+TaUgs/GJmAsdi52R6SY4Bwom4Oq8sY=; b=IkB4l1UdITnYKWaC
	wL45X9ePJuiiK5gOyRHxSwiI+n4rPPt0FTr2+odBJjodQ6iGXkDBzrWlecwLIfud
	XSCwrQnEbir1I52dqBiOb6pRZEpGlRoivLT3KFSyV8/R1HkKe5OZyxdOKMD8tZmy
	K3frueGKPYQ97r8q5anE2eMV4RmNAVCa28mKTo3Cljo6jUsnkjsd/eh5GUIScTBL
	gji/iq6STVXRqj/LTODJUkpSw2UBHyST7xObm3FNN14BTCkBCuox+lKavGzgHEIl
	nywgczybJ464SJYenBiwSIz+tX+P/8pR40kDrr2aARBoyVRuav3vZ91caBfKAilw
	xsq83w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesk58b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 12:37:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9158ecbfbc2so45075385a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 05:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781699822; x=1782304622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mi+7F6MOp31T+TaUgs/GJmAsdi52R6SY4Bwom4Oq8sY=;
        b=ZmHlera/RQySWCJfthUgq1crDkrNCR3DdYaZX2DiNWUInCqN0esv3SStIxXa2Mek9d
         taccGkP18cdJCClUYLklzZSzWBVUAVrif34VXJcIm+7xF1VnN1fGCnPkmIa4zOhIrTiU
         z4Z5dBqgo+/iwFbvm+m3Seb2lOQ6305QzFZ+4fSrJS0yXC9XG2DJx9h4tIZwB+oo5jMk
         3q+tmunFHqdD2qfHw1lt+w3WB41vTXe3B2KfNhI45ULagmy8XMPMD7ygh5LlxcEOJbH0
         S/fyVwI2c73XU3BYbg239sq+YcuoDTsBvcKF3gnMwXCzx00IM6HrUQvz6YDUWo7N3OJL
         yTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699822; x=1782304622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mi+7F6MOp31T+TaUgs/GJmAsdi52R6SY4Bwom4Oq8sY=;
        b=S3nAAc5EnBdwMJQeYKWGn/sJd6MUzWg9SRJkixdBYqnbAr8Z+qFnQKShBF2iz1anME
         mUxQuA9MkBJdmYFbX61dUPyzg21dFDpliKGjGU5SeaBY9h4UzJBVRGlGmAKSrLUkWipj
         B9V9IQHRCA12Gmvs/0JNmcv4LCv+KmwlHOV3zfOlHmPjc0dhXtXo4JUEPO5KQkk5D713
         nvV560ev9Eoa2Q9kQ0rYYfc3toUcddyrubDf1EedYutYi7zJ8q5CvwZigEiGTyoeGfd0
         nm0TFFQyb0T5B+Q8ll7zJut5HYr8ZcA5kJYkRlAB7xbbBcTbX3b87wuQY6G2xq9FC721
         Xjfg==
X-Forwarded-Encrypted: i=1; AFNElJ9XBOW876WyLnozNJtfp2xny4GqXq72/PyH9IhPCtlzkkgXqmdhQjHV4iq3rtT41gdKxfXIybWVGoZTU47GY8QJ/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlgcXGvyrklSu/J4576P/rUvcHzuVE2GleEuuyquqUcdOlqP8L
	kVuFAaR0CAsquYBjrPvf2l5v4iR9fGny57XzsclEkqf8m6UOv5m6fUkK9hFkq3TuwFOHPt8hNW2
	+U0TZu3eHQ7vC3rMagr0BkrHwDaChaM9+NLzVxdEqwayhYBmpjR9CKllptu2edjpWVGqgDuXYdg
	==
X-Gm-Gg: Acq92OE1rBgv5uQ541Oltek5H9o1ENzPO0M8CyvkStBchfk57+X11oaCmBE5vvk5pog
	M+P21oSR1WEi1S+LH/x9hf9VvSxwrozpPrE3E9eS8cx3tGJ2HQ2w8KkZpPwHBinvSTa9CtMKma4
	yFzum3L/meSvZWI973Oaz8A6nQ6H11ZkqrNMhOUO5udztOowCJYCacql4vZ1KJnDLuu82BOpgdq
	jnXotbiS0zDgyVA93xhQnmZRZOtMvZLukiqElFKbxrF11pAfqOLTqPHcYUqco2O17JfNr5BXoDb
	RjMu/seBb4gpD6RXKPS1FD3pAjT4Cr4s4CiC2KRHwY0r5sB7c2cmuAHPWFSNd3vfjvi3SfdxLiO
	FCs8WlRFaiU44EHUyHu0OaMGfoEcGE5dGr4g=
X-Received: by 2002:a05:620a:1a17:b0:91c:9d38:30ac with SMTP id af79cd13be357-91d8cba7875mr374528685a.4.1781699822046;
        Wed, 17 Jun 2026 05:37:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:91c:9d38:30ac with SMTP id af79cd13be357-91d8cba7875mr374525485a.4.1781699821571;
        Wed, 17 Jun 2026 05:37:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44208c9sm808828966b.13.2026.06.17.05.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:37:00 -0700 (PDT)
Message-ID: <d3b7b468-7314-4ad8-85fb-2f9e3e1a923e@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:36:58 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display
 nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        KancyJoe <kancy2333@outlook.com>
References: <20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyMCBTYWx0ZWRfXzGsRxKc+oSdN
 4xxLhifIy5J2IT5ovphlVC6M3ouJkFxhzUEdyswQ1GqUV81NAMyHKeOhqLWu2+7pmFdTBKaBYOa
 p8H55637OAGA4wDnTGsGf/7Zqk8dW9Ypl4e5792vGNfBouj3L3/qfPR4ENMtWhKDY9HU56Xem3V
 1a1IKUmH667mDdMQnJRh1bDatXrtVlSP22GBzqZuJyJZZGQpXBhUdGUSKRk60sOSLZxFdaB/0gz
 I6KYQ/bVnflIsxl8Lp0U+9EJYUwY2Nu7859oPb/Urs/xccsVjqzvsoYLbtce1E20SEVuEmabYiJ
 pFmcCM/ccmXtCG2OLM6L2ntotAdmTlPIkrfJ2qEFfEk4eZ52+TIlB+c4YfqOfW3cTabwq5IcjZV
 zSVWS3WlLcWG8bQEGb3mXvyKvjz1OBkUH8BrGrLkEWqGqFSWpC4/QBEcjOR46d5Hu9eP/WRbJMN
 7Zx38UZTF32TW/9tMAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyMCBTYWx0ZWRfXyLt02v84b/Pc
 TnV7GI5BoVtYVpjfp5qla0MLGdvDcv9US2DxQTMgnlkbdM15qAhzynyJbQe3FpMu5OosCc0HmCs
 m78U/fblgm/DSbrmm0tNq2X3Ks9/Gyc=
X-Proofpoint-ORIG-GUID: ua-19tbykvVQpdaN_yKMjImT35Pxpf20
X-Proofpoint-GUID: ua-19tbykvVQpdaN_yKMjImT35Pxpf20
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a3294ee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8gp52aLBMaF4WGxJS50A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170120

On 5/22/26 3:15 PM, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add nodes for the dual DSI panel, the SGM3804 regulator, the
> SY7758 backlight controller, the touch controller, and enable
> the GPU to enable full display support.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +	/* Backlight */
> +	sy7758_backlight: sy7758@2e {

If it's the only one, 'backlight:' is good for the label. The node name
must definitely be backlight@, as those are supposed to be generic

> +		compatible = "silergy,sy7758";
> +		reg = <0x2e>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sy7758_default>;

Please use this order, everywhere:

property-n
property-names

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
