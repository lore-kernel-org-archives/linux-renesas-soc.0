Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE5B4D7D5E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 10:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406215; cv=none; b=SqUDTL02qgRRCB7lcchASLEwYCULbOG6TmAmwVdD0Tg3Rgtx+WkeCixdOe7B/EuOTH8SCXLyQ5AStrUT6U1NUvxxJnY+OuULgLHhwQhjsdvW8syFdQCxsm0uwv53Xl2c0GLCdpDlH4Ndtp+1S8M1OP4g8r4SPg37/BSuJdub7sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406215; c=relaxed/simple;
	bh=vykg/OJAriT/sx9F+QK3R3JwZ7Dbvie5oTtlYPTxv9c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Lij4cdIkgU4gHgb5NmjtbkcTcgMZ0lfgceX3kbf769kbrbFqA5snXWpWMd/7K8o6t+xnYAz+o11xyv3gZwkY5Ue5ttEZiT5PlxYQ2G4OvNP8tr+8dxPMeivL84UThFjhyynTsLhN0Zwb7BTN2+UnqpoxK8bEopSmVNWVg784z+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=X/sGRZF6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="X/sGRZF6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so17507755e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 03:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1792406212; x=1793011012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z57EO/ibWAdNwQekG27y4VD2pFEfdog7Rh4uiN0n8iY=;
        b=X/sGRZF6mLkXDbZGXu8m93Pa69i2CCspA94Xseh7+bnX9wgtyeviZAmS9QSPX4An+W
         oRlAyiW79G7a5SpMrWJkvNnO8kgdIhGFvUABu60NEeYy1GeWN/3M5+EZ+3LEDhR01m2h
         j02zbRAffUCFY1QeuiuWaIoZtEfahcOMjQrQQrNcx0qloqTNkhVBHMHDFk1GZEWqTtsS
         HwMxDOGitdytJjIzHgZPhXXi/1G0n/KwZEDtGE2wui7b/gTW6mfG4rLPakpavxb6PenB
         ZYRl0c7+MyMTj/v9lhE7XzCwbpetDLUFvLUAaC8wXpvGq3LI8/RK8yL6LdOi2w/y5IrV
         9lRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792406212; x=1793011012;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z57EO/ibWAdNwQekG27y4VD2pFEfdog7Rh4uiN0n8iY=;
        b=YcrDwuVINUWuXahLMqkjJoUw8UDBetzo3x65Smd7QoBs2l0lw5oIpeMlEsuOvSaTIN
         JApa0cjrwWZi4Ahcm5Fwlp2bcf/jneKWAIJK0wNidS89314imMVgmTSQEIUTlY/evnAs
         VsNiuMSXRfVtOW/h7p0+SOvAC6Wp+OHork7Ywtgpd+WhEx0KHMQMh3epLo7Xy4mUP+1a
         4Qs57EF7LLoXZUh4gUK7Pi3oUScHr8jgfDAIn15n0b9OyCEZPOE1rvWzNw31gOkO9gxo
         KlV891hdPuNjUm7Gn5Vu4FIBPc4Shp5b7M2EAKyLXNJO7kTiJuBwz/W7XLSfmFIfFAfQ
         Ipww==
X-Forwarded-Encrypted: i=1; AKwUvBwWBBkavwpNTwqZFxeZmrdhhaKxK30s0pR/3yuKhrUmi++1t8nIFlTFOpULhA9bQ3mMZ8rU8GzZeFUUudXcdUyFPw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKLeiIX07A/7BXqGpitJ84SkzPT39PCW6IQMskop4K0RrTJGwFz
	8j2goMaak0COm2ZyG6EataEhz3G0JWd3j2mZzJ2k+66Pe6ye/A8i5Vxxl6a13AD6xtQ=
X-Gm-Gg: AYBFou1BeY2fd/4tAC0HgmhOnKkXrREoxP4gz7HSWAbjuxYmcEbKqSNOlarq+j8p/yP
	N48nhcVSCI0g/57aQVP7jTn/G3IeVEDYpj3YFhHFSsGWw4DZ3byZNEibvOOWUPbpiBGeimJhMH4
	NvROcmBPQV1l/RP3cilVvxcTUocYP9NAnvVUtcN5I+GGvcVOMi7WsldRvboXmHZfITv+Uv6IghB
	4w3jMTJevGy5AKokle6sqWDGcytoYYk6V0nXiPin4hLu4wLo5M0awJ6f1l0c33IzjiDcoDeUV89
	x/S+JqlDVIBggFX7S5NuoOTATxG8MOZSTZPGi81pkBRXQTqsEbYheylmbQeliNXpFb/goCqijaq
	rgttiMEWLxe4cZ8GwijokXvv/bNQ/3bPSZsTPiIYwl1r9Ksdy6x3SXQ9jAeZU9o3ZhkOjoqXL3J
	vZyWeqT5e5aVcROu3QVW7IfHYVABwZeuKC7Pg0eLueGvsh18f0ktz13+JUHiHwuDltnQ36sTNrr
	X4m7fYK3LjgWp5hQA==
X-Received: by 2002:a05:600c:4e50:b0:4a0:1ea2:10c6 with SMTP id 5b1f17b1804b1-4a1d7600357mr141235245e9.17.1792406211862;
        Mon, 19 Oct 2026 03:36:51 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdbb4a30sm348976065e9.15.2026.10.19.03.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:36:51 -0700 (PDT)
Message-ID: <69f0c77d-8c23-4949-bbb3-0a07da506b7a@tuxon.dev>
Date: Mon, 19 Oct 2026 13:36:49 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] can: rcar_canfd: Allow the CAN FD clock to be
 sourced from fck
From: claudiu beznea <claudiu.beznea@tuxon.dev>
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
Content-Language: en-US
In-Reply-To: <4a9e32a8-8a2e-4b70-8057-2d51e6d38b98@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/19/26 12:58, claudiu beznea wrote:
> Hi, Mark,
> 
> On 10/17/26 23:01, Marc Kleine-Budde wrote:
>>>>>    /* Helper functions */
>>>>> @@ -2190,13 +2196,20 @@ static int rcar_canfd_probe(struct platform_device 
>>>>> *pdev)
>>>>>         */
>>>>>        gpriv->can_clk = devm_clk_get(dev, "can_clk");
>>>>>        if (IS_ERR(gpriv->can_clk) || (clk_get_rate(gpriv->can_clk) == 0)) {
>>>>               ^^^^^^^^^^^^^^^^^^^^^
>>>>
>>>> As sashiko.dev [1] pointed out here's no check for -EPROBE_DEFER.
>>> This looks to me a pre-existing issue.
>>>
>>> The newly added support does:
>>>
>>> fcan_freq = clk_get_rate(gpriv->clkp);
>>>
>>> At the time this is executed the clkp was already checked against any errors
>>                                     ^^^^
>>> (above) including -EPROBE_DEFER.
>> It's not about "clkp".
>>
>> What's missing is, that "gpriv->can_clk" is checked against IS_ERR():
>>
>>>>>        gpriv->can_clk = devm_clk_get(dev, "can_clk");
>>>>>        if (IS_ERR(gpriv->can_clk) || (clk_get_rate(gpriv->can_clk) == 0)) {
>> but if it's a -EPROBE_DEFER, IS_ERR() returns true. I think in this case
>> you want to return with dev_err_probe().
>>
>> There's also a difference between "can_clk" not found (e.g. not
>> configured in DT), and there was a problem with "can_clk". I don't know
>> if this is important for this driver, but if you want to distinguish
>> between those, you can use devm_clk_get_optional(). I will return NULL
>> if the clock is not found, -EPROBE_DEFER if not available yet, the clock
>> or, in case of an error -errno.
>>
>> Thinking about it: if "can_clk" is not available, I would consider it
>> intentional, so the driver should use the other clock. If the clock has
>> an error, the driver should not fallback to a probably untested clock
>> configuration.
> 
>          /* fCAN clock: Pick External clock. If not available fallback to
>           * CANFD clock
>           */
>          gpriv->can_clk = devm_clk_get(dev, "can_clk");
>          if (IS_ERR(gpriv->can_clk) || (clk_get_rate(gpriv->can_clk) == 0)) {
> 
> Based on the comment on this code "If not available fallback to CANFD clock"
> I think the intention with IS_ERR() is to allow probing go forward, falling back 
> to CANFD clock, in case of any error of devm_clk_get().
> 
> The device trees that I've checked sets the can_clk to a fixed clock with rate = 
> 0 or have the clock provided directly by the SoC clock provider. I think the 
> intention with IS_ERR() was not only for -ENOENT but for any other kind of 
> errors. We can return in case of -EPROBE_DEFER, to ensure the expected clock is 
> used, when it's available and sane.
> 
> I'll switch to something like:
> 
>   gpriv->can_clk = devm_clk_get(&pdev->dev, "can_clk");
> +if (ERR_PTR(gpriv->can_clk) == -EPROBE_DEFER)
> +    return dev_err_ptr(dev, ...);

On the other hand, returning -EPROBE_DEFER here means the driver may never probe 
if the can_clk provider fails to probe, even though the fallback clock is 
available. That would go against what I understand to be the intent of the 
IS_ERR() check: letting the probe continue when can_clk can't be obtained.

Please let me know how you would like me to proceed.

Thank you,
Claudiu


