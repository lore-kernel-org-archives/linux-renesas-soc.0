Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA5639EF1C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 07:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470839; cv=none; b=kI8EUnesG+rf8gr5N3gsAdwW4FVtGlhaf68FS2Ptykv4IHnii7dB1Jvd4jjkJjscb8JU9gy+XIvxtZ18crt/kdsxp3NFRLIXPQXeT21WJuHHu7ezpzvxDdagYLsQNrC9WHqCMFq9810SNnPi8VnxfB+jspyJadaItPKPHu3Pfj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470839; c=relaxed/simple;
	bh=PCWXLFfrvNilpK8ZEoTfdntslW6sKXMO4gpjttz/CDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljIz0RRFwLeeh03rCLAtH+MOuYm9++0IEbkaMUuR5nw/v+FsK11lBzHFY2oV55fdR2WSjwsWXGF/9FUjCShOHwz4dk6HoqoccrPJ8BcszWv8wqIXoQAQJCHSUopM7Jngb3jEZXZ7F2TuAjwbs1KXWiZoOKQXGnrZqTWbwIYnQKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9618b8bdc51so3173001241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jun 2026 00:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780470836; x=1781075636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVTm+HVXfWH2P4Im0jsyjBGPpAwX0VIXYMfcrROvkZ4=;
        b=kH8a/M9KVP/1H3puYxYpLrqCnuQ04OPttHqr+K4KG78bBmiNaWHtERL2moj15t6exC
         zt/h91uFh1gFK2I2F0MHnaZ42ayOx6/EZQz5wZV64R36migJDP0SxWHmilqQr6A/rIpo
         u5ZkIdjiRO9WNhwce/E/raUkY7GaKs7npdL+Pu0I0d6V1jJDlSvSE9KDYBqvrT6biK4a
         kgX/x5g+v0bG7J28N2WDejELrtI/cS7rpfUdkczE/487Z+6QzAOoTTdXYzxLn98UmjDt
         T4V1R4b9hFYkoA+uxE8j3FfkI87Qw13WvBPP5T/rewW/9oF4sCef8vkUIzfOzdYO8Ztc
         i3JA==
X-Forwarded-Encrypted: i=1; AFNElJ+LYK7qiGATOonb+1dckB6C+NzD6qi0v1VwzXQSuaGC+31ZCHfEtAFEDrRa3KOUgdBlTaznIf7CBHpiRh2MpaK7TA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk4MSoHGCB+nZTKOWFMhoaZAYGdD+lSfov45/en6qllvVzfCUB
	8NirA8967xZgKsG3w+UqtUWmfuNW6rWZxD6VoSlIo68pNCHciUdLGLGZ4gK11rRh7fA=
X-Gm-Gg: Acq92OFnnrhIgHOmd5dXzFK5Ld3E5+zt7fE/1pdyCk5mK3AXrZZzan3ELic1A7rPDnV
	/fFhveV3+r3fIJNoq2rraQkXAFwjYWia47YU/g/drAzTg1jTXR8ZN0yC/VqK5f8D19+ofFtIOc3
	x8GdjFO+d7OmI9klpgST+iStW5nxgV7WY6rq4X1S9n6RXcUVP8vv9kjjUWxmoL98sJzlJApUs/6
	z7NJ+gr/q8dwPfUb8EbPrep7u/ZlM4OHvmILRBwmVqplYwBfjz80/BCSKAlpxnh8UdGThuRUOF8
	CC3NZutmPL0FVqyantFF2xoSrSo8gRuwSMel5id0zonuUmHNX+xK/A9Y2qnFk6pKQo/IgM3mzMd
	56LXPwWlMjUNQ8qoHCWwWkMYz/g20n/ZI2Lv6yfE6uwtuL6yClRUQTAp6mnwSUz9nf7FJfKikeM
	qTJHRdR7Q/XSWhDc+h5CTgYQvdOtuW3unBUK0brQo3P1JKuWKRiSsJxNKtCTVTt/u0JE7x66g=
X-Received: by 2002:a05:6102:511e:b0:631:af51:7d8e with SMTP id ada2fe7eead31-6ec42bbec84mr771144137.17.1780470835782;
        Wed, 03 Jun 2026 00:13:55 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96413f9afe7sm1167603241.6.2026.06.03.00.13.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 00:13:54 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6c5ac3fa819so1397217137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jun 2026 00:13:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9GpQEXMV5MSHO8jp8ARJDkbVIoZpmfHILQYrAWaY4uaE9p3PrpNwnw8PeltEFmkF7Q+RhP7MLnQZ3cvhQx+QwL6Q==@vger.kernel.org
X-Received: by 2002:a67:e701:0:b0:635:1bc8:3568 with SMTP id
 ada2fe7eead31-6ec460bdfd7mr693156137.23.1780470834442; Wed, 03 Jun 2026
 00:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com> <TY3PR01MB11346485C16AFB6299B1711FD86132@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346485C16AFB6299B1711FD86132@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jun 2026 09:13:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFScg51Uj2_C9YmwAOfG1+pmGiHgEr1=s0UD=OwPb-uQ@mail.gmail.com>
X-Gm-Features: AVHnY4KTaTymKCx0LSLs6RhnIwDGw4kaIZ2uRjB878pxxG4jPILkeBa1s_xqOpY
Message-ID: <CAMuHMdVFScg51Uj2_C9YmwAOfG1+pmGiHgEr1=s0UD=OwPb-uQ@mail.gmail.com>
Subject: Re: [PATCH v17 00/17] Add Renesas RZ/G3L SD/eMMC support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"magnus.damm" <magnus.damm@gmail.com>, "wsa+renesas" <wsa+renesas@sang-engineering.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 3 Jun 2026 at 09:00, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Please ignore this series as by mistake instead of patch series 2
> I mentioned it as Patch series 17.
>
> I will fix the issue soon.

How? I am afraid the next revision must be v18, not to confuse b4?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
