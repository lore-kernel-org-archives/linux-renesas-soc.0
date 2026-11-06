Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952240;
	b=DM5x0DVttLvip93qtUbxbF5gMhyEjhaziApIVdLTi4zDIZRNh9waoKdX1Tqyurtt71Lo
	 o+Zhp3ZSQSeWHO23cEpPZ6WbFtMX9AE9Cu/6VY+yOX3o5CAjtd+GvauEru0cR+VGn3fav
	 RpPOtLWDbOFMXZ2u5CGiPGpjPn0Oqz8AoIOnDmF/FJTe1f7QmULta+SkthFyfwTzMgsul
	 qAbRz2b720jDCdbfhsfjbANTUkWfhZATW5PYQQk9FkOOUezYae3SevlLNk9/9+yzFWOuq
	 jQBeG/HHFyHHRY31UptW0deeVPbktsQSFee0WqOctcpTtrZx1JWLQkLMR//s5vQy15g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=k3uHALvzjtptIMCjCni4Os1DaEQGVzPkp8ccI+3SeBQ=;
	b=X1DKPu/Wqr2bDjFq0lBJ8yw/VYpvVupoZe7zHeeWxugaw8WBi6Px8XDu7RE9iuG+tz4B
	 jQyiwENEhkUjeiLaY6Dqq/F8bSmDMRXfMmcSBbJW68gf6+nMOudbRKwEWCb2iZVf36lUa
	 E1Ew9KvhzjbCmTsccmZI4gUTDvLm5F6417RotuxhZEENRRYhpvDcuj15YfBH+IpBfDzyN
	 FdXDJcsIMrzNQljDUc3c3udKXgwkn43eMZVL5u8jvLQu4H1XO5aeVlBSLXZnTD2x/+LTM
	 VJXBka5hdrpsguRcAOA7GWhV6d+eZfH9PL1+hy4cYk7y2O28W0P0Gb7tnm6hG9pGvqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E81606A32D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Nov 2026 08:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99E81606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4919a880834so176524f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Nov 2026 00:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1793952238; x=1794557038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3uHALvzjtptIMCjCni4Os1DaEQGVzPkp8ccI+3SeBQ=;
        b=k2vjgbNvN06sZzQr7ly4gExj48be0hhFCTg3HdoFnt22kAKYQVYTrUkmQsvYn9Igty
         6zO08AkzRzRm+RaLIdOlx1oWUIt1Oa9vm5bNEDijfCN7oxuL9WmLbQ3zW0KPfuRSPBiW
         8+7y3aBsvtdMOiWSpd5cLYpjZhmD3IJwoUqPeiQMT0+mkz+CDfR0zn/gph0K4DxFWN2c
         joH+fvYKWIeyqoWyb7ZC+vLwJKNXFaffBrLL9cEkw9W7GtsP2VLrYKwCCv9EzAbyuLf9
         fbNpEVG/tcWzEdqUCtUE32u6+FzwbgSjRRMxBLQ+aCGWu64H+wXSV47h1wM6MrRENrtn
         a7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952238; x=1794557038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3uHALvzjtptIMCjCni4Os1DaEQGVzPkp8ccI+3SeBQ=;
        b=dpv5aIbxcL7seHjLg5dlxDzTCnkjuyxf7CHwDaR68G+j7QyZ31WCH6F9p3gwSuO6th
         KSJd56Y62sjiCc8btNICYloBLfZxFdaA8SPnNOJNWPAn0of2K8Ew2RVeHK2an3AgA1jK
         mOgOnMNPBimoInjvvq5g/rOIBy1mOkcbgmkri4LuQhtwLlvnJ81+iuDKgcVpRnhTFU9h
         jjVu4CooemcHEv3+dST7APFLylAEHi88x/RwUKQtCceXhO5+GfdW+uMu1II6w3As1p9m
         SDS9mqjMHvMVgoU1waJDZ5IzSWgyY5UNji99fZK5wnmeGvYinP3+O8B7a37ytxvIWD8R
         ywdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFMcQfZpaS6DvCJZ5FUaIhqE9p/tqhopKxdsQUP1MBoxLROSmlwJxXovPQdZ4UKD/zP3FfsmJkTkSnNTn0GTyHOQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/+08Ss9fu9un3DrlrGJLoh/uS9jGQGgK2cZJgHHFpA9LmkHvVw
	m4yr4xAwG5olLQTAAqSz+//RaR/rXqzMtEp4iOqyHP9+ywS79P3T0I9roEwPtxpiXCA=
X-Gm-Gg: AYBFou1/s4ZKhzTXFF9YZ+DCouotFmjHkRR5gMhFiJrOBA/1cmTeK5+pa59kFKlJChk
	CaEV0/VewOCV62j9Go+PO4YLY7DR5DUFdoqRehDnQFbpSMz4zPDw63Doog4ZjJEeggR1ygBS+LM
	71ma2CKJybZZZM2rMSdzk1YMb4ANIGOtRidQqKokpWywZym06NOqU2Sm15VpOSeiX+7ghABLnhd
	ZJFErs5zbWpR4Hh5SWVMC1h2lWiH80/OBmBUL4l+e2JcSz4PnjyLobuPLDJJpe5XHJAcVPhvtSu
	R6wf7ufRerJLvlQ/kFgBZ+nVXGN8+pp3HNfkaHtckpv7Rzd+XWHupup4qNWhKIXz402kq2pD5tF
	EDn4PuyJoQUmvfbtHWtrqErMPRE2DYrKHN2C6TRyJpHvSUb2BJK17ythHDESYd5PitWF+Q3seOO
	BPv4ajSp+6xr8wYOiknit5oySqAtGJ0q2HS0TyoSI29kBDQtcNuV/Ce7XUjV3+4HF8BHXSoa2oF
	NEDI5fqsOikgEzWdwsnbq57yYbcD2NMw6Cv6DUKwfX1qBqp1ayloSDGS+lEAg8AlfzuCdOh0hm0
	R6ikSoHtKdx+yvRZO1OZu21bTW/CGEwIgTU=
X-Received: by 2002:a05:600c:8b28:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4b6dfba8628mr21279205e9.30.1793952237431;
        Fri, 06 Nov 2026 00:03:57 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6ed5b8159sm34920515e9.2.2026.11.06.00.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 00:03:56 -0800 (PST)
Message-ID: <096754b1-6362-4f44-992a-989a1ccdec22@tuxon.dev>
Date: Fri, 6 Nov 2026 10:03:55 +0200
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
Subject: Re: [PATCH v4 3/7] can: rcar_canfd: Allow the CAN FD clock to be
 sourced from fck
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com,
 linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev>
 <20260902141544.565763-4-claudiu.beznea+renesas@tuxon.dev>
 <20261016-durable-meticulous-owl-7a9eed-mkl@pengutronix.de>
 <69826962-0c21-4616-9cd8-6eb0478a422b@tuxon.dev>
 <20261017-weightless-poetic-mayfly-bbdf75-mkl@pengutronix.de>
 <4a9e32a8-8a2e-4b70-8057-2d51e6d38b98@tuxon.dev>
 <69f0c77d-8c23-4949-bbb3-0a07da506b7a@tuxon.dev>
 <20261019-precise-auburn-bison-8b0d0a-mkl@pengutronix.de>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261019-precise-auburn-bison-8b0d0a-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Marc,

On 10/19/26 13:42, Marc Kleine-Budde wrote:
> On 19.10.2026 13:36:49, claudiu beznea wrote:
>>> Based on the comment on this code "If not available fallback to CANFD clock"
>>> I think the intention with IS_ERR() is to allow probing go forward,
>>> falling back to CANFD clock, in case of any error of devm_clk_get().
>>>
>>> The device trees that I've checked sets the can_clk to a fixed clock
>>> with rate = 0 or have the clock provided directly by the SoC clock
>>> provider. I think the intention with IS_ERR() was not only for -ENOENT
>>> but for any other kind of errors. We can return in case of
>>> -EPROBE_DEFER, to ensure the expected clock is used, when it's available
>>> and sane.
>>>
>>> I'll switch to something like:
>>>
>>>    gpriv->can_clk = devm_clk_get(&pdev->dev, "can_clk");
>>> +if (ERR_PTR(gpriv->can_clk) == -EPROBE_DEFER)
>>> +    return dev_err_ptr(dev, ...);
>>
>> On the other hand, returning -EPROBE_DEFER here means the driver may never
>> probe if the can_clk provider fails to probe, even though the fallback clock
>> is available. That would go against what I understand to be the intent of
>> the IS_ERR() check: letting the probe continue when can_clk can't be
>> obtained.
>>
>> Please let me know how you would like me to proceed.
> 
> If the clock continuously fails with the error -EPROBE_DEFER, your
> .config/DT/system is broken. I don't think it's a good idea to ignore
> these errors.
I've addressed the concerns raised in this discussion at [1]. Could you please 
let me know if there is anything else to address for this series and [1] to go 
forward?

Thank you,
Claudiu

[1] https://lore.kernel.org/all/20261019121356.2421761-1-claudiu.beznea@kernel.org
