Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793684838;
	b=IQTMVhrwUrRszFaVRajOoEFIdLUR+ukY2bRAXtAmhw7b2btIVE/49I5z+FXV7w2yKUzR
	 PDfvkvhggdtWmhoFdU1iZaT/IaWQCkwRvrXtyhxaCNIbwUn6IQrttpOR2Kz6adO/NNfh/
	 8tZHFAdksDz4hZ6VLeV8+b0MOm1b73rkjrYEHPcZkE/DEhriOfhZTlqmg2el2I98TKUAN
	 kOXLllOAY2RGuQ+87gYE3c6EbRHTKybUnIfSh75dYF/ADQvn8NcCJxRk2uQ7m0z91hyAX
	 xAN/1pjCXMSWu4zahS6Jk2flzcORGg1YaA0SBzrf9sPrVa9H02Aol7bJSkgfC7qM4Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793684838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CAUzZfGxBOdGVKQARymZnvw9tUEu8Gk9GBeF1+1UKlY=;
	b=jFG5jcTzMfL2q1AvxkEP3KAhiGhHphbW2iEbgvD5mGonRf97/xCw1WUrISV3/dQv977N
	 ddAmDDhEiHxWD8AlK2CGZWWEhwsbJEN5Wj1yEpDsYYLgZQR3H9N3kFrgtYGQmaeMpBj6B
	 JWxXyAXLm7mIIVHJaeKWwd9VitDAazR5wyDs9aTJ4aAdQvxnzFHGYYQJalVEXY2PYAtrk
	 eT74LSfOwXCodj/URPF8C6IPcWDHsUIKqm52TVC6sxcPIcnfcqZcKmQLpyR/L9KdX2oen
	 cqjTDPpL6lPHsqg7Zs884xp7xAPocQqe5bK/grK2/7MZw5CyzeDgQ/TDAkdANNhih0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B9WPCRoH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g56Tr5nY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C14606A32C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2026 05:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9C14606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B9WPCRoH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g56Tr5nY
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31e67k1397190
	for <linux-renesas-soc@vger.kernel.org>; Tue, 3 Nov 2026 05:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CAUzZfGxBOdGVKQARymZnvw9tUEu8Gk9GBeF1+1UKlY=; b=B9WPCRoHyNWKGB9D
	L4dsvqEUClvH8NYUkX61OcAYrQ7xjNf8OsnFL8BeS8ivn8fOebHh8j2Gr53ZrKh6
	6ctTJdl0ZoS4wmHYDLR+/08RvCfJxzW/kPXa0K7cW41jngrpCOWaIY6LQkDQwyJX
	pc/oqb9Sfa1/hL935YqWfv8iL7ENTA5UNB6XUVuTVOZ4NG1qYy0RYXXAn+i6+JaE
	dAtNI49uAU+gger0nd4XxtGguv6Heck9tdclAGjAIlIbqcV9UwW5+P+biYRG2YaU
	pDVTCiB7IXKU61B9PByE9Cd8wuz4R9xucjIUAAdWtJMAiw1U+M7kvVF7/je2dwm/
	b3H4Hg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5h24d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Nov 2026 05:47:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso4218550a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Nov 2026 21:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793684835; x=1794289635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAUzZfGxBOdGVKQARymZnvw9tUEu8Gk9GBeF1+1UKlY=;
        b=g56Tr5nYTBRguwedEcBQiCAihdNQBz0x3U8KSv4CKoD5x1qbdtDlrpaDDpbgYZ1Bd2
         U9GWKN88ADi57o/kysshNxRjfhR7SMLlHQbngl6W2IoEhjDDPWGxfSGqd18v3gY1bMdF
         Ro7XaCyaL5VfZcBjrnztEZhilDGytP5PC5QGT7oMSctJm5TZ0u0VK0cXsBaev2ppMVir
         bmW/hj4+dzczrAGOcp3EI8iRoScRqtp0sET9Nofp+ZLAf0oO6qRafd93lXvd+NL8nvLr
         1D59Fqh3ddTIPT1yQEVU9QrH3ByI4F5tq7F/Am3kjAa1jDQjqtIupr11x4T1EMqd+5D0
         396A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793684835; x=1794289635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CAUzZfGxBOdGVKQARymZnvw9tUEu8Gk9GBeF1+1UKlY=;
        b=VyCRyO+Okj2A4b5ZeCFYNYcSJR5dGLLP3zeAr66zFCgVbYVT6mtAVzIcEWaWVeYPps
         tN7Mc2I0SSs3+iQ47vRBwov3JA1uzrpe3pg8/wWF+Z00KTY+TygYV298rbW2q+P9Q7z6
         YsNSSf7E7fxQpqPXFh/p8bO1YK0cEOFtPImpNVPyJW0rmc0A3vheXAD6jS79ISZkZldd
         WDDGfV/PEUazHQfilEoJFYGTAfMSvpcSJoJtYrVE5a/BrnzQ0RkEieAKpa0wJGeDe7Eh
         TBBh3aEPaHEc9Lf0ZU9y4NrNLG+mVBtGxEqj0xMKG4r5KsjwvhYCBo2yLlfMxM/Elgsr
         0PMA==
X-Forwarded-Encrypted: i=1; AKwUvBz5nNNGyF2TUB3VTEUKmYlFamNkwulKooZQLZ8tAFCzrvU74YcVnhmL8Sa5zt7RA4ezVrbMUmoRXBz5Yv5rpb3glw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/IWoMzJgVfEcGPrGg8sYhT3Jic3y76wbEWxM9QMcBO6VnkzAW
	Cb3OVLp+6peni8d2DhzERbehOL37LluaBlOhyuPWfjJtOJ0fvziAidCzRXbJ/rb72uc+MK2S9JZ
	W+c0c2RZ81WV18JC0P+nv9TmLbmkX33ju573NbP9keSNUhiGQNrk0wARJnk1HNRADhmRS4bnhCQ
	==
X-Gm-Gg: AYBFou1shGTIcpBmxkx+3L44+G3JtK1UHEElV+giCj2/dDvPh+w6xpDwAb44OD/5PGx
	rwP7o+KUBW0Y8sp3BnmKG8GDPELUbeTHTP+vjXm8FrlWjibuxFGnw2Z3lSIjpMxC/C0NHVb8qLy
	V4AsxO0UTIt+MXRzZ+dle+1o14HLAvl4kyWlM71yPNfjl5FSWaPu5YRkn7GfCELUyfYeuqmAiun
	Nq66qMdN3DoBPBoeUeLA8naoNE9P3VilBIKJnZQovm8BpoMCWqHM1r/TuvX2DSlwsxFjGpwkmtb
	idiEnHGtoZn+ZZg8R8DBrFNcspkltjoS6m09X2kTfPhcJurU6N9DaJtXSkyXsNywlzRLK//QKqs
	/XITcHgDw6b8jeQKJztOAOrLij9cC/oP0uG7Yfg5qOt6RED9nHBnptu6afn+ILcZ7/c3lUTXsER
	PBdFnj
X-Received: by 2002:a05:6a00:1f0b:b0:899:67fe:3c52 with SMTP id d2e1a72fcca58-8a9be1a4461mr10570064b3a.15.1793684835500;
        Mon, 02 Nov 2026 21:47:15 -0800 (PST)
X-Received: by 2002:a05:6a00:1f0b:b0:899:67fe:3c52 with SMTP id d2e1a72fcca58-8a9be1a4461mr10570053b3a.15.1793684835043;
        Mon, 02 Nov 2026 21:47:15 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad7801a53sm2896689b3a.2.2026.11.02.21.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:47:14 -0800 (PST)
Message-ID: <e44d3e85-8dbf-4ca2-9c88-817f729fcdb8@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 11:17:03 +0530
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] i2c: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Codrin Ciubotariu
 <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oleksij Rempel
 <o.rempel@pengutronix.de>,
        Viken Dadhaniya
 <viken.dadhaniya@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:MICROCHIP I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:FREESCALE IMX LPI2C DRIVER" <imx@lists.linux.dev>,
        "open list:QUALCOMM I2C QCOM GENI DRIVER" <linux-arm-msm@vger.kernel.org>,
        "open list:RENESAS R-CAR I2C DRIVERS" <linux-renesas-soc@vger.kernel.org>,
        "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Cc: vkoul@kernel.org
References: <20261102170004.3852546-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261102170004.3852546-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PF2pIUqNVUcLkKli82tUASbRD5bfrowW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMiBTYWx0ZWRfX7WUXcMV3Pp+1
 gYpEbv7esMptxpo8HjIsdMooPRtMc9HrAH9OmHs9OPuh9sAIYRgwxe6xn1nmyo1ZtyR6HEmyA96
 lJ7rRMtgFVOdMVzr5+R37I/ooOJwExRVxdxLpd8vjyIUwpk1aNJ+tHa8t9dYJHo66hM2gAR3i1/
 laR0uMnGwrgj2YW/huGV+Rl5m46XDZMjNgGzKic1LH3g4wOGPuhm4rVnG9so+SD3INrsTL5pExc
 153wwT0/G1aJDnE9v3pyh9m4o8n6Lb5DihYlcUY6txZ7PtteesLhA1FM0qInm/Si8S6e16DfMin
 p8RkNOgS29Vhp/l/6MMXle+b0DP2ZgwtYt4sovs6qb2qhHB7+kbYu0f/lHFxMwcSDmjxmw2eRM8
 BNvAM3nIdO3AOCTGS9W8FwJL/3cMrHoPy5emd2Y79CWhO+k/Y7Fb4Qyl9XFFK3V6hjlBFrQYi0p
 H48NOP01ws9VN4bJmcg==
X-Proofpoint-GUID: PF2pIUqNVUcLkKli82tUASbRD5bfrowW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMiBTYWx0ZWRfX56YZAhIYnuVf
 Mu13EllkF4SWIvz2OdGT1uYcDvgfjRTd/zMnKEe1ORGXHX6ocIAkS2my4MwBFRoIwmbv+tPSRIo
 LzutJyldrgfak6KQtY7+qREPZHP8SFI=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae97564 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=ibj56h0FkVxt_nO8038A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1011 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030022



On 11/2/2026 10:30 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across various I2C bus drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
