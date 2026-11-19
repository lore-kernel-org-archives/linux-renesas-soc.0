Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099640;
	b=1C/zLjWYROb5AgrhyYERHuitWpxmverttLxVMWGAIwboqTGDwk3Y6fSIHU1cAsrdcfz8
	 mq8Oru3xXuFYOWD0S+MZymDecPeLzeE/IUh7hFS+b0Hq09t6GKA9dxGJfI1StOaUt2FH+
	 ibQhDXtTbgqIsAiZAlwcKWBO2lZJ+Q8IgtbI4F0zz7kKL8506oihkKRyURlmyj/I2PfK8
	 k5oY0+e6OaG3XfSa6fzrArKe/jTM9yOlsciV6dErvi+FVj8vvsq9GVlCjri/WI5VPTdK8
	 NxAKHE2jrDa5WSsINsqcGFYk178jcZ5+F8iseRC76BfnWyRQwadeHmx7ZdoAKzA0wmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vITMaRYl8N/4FX6Ub/CtOdFIyxibL9pIfaPhRC74PEQ=;
	b=VYHl6LeGH2Z4VYpIbYTAo/h39fXCMj/umXgcrPGEaoFEQZgsisXCwrEbdvj3Rnnkj31w
	 zoryZHRij0xlAsPQn0WnW84hduvE2V/kISfBtPO+7A0dBshtjMe0DQBT8TItNAVuTXCjw
	 tF/Bx+imhUIVxray5JldAgqlidV9GT+/hxFea/7G9wth/no+DI8uzAUe2IQbHfIA9dBdo
	 Xo7COBDjFlGiWAT4U1TVxsOrf8oTiYsmXy1JRIszJTZ3hpD/YylkUKikAepmafyclvZPB
	 y6322htKL8vXRNLHNrbJwk4e8K9DXBMVrckyzSzGQUdhmQ+uEGSRjEzrS7R06MHW7Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TrJluSdU;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED34B606A324
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 14:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED34B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TrJluSdU
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so2078088a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 06:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795099637; x=1795704437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vITMaRYl8N/4FX6Ub/CtOdFIyxibL9pIfaPhRC74PEQ=;
        b=TrJluSdUX+LCPAOrAOhA6LjHqBXkXzXdZYzjMx55+3fdDm8qXlIDbcwPLeFn5iEV8L
         81q7PJ6vKUHawD3zzMlIVK3s0qlUxABF9nlbI1HhyjHFLneVa4qFHXHBTQ30Wd2+GFaT
         N5U8a7+EgH75s8BGxVtnefpvkPJZTUdEf4siNc2UfCxyTzsphHLg2wBwxKJih/LDuApL
         eWknL1aAzPN20X8Bum1bME8KDVnaD0j71ulUclw9QS9pjmPRMYD1rEO0Cg7cEQJUz7M2
         /E2vbBN1hhBaN1oikSCwHN6vsJoji+hAK43fX4HYQaXsr2i5I4wC+SL3M+HaQAYn82fy
         hy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099637; x=1795704437;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vITMaRYl8N/4FX6Ub/CtOdFIyxibL9pIfaPhRC74PEQ=;
        b=rqToWYzrL1c0pxV84uOvBkqo3thGnb6+vpgXVv7qpZTl+/6MXQmchB6KcZxHuNsBHm
         BzsjIG+UzKOt74CJGO0fPr5w74+jsbjVpl6S0v+RC+dYp/z2BNfgSHbTCKmk/g1TZnsc
         n4pnFHBW8EQwoEhPDNf/YeB+Ic6/vgcDPtt3CjR9/482+ijbu6yS8UTmGlf/PQVACMcO
         VkuyXRaI2nPIWB0FeDxsyFxdpHolhVo4BgNki+oY310z8rTxwcE+G34hTTnRPj5AnKhf
         PAfsch2r6HIJvtJ7GNb7qDBQjyYpLMHeOAvzlio2EHyAswjjbMa9Uy9sbu4MtLsqxvjZ
         jBEw==
X-Forwarded-Encrypted: i=1; AL+hErG5k0uRupGGrvK2AQv33BOjVsYnG/Hlp7phVLx3xJu10sj4WKQ9GSFRn0ZLW9aJUrl1v0jNUlcFmdcV5X79jAEqiQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+LRQgKanDCmiuKH7U05Kfp9e3ETsxtkoGnwkdqInplrHRibVu9
	PrtFDagm4o+LJvhZdTbYFpudiA25E7qfOq4/RgwAR4vT9fkIfTOWH2B5fdSmU7N2RuA=
X-Gm-Gg: AYBFou1veTtiD+5vPLKSj9G4vZjdPvzjVb7Xn/TpuHz9PLTw3Z1olb/WM1PoCDbg2Po
	bH/ZCsSWQHrOlw35/nI7GSFpNe+AsKjEJU87LXAy69zSkxsOON21wMoPbGnmXTRPq6fzGLJ2r6l
	b+LWCSQWMKk3tOn1TLmihmdOqxcc+dMnNiJRhLCCnRt5tgvr+TgzA4OIuyBMfVebHJnoYO6gBAq
	J9DXKOGtA/DWLnDnhFg9VoWjbWZBzSTxZCGXP4nkeMroZvaySnU3RbQUCJBMTmlepCub2Dm2Ouq
	u8NxiHYuyucHxqlUwWySdZDQKtZlszLSHDmJsP6cemk2CAmp1++YDtuQB5LoCR9kDXCQXV/VKHz
	WUgFFgVbCNTJRuDYm7kb7j+1sv1K5bhDJDlRKU+4VFHr4WzPBYBcorf3A0DFygQy3m3t2LMSqgI
	4UG+QLQ3R5SPB4jTOC4TzNQ6dQ+Jft3xk8wqX6j9FJg65DKUmsCsNREcVHL+odLhb70ZS/DNBfU
	wl4D5VnscAjFz/Uvr2/jW8W0pOiQ9Gn+49ca1bHeehQw1Sf95zgNjLtOo42nIE7QZ6uGoeZsi7R
	BOFG6lvcCn4QAkgI+1TKldwefv4tVAVsndlJoM5fkl5zb2IlkWeVn+lMhw==
X-Received: by 2002:aa7:c7d5:0:b0:6b6:ea98:2539 with SMTP id 4fb4d7f45d1cf-6b9095b57admr2564430a12.6.1795099637250;
        Thu, 19 Nov 2026 06:47:17 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88993e08csm2579854a12.6.2026.11.19.06.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 06:47:16 -0800 (PST)
Message-ID: <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
Date: Thu, 19 Nov 2026 15:47:15 +0100
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
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Paul Elder <paul.elder+renesas@ideasonboard.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1795029012.git.geert+renesas@glider.be>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <cover.1795029012.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert,

On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> TL;DR:
> 
>     Describe hardware in DT, and perform mapping to abstractions offered
>     by SCMI in Linux.

A question on the approach
An SCMI variant DT could mark the CPG and MDLC status = "reserved" and point the consumers at arm,scmi, while the U-Boot IPL keeps the hardware DT.
Since v4, the series assumes the SCMI ids are stable:

>   - Remove dependencies by making assumptions and dropping disputed
>     items, to move this series forward:
>       - Assume all SCMI IDs are stable.
If they are, why not using them in the DT directly?

On partitioning, the cover letter says:

>   - The clock, reset, and power domain IDs are not stable by design,
>     causing DT incompatibilities.
>     SCMI requires that the ID space exposed to an agent (i.e. Linux)
>     starts at zero and is contiguous.  Hence any change in system
>     partitioning (Application CPU core vs. Realtime CPU core,
>     virtualization, ...) may mean a renumbering of all SCMI IDs,
>     implying a massive change to the DT.

SCMI do not mandate that renumbering. The ids start at zero and are sequential, but nothing requires them to cover only the resources of one agent.
The firmware can keep a single id space for all agents and restrict per agent what each one may use, the rest returning DENIED (SCMI 4.0, section 3.2.1).
For virtualization, the spec has the hypervisor grant each VM its resources this way. A new VM then changes permissions, not ids.

With a single id space, a software configuration only changes which nodes are enabled, so one DT per software configuration, a base DT plus an overlay, is enough.
If managing many configurations ever becomes a nightmare, tools exist for it, such as Lopper from devicetree-org [1], which generate one DT per execution domain from a single system DT.

That leaves the missing clock domain, which is a gap in SCMI itself.

[1] https://github.com/devicetree-org/lopper

Best regards,
Clément
