Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF6D471263;
	Wed,  5 Aug 2026 13:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937458; cv=none; b=RoZgFsnPlsrP84DGxEQRFS0uvr/Ee3Eo62JN2LP6LyWd/Anuqq2p2mZMDADrJJ6Kt98SR6YkyctFIrkGVw3jPawVIJvKBfjGY3c6smb9nyUk6EZlCLWpD4oZnmHvstdPHNZSYpT+hMzC4+GhqSd+uvsnpkxjtBHvptc3jlygsxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937458; c=relaxed/simple;
	bh=ZTM2hQTIm6j+TfwiEJh/dlBSQNQVejxVgAEd3L6f2+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l++WOteZyk7psEkPx8T0DSvaTX7N25LAKxC4zNRTL9FiQ4QCSgCDU3bQJ7DoeFI/Nf1/7PIu/WB0JEpqR7kY+iD/aznloUMxGx7ilQfkdiiFf57hM/rURrnDCLtbFjDpYE6QdsroJCWmgPPdd4ySPhogqp2h/Ux630QGJKs9Wnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEVjxwCL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEVjxwCL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666151F000E9;
	Wed,  5 Aug 2026 13:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785937456;
	bh=tMOGoWc6+rcINiw8Sv73vPtlQPMaiPD6VFFbTAX9G5M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GEVjxwCLdfLre7MP7VC/JbK/FzKMOp+uWmYhLt3eKzrqq333e8jc3ThhgKf6IHrzi
	 9bcX0FZXWTmVXVxFpjmYSfIRT/YC0FkK9eP5VucyDWg1eDVh1tcliZTKAnHXg0FoNo
	 1xF94TWtb/KH6UEL9Ty5s8MLPNE9ycPWxmnAeyeylZa3X3cm85j1bKTbeJGefOq2hw
	 71BObGN+Gz8yFpzLL/R2eKlZGG2LKh7xmepAbSvkfytwVX48OIE+EyD9VhLatop4Tw
	 TfheTgHIcQxrhhZXH22spZAjfa6N5DW/E1N9MXHeOg47DvGgS//9M+Od95VNTibzVa
	 Y0+Hau0ZWM6jw==
Message-ID: <5c4fc5fd-7d28-4f8c-b045-f042e79f3c99@kernel.org>
Date: Wed, 5 Aug 2026 15:44:07 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: renesas,r9a09g047-sound: Document
 audio_clkout clock-frequency
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, tomm.merciai@gmail.com,
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 John Madieu <john.madieu.xa@bp.renesas.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com>
 <20260803132828.3249424-2-tommaso.merciai.xr@bp.renesas.com>
 <44c150f6-b04e-4515-ba71-63780c56c38d@kernel.org>
 <anDNtrL-eL6VUD94@tom-desktop>
 <8c5f0e53-2515-4744-ac6a-a4c94f2ae2b8@kernel.org>
 <anMkwfGAW5fBSAEf@tom-desktop>
 <CAMuHMdVzvnz-XrgJ2+UrAA-Gj6XjAnz9Q0HqrNCuVQF3+v9X-g@mail.gmail.com>
 <anM1KUoFC1ltRsje@tom-desktop>
 <368eb87a-bb12-4943-85f9-cda8a7835317@kernel.org>
 <anM75cMK3_799SWo@tom-desktop>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <anM75cMK3_799SWo@tom-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/08/2026 15:34, Tommaso Merciai wrote:
> On Wed, Aug 05, 2026 at 03:19:17PM +0200, Krzysztof Kozlowski wrote:
>> On 05/08/2026 15:05, Tommaso Merciai wrote:
>>>>>>>>> +  clock-frequency:
>>>>>>>>> +    description: for audio_clkout
>>>>>>>>
>>>>>>>> Incomplete, missing type/ref, constraints.
>>>>>>>
>>>>>>> renesas,r9a09g047-sound is handled by sound/soc/renesas/rcar/core.c [1],
>>>>>>> and "clock-frequency" is read by rsnd_adg_get_clkout() [2]. The same
>>>>>>> property is already documented for R-Car in
>>>>>>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml [3].
>>>>>>
>>>>>> But was the property rejected? I am repeating myself...
>>>>>
>>>>> Looking into this further, I found that you already asked to drop this
>>>>> property during the v5 review [1].
>>
>> So my review was applied to the bindings only and undocumented ABI came
>> in? Great, cannot stress how happy I am.
>>
>>
>>>>>
>>>>> Thanks for pointing it out.
>>>>>
>>>>> For context: the sound module contains an audio clock generator (ADG) which
>>>>> generates an output clock from the external audio clocks and outputs it in
>>>>> to the AUDIO_CLKOUT pin, that mostly supply master clock to codec.
>>>>>
>>>>> "clock-frequency" is array of the possible rates provided by
>>>>> AUDIO_CLKOUT to the codec master clock.
>>>>> Based on the playback rate it will request either 44.1kHz or 48kHz.
>>>>>
>>>>> I will drop "clock-frequency" property from r9a09g047e57-smarc.dts, where
>>>>> AUDIO_CLKOUT output pin is not wired.
>>>>>
>>>>> But for boards that populates AUDIO_CLKOUT we need this property,
>>>>> Could you suggest how to model this properly?
>>>>
>>>> Isn't this output the single clock output of the sound module's clock
>>>> provider (#clocks-cells = <0>)? Hence can't the consumer driver set
>>>> the clock rate?
>>>
>>> Yes you are correct.
>>>
>>>>
>>>> If the consumer driver cannot set the clock rate, but depends on a
>>>> fixed clock rate, it can configure this in DT using assigned-clocks
>>>> and assigned-clock-rates, right?
>>>
>>> The clock driven on the AUDIO_CLKOUT pin does not have a fixed rate.
>>> Depending on the playback rate it is a multiple of either 44.1 kHz or
>>> 48 kHz.
>>
>> So the playback rate of 44.1 sets one frequency and playback rate of 48
>> sets other. Feels pretty dynamic so job for the drivers? I miss the
>> point why drivers cannot request proper rate.
> 
> Can you please confirm is 12288000Hz(for 48kHz) and  11289600Hz(44.1kHz) are
> the mclk required for all the commercially available Audio codecs in the market?

Yes, because each commercially available audio codec will request rate
it needs. Of course each one will request different, but that is the
entire point of Common Clock Framework.

>  
> If yes, we can dynamically do it in the driver, otherwise it is static/design time stuff.

Best regards,
Krzysztof
