Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2D83290AF;
	Wed,  3 Jun 2026 14:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496002; cv=none; b=mHKIzq3VXBetRB4wxAyqUevwecSz6vVk4dWJlTrgx7BtPSwg98bW07RNAAoQM/bat5/QFrxoCzKXC83qKdiDBL9d4QBrTmjzwBmiJWma6b/zMkhQwstUIgRGb8FJ//4scY6HJTTbNCLbrUTEP7Io9VdCMUZZanlE2YyJIJxZ0xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496002; c=relaxed/simple;
	bh=P7afQ1zwwmTRqfSp2yhH0Ds18AfZBh2F0p7entJ2Za8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFlFCmJ9VALvPgFn52aAQA9yB7oQue67c+tH8vXkbfJ+Z8F34iMlYLsHzL/iCiw7P8nWZ//K9p0pLTaIDHcezFvcKAlFf6lyfjcgGp9UHvHjakac6PEfCyNqiEdwA8v3vCmc6JCITgF7Fim4ecZBwzoegga5ojRGAP1+NIT7/is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nVumAYB2; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nVumAYB2"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gVqRV1nDbz9tjf;
	Wed,  3 Jun 2026 16:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780495990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnV3qkM8vXKz87ni6r4AwY45doVDY/GJzEej5br5st4=;
	b=nVumAYB24WEopxRdmCdptRc4D/aq1fAw6mjBWBUfeCdAlb72LbldJGbWxmcNADb205l5sj
	eJibB9U22Hqdqc6bPWYdewugZZXcCIf14qEaASFwzENFVwkX2xPinyzvNM2nYInetX2n6d
	GfWFIPQB9ni0LUnqu2QgO+iw0NC2AuJg3r5K0wzaNFv+WTuE/vQSsgIX6A3sFi7OUKYcVj
	Zcj/Qv/396S0+09Pm38CN8AIGqqD3tz8NrysrNozXiy5+KetjZg5LNcv/4zK/lDlomnqa6
	RxQi/eqRjSeMnWvr/XGWJEq+1/pZw6RcQo+tkFSZ7CmnlxxUcfp3zxbYKxSKmg==
Message-ID: <a5535498-ea43-42ab-9cff-0ad53551737b@mailbox.org>
Date: Wed, 3 Jun 2026 16:13:06 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Enable application CPU
 cores via PSCI
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260601113919.8327-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXGJ+Ww+ek3KLvrnFKpw2cJn=RB8q3k=W6ECVgtw-zK6Q@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXGJ+Ww+ek3KLvrnFKpw2cJn=RB8q3k=W6ECVgtw-zK6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e6913ec3d3745fd1b4a
X-MBO-RS-META: ffe1ti4tsfjmtqc1bf9w344pn51uzy9c

On 6/3/26 2:42 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Mon, 1 Jun 2026 at 13:39, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Add PSCI "enable-method" DT property to all application CPU cores.
>> This allows the OS to bring application CPU cores up and down.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v7.3.
> 
>> NOTE: This depends mainline TFA 2.15 or newer (or SDK TFA version
>>        which includes b950bc09f5e9 ("plat: rcar_gen5: Fix multicore
>>        boot by ensuring fixed address for plat_secondary_reset"))
>>        and on SDK 4.32 or newer SCP firmware.
> 
> I assume SDK 4.32 includes a sufficiently new TFA

It does not, but it does include sufficiently patched old TFA.

[...]

-- 
Best regards,
Marek Vasut
