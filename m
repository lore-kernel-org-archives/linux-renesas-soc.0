Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7AD43E4BF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 12:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661395; cv=none; b=d8e7SGQRcNmwixNyU5ECFkWYLd6wpCykCeCiv0nrRQ2A9YkMBBVuwqsxqsBpCEwqperDscx3hZnB3CMJgsSmKQilnxjbseHEUrzZf3V43APriWortSPaiZy5tSH46k5WStrz2ULpfVfoQ0+cLxeDcbk06fjngr3YDB9mFj1pSIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661395; c=relaxed/simple;
	bh=XVZs/xqSmR+34+BrwmpxC0cd+dGU1Zxb/J9zlN0cTU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BhjsRQQq/mfRW/JDFkR9caaZnx41ptbqEY1JvW9rjUes430lMM2lYeAFB895i+OK2ISbxDI3qvhQGvgyBrcUaGva7loZ/l5v0Arw4xar5Pp67KKCnxFzekE8S9VLangPdnWQWI6BWLgmS2NFLNYO7XqSCX0H9BU61y2oCs3MvIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66ce4a63e17so5630221d50.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661382; x=1788266182;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ILP07iJKBmCL4umuQJDRJxi/o8MvR2u5/1eDo+tc9XU=;
        b=FcnZgVrg1n/2gW8WLNCgAMCiYHwk+wPTPyqGUEoYb8oe8QJPJ3f6LUn1xKHvx4RlKM
         JlUZylpG4v5oHPXy+oSFfPKKc0nUqPFFDNqeOpFpUK+0++GmpvqXmB6H4Bxu4/tyvLV0
         6NsLM6plBdiOuafU6Q1oE/COG8YF4+IJ1byoH34ur4eacW4bJjHV8/DWqTnIf4MwHLoP
         VVUUYAmvJlz0+4JFmqbF6vQlPqDOFmp+E1qnlA5o+y6SZBDIJ8t1FB7cQRq5Lm13zaSh
         KeQOe6Cl0z6/0J1Q0SawKVPezkMww+ImhkGPDIDLd9FNd+JdfLikX0TKSdq90gYvMZ6Z
         VXKg==
X-Forwarded-Encrypted: i=1; AHgh+Rp01rD/ongQYAE91Kr1tLunM1ivjXug//wtlqVYFPu2d2lRpWuw8PZkr7plK9MlOY5VcarMvetSa8tOeB5ovNDGvw==@vger.kernel.org
X-Gm-Message-State: AFuF++kfWr0CruDAHqP9BY/POkvnXXIY6S7RCS8d8pOphd1GT/tO/rfc
	+RpXzBMHkiAd9ZQEemXXHKCw+3YjRr4tjjCryt62RmMjeEMXejqvYXz0TZTOz6rm1fw=
X-Gm-Gg: AR+sD13iEVEyWhcoXLsZn+XMn4z2DT/FYf2nwsLlcJVHIG+vAx3ol1xEpB6uWcBnurj
	vDk6sRCMGYRjyxWDbosn8XdVlwvzhB9unPkETPWkT4XgOP/5UBP0B8lHuL0/L/b7PCIGsfs7o6R
	oBeisj5rrSqMLdOmHQImcbMOfOuitjr1wx5Mr9zXHdhf3A7TgoQfbft6uwZOdDNwN9bWLCSSYBz
	9W3bYlYdBRQ9MIcOtlbXnX5hIxaaQqg2BATbWGEUSS9t6hPV7bXVHgke5e52CX3rqdtbAFJAvNQ
	Ng8Hxuw7BTIAZN+YQMnqdDDNI0jfoy8BiCuI5gzt9hWnI2q50iKD7yBbY7+3bSK0h4y5qEXrwG9
	CrfmSYyXlLlCg+TE6cStX7bvaQ/NQuz18mRAcu3pHUaFVxyV7jeCbQe+KOmC9RDdJHecMRzw3n6
	QCS0wYjhTggYD+haN5WCMF29QurtVGVxckEm6pvK8kyqipmHG7JLfyANyxtjWRPJZ5uv6DXt68m
	KvPOndL6BQCOxBT6pmzGmDafO9Dgw==
X-Received: by 2002:a05:690e:4882:20b0:664:c81c:d1 with SMTP id 956f58d0204a3-66cf222e5a2mr6172071d50.45.1787661382073;
        Tue, 25 Aug 2026 05:36:22 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cf4a2a6b1sm5272755d50.14.2026.08.25.05.36.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:36:21 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-836cb2fa1bcso71250647b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:36:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp3lbX05bY+E07bWCZK5pedqD2m5crCJb7bKwICLIpaa/a7chSHhsxOXFPDJaYhWmnv61ckIwV0w41v/9uNqbpoYQ==@vger.kernel.org
X-Received: by 2002:a05:6102:fa4:b0:778:9033:e337 with SMTP id
 ada2fe7eead31-77bd12c12c9mr7782019137.7.1787661031227; Tue, 25 Aug 2026
 05:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:30:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwbEUjqxWyXFK0WSDh5B_hXj5n5iH4Nk3_EpBVQDbtMA@mail.gmail.com>
X-Gm-Features: AcwNN1VMSQ32o_cnpnsTpSPX7r0kAj3W65LFTE0SdyuxEiBV0BGPSBvqvVU8GfE
Message-ID: <CAMuHMdXwbEUjqxWyXFK0WSDh5B_hXj5n5iH4Nk3_EpBVQDbtMA@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] arm64: dts: renesas: r9a09g077: Use CPG/MSSR
 syscon for WDTDCR access
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
> The WDTDCR registers for wdt0-wdt5 reside in the second register region of
> the CPG/MSSR block. This multi-function block is now exposed via a unified
> syscon regmap interface.
>
> Replace the direct mapping of the individual WDTDCR registers with the
> new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
> node.
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
