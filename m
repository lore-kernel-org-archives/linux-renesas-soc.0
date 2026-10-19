Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A354949D595
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 09:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403911; cv=none; b=WMJ4gm5S7D2p7kYGv9YX9NvUOZA2WZwlA0TeLwzdl9SNAo6dkZhO4jwojyLhXPJF4msvk4IJAgkAWwaKGD1pMca6EVm63DogKYHwX9j3uY0sXmB1hQWRrLshwA/bMW1fWw/ZEHS15NWDf2vJKJ1eU9QeHHzN17G3CDGwWAlwnbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403911; c=relaxed/simple;
	bh=eGAF2rlwQq8vrlYsNjNO5wZQgv0NDo73dHPMv/EUZMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YkjSg4/yGdWTSCQTilrUnRDjMAmaw94lPY3pxtJCZzPTA3G1Gi/zhFZaomnI3BFkeIC+5iOeP1Zvdu4UOUYCcQWGtX6VIgBClGF0e1bxcE4dHRbGKR5sWJv5lvWk3VwLnUzmaKqFVuJCsDOI9kjUcDumsNhBGanmkfELHoBNr/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ceHj7eab; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ceHj7eab"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so16769995e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 02:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1792403908; x=1793008708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFxY6AoLFrbUivYUuQNWjKVo2lafGDyB/yJV4/e5rAo=;
        b=ceHj7eab3TgzUQHvWP4z+PpWLJzVrLi+PJroce/bQWp2fQs+FrMSSTcgPp56vfkMuP
         h3u1br75x4Kw4/Idl3AGsmkstyh99PTmBvOvouQwWdIluQtrZ2BOcHfILD8SOevEccF9
         RuO+AM0mxDMMkPGLlQ1MQJwTYasAYEUCofmT/0pt5FZlC7GI0F56kqjNkR5yy6uWhu83
         K1Jhk4WdWOTRzviLIa975UWoLOUsSHeWBgslTCPwk6zTxGzwEaX/ApdgjQE74Vk/mLO5
         ME+kkNg58YCkCR/0bjYXBWKkEeboAwP5Pc4WmNMbTtpPFCT+OYZNiRItmHLqX/9Um7DI
         nIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403908; x=1793008708;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFxY6AoLFrbUivYUuQNWjKVo2lafGDyB/yJV4/e5rAo=;
        b=i4E+rZJF2iHrrT/QpgjRjX4rONYKchkPonGpbVAUbWfb/0x8zAgyNZIWtDFcwHT0Zb
         4Kmbf9gnMOIyPTgW8YK/nEybc/9wQy6MD49MGrP5Eyz6aw8QTCJd7/Ta8CeBJJG62Yhf
         S0Cwdyyy1f8yS906FWa8asIzWyZKKSiNnjWBMy98vCz6+zJXGMGTBPqW+d6MZ9QqObo7
         Ap9w7rGLS+DznR3y2obBLlPfT3aAtaRoeSai23deYyxp3lMKrP3NqINBAJxTZntr5j4C
         KWojTH0RdmkHGXr0+8wSszLC5g/a0BOrCEN/sOHDwy94Hlj4TIKVf7uyo1t7N5lhy2Px
         VGnA==
X-Forwarded-Encrypted: i=1; AKwUvBwmCY3qsW/LqDTB0AvkQMEv1eqGoeo+Ks5SrSiogixLp+gfUGmTGnAh8GjClfyFpt0MY34lIIoNFQrrJoRmCoH8zw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLij9xqCwOTR25iO2f8pkKqYveTkZYBbvOhCzdP8VHeGgkVgLDM
	FM0pKGC2QS7fnPqAb8bUFdRGu6h1o9Rq1W0043RtTllbqwSY/HqvwMKqCMqH1RHFIZU=
X-Gm-Gg: AYBFou1h77/eq2zZ1ZF61MfLto4G5x/AP8GQS8NQfEWHzor8oacfq2zxwgJ4iXwO32i
	dZf+Z6oHYhMd3jCvo4g8aI7Kz7wzcfWtQRpYntmJ02J284WD1eUGtBheVImRjGFByhndoHcbVtI
	KoorDYA7LkXwvql7SHPmcAuXbhPoooxGDZSOPqmFHPv9KVDJ5HoHTv0Ao6lTz43NH15H3i1T/Sl
	9P8stmcchiOkjYH4hXRxbujidTfovMcxbLbGx26hkVlLqS/mg9QssGmO5NWGowJJvYEYBzHGWKv
	jH6gAsJWa9j8ZSKKLOBo4ej22OS30zmZM15l+l7MnHLCXpAtcvEr/WzaPqf1plQqm+wozRDfXqe
	xWYD/ZupDuL2hUdVwT1G4c18IklCS2joY/3LsrQyDDYO4bvzXZK8KsenItIbnVG/Dh2nO09Ym7y
	yxPB04Du2/RTAAA6flynEv18Ar7C6UXx2IO97gF8u5TkbECkbDAkxGj9N6jjX1K88pusSixev9d
	cQ3/zg=
X-Received: by 2002:a05:600c:540f:b0:4a1:97c6:d2e8 with SMTP id 5b1f17b1804b1-4a1d7633b35mr152802705e9.32.1792403906248;
        Mon, 19 Oct 2026 02:58:26 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cdf2f0d1sm156663265e9.2.2026.10.19.02.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:58:25 -0700 (PDT)
Message-ID: <4a9e32a8-8a2e-4b70-8057-2d51e6d38b98@tuxon.dev>
Date: Mon, 19 Oct 2026 12:58:24 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
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
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261017-weightless-poetic-mayfly-bbdf75-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Mark,

On 10/17/26 23:01, Marc Kleine-Budde wrote:
>>>>    /* Helper functions */
>>>> @@ -2190,13 +2196,20 @@ static int rcar_canfd_probe(struct platform_device *pdev)
>>>>    	 */
>>>>    	gpriv->can_clk = devm_clk_get(dev, "can_clk");
>>>>    	if (IS_ERR(gpriv->can_clk) || (clk_get_rate(gpriv->can_clk) == 0)) {
>>>               ^^^^^^^^^^^^^^^^^^^^^
>>>
>>> As sashiko.dev [1] pointed out here's no check for -EPROBE_DEFER.
>> This looks to me a pre-existing issue.
>>
>> The newly added support does:
>>
>> fcan_freq = clk_get_rate(gpriv->clkp);
>>
>> At the time this is executed the clkp was already checked against any errors
>                                     ^^^^
>> (above) including -EPROBE_DEFER.
> It's not about "clkp".
> 
> What's missing is, that "gpriv->can_clk" is checked against IS_ERR():
> 
>>>>    	gpriv->can_clk = devm_clk_get(dev, "can_clk");
>>>>    	if (IS_ERR(gpriv->can_clk) || (clk_get_rate(gpriv->can_clk) == 0)) {
> but if it's a -EPROBE_DEFER, IS_ERR() returns true. I think in this case
> you want to return with dev_err_probe().
> 
> There's also a difference between "can_clk" not found (e.g. not
> configured in DT), and there was a problem with "can_clk". I don't know
> if this is important for this driver, but if you want to distinguish
> between those, you can use devm_clk_get_optional(). I will return NULL
> if the clock is not found, -EPROBE_DEFER if not available yet, the clock
> or, in case of an error -errno.
> 
> Thinking about it: if "can_clk" is not available, I would consider it
> intentional, so the driver should use the other clock. If the clock has
> an error, the driver should not fallback to a probably untested clock
> configuration.

         /* fCAN clock: Pick External clock. If not available fallback to
          * CANFD clock
          */
         gpriv->can_clk = devm_clk_get(dev, "can_clk");
         if (IS_ERR(gpriv->can_clk) || (clk_get_rate(gpriv->can_clk) == 0)) {

Based on the comment on this code "If not available fallback to CANFD clock"
I think the intention with IS_ERR() is to allow probing go forward, falling back 
to CANFD clock, in case of any error of devm_clk_get().

The device trees that I've checked sets the can_clk to a fixed clock with rate = 
0 or have the clock provided directly by the SoC clock provider. I think the 
intention with IS_ERR() was not only for -ENOENT but for any other kind of 
errors. We can return in case of -EPROBE_DEFER, to ensure the expected clock is 
used, when it's available and sane.

I'll switch to something like:

  gpriv->can_clk = devm_clk_get(&pdev->dev, "can_clk");
+if (ERR_PTR(gpriv->can_clk) == -EPROBE_DEFER)
+	return dev_err_ptr(dev, ...);

The devm_clk_get_optional() would involve changing more lines:

-       gpriv->can_clk = devm_clk_get(dev, "can_clk");
-       if (IS_ERR(gpriv->can_clk) || (clk_get_rate(gpriv->can_clk) == 0)) {
+       gpriv->can_clk = devm_clk_get_optional(dev, "can_clk");
+       if (ERR_PTR(gpriv->can_clk) == -EPROBE_DEFER)
+               return dev_err_probe(dev, -EPROBE_DEFER, "cannot get can_clk");
+
+       if (IS_ERR_OR_NULL(gpriv->can_clk) || (clk_get_rate(gpriv->can_clk) == 0)) {
                 gpriv->can_clk = devm_clk_get(dev, "canfd");
                 if (IS_ERR(gpriv->can_clk))
                         return dev_err_probe(dev, PTR_ERR(gpriv->can_clk),

Please let me know otherwise.

Thank you,
Claudiu
