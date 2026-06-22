Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942863A9D95
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 13:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133300; cv=none; b=B6+sGu8YplE8XnOBhpfoYkASO+BpwG0OpQGcJkBbSSOQY4lS92H4Sqt/tzlV/ylDMQXzXN1vWlLl7iOMub2r2HNkqZTtAPcb0WOOuYjioi1+og8UFDpiNf9F5OWwfzBjI5jiqIDiPUZQHIbJyZWB1t+jHctejXLhKF6TtjnDpHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133300; c=relaxed/simple;
	bh=qK7VD9LHBp2iojTMkcS+j1VMY8DyxZEPJu9ua8on/To=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TtqrL6myJ1P6Ob5sm3ppmvT/Lz1ZNaGQnVhBPgps9cJfxfrK6kMLJKIhCfKx+b7W5XoGpF7ChYWWdrKqvvrC4J0wcQEtTFM1E57lppzm4rqk6qJoWi2mT7K2GF4adIuJS24fi+H+4pw1OTdF4nZiGZYmOTjT253V+Dy2gaM2r+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9666739d3bcso1174604241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 06:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133298; x=1782738098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjMojdBNG/o8SIjkI26rWpitqIrtyyRQlAlt+FrtOZU=;
        b=ngv+cIBeBk2+BRBcsuY8Vo9iPROFY9S6Pn8YWOakCcHP3nvnq4QTKdiJy3oEkFjNOR
         Go5lp7drMdn4/lyTFZ7NdY7/xrnS93nRUjEfmu5i6NzelhjOgJiMoWFnWemX4cwMUZg8
         APy/r3VEO0HEYF5mCrpZ/X/XjiPEk9+U7a2wmx+0Gvmrj/Im7nQh83RjrZR5hoYiyamk
         O2vI9a/Gj+V1RTbhuKwDJz8kBAI7t1Eb2XqKE9KJ0/tiTWdf5Z8A843x7udr0vBNcthY
         gcziac331oFDfRQ0mRpMp+PiUP1goKuFF/xV4SzyjcyoB8fk/cJ440K1HUDy/Px2XWA0
         OaoA==
X-Forwarded-Encrypted: i=1; AFNElJ/abih1jPa/TO1xv79c6It5k2nnH4S9mYck2hzCzYtQxP+bWjf3DMabYL7gDs5ECLM3CHiPwOozL9BEYaLxCyORNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQFDHnzO8NG5H5j9qU+iZA0A2ROQ7/Epyk8z/blMv1ByRsvUq9
	9xMiC1Zbbdp5lf8jLPqpelGTL2Xbgnu1okuNtJgVzB7Zmwo7HtV95ScsCxEsfaYc
X-Gm-Gg: AfdE7ck7EicJms2RFUbFssxk/Ba856r3fCPuY/FVRjPzswUT/fqnlvaxXy7j73IdPW1
	ZRrmDE3Ze1ZxxF07ia9MlNgqdbANul7A0aTZ600k++Ceg6HgvZC3C17JhtltVwoFM2VVxBaEgMM
	dsPWMgYJtkiip3+4dY00tUnsB1aOVbkkXeIlV19nxCfgbpKBhuAZmzDC3DSgxgyzRw1jmUhZxY3
	H0XBt0QOXDKMcSDZE/B7yCeFD+ccZXDuLOcgwwjGGvmCRF+DCfPk33nWGMHHjj6jdauvbf73egm
	i0VpMxWDtJaNDjmYVWBvQ8emOi1itbrgl3byVcmNWx78G3nB+eNo6mEN3VyEOajdx0Fpbqactxc
	Ji6+42UptrzpXVSQKCOx0vdiGpgYx5WyNlhlr3JZMNuB2+gIi+PY6p1AaCDhYFhyEdBxyWHTxAV
	h1siwtX48wS0Ixwyv7LF/pIm8EfLuHTSwxeqRubuQcz5GhgYwt+KrqsMcDIVyJ
X-Received: by 2002:a05:6102:b13:b0:608:94e3:bd89 with SMTP id ada2fe7eead31-72a01882b01mr7658612137.1.1782133298194;
        Mon, 22 Jun 2026 06:01:38 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9670bf154bcsm6384698241.0.2026.06.22.06.01.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:01:35 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9666739d3bcso1174532241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 06:01:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+zX7wl3cT4t/ATHxJNriYZHTAAujhIid4ibd7U5uqlqac5a2xp/JSn/LQ04nn+vI6BPXn1c6qfkmNIn37U0vkX2w==@vger.kernel.org
X-Received: by 2002:a05:6102:50a4:b0:631:4cda:3e86 with SMTP id
 ada2fe7eead31-72a042b0725mr7252805137.24.1782133278319; Mon, 22 Jun 2026
 06:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618181949.3036280-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260618181949.3036280-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:01:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOLk+zsaxyiGKvW=kY51QiqSC7osrgEd=v6gxiSoE-8w@mail.gmail.com>
X-Gm-Features: AVVi8Ce07vFTcANCkm8814EiCsqaHjcIMGnkhkhtKVp2ly41YzdV-ZwpiC2NPxE
Message-ID: <CAMuHMdXOLk+zsaxyiGKvW=kY51QiqSC7osrgEd=v6gxiSoE-8w@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: clock: renesas,r9a09g077/87: Add
 LCDC_CLKD clock ID
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jun 2026 at 20:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
> operating clock for LCDC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> - No change

No need to resend queued patches.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
