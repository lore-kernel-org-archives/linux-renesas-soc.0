Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8818642E40C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 12:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660877; cv=none; b=FQj7P0uodhGcOBDV/XQr/G0QfqZ5AyQduWMDbqyBhlMVFPTszPYCkm3IS+eThHSlQXnFJ2O92lfTW8IHcqqBSQztFpCeu+3yKf3SwrDyKYms65byLE8vfhYkJKwjEmO/IqTRcSf4QVyBr+vG1LxL9sHb23RvSe+JnXtMqbxakIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660877; c=relaxed/simple;
	bh=vTlIBThix6p5ACZNkCu4XDSKPza1TCok1RZWv9Vcpu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSlX0H0jC0vVyniipxTOKJxHnrJGrvZTC++/ZJxzf/92xPwHyYzBdRog+wHf5fSx8tGAEumuoC34/uBUiEnYJRnQBhE0f6m8NAAMG8JJKUmnKSOh5TPlUDg3lqEQBCdUd609DSKg0CN0U3GSBN+EdU/TphtXyrSJpcbrJqdMb38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97c4f5858c3so1308635241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660872; x=1788265672;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oIDFWZS6RDEUFbtSxS2ibtPun+j6l9sII3nkgLpimSA=;
        b=FDyl8yqUBkVIZ6RZPu4qR6wQXeVN//TUBU6/lj6hGLdTor4/vziJ2CcETtuLg5wt8Z
         hYgDtC8kNDJ2jCN4DrROwMIsa6EQhBD9PFVDKDJjne2jzLel1SxSdrXUThyUDSdTacUw
         M/8YMafr7OAI1JOs7vUcrlwEhmZ1NGRfYQ0iT3A67jECKmwKKLWMeawQ4dDOYJ8HP+hE
         onL0JE+Mi8HVxwH5lSaZXN1imPr0Wf1QV0fROMzi4FIkPPrJ55C/wbYI4KRURPf+gegx
         5JCRz2WioEKgw36UOWUPk3ZrDckDSQv2xWMFdIgKNMfhsGqLpH5QpjYJrtx14aQ8ymLe
         Nm+A==
X-Forwarded-Encrypted: i=1; AHgh+RrhU6gl8hTcW/CLHRoC6ImaLN8QdwM/ksjaQF21Io0XDL/BBUtAHzD6aDg29xwKAVtRuw8lPl7bDRaHk3W/fUivWg==@vger.kernel.org
X-Gm-Message-State: AFuF++m2y3CynEdyGjWNcPfMGSQG45yk/wlrNuJF87dmnSGjB9Tja61Q
	FOgTtxk//a0AJU+jES4kdIcj6axOApQw+VU3MBmVtaTtrHa9/TEwP4LrcaoOWeMvMaA=
X-Gm-Gg: AR+sD138H7hJBRK9UFaxX25S1KDASVUmyMvzSDssUiSf/Rvssg/+C7w5r72a6gdSp+Y
	lDbN7s9X5jjLt8sHsPYdQtJ9CZaRyuusG0sBNhtMxEfnDCS3+ak1P3TBl4s/mkDXsrcv85hkLAh
	JiTZ0urPbSJQKLiuA7y6dv9QYFTE1TSm+Lh2aR81IhQFNNB2HxzZP9Mff2w9M+g7bCQgpiJ2ZjM
	S+elhZkKoqan7QK4k5U903lonIcWKPE8UeSnJ7KvXPneP3O5cAA02rRv0BK+uJcZLseikblVpUI
	vjpKw0rcrjv7aTYrYtCKOTZs1w1zjwtHcXKn7rUxzOvE0Qz3ljqOljbvF7V0Ld6ZqEUBlrpvyrA
	Fh8OTY19qEA44msePHIdNb6Ql/GmFaUyR6MQvdz1my3b9wzPKcaaLLjxFUZo1aptxvkJApW/As2
	by2DugI6n8KnrbCC1b8X22jbqBuYur1v+uwZTBC0thJgJKwWu54eFWFoq10kZaZfTYd2bjeOgmc
	OrJ+B+ctBK+X83smeqWhT2DRw==
X-Received: by 2002:a05:6102:161f:b0:780:8536:f53 with SMTP id ada2fe7eead31-780854567aamr704362137.5.1787660872119;
        Tue, 25 Aug 2026 05:27:52 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-77d8357ccf6sm5342862137.4.2026.08.25.05.27.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:27:50 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97c4f5858c3so1308622241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:27:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoV1bfgNFTPwEQ94G8XFCCxmArCEfq7gZWdYVa8i+pAiCPKi76EdvJn0bRH/2CxUnMem/+eX2MXwB8lYHSBhtxkeA==@vger.kernel.org
X-Received: by 2002:a05:6102:956:b0:778:9e3c:5760 with SMTP id
 ada2fe7eead31-77bd288c901mr8408694137.11.1787660869267; Tue, 25 Aug 2026
 05:27:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:27:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyq0pO-ZDMiSx6k5HoT4Y1W+Ov2KRWRr_OCE_ng8BEVA@mail.gmail.com>
X-Gm-Features: AcwNN1VVA1JsDEFfJkQvCcAZH1nZvL8L6xNDA-rPHWfx8tfe-s3NaRctdvNNt_w
Message-ID: <CAMuHMdXyq0pO-ZDMiSx6k5HoT4Y1W+Ov2KRWRr_OCE_ng8BEVA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] arm64: dts: renesas: r9a09g087: Adjust CPG
 register region sizes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Increase the size of both CPG register regions from 64 KiB to 128 KiB.
>
> On the RZ/N2H SoC, the CPG/MSSR block is a multi-function block where,
> apart from clock and reset handling, it supports other features including
> clock monitoring, write protection, and peripheral configuration registers.
> Expand the mapped register regions to cover the entire register space of
> this block so these additional features can be utilized.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
