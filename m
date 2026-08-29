Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2926407CD3
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Aug 2026 16:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020377; cv=none; b=s/fMCCK7gv30woCI18l6hG6IN5105aIDIo/BFFCGmkvSW8ninI8ABG4ue85JaWniLCGtadd05W1kw0M02z6AsecuP/GycAiNNEa/ZnJ3fs/8nGK+SxVXcOfrVBbAtk3gw6qkjGi4LF0j0xcV7uCVA8wJ4ilkCQzjBMHjvSbdjaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020377; c=relaxed/simple;
	bh=9UlldyNWYOhvwGQWlGOcYCfrx71AurAvRd95Y/8YG5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GomUr8BUbRaFC3Rcwm+TMGVHXjvzzDySyNLyJ0GOMGDR/Lncn0uH9PNwy883bNCv7IHhI3UE02Xz2ajTt9h6aPfJJYS9eWjRMSX9qq9syJZJTU56KKYs9ZWMGOWgvoc97uwd05SS+KV9ClPufEANnaVlUS+txVmp+O5s8bEXAgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACHs0bwl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YjM3G9aK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACHs0bwl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YjM3G9aK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TE2VBs1939558
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Aug 2026 16:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JRa4eiF0jOBt+z+yd1SxFPDbNFX363osG4c75Cuyzho=; b=ACHs0bwlUchPj/G7
	NbQtDzX3srWCZ4FuxB3/Sg58RAj37S3qp54Jb98BzhGR7rZmOC3XTc9+H0Iv5Hqx
	IKBGzth63axI+tElBM2OsfDfFXXgYFQjU+4uwApuiqCKt+Ohk8sEr4CmFg0lrl1J
	YeVTzRLD1l2sVqslbGoKMhZVHfUZr/OGEcGa57IpblLIk1of8C2fdHZBuDXp5D6T
	U2tE4yvvnw99I+1iat40LIohoZCLbvZ3fxmvWnQbL9n0kFAPaTzwdAA0Slt5MoR/
	FEPg+jXBBu8CyRol/TCR1Ma41IY9eM5sGdeIPeLbUlGLcC7itD1LHJ+138JVrTrd
	uC7WAg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqfb1bye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Aug 2026 16:19:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so2647160a12.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Aug 2026 09:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788020367; x=1788625167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRa4eiF0jOBt+z+yd1SxFPDbNFX363osG4c75Cuyzho=;
        b=YjM3G9aKidFx80o/tBIKaV8Ep45eeaLVUppmkJMCRWdBVP9O1x0iyDGmvuciZn9Hlm
         c1F3zzC80Yuy7A8Rg9MNqJrasJOwkWLIXdhQoXHSHk7glaOkggXO6ksZSXMUhzu3doEf
         21UkxQjWA8zli4VorJGKZHFz5eUuOrZlE7PwHVKgOdj7Uch9WN6woxiOATQI6RMx9qoa
         KHeyRM1SslzQ6pzZWxcynw/4DaX3+dztUDw+8h5BOx6v+rRiaeHuJWRSMhzRhAx8ychD
         sjiaCazLXzGf3m7O+zy3CbBkPkIR3sp3THTCJ8GfiI8jQHHKgQi4CbA6Yv8IT1k0F133
         gfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020367; x=1788625167;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JRa4eiF0jOBt+z+yd1SxFPDbNFX363osG4c75Cuyzho=;
        b=GmVBf/q5og3skHngFcvwFSzMnxoFj2jxOjLB54/8+QG/JWlxGr/PpZbzBOslqLCCV4
         aApodOTK0U88IjujI6aw9tq7j1qubLW+or3j1QtTPs+njDpO2R4MjKvI7d8dkX6RbDoo
         Nieu9Pdo3WjgBLS2L2aOCkHNRPTsoJD5/0D7G0wkEYpEwASa2lFqpn8RBxtNxJQakrB2
         GfZwVhSYw8HOJRtx/5eZ40SJGeT3C6NcXZCmbOHuzGN36JQR/KRbu0krzQ8p5DyuOm8k
         ZswD8FlVQhTAGbl+Ijg9WhLMugheOhDyzVZDmz9HCCPD6xOTYOuxrR1ILOUFN4sTk5Zu
         EEIw==
X-Forwarded-Encrypted: i=1; AHgh+RodA1bmyx7V2mx5DjuhTjrvjb1S8XKWKyqNneJ7rqEJHzOc5lGINZ5s34GV/OjHbkqU3OuYvaAFZkrxmi1q3xQ9pg==@vger.kernel.org
X-Gm-Message-State: AFuF++nvzZeSjHg4zJ3yT1hJGOt0W8/2ZfawBEDbQTzgJOF4BN/MFbMe
	9SY8tIWSwPor1wyR4EPT3M+S+/K/yLmc/0viTo/JZMXagh9BpobzULm2PObl/xJQjThr7ypXzsH
	Evx334vGMqbfhHaSVk/8Z7X+FAXeDudEADTCZDhZuNJAiyVLxyEV5HGWb5Tl7bQSNsvvtZGqN8w
	==
X-Gm-Gg: AR+sD139BpbR+2eD5iwJfNJcmPZDaWe/C8Lk+5y2/7gk7nrc88VZkyRG7MagEfc/HC7
	nEhRIGd1XjyP6He3CgEXbXScPlxA4Xb7S1NRxrbYQWOkjAWDSzYu4AM/PtaH7z2yBikxIVGhK7x
	AoLctmkj8Bs9hRiJC/kWtV0/VdgTSsaFpApK6iML2xHOoWkSS4p6G63WNuHoyCGqKCpDr95jQnL
	0oeCSxYMxyMa+X2NWKqha97BjBss6mL/6HI5gb8lyOmAq16yiaLMhHZfZd7LuGQeF72fkkvModW
	S6NkLik4mRM6skDeSlm/3ht0IU0oKMO7tIjSTgnzrGZ5W/sqcDSaRbTuKd67D9jC7ttybhoXZC2
	K0f9AH/aiAGc+Pn2LoHvWK4Glcjhji3gtCK5LNi0EVxKffyk8w/e9R1qPCriykP0MnPY=
X-Received: by 2002:a05:6a20:72a4:b0:3d3:ae40:51e4 with SMTP id adf61e73a8af0-3d3ae4056c9mr10116778637.24.1788020367531;
        Sat, 29 Aug 2026 09:19:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a4:b0:3d3:ae40:51e4 with SMTP id adf61e73a8af0-3d3ae4056c9mr10116726637.24.1788020367068;
        Sat, 29 Aug 2026 09:19:27 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.241.61])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f85fsm1839168a12.9.2026.08.29.09.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 09:19:26 -0700 (PDT)
Message-ID: <d801ecb2-587f-480a-878e-8426239b7690@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 21:49:18 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Thanh Quan <thanh.quan.xn@renesas.com>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260828184212.395082-1-marek.vasut+renesas@mailbox.org>
 <20260828184212.395082-2-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260828184212.395082-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE0MSBTYWx0ZWRfX4MgnKXaFu2Zo
 pYEB6aac4jhVUJpBMWyEsAUyTp4NK6hwJmyPil8fCEEegoT52rYEqtuYzFDz8eKIHUjlPbtid0P
 0gn8ZYUhlZPK0K76AznDWuh8a7hjQHsCMIuThnhUYwbuQwvnLesCxg3ZozvqDVnAmCHKvTlRjq+
 Xtli7kXE4ofAEERvpe+ODJ/sDSCkphq0Pm3pZoH8GHJq/CxxUayMczzwRKeWnteK8sdA86AIK89
 z81o7yZ5tsqu0+ubymHeqy4ErsR1A0PR8sJbaPqRWyhp/eIMNUjTpO2cnEbw6kQ9BMViEoPHgmN
 /MNaWaTnY+BJxXtUPqhR2b+U7yLZXphoZ4+X5cczznVMsHNWw+/4+OSzocJMxmw5tV6RgOCIRnR
 WufJzQ/07cYtwYtCB4bwLPVJyta44mbQMZFjU0EnB5FXvi0kDBDKq11nrAb10gDR0mPLL1ocahE
 aA9uSoCMb3elKPiwpew==
X-Proofpoint-ORIG-GUID: GVjFKkYSBcXziXNqXVSSR1jqMmlnxhtA
X-Proofpoint-GUID: GVjFKkYSBcXziXNqXVSSR1jqMmlnxhtA
X-Authority-Analysis: v=2.4 cv=Q77iJY2a c=1 sm=1 tr=0 ts=6a930690 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=PZ14JaS8AzYbITig/tPzRA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=yC-0_ovQAAAA:8 a=b3CbU_ItAAAA:8 a=9smufsHQ1aYfdmuKAZkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE0MSBTYWx0ZWRfX3StOsG/frSWI
 tEGEilX9snR3RgWxT1O7LVA589A8sKE7QXF7SAK9jZTKMOnyrt3AoVRYEjw5uiiVPXdQ60PpT+D
 OQjE35vb/iFIR8yBBKfcAtVu0+BS8Ns=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290141



On 8/29/2026 12:11 AM, Marek Vasut wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
> 
> The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
> controller with glue logic wrapper around them. Extend the generic
> DWC3 platform driver with Renesas R-Car Gen5 glue logic specifics.
> 
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

[...]

> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index ca69ac0eb07ce..e8586c40d5006 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -71,6 +71,55 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
>   	return 0;
>   }
>   
> +static int dwc3_renesas_rcar_gen5_init(struct dwc3_generic *dwc3g)
> +{
> +	struct device *dev = dwc3g->dev;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	enum usb_device_speed speed = usb_get_maximum_speed(dev);
> +	bool usb2only = false;
> +	void __iomem *glue;
> +
> +	/* Wireless USB is not supported */
> +	if (speed == USB_SPEED_WIRELESS)
> +		return dev_err_probe(dev, -EINVAL, "Wireless USB not supported\n");
> +
> +	/* No USB 3 PHY in DT means this is surely USB 2 controller */
> +	if (device_property_match_string(dev, "phy-names", "usb3-phy") < 0)
> +		usb2only = true;
> +

Why not just set the maximum-speed property to "high-speed" instead of 
checking for "usb3-phy". That would be more clean.

> +	if (speed >= USB_SPEED_LOW && speed <= USB_SPEED_HIGH)
> +		usb2only = true;

And this check can be removed as well if we use "maximum-speed" property 
in DT.

> +
> +	glue = devm_platform_ioremap_resource_byname(pdev, "glue");
> +	if (IS_ERR(glue))
> +		return PTR_ERR(glue);
> +
> +	/*
> +	 * The datasheet describes initialization procedure without full
> +	 * information about the registers. Therefore, the source code is
> +	 * based on the bare metal code shared by the board team.
> +	 */
> +	writew(0x211, glue + 0x26);
> +
> +	/* USB2 does need additional register programming. */
> +	if (!usb2only)
> +		return 0;
> +
> +	writew(0x11, glue + 0x81c);
> +	writew(0x0, glue + 0x81a);
> +	writew(0x1, glue + 0x802);
> +
> +	usleep_range(10000, 20000);
> +
> +	writew(0x0, glue + 0x802);
> +	writew(0x1, glue + 0x2a);
> +	writew(0x1, glue + 0x81a);
> +
> +	usleep_range(10000, 20000);
> +

Use #defines for register offsets and register values like in 
dwc3_eic7700_init.

Regards,
Krishna,

