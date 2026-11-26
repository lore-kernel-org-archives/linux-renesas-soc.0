Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711718;
	b=pSb4yOGcGw+efbLFEbONwKzUg9E7B2yJzEswrXMSlhII6YwQfkMLT2bPGT8IZUMk7p26
	 y+W5AOvuYB5q+6vORmg8stpbXbVBTOOP8UL5RlwqO8Z7ixfsSaYa1r/GPxudmKGjN2m7L
	 sQ4RIuOAMgbqMjreaetg5asOIGtJo4oNrx47p9KECja2piHEscbVDyfeMjbTrxchEeqwU
	 JSbxfQ2yf3CBB39U/LBbNZlsVJ69fxEfOs0MXftx7hHC72yiI+YUU9uAtxwnRMLe1HWwF
	 kk/xlYR5kpnjtwSoN75ZRDXn7GIhp41rlzuTy9ubzl0MylXTsMfaW0rJLF66Horb6qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZVsq7HzzR584tpf1ZxWh8VZbyO/31x1/Kte9UhSSi5A=;
	b=d6mc6/zOWbas0txXHOgvWoSySbM04paZl3f7ND4EvLlsOxUaOT+HYSwLjKR8UUqYIz3N
	 XKvimLs9kHsIx4BXqrkW9RU0peADhksArOHCvbHCMWbs/PTCBWYgdps9sY6DajnHKslLV
	 CCD469CKPjHwrxoCtRal4scIfoexdnp/lzzXZ1Mlv/U4xygjiLJ9KutsMsVZxHuDwf/Fz
	 fixj+eGICzs2MS7hnkMq0Sb/ApudKH0IhtsdLwgkpOAqMjhowznL/hZ9xfAo2gxtKzpio
	 Q9xdThG5v1KmM4URneZVYuPGlnCujmM7uqUg16+X3gEEz8zYmwB3/Qi92cGTuDDr9Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=Tpi3UyPb;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C18606A321
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 16:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92C18606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=Tpi3UyPb
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e47347279so4422592f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 08:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795711716; x=1796316516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVsq7HzzR584tpf1ZxWh8VZbyO/31x1/Kte9UhSSi5A=;
        b=Tpi3UyPbUEwAbxv2YI8qS6q9I4WYwk9hOYS1KUt0uqR38AocfXhUKn9bDztAP6zGVk
         DrICgIBQ4IL6V8rxgebQV2Cw/SJsAn3My66XHXVG20DjP6P0WCqcIIq/uD842BvdDNRR
         qL5HOABwJYkXJgTNOP5FMsk/AwXm/+VXrnSCu94UCMX40qDCFu/PUk71UJ2Em2nMYkTv
         vfF+czxdeaHPMBR/yEdJBwq4wseagIfJHqJqAQj4xcfl9zvrNmU6ONvX+mtwrzC2PboB
         GvtcIa/ec/OzirzDUFGcPn/ndoX/0NcnjtZe4koYr+ePazyWjlf5bUvKtkXnLs74jyIM
         iATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711716; x=1796316516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVsq7HzzR584tpf1ZxWh8VZbyO/31x1/Kte9UhSSi5A=;
        b=UwF25txP3y4UUMUsvEiByNM2AywpiL2JBXQ/RLsAhKoNgkoCsYxyTVKvpu3IQ+GEBH
         DduDk+k/FNKSB3t8YRul0/szTIiOKbqLi9OUeDeJxpheCGlWAReBSZZQU6J8IjbFQcMK
         +J+SDcAgenYmrddX5eEMm6VZPY0Rczih/fiPS6SipZ4WK+R7tU+K1pH0EK3HxrHDH3kv
         TlMinK6xlrzIIx8pOoMVE/FCLCtA2p8vYcPMu0vilciATSm2j/EedhT6Qfbj6eLNdaTI
         Jddtkrt8+DbIgP2nZZtZlIXCr7gpuw73DOfGGmNWQiEX2233eNHW2McU5QdFIUT1kBJI
         4TtA==
X-Forwarded-Encrypted: i=1; AL+hErGJhqFFzsjGvzuPTiwDxSjTSW9gBUPOdxlDF2CurnotqRcBc184s3CK1Y2ULbANUbCTqc4mpfuBE2TOOD3s8SRIcw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZHQTbGH8F8Njx4HzeH9UWeWazf9INrVvafw18LpJ8AP2p4hvs
	g6KwGa8gs2zmQsYvceFIj8GsRp97BLejg5hn5T/EeH/x/SIwirAwjl3foCRy6v+5MTo=
X-Gm-Gg: AZFdTZeozC8L/nvJR7SHI3w4Gr1RXikyqPHsgHBmXzxuWToF1O3Mpv8EpQ0t8udj5nE
	Em5PguKO52+t30bfDlVRS/+en/CZZ+ZUWZ4UyG1bh+8cOuAzZt/2luKGBdVT2YLgKt365aRzkh/
	yKqjw9NcYPCMygaoyABu/ps/oDeEupp3RwdvlmLCelI2xeNpVRereRbHLmjyTXHCozPJlUNDdKI
	wzNzgUoxe0gkIoI8LFWWQywRqMv5p326IlroMDP6oY+wjTbkNV3L5g+sjfY0zQt/zSAiDw7qdsn
	O6Q9wI4IVQYOMqAhW+/oK4K9OLIInqQMz6Q95SiQ1x1Xp8pJaaZJrNoaMTzhdj+Bm0rjvtVzd85
	53qoiogy8oA78yiNoQDOcaynRAJsfuC9RwrafVKCcAf0pWzU4wmWFGXeTeFrLyqsMPDpwH8uhiz
	ctDskdG3BvYfO6rgxn2FtvPjZVbXSAJs613LWFpw4D0lsjkM2cKWJRUCCldmWwPS7zinr8chhEK
	pFDBxvst421QC9wvjrN9H9mqlkaHu3rY/VLLAMfGeULa1ITkKZ8u9ChGzSPIBQFNakf6Jz7eUU8
	JyJLR7ZeyZSZIfJ5c40nPt5iffjpYj8dCvzJ
X-Received: by 2002:a5d:5888:0:b0:490:a481:7ac8 with SMTP id ffacd0b85a97d-4abb532ea79mr39988008f8f.29.1795711715830;
        Thu, 26 Nov 2026 08:48:35 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm42879947f8f.3.2026.11.26.08.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:48:35 -0800 (PST)
Message-ID: <9a269c63-86c1-425e-a892-b37856a26df2@tuxon.dev>
Date: Thu, 26 Nov 2026 18:48:33 +0200
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
Subject: Re: [PATCH v2 2/4] can: rcar_canfd: Add Runtime PM support
To: Geert Uytterhoeven <geert@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
 <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <cover.1795703576.git.geert+renesas@glider.be>
 <557fa8a4776e0ee7d6c566b825771075db46b276.1795703576.git.geert+renesas@glider.be>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <557fa8a4776e0ee7d6c566b825771075db46b276.1795703576.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/26/26 16:46, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven<geert+renesas@glider.be>
> 
> On R-Car X5H, the CAN-FD module is part of a power domain.  This means
> Runtime PM must be used to make sure the domain is powered when needed.
> The CAN-FD module is part of a Clock Domain on all supported SoCs.
> Hence remove explicit management of the functional clock, as this is
> handled automatically by Runtime PM.
> 
> Signed-off-by: Geert Uytterhoeven<geert+renesas@glider.be>
> Reviewed-by: Biju Das<biju.das.jz@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
