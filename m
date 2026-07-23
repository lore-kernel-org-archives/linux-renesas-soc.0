Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377E935CB95
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 17:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827017; cv=none; b=i7MYxsWz+lQwPRGHhdiVanyEgkx99o4/+HCQIbLox9hk8Pfp5Zo/y7MUPK+BCX+luR1wYmBx2d0QUVjnNRiqYxEvMQP8iD+UX0OOeFi96w1r6hfXJu9SKfBgykoPiS7O5R3nMV21Vz3MwbT/6uEb39JT2FUdA7j944bFMDlDhsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827017; c=relaxed/simple;
	bh=87U2BF7ROJcMGMAeiwhiFsxW9By6AUV2MKfXm6mNaOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nj38wM4KCht7ZH5s+VVYFG32XW2o6uqhrsyQ71n3vfRhx+bxHAdw3jMzfMbo8io15+5jngDHPIqib2Sp4xxO2pyWxeK6Y6eKv0Bf6Q5oebBcEr8HU6+pd0HCIBBAAdl1s4hVg+hfx9QQ363pDxXCOjHKDq73SabZtrCx4EOaTho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=daXLjxxw; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="daXLjxxw"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so974169f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 10:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1784827013; x=1785431813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OC6Xay4C+LNUcYvkyvApDsvmE+T9wiOzrVP6RhbK/vU=;
        b=daXLjxxwwFhAeRGwjgfBLmkYZom89ClhHTjPum88oyNhbTPYfp5z+ezIh1Nz38vOLF
         O6PY4jea8ab2pbfGVA/3eKLMeKLv8oq9ITtGPFaP/IIIB6wiUwDX0BSGiOKfBHSz2FxG
         zXYX2Yj0j+0Ow5GRBq8lkiAYlaxkkChgBKWO9yGSCzNvffEJAh4R6kjGrHuC7wOjzRO2
         qp4mOAD+X/ZIp+KXlzwAaniNHTLO/S8xxsqicQggXED8Y+nShN4NxTqz35tnSxEkYxuf
         yr75zSNudxibqn11cW52HaXZ6lUoqJbcGVvcuLPosU76B972lir1criVgdfz0KfpGAuy
         VgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784827013; x=1785431813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OC6Xay4C+LNUcYvkyvApDsvmE+T9wiOzrVP6RhbK/vU=;
        b=cvozH/i+uBmNcLKIg4s6tNownhCW2u2B1tk3ybxyO/+DsMK93Or6gK1tdB7rVH8YZw
         mAFokelIm/ZIWwOZe3vFPxDu0VDLbdTh3YrcgGOegabPY0NEYEc1B6LY3PJxjbaWQt0v
         qEBEaq9G6ISeX62rKpodqk8FTCQ9nkG7dKbi0kvrGKzbPf3j1HWbblphrYLrYZgQwepb
         BYh/0MVvzjccLzFqZBla3xYviNd3bYjMhda1n1LbLENNzjGPWwxJPvFWu/Ih/O4egHFd
         JHS/2YvPkNeQVvhn5Zx8tS5MAVouJYyKFAuFdXF8BqwRAWeH8b+rTAMh/AtUJTvr+yi4
         6dCw==
X-Forwarded-Encrypted: i=1; AHgh+RoNxd+3i1LUHtKHkQbBvMtzjf/azlQHkC7HvZR1z660BGqNlJu+ht5Umyk2Y/STxl8+nxizSA/WfAQC34zgMK4IFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXvPHqbjIjV6PUVbGfwS4EUHf3p+CaaUtoXoYojpaWwT6SG7Ja
	E6vIwveygaIK/y8QQnfGkgRnwKbWNEXYf3Flwm/h21YJ83qa7A/U2WGthV8H3U4vRTg=
X-Gm-Gg: AR+sD13YvKzmlbUBwH7SGA7IpiAayxgQrky/3xWUyD7ifZAxHY6peTTqHyL2GkUjNOP
	s7qpazCwOjGmqftaKvthBnRGGwv33Bovj82jNLJAGSfKK+W6BXqa32ebKjYRXCxalwypO4A+bY5
	NfG3FVv6mLWYwh5XmH48Zi6i4m+93FQu62myt6pBpeAoPkaAP9OapaPOrU7MgZ8Tl/7i1/wCPPH
	2NFBk7VT96ODmEdv123FSD2D0ctNrim1gKFtOHR+3hfKqYixbzI0xvSjA8SyIvvnD7EZggi57Z9
	XFd5HoQAXuOcAVwdcttM3VjaeZGcyQYvtRlLXSBY+wtXCp57PBjy0AwmCfeHqEPaqbhuhnz+PyU
	BwvDuIlXhxj19QEKsq/ea2h9h7yRRmq0Wt/OvtndNjvY90jrkgXK3fwmuBQvUFOXuJQmf3oqmG9
	CUKzjaHZRx8JIV7UpLCQwCupoc1dKpeZPV/9ITZxqD/WiA/BPiXDIkkAPdY3Sjv0E1SSDC
X-Received: by 2002:a05:6000:2287:b0:47f:837a:aa1b with SMTP id ffacd0b85a97d-47f8dc8cf8bmr5028600f8f.36.1784827013320;
        Thu, 23 Jul 2026 10:16:53 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6302:7700:4510:8c44:3b9e:61ae? ([2a02:2f04:6302:7700:4510:8c44:3b9e:61ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm16373400f8f.10.2026.07.23.10.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 10:16:52 -0700 (PDT)
Message-ID: <14727860-74c2-499e-b59c-f1bff48bb855@tuxon.dev>
Date: Thu, 23 Jul 2026 20:16:50 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] PCI: rzg3s: Disable refclk on probe failure
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Prabhakar
 <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 stable@vger.kernel.org
References: <20260715223019.3002237-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260715223019.3002237-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260715223019.3002237-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/16/26 01:30, Prabhakar wrote:
> From: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> rzg3s_pcie_host_init_port() enables the PCIe reference clock using
> clk_prepare_enable(), but if rzg3s_pcie_probe() subsequently fails, for
> example because pci_host_probe() returns an error, the probe error path
> only releases the clock handle with clk_put().
> 
> Balance clk_prepare_enable() by calling clk_disable_unprepare() in the
> probe cleanup path before releasing the clock, ensuring the reference
> clock is properly disabled on probe failure.
> 
> Fixes: 7ef502fb35b28 ("PCI: Add Renesas RZ/G3S host controller driver")
> Cc:stable@vger.kernel.org
> Signed-off-by: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
