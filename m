Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC62156F45
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Aug 2026 18:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786818645; cv=none; b=Mb8UBWQcfgw4J+KacCHpjuYJWqZbx4PRBOuXDqVEqu7syRCWGNGiLaV7yW1zIPpMp6hyzddGo+Qv3+j500hoeXwuVyvkdN4gJxn9iFAOKHgvH8xq4PnS8u46Z61fPJpGE0X9EKZbV953rnI8XFpbu0VjEgtTTOgToJfPKnxprjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786818645; c=relaxed/simple;
	bh=kZTfO3uBKI57NTDJR2ykmTrRfYE0b0gP3rPTwHiWlDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RsAOyMXFT1UR9p1Puk1Mw9YkdZo+IrxHBrBPaRbkQKA3zfbrzG0xNnv9OOiu/IBxMYjSmDPpx1XafvAzYtiMpoIKjO0AD9WQAckgSZobeyn44lHcHrqafQTYh8mJ/YMFXdJD9I21XrVPH4RDXY/nE5FO71A3NI2e7MgucLjKXRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUMcL5WN; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUMcL5WN"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a36982a875so2533119a12.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Aug 2026 11:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786818642; x=1787423442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bX0B/tvx/xNY4Z8oanBlKNjZDRWTCp9mIncsBbd3D3s=;
        b=QUMcL5WNZ97vXsab3wHFE9ktnGN5ocPotQL03Lov80XfdxfQfkSGgzTAgXtIVNqxJ9
         vvNf/Nf0t5YPAdQbeE4n74iJjrTM1bMw7P6sX+0rznkVcAz2/2pMMr5LI/+VHr4rmllf
         Fb50UADBBG+fqAUpv93RECRm7ju86fML9PLtmYhj0DBW4i7j2J11aq8fuW4t2nlnLz4W
         gPHlyWzoHvYHE3tgm0Tp5jnkpr4hTiFvxOexnDcTKUHZtdPvbjbchh5iyu0JTuMxtqq8
         57rpzb3j5uwHTQTnkUtyeUwKh0NYWXjzt4YHLPAOqxmpPpyyQKfgxD6gZvXApAcmoyRT
         Q+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786818642; x=1787423442;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bX0B/tvx/xNY4Z8oanBlKNjZDRWTCp9mIncsBbd3D3s=;
        b=I8/lBl6fhn7UgsMrxYUeQD6YJFOkNvWAJD0p4ZEVOcOHpBArAuDNismEafdhtuu3I0
         mmn4C1dIf1oB9GIWNxQVx39dSIKn5x5HR2nDadKn1ENOgNVim9FpKHB3SXv9QfbmTZrq
         uZeYJ7g4HhJyld7pdfhscPTsALS1hxkAdV2weYKtkb/LAWP/B/D8+HG1UdO7omFTFt9U
         Jz4HyTlAzTrcKmh99TuJZS63CHQ4WZ0oJYR4CAj9taTZNgha8LZit1ZkrRO9X9v8j7Bt
         DHQMxB8wnDor5Hs9O23iBKH+nBtfv+BCx7RfJl4wGRm06de/Qj0Y1IopYu5a0j9ip8Rp
         2uvA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9kKhISgHhTR5tBIj5xbEvZ5cdnUPGFiJcB6K9UYhhQ1POx3ETPAI97dxshV8mcUMorc/ObDw4wQm9kr3thYb5mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ks+4u76UpfSB/h7//0Oiz5H3tcYfoIPEEY8m1SOc8Y6fP6Wa
	n9mhJ2QSC1Enkm2i7Skr1cyVfiakOkG/XmZqJwTDYi3AWbAHBIPSgTiF
X-Gm-Gg: AR+sD11B2V2naQdC4nCAUp4RsIuaqoUY3yfqaGSZZAsKSo2s6M9Yrh4P5vABDgTmbpx
	ITpqsvmZ6W89jjexx/SqPofQ8n8YoAzRyIjCXVUl9jVclkCSE8RAwjzqQsLSwbQkNZdBF1Irt4P
	tnBS1Rt+XGIM006KOy7ZibAqY0x54riIeODnFnOQ1iJzeVX900ELgfQpNIg8crLifl/1QFj6ggm
	vby7t3To4cTKZqwy3v0AGzmxMa6sl7HhKtT3wMdk9HjfvByn1Vl9TAbu8uI7TY6jOPuFP3CDY8i
	qB6Dn4WF0RFqSEzd70q3hMobABOLLyvFtvcetTbD3KMRdGJpniLwPJbmltNFh3AW9xzyeEpRnHP
	WGYaPjL7CPvRtogWfI8fesdUILoEtBv6S3mH4qC4O12KyY9aHxMh8BwAnrlA2ss3WzzHy0IFLzR
	7a38KVxwT1sdScQWSEYKAmoOAyPIHKfehU09ULvSvfOhwy7uovHQ1RNiUwJ1VfMApV7nodcDpCD
	QxOuK7ChSee5ao5uTWNqr6YwrXbA9/XlOoNuMri4Q==
X-Received: by 2002:a05:6402:504f:b0:6a3:6943:d64f with SMTP id 4fb4d7f45d1cf-6a38a8bef76mr5798579a12.2.1786818640952;
        Sat, 15 Aug 2026 11:30:40 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:28f:426f:2aa1:8f7:f8a6:4f89? ([2a00:1fa0:28f:426f:2aa1:8f7:f8a6:4f89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38d7698d8sm2205357a12.14.2026.08.15.11.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 11:30:39 -0700 (PDT)
Message-ID: <592ff228-2887-4ff9-b110-9f3c0e73a02a@gmail.com>
Date: Sat, 15 Aug 2026 21:30:35 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 03/10] net: ethernet: ravb: Simplify gPTP
 start and stop
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "DavidS. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260811160200.2049987-1-niklas.soderlund+renesas@ragnatech.se>
 <20260811160200.2049987-4-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260811160200.2049987-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/11/26 7:01 PM, Niklas Söderlund wrote:

> For devices that do not support the gPTP clock in config mode the
> somewhat oddly named flag gptp is set, compared to devices that do
> support the gPTP clock in config and operation mode where the flag
> ccc_gac is set instead. The two flags are mutually exclusive.
> 
> For the gptp-flag devices (Gen2) the clock is tied to the AVB-DMAC, when
> it is stopped so is the gPTP clock. For ccc_gac-flag devices (Gen3) the
> gPTP clock is available whenever the ndev is open.
> 
> Prepare to add Gen4 support which will add a third way by cleaning the
> Gen2 and Gen3 cases up a bit.
> 
> Fold the gptp-flag start and stop calls into ravb_dmac_init() and
> ravb_stop_dma(), which start and stop the AVB-DMAC. There are no
> functional change as all call sites to the construct:
> 
>     if (info->gptp)
>         ravb_ptp_init(ndev, priv->pdev);
> 
> are always just after a call to into ravb_dmac_init() and all call sites
> to the construct:
> 
>     if (info->gptp)
>         ravb_ptp_stop(ndev);
> 
> are always directly followed by a call to ravb_stop_dma().
> 
> There are two special cases where the calling construct covers both the
> gptp-flag and info->ccc_gac devices, one for start and one for stop. The
> condition that it is preceded by a call to ravb_dmac_init(), or followed
> by a call to ravb_stop_dma() are however true for them too. Reworked the
> two special cases to drop the check of info->gptp.
> 
> The end result is that the gPTP clock will be started or stopped for the
> gptp-flag devices in tandem with the AVB-DMAC, while the info->ccc_gac
> devices will be controlled, as before, when the ndev is opened or
> closed.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>

[...]

MBR, Sergey

