Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AB0199EAD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372720; cv=none; b=JyzKHqkTaXXQV1EOsgylhW7h2M949ndRcWhETYFEp9vzCE1q6d7Ch8Xs1NM5mnFteRSCRbuHMqRTPnt4RlhjYz6HME2uDXmlUt2oiggB8VEoNtAtHze/YYhoIxJlKj6Zq7JUirwqbj8fudt3jqo5Jz7m6vk7cFwbiYkaeKPW/rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372720; c=relaxed/simple;
	bh=uB/V/Xhwg31kLJGNDAMpcVbvCMFk1PoC6Tb+YOPqJRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZitRkGfdcZ5x8I8seNrQAUQ2xSfA6XBFBRkyRjcb2ePYE6PL9Rk5+j4BZmyHB3FEkkAWhSXqnod5Oa2egOwTh9kH0dudHCu0mJf8qIikHg17wOl6VNgQDOnnNhOq3o9M/7hrmRVTnWhSjvcZJ86VgajsM/SDErYI9yFk8Lalv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9667ea2fc22so302524241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372718; x=1786977518;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=dbSqRr0ydXv5doAIAWKKFpnoIc7zZTX97TsNvY4IibyZddcXYUf7uaYzTHIlJNBvnB
         WUKMkV2+Vuo+ZH/k/XYpqQghIS1Ow1WZqgmBvdbqVRbETr6GCZkeGHbK/HUIlce5ZqAk
         m39g7D2j/0ShPBkixfD8bVM08nATeZS96yJgwMLjEZUFlB7S3/74ZR2y02HLHQeCjaJX
         H0cDRbgPismeI7rYN1INUITgzWzDlNx7E4ddIeF4UHsPhdXo9EW0c9zmUg3BIxjIdqFy
         ALoBEd06reO+j2EqDx13JPW4c6lYmQtSwkV9nfGUXr/UdUHAFNZDJ7Giqxm3CqBgXClI
         0KKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJUAzoMC+WJlSAg+KwzuV23cxcl6D3q3wQxS5vfou4rTxxMSy6QpdU9TuUAS2iG/wr163zWjxf0iyceKSOavvYFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGJjLMUqBTBPVjoKeeAHEesKtsfwpHE1UOfGLrCIOwppXrRCqg
	CUxOSBHpdMu3x1tN8Kv9o165VtsZ4i7ll2IQUCG74oZsl9Zwee+z7DJ8TlaoYPDx
X-Gm-Gg: AR+sD10A3J9DGA6xvYjxdo1SgFL9VBzNlqes7CGXqn3XLqqJMeh9zU5KPFL36KMA8LA
	myh5MlSXfKHh5klN0ysF6MwKhWpDkAYbeefQl1h683R3libuSU+A+XXk0OzUtchzfwqr/UWGH24
	o6XgMweLb2IPTMQXLIViG+TBfNAI7enrOjTrDOB4EEQ8gBVCh3w7y2Few1D6wIVYKAc8Uj0juo4
	k60AutaEyqV4aVKcyDV1YHGg9EwCrNvRLPpxB+JlAozpqvD+QmUmf7W4PAXZj59qSFCv2T31lim
	Zry4QY+AxlUM4JBKOaazWWtXaB7Zs2BhxN7PlbV6T1o0Ckjl0cRZ1J1//+0OMo2Z5XhG2ECWh+X
	eqfAl6Yjz8AjSPhTpXQqs/P0A1nkJeoMIVKAdnKir8QFjq/2mKseFQJ5+eajGLon08JRar/ekYM
	KS1tK4XtydqIRBoQ1/b8IajK4GxK4hUk2/WeWVgMPqJhN/NHT2ZpmCyYXHiL0D3CJktK7Hjg0oR
	+N0lIeGdc7BS145vPBfEIsUHg==
X-Received: by 2002:a05:6102:4b04:b0:739:5f55:3c3c with SMTP id ada2fe7eead31-7642fee1289mr5108691137.13.1786372718312;
        Mon, 10 Aug 2026 07:38:38 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f2e7af1asm3563083241.5.2026.08.10.07.38.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:38:37 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-765c077b5c1so470607137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:38:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrCIWj/fUrTAfKhy7H6894Zcbb1L7f0PJ0tzJVTdmZ13nEKfzKLuAT2NYgzbpS2FvymQ3h3uBGC2H1RY2SXbMuwkA==@vger.kernel.org
X-Received: by 2002:a05:6102:f82:b0:745:7f23:a876 with SMTP id
 ada2fe7eead31-7642d16f34emr5609033137.1.1786372716525; Mon, 10 Aug 2026
 07:38:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:38:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4V4tUe42jjNe_PZN=3cPuNfY-f48SfaM30DCHG6T3cg@mail.gmail.com>
X-Gm-Features: AUfX_mzMBIGgMQPjwxj1aRVEbLrB1qEDZGXr2C-cIphISdXHCveNYmgvbEJ2aX8
Message-ID: <CAMuHMdX4V4tUe42jjNe_PZN=3cPuNfY-f48SfaM30DCHG6T3cg@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm: dts: renesas: silk: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
> the system wait after deassertion of the PHY reset and before start
> of communication with the PHY via MDIO. Opt for the same value as
> used for KSZ9031RNX, which is 300 us.
>
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
> reset high is at minimum 10 ms. Set the DT property reset-assert-us
> to 10ms because the KSZ8041RNL RM does not explicitly spell out how
> long the reset has to be asserted, but this at least covers the worst
> case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the URL corrected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
