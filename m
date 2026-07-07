Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB67B3A168C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432124; cv=none; b=UIJ2upYElCfyEwcSyt2dGXcot1gyzDmv8OseCiWYSlhcGFZ4WZEFnW1Vucos7PmERP476oC/D3W60dA8dtedUl0mT43qNOrfoJfrpRNkJTeWt7w22CXp24LSj7/kg952PzVssmb6+64zz9cVGpxIDKdlivzZJOTJkxRvJgSqCSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432124; c=relaxed/simple;
	bh=1Yo7u0z6k8U7Mbjer68rrWV0r8Sh5LFdbkY5Y5c3Jrw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DTsLN//o70QXQ3lBGRY1avAo2AdiIxi0Vd5YwRxn2Bm3d/NBjsNyzCYDxrHj6il+GHodtXYr512ZlbtDqJiTlXT7pbFFRcAwVlY63fgH3PKO/Ujr56UFEVxRca3QFcHl8moRPWEcp5FwIYn9g/3AXNXG+Sko3BbIj25ciDVOi2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPCuvKS9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPCuvKS9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB701F00ADE
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783432123;
	bh=1Yo7u0z6k8U7Mbjer68rrWV0r8Sh5LFdbkY5Y5c3Jrw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=NPCuvKS9DmuWd/fR9VVpq+WbeO/Ot0DDaoQl5jIEz89qXFKsFkKmIprS7NaXGXWRL
	 t2yAZ4U0j3Rb3zkIpWXmPbjuB5YQWaCwh4r2JFuvNrOPvgDKgxA9q03vH/of9UZUiE
	 FYhVQpFW0/6midrCXMGP8ncBcwzNZdh4RvHMeiKLhreqNzmYRR+JJflSjmiKKBeAeT
	 kQ1dOTgzJurwcAmph1jgWj/Dp9Xwb3bVlWhSjdk7uO6oaAfpcm2ywr/vzQrwT66jDt
	 0nV3XL83iB/0IEniCmUdCjGqf9drDcLVdIX48UfQ+igaqtm+HCCfG6eWPHAYDqs0rD
	 sP7LyceuqpP3g==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39b2be45e8cso33461411fa.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 06:48:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrkl1IAiZPr5/0yC4Z/IbEJ7WrkVShkBcqIZ929d3pvPbEHRGGEdEeWZWdMdElrtqZCrhQoTNCF1BYYPo2fAjjsKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Qq6GmeyDwPht0JsToagIbTXEmRkdyGiZWE7H8qtizsqe8Ir9
	h8+wGWuay2AWzI2PE+cWsfrn7hO5sanXJKF6Z33Sz/IZgxcZoHKrTBYEGoo6XBXF6KWfDw6sJ9k
	gv5M5f2bXjcyASjbWx0OrT1J2Mc/LDTU6LhibW9cs6A==
X-Received: by 2002:a05:651c:e15:b0:39b:d76:5cb3 with SMTP id
 38308e7fff4ca-39c60015570mr11010031fa.29.1783432122399; Tue, 07 Jul 2026
 06:48:42 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 06:48:40 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 06:48:40 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMRc=MeyKGv75rTLauZuGxSfgjCPXVE_r=A7uNduRr6kAd43aA@mail.gmail.com>
 <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org>
Date: Tue, 7 Jul 2026 06:48:40 -0700
X-Gmail-Original-Message-ID: <CAMRc=MegYyuqMVkG4_E_TF4hzoy1PVx=omXgZUPvnARd-Eh+7Q@mail.gmail.com>
X-Gm-Features: AVVi8CfTXb7a9CnF1kG_J33U_VZ0A1Fo3nvdJCm7SCTOOAtgiE9VDcYDyKYQeEg
Message-ID: <CAMRc=MegYyuqMVkG4_E_TF4hzoy1PVx=omXgZUPvnARd-Eh+7Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Jul 2026 15:06:01 +0200, Marek Vasut <marek.vasut@mailbox.org> said:
> On 7/6/26 11:19 AM, Bartosz Golaszewski wrote:
>
> Hello Bartosz,
>
>>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
>>> +{
>
> I am hoping to get some input on this remap function.
>

You mean its potential impact on performance or the implementation? In any
case, as Geert said: a table of function pointers could help to improve it.
I don't mind it in its current form if it works for you.

Bart
