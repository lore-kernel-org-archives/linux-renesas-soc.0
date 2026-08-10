Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFC23F58D6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372689; cv=none; b=tDTY2XCbY3kpHah9Ey53sinOqhgzaYyPqhRDEt5b0YtRIs3dallM9hcrxodrBJugLndScMALXTeHBFk7wVveK6vP5mU6ZcPq3jV/DYMSSiyd+43BGV2gn/qm8DPNlwPvthUrkoG1QMINuPY3TlXTcUWqavk4gsFBdh99kjsU7iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372689; c=relaxed/simple;
	bh=uB/V/Xhwg31kLJGNDAMpcVbvCMFk1PoC6Tb+YOPqJRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ErBcUJwRQIDygMQnRwLhA7VHwzAFiDd5pDOdUrFMapK7ICw5Sr8ZizTl92+X0O0wocWlQRFkAOePXQ36TvZvhZign0kPtm01A7kju9uk3F+MrgURRLcEwdC+ZQMu9g/wPofiHoMAcqb3ZUJ1VdIGZY/70xDCKt3IzdIR38rWNZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-967327a0c7dso606261241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372686; x=1786977486;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=fXhQSBw1IBSndJe7TCJI/GO1nv9wXZ6dlSBnRjV4Gx+WPhMra2i46qFxLyJ9b4L557
         3aMUGPjIcYUuN4BnHtxjsQI+84zhHLxlpt17bn/GOp4OmnVZCnjiAUNfx11lpg6tsmic
         QoY8/uyMT5avaa269m0dwOypTIufnPoZ/2AfJ/PAumx5KgiSOZOIuxxbHSJe6sT1cSqz
         9E5+1RlA48WPVMebrY8YZa4VkJUvTP944AYrqbNLR+AzqWuTnxFLwIbJvpCkUN8ivCor
         ieo7UBUIuSwOdbAvijJnKsECwGX9fFck6LdCkTyqC4r0beK0APqBfC6ML6oxzswD9AkU
         zCZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIddCtyTnix26bI+AEXtxlxjhcLGQ7mH3d4+RxvNH7FDsy7AOpaD5mbTn1G7Zy05tl4xbFRQ1v32NLzGaDiY9nLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8y8th+HJxHGscmJ2ws/9OJmJcInwHzcpxDlgba6W9flDmA5v0
	Sc3+ZVxo0s+yP0UWkr20hV/znN09pY3WyreIHA3AY3As2sPAz4sVcZFrvDamJxfE
X-Gm-Gg: AR+sD12fSFjbA/64Nh758X7vv/pBkdMrBpwJ/6LGZG9EJjebcjHD3wvzYH0HZ+IYCOL
	bCbkZuacUGfbMoM+mpL+4C+B9eer9Uw+MRXjs3pbB4tmlXvWU+l2V2PCa0EJAvDQAHZY2dxqUSF
	CwT4vPjBEWqVRTKF7J2CfN25STuITY1c1gWlsG5QTxkt8UT1T6I3TVGO0uDsyxT2dh2UOMvjAOi
	kkmqugWPw94lpxwtmAGOxznBj75l0y1/NXIVRQUAMNkib4KFN/FQmy8+gQb6FifzS+gEqaL2jTo
	ZaZBKXVliKlSatkepz6AT3oKo7lirrytDbOQMPBa6rUjdYIlRM81umSk15HZiyZx2ewiud6m1QX
	NAAXI4ATzSTQeoGvYLIMp/KW7fAezWpXghic40GbDW/4VZ0qzUPGiPwbUTuvWz2+rnrPAzb6Gnz
	53mmxywv2WkodXMkgZC7LAGvXjLyQYBrSTRjtx5hBYrOr743B8/R+O66RxFIkCCjlUjYmUqDbcs
	I01UAdXydDIXWbv5+KUcpAZMw==
X-Received: by 2002:a05:6102:32c6:b0:73e:c6a0:331 with SMTP id ada2fe7eead31-760e852173cmr10244183137.10.1786372686350;
        Mon, 10 Aug 2026 07:38:06 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763feadc5e1sm4782898137.6.2026.08.10.07.38.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:38:05 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-977fbb9dc5fso439907241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:38:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoD57PMhNWnfTZN7y0gW/4iuXuOD5TDPIRiZ9J1lU9BE+s3UoRnPSEAaOZKl3fCGqARcZEPU9le6H+TtOTmM5XUSw==@vger.kernel.org
X-Received: by 2002:a05:6102:534c:b0:728:53be:7c87 with SMTP id
 ada2fe7eead31-760e77dfab8mr9982753137.7.1786372685152; Mon, 10 Aug 2026
 07:38:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:37:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrVzFKMYwOJsBj=We9_fRNruL+AAfBwvvBb_fVK5oUDw@mail.gmail.com>
X-Gm-Features: AUfX_mze_-zHFwLEPllsdSuJpX2MOFA3Rbmq7xanY1eONL6iFxyWiwDqSoDZXYo
Message-ID: <CAMuHMdVrVzFKMYwOJsBj=We9_fRNruL+AAfBwvvBb_fVK5oUDw@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm: dts: renesas: alt: Specify ethernet PHY reset timings
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
