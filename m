Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DE93F86E6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371693; cv=none; b=GEBOshpjUTRU6SuRzsP83LGdO/rUghI1unkwWL+F21qvvl9VOkkBR96Vf8T/FvH2vq1HGuM7f/HXquvDhj6gtFP0r2SrMqLsWfYByE7zirQmUh5/k0Gdhq8VLUeZR0aWpysXoLtS//88zTiOCvsULhxgAtDrCXxaQsjR+6Q0uXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371693; c=relaxed/simple;
	bh=SpxVR6pxx9Ul7PjbKZTHV8Hv8h63JXbsETU+DAVrbVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sTe43m3lw/92nBx+S1o3/rX9jByzvK8aJAAKwZDhAs2bD1uPtDZiavOct2XWK2l6uNmankRmDHuguWVuyK1TTZWZKY8QdhkCt/0Uulc+bGMR6WtkAdp+mKnwWrI1UEzdpMmRto7YpjAPRTSNWU57BdSXG0Im7Xe9aWctQV77Sps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so814526e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371680; x=1786976480;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3qt0obc65zslhsJe5ID8EDkS8LtWy0Gpp/1LJUID83I=;
        b=gnv8iUBkVBIPco0WLbmwESlEXt8KsyGFC5ypXF/puO0iD8/qOfj0PgPBuxXAS9cQxg
         7gKKz7quP1A00qrqM+SqxcKjaD+cKMh2dR6Y1hwBoMg1/EWehMxN+PwOG1qBhQPbKaKN
         UlUTGnV2kt9WUlgjf9ZCbXmX1sr3gBnvXFy0mP4VeSraNeB8SK3jDjZNOBrUQRZKgp4U
         sJE9t3uTLskTSeSa2eoTF/+yNJ7qS+ATtL3FqB9I+9VgNPetJGWdRnNJ2gE4sejD4Q5T
         Nf4d4vKCHX/eYuqYtTH5Jx+GBeUTgpTCR+k0Mab++OsfZV3gdGQFDJu32OcDC1qnsS8b
         lzpw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1RcezPSxHmUY/d8zat6WcP1AhnP5EOEsEnvnWJoaY9UGZPOvY1vApZdyTZW/XTq4iWoVFaVwHeOeFZBwC0HIbXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0pjorJ6/dy8VPguCSDiQe1xDwUAWdnaYRFR0Xlqcb70LAi+Pt
	VEKTyhJwBL0TU2Bwy7Pe2vpoRosB9vovMyLlbQB1f/g/xk0hH22hKUBiEvhqAjw+
X-Gm-Gg: AR+sD13bBCt/oQUln+rTABfY+Y4EXdmEbaIuAddTvNx40OtrR90x491bcaLLuZZ7OKF
	uiiJ0l/zmq8WXgWfoCZ82nrqjMp10rSGiLMMaOFx3RL1ymN3+fIZ9DIzixAmKVfCrhKuSTAE6vi
	4bu6BggxqN+wPz1prkWwcGXwiYRBssWWxMUdJwJwTd3hpQy+VVZUVm+g3L6EJbovuQPUYHmIy/V
	SZH71U9VllHHf4lBhHg4z9X/zCUeee9kuKUF+QLG0Ie3ewiz0WzJsLZ4gnhWYx/21bzWH5SxsP2
	9RkVx95q1q6pStJx5flsBn9JioeNT0hlMnl94AKUMWzxA8lbwYuarhNC6nlJnSkY7rwAx+l9L66
	VH2nbZPerK9YuvlK8HGGwPJkVqERa2bVydROVLOWkvyIcACh1B986oFmmFiXz/6anhPLXGVKblP
	vMBoFkRYpDsKkezs8K32xelXnSLUnIqbDKZmJHYHnoIx4neLuKcm1vDBcYcuJW9c5JVD/A369cP
	1UggK3qX7yHAwii1sGzqqERO0TqqPaUIarP
X-Received: by 2002:a05:6122:895:b0:5bf:7f98:9657 with SMTP id 71dfb90a1353d-5c409339184mr2544021e0c.6.1786371679891;
        Mon, 10 Aug 2026 07:21:19 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b1aaafasm4333380e0c.9.2026.08.10.07.21.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:21:19 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9770fffa5a6so319835241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:21:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpXCzxQFxhCEEdLuhXuEwOmdREAlxPx+isYZMOIl5FclY10rtRu6zQt6Bap0Erqkv+OVYcaE/daFMJGPQ9UoJQufA==@vger.kernel.org
X-Received: by 2002:a05:6102:50a6:b0:728:f34d:f410 with SMTP id
 ada2fe7eead31-7642e3908d2mr4413691137.7.1786371678544; Mon, 10 Aug 2026
 07:21:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:21:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXv8rqGGdFjXqBw4RbzHdoy=CAWY0WdRfsvjSccm=kvxA@mail.gmail.com>
X-Gm-Features: AUfX_mzTCV5NDV8QSZzevbAyZcff566ZTll72oycYTZVrDtUDH1idu1vYH_kZ9k
Message-ID: <CAMuHMdXv8rqGGdFjXqBw4RbzHdoy=CAWY0WdRfsvjSccm=kvxA@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm: dts: renesas: lager: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

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

Thanks for your patch!

> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf

That's the URL for KSZ9131RNX. The correct URL is:
https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ8041NL-RNL-Data-Sheet-DS00002245.pdf

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
