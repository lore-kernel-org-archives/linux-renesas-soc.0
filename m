Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1AF4229BA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 12:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660549; cv=none; b=dZvylbBT/IOvsbM9DuuzTh3iakMCS8Cq8NAqT5UBXtE7xruikiHP+fwLtGl3Wr5WQochnjou3jmvc0QfAxJ9vPHrbFGRiAZGEXtN+pTZyPc1a8dbZsUwLrkZQxQDQdDYIchad44yZGKRpOg0Zlx7efGA0GDBYK70772Gu+KiyIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660549; c=relaxed/simple;
	bh=19jg2lnbTri69zQgVhr/NQjVFCslnOuGljfwHwp3p9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qKZXzWdHZ7eC2GiVB7oT8uLO9laktgO0GA2ESxg6/9wxccoylyHwbL6oPn7gJp0IWTvsXTQ+Cif8ipBVz8/kOLKgAJg/s6FtROPcwtMo+zLraYAdTmMS9rWGB7/aWJPccaA5O/TvqXxpzSg7Gmqx0YEpDw873PgkvqjFOOkqyqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-73720e58dafso2525549137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660546; x=1788265346;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+rIzCWZwWUvnN7ZoJhz2SVkMSZPN9hcBjEcwV+nLhNU=;
        b=UBYlcb7bTyuMyDfKCHzMWIGNWOL1kyOQIYL6jLdmCvGXNsusQqRyLj//Y6EYxMu4uz
         6KwMSddx/yPG/Lm5RcZ89zuVwE5OYazq7JRgzBZ39XgAltQGZu9h6DcvTiRo8aLXbEmT
         jBGEnAUtsHC0g50p69wuclEy03kO3DcBH7DTPvI/X2reWumSl4tVD3ZTnOgEblhJFf2A
         iOX2V1/DBs0kh2ZynBy54YAhj5VU5x2xrObRPBDL9nnaf4d5Lyc63vGiy65QyrI0/R4t
         sOm4dL50SL/q32yOAjx0Sy8Mo68Y0iYg+qMzkD/Np1a45XDXyxqNYWNMnb/w1Bs5kBA4
         uMMg==
X-Forwarded-Encrypted: i=1; AHgh+RpN9HdL79qgqCOyiWL4rq6Uf0TK4w98Q8FrLiN7HKmh+3fACDxda9XZ5b/iCUtTjMJboGUpw8R/DicW0eHrUu8apA==@vger.kernel.org
X-Gm-Message-State: AFuF++m/Ft7KKTAGlnOnXBrjLC+TzviZE7oGLSK7/zYlbZAmU4JXf6tO
	pmmfv7BEoKfz633VQm+v8UK8VZKr+rAUHg77Y4a+bZAJ4gm2ljtQ+IOxn07wLh5SbbM=
X-Gm-Gg: AR+sD114DxK1BR1pfuXKbRcHwy6+YxtdNFEc3H/mhsmLNiEnziCC5aL/FEY9aVOmlMK
	eFxhLoe8pHJsWX7WxjQhRjDn4VorakSHDM/p0nhs2Cp6iUWll9stzMGpAacRDYMsHdJCue/tE1c
	F4k6jIOiJhsosioJaYf9Nb3t2w0iVkwMYvW8oyxeePIZTA3yLQKbvoDed91yg6yu4bh5kLGmfTO
	tf9XRvox9mnuU6SgSclEd1y4p0zJz02enVO3aHAKpItQcZmW9ERwDVd9uD/vl+LIyO53agjidf4
	OUIbgY+lLrHxmq6z2M2l5ClDvaQZS1kdLveBfvY5Ma+Jh/Y1NKq3jCMjETgyLEJqbFJc1/DhYDu
	vPgGFfvYGP09pWnCVlHofemCZHITTK+B4zCXZGbV/La3eoI9dgWKxZky1+bmYL0YiRcDoqq3Xf7
	CDv/wVbFYnecSQDpmTOtsMymzKQVjdDQLMDcsEPA1Vh/vwrSh25PSXr0LrDAiV/kzq+WFB0vP7R
	HXktkK4F+CYqfVkV1ZrqqK7DXk27PiiD6Cx
X-Received: by 2002:a05:6102:e14:b0:77d:a23d:ae70 with SMTP id ada2fe7eead31-77fe9814c27mr2227557137.14.1787660546274;
        Tue, 25 Aug 2026 05:22:26 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7804c715dfesm1012767137.3.2026.08.25.05.22.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:22:25 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-74dceb46291so1920664137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:22:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roqw7+RSRQ1yQjZBqW9tuKctmZ5v32HOVGp89PznMQ+1GnvEr6JbBId2R9a64IcX56L2iJWgAT08CP4wU45XDwC5w==@vger.kernel.org
X-Received: by 2002:a05:6102:e14:b0:77d:a23d:ae70 with SMTP id
 ada2fe7eead31-77fe9814c27mr2227510137.14.1787660544918; Tue, 25 Aug 2026
 05:22:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260824075936.2904336-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260824075936.2904336-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:22:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVie-98BHsSg5M0yAnZsVWgSr-DForifCwiPcJyz1G-jQ@mail.gmail.com>
X-Gm-Features: AcwNN1VHo_Iwbco2G78SH4gvsKQGahjhs_UdUCHEWSkKQyljk6c_fOwgu5bpYwM
Message-ID: <CAMuHMdVie-98BHsSg5M0yAnZsVWgSr-DForifCwiPcJyz1G-jQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a09g077: Add RTC node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2026 at 09:59, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add Real Time Clock (RTC) node to SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
