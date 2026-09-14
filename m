Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867D648643C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 15:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401166; cv=none; b=n6kpo++uy9NZqm0SgfnlQAb+jJiUi0zWFX7LoXvW5n25bEAaAgM6FIyBfpjwjcxpg45+Q9KLipBv0twNXUOSABZOif/K1/felvQbn2WARCXpiJk86babsM/sviNhtkcc0sYd8ILgRD1TJPibliwIf80s34VVMUSeF66VxlNBYrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401166; c=relaxed/simple;
	bh=HIk1IpHMIoS0JC9EwLMBzSzfIUXCdtc0LgtWZRJBnoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ngpC4a3802h69q5Qng9NOf0w9VU30aaxRwv1fa4ts0GSbY8kf8aev6JnEwks0esdXIJJpPV0/3kUVhFHZYaAkd/p9hzg24DGXzptCV4ZZclRWW8BsGHC5Qt5efxAaZex4EuExZR+niFFIMQ17U6OjCnj+BZ6Nly7dSAfaGTzwkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpKZIH2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbyEVNew; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpKZIH2f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbyEVNew"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Xtm607594
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 15:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=; b=JpKZIH2f9DAXQmXH
	2iSP1VdlpJ0jceUw4F13wvvmhwgtDHYwagzFi0IhLy8fWf1EZBTsFWgxC2NtF+td
	1WB37/06bpqcAzlBAvfooguEFqC49IGSvPVLEjjDniBT5Wk0wufQgO3pvEHhA6DR
	vzmq7nW95tq33wdbJ61049JaWHRe3zZQo9rYHgZSTB3t9nBRWzVB7ZtP/fofSiWi
	e7XA9fOcoKAvtOLodW3OMJ5HOzHr8EhHdSiHkovtecswNEkJ/z+6GaUfDWFH6tn1
	lLDJrJtF4D74EaNcKXw610/z4fDiD6TCkV8IMdJyApCyirO2+QUisvflLq/wqhrD
	t9dkSg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2ks1ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 15:52:43 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7c0d2b0aaso1457537e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 08:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789401163; x=1790005963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=;
        b=cbyEVNew59KTEOHkMvW19wLJiDhwdkIA3a8ZRQYYlT6l5d5aiO+POfj1zZLKu04uPm
         MYjV166dLa4BsC005EfZBKRQUbEb7i6x3d2fGgDMG+yLWO5al51x++yqDPAe4zykANRP
         /5EP8rgzNsfscnWqKZmh+HR6u2kgRGaBRNNtXGXoWV366TTh3Oma9G5zOP3pVUKl6FCr
         BMOKXo8d3dWnGAxR/sq/EBOyIxbqSwUzafkU//Pe0/fqZBjukhLpko7G8WRCQWhYBt4d
         oM1sKA22NHk5dONuRupYEQDr806scnDNHewvbZ1Q2pEZiIZRaXYXIfbmbW3HpeHp1RNg
         8j9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401163; x=1790005963;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=;
        b=kbdqa8TzFg4HvTJyizurjKdk3cBa2KQr4C4ZClS1A1oWN5xmxAKVbtWLsBJVz59au9
         1VOK1K4E5I9K4eHVgfxXuB2Oi0klttFT2J8lXT2jvfpgtf4MecYFFAj15y54so7s0F+8
         kgWV9dKYHzEShNJi99gq7Ti5Y5+tAvXaW8Wx8Ecb5vxdhKN8eiFJlrcqH62F9lEOtna5
         PUpj3WRiF89i+ruHUFJgUIFom8z6v1W4nlKfAx5Nfc66mISi+9QcPKgXLKJ1R0hadNX/
         gpw2twoASxYoeu/xO4kOptRgjl6VZaMGxKj9i/vmjXkwg8+Cy8+OMGbBOg6qq9X8iXVo
         GKvA==
X-Forwarded-Encrypted: i=1; AKwUvBxkj5pVfTC4KYLvr0m6XnOKyDuJeFLHUgMYh+Q+ivInAeoHGJ84UEFe33SyL6Fn2I6n6VjnpYjaqXXontB6BM/3OQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l2beRUyZnVxYKvPWoNBfb+lEiyidAoMnQoMifD/EHyn49hEYju
	Qb0Ct4pZ8/V4ui0LgwwYBOhgEQqffEjNVjZUnqNhs3YgbilrplvBr3BzVJ7LzSwsfAMVRmg3puZ
	NAm2MseDYwYGKD/iRwW54teeiBsq4Y2/YzLVgjY8G9kfhD1yc6qA7pj8HRYCF5PTA7etASGlNtw
	==
X-Gm-Gg: AYBFou3hL/hLSCpr3qhArhiPnKFcdDC6JaZpH57cWNtrFXhsxtzzjotuQcEV5GD7pga
	94nkZDLN2/4vWzXnf5UlUScruSaijQIQ4v5I9VWVuZjNEs10suW1yET8ax09nTPgGuPO+dsRLNI
	rqVxEI3vOdUzqxLufXZEfjJWgIjL5AEHf4cdoWUi+lGMqqiLcROalBDhML5HSOBuUH1g2qmnErm
	Uan6vcS2EfXvLd7l0KNsiaxb/1VxzgCu7RT6bhGsCMV0wOA4NeSpmmFVurzN1ml8vGBSDfvIB7S
	M9n+gIlzeK6FTCG9etSAFEQlRV91zcm80vjnmQc36b6X9a4JWjHlKFrQjl5+x6xac3K8JVjb6A5
	VS4dxNOe4vqR+xvCNvrwKUXv4eWOK
X-Received: by 2002:a05:6122:32d0:b0:5c9:72ea:141b with SMTP id 71dfb90a1353d-5c981d701dbmr3781456e0c.6.1789401157591;
        Mon, 14 Sep 2026 08:52:37 -0700 (PDT)
X-Received: by 2002:a05:6122:32d0:b0:5c9:72ea:141b with SMTP id 71dfb90a1353d-5c981d701dbmr3780433e0c.6.1789401153186;
        Mon, 14 Sep 2026 08:52:33 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm22926613f8f.0.2026.09.14.08.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:52:31 -0700 (PDT)
Message-ID: <3bda35ea-1f45-4cc1-af1e-7f1513651b60@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:52:26 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] dt-bindings: net: Use consistent indentation in
 the example
To: netdev-bot+sashiko@kernel.org
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, justin.chen@broadcom.com,
        florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, ulli.kroll@googlemail.com, linusw@kernel.org,
        clement.leger@bootlin.com, olteanv@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, hayashi.kunihiko@socionext.com,
        mhiramat@kernel.org, nbd@nbd.name, lorenzo@kernel.org,
        ryder.lee@mediatek.com, shayne.chen@mediatek.com,
        sean.wang@mediatek.com, johannes@sipsolutions.net,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        jjohnson@kernel.org, richardcochran@gmail.com, geert+renesas@glider.be,
        magnus.damm@gmail.com, yongxing.mou@oss.qualcomm.com, rfoss@kernel.org,
        abelvesa@kernel.org, vineetha.g.jaya.kumaran@intel.com,
        claudiu.manoil@nxp.com, alexandre.belloni@bootlin.com,
        elder@kernel.org, s-vadapalli@ti.com, rogerq@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-mediatek@lists.infradead.org, ath10k@lists.infradead.org
References: <20260913122910.99457-3-krzysztof.kozlowski@oss.qualcomm.com>
 <178939022208.22033.14553895731937911806@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <178939022208.22033.14553895731937911806@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: V1ZFFK2zVoUcPTya6xYroyvD8MrtoPPf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfX3N66+KQFBXb+
 Shwd/msMxc7VEbbg0GW0ZU6cFLBpgeMx9PiSVzMHirILhyqarBuJ2YZfXjyN/Jeo1LqrTTsbbFi
 1ytdHnitpI0A3sDkoLjiPOoszdMI8mti/cxPHSPtTkWhS/wyD8kELYUpAfkTiJBhltc/i98BSCf
 kfyWyeKGtqjLzlXTWIa+EUbXKTNCZn5fr9XRJt1vug3L7nlH8pdiVLRaPIp0CUI73NvkIi2L+4J
 bz0AA9yd24ha3YKA46cDWfZ6QgvgMMhM1lFWvuWjEQEsB07Dvbtn8MScUIzmVooZeQvLhvuw63c
 476F6VMYbHZEIYd/IP2MJDYMVyPBuNMUX2qxqw5j7IrFWpWoe2iEPR9wabRzwin2LIdUb58T4E1
 3eo4ySYpSC4QoSCFpDGUs5MYJZan5IYwfDgLdTTWO9L+HZojJdeDHTTm37BH8lI8uiRor+u5Y29
 DrA6MZXX3GmZ9Z00dXw==
X-Proofpoint-GUID: V1ZFFK2zVoUcPTya6xYroyvD8MrtoPPf
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa8184b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=JYzT5DUXXbXYkYiThRIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfX/kJM0VaxTuLd
 oLIu/YJNPMD6FpxUNaJxKcUPaly3SiCF5mQm3P8Iw8MVDdxh+mqJuh2R1/O2wkiNzaPw3v9o4vD
 71e2UTco6Ep+CNmrfzaadWv3hTF/gaQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140226

On 14/09/2026 14:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> - [Medium] In Documentation/devicetree/bindings/net/cortina,gemini-
>   ethernet.yaml the patch does more than re-indent: it deletes the whole…

Overly long, it's like use the most words to explain something to waste
other people time... I really dislike this approach but did complain and
people disagreed.

Best regards,
Krzysztof
