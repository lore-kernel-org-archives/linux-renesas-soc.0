Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7CA47D45B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 08:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584630; cv=none; b=adjBnFyvQigi0vc83Lvvg0ZYhmEzl5D/URWbDqzzh/eTHJgguBalfV1OHeW29Yp96W83KzjotQfbFFMm0/Vfv5MXZ0SQryw0IxczzZJkQdXhI4svniTl0Cm5yXmbKjL0Hg/uDvRpOgotHCR2NAv2uVGwwr4a5BQd7NpkIqoC/aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584630; c=relaxed/simple;
	bh=EX9eicHVwaUoiSZxx714UBw/LKTiMCIyWd9jiYJIXM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KbhDtTpC5RbiamJQWVhwuazTijkQkh8Jgu/arfNe9AJWYG76fziqsGuBmDzdG6RYvaXpkzPnn09crQGojNOu9cDuMpaY41LRJQ3Fr+7tKCvuRvwfxrTMcIRMiNy18o38rAdTdLvqFES8iyz7MNeus/nImYmHBLQACkb1XSVk+do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c979c5eca8so2084266e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 01:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790584627; x=1791189427;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zyTKehMDkFPkqWKZx92kuclrg3hevtjSeeDpDpZ8x8o=;
        b=BevzsXeGuDFdxkthB7IFSve6dT3K26dRIGSdci05mXUv8QlCaiqYc5ZDgFU49ViSN6
         FpXa+yjg/f2/rmScQ+56cXfXV2wk3nzhk5BKy5SH/LeBntim7Qa9W+Iwcm4BhNgtFlRB
         j+9qvS3MH9vmETvbRroZcloHk6q1JEBA78FEPRB3Rh2xHevqPGIqOHyTFz5zyJjEJidm
         YyKdTEcR+QJA2c/NmkOR8sYaCL4TgRyhqHFMV84ujHCrvtRVY0mZiq+ApPvCJrLefj6E
         OQVB5qroDokTU/hnHPTsyreWwqB+EPARTR+wKW1gCBIUm5vyB8mS4TspGf5eZtvQXXgK
         PKcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYTNmM54JR1uoRakwHrB1kkQo4ZBjHYp+JCfPzVNthPP9LFd+YPxz8lmLWk1Qk5D4O38pm8QPtc9uW7V2XwLtMhg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLnPH8Yiif3z/HPQEomgLwmTLPu0/7o1RHe96thwvO/hljWgxVz
	dXmTpUaggRe9AtgJHrCWie5gTjhD3WLl8v+Dy01+XPdsOusqD+0FpiwqJvhzGR4M
X-Gm-Gg: AYBFou2dvUtzJLUuVuWY7MGw0bVw0RuIn/ZwiFBDI2NT/yZbJe1/5uAS93a9kn1ojTm
	+Ic1xtsSeUT3BDHmz2PwCpvuiZ/0ghLFO9wxPTYW5IJTYYrUuisfcAQrKfvntT07LYhxEhnZYMH
	K+bJBuVNnfD7gPosngYrfOlMMOMjGCE9d4TywzAXbqv453DSp4kwiETSnpMyFKH0hEonDmsah6A
	twxNHpiqBeD94em0TkbHeu6krkOSahr22aot0bTEUg3hNYXnL/Uw9sdSn9lmPpGczJbNUDIleh/
	yhqQnas+T/zNeyFjBUlyMXomzcAZyCQeutd3CrQE6vW8qHfevQ5mHtVXuYnur1tDtbJk9DBCMZ8
	QyW1qrT5JGW7s1ulMNdB6kMLpgy5HuEb7Km1Ndp8FhpungQHGB5nQAzWMXiukBxAia3asx6SO4Q
	kaVAuqSoFl/qrF6GSXQcRFuqVnzbIJGJoHzB/4QQlT1SKkZpKPaiEpAlWX5wiImKkPMn7TGVc2W
	5tJnROkZg6IPBOj+QPNrZOk1YjgazSbUn9M
X-Received: by 2002:a05:6122:1307:b0:5ce:b65d:22bd with SMTP id 71dfb90a1353d-5ceb65d285dmr1386105e0c.7.1790584626984;
        Mon, 28 Sep 2026 01:37:06 -0700 (PDT)
Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com. [74.125.227.36])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889afc5c7csm6121103241.2.2026.09.28.01.37.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:37:05 -0700 (PDT)
Received: by mail-vs2-f36.google.com with SMTP id ada2fe7eead31-7b47bba7c88so660714137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 01:37:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwovH8UxReFiDpEV+T44tCx/IviHzJ+H7nJWG4EvtGJenE2OSX76YkecaWLffj1VtC/FBfMg1X65Q7j2SuNntT9Kg==@vger.kernel.org
X-Received: by 2002:a05:6102:4412:b0:7a7:19aa:8a85 with SMTP id
 ada2fe7eead31-7af1eff69c0mr4934230137.32.1790584625197; Mon, 28 Sep 2026
 01:37:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917111349.52250-1-wsa+renesas@sang-engineering.com>
 <20260917111349.52250-4-wsa+renesas@sang-engineering.com> <CAMuHMdWy6ksspwvj8jRxf6_OATU5rS5p92KyG4+sEF+ag7S9NA@mail.gmail.com>
 <arlA1YuH709wjtHm@ninjato>
In-Reply-To: <arlA1YuH709wjtHm@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 10:36:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6v6Fu+mTy83TNRoSEjbaaup8sZb0AE1DZbYc0ZGV2_A@mail.gmail.com>
X-Gm-Features: AclHuK8tJz3nMwMQn-AWIXUGX_sO1CRpFshT3Dx9kEcVgOI32UtUqTiw6p7Mi64
Message-ID: <CAMuHMdU6v6Fu+mTy83TNRoSEjbaaup8sZb0AE1DZbYc0ZGV2_A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: rtc: rzn1: add R-Car X5H support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Lad Prabhakar <prabhakar.csengg@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Sun, 27 Sept 2026 at 18:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +      required:
> > > +        - interrupts
> > > +        - interrupt-names
> > > +
> >
> > Sorry for missing this before: the "resets" property is
> > completely missing.
>
> Yes. Prabhakar, looking at the N2H and T2H DTSI files, I assume that
> those also have resets for the RTC and only N1D has none?

RTC on RZ/T2H and RZ/N2H does not have a reset.
Please check the MRCTLx registers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
