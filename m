Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6930560AB8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091096; cv=none; b=M/4UkKwVKDt9sJ9mNYI/5OIoMXFYGRNUEVi1yNQYVU7V7A+fod8F0GwfSnWL/f7Sz3t0xS6iiz7aKBUeA1Av7eCzrgKDIpKYiLZluiqA14xemasSokcHdI/CWnn1/S0oC5bb8BUZbaPv5ro7pA2hSu1DmdfVCU90V//iR/MU0P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091096; c=relaxed/simple;
	bh=tAyiwXOmkifke3Bc+NxLOBMDbHXY6l1OlgnArNcsfhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lcE+mRUhXxFsSEpkP8pJxD6filmTNi2KCh5YKrgcjJN4RHrgCF4JIla0pPzBU8rDRQYKKiNVZNyuBOIaWSgyQ9yLqi1/FsWRYPFKypX57vJBUjzVrNR/6brOB9QLI7MuihDpiPvOtNMZfJfskNW0fhZ+fJyjRTMt02QY+ArPdAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91058dd77a2so60636d6.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 08:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091094; x=1790695894;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EibhQgWiuapM4MkmPRwugdMJ27jgZzllZGbWfakUivA=;
        b=zFI7klRPV8WTjObBp9H93OspSAZI0rKayzKZarDvOTS2/gbatldTxTVCXlkbzdnKTh
         N8f/TiSmTHGkx3iMyZCximRiw7Zb+KU3bJebL1ZsygTf4ouxc2CkMNohsDqGFXCObYhP
         GqrkOkUmylI8a5MTfRK0L1nTMC57rziT7nQxmOzSCYoY/x3PDqj3WaM3Q7BL/USh3uqE
         ob23Xi4prr7CkzCI69ldQiYrijb5NNGskUwQ0q6WfkTMJsDkYMpL5Qn3rmoaPvlKwzdo
         KtirbauDBJE/4VGUUM3Azdfys6ivnnHKQ0H+b918OzbWPWQb5RNRJubrr2eXF+jwjXk1
         avsg==
X-Forwarded-Encrypted: i=1; AKwUvBzPE98nDVM97Sex2GcM6hgOsbaCnqiKHSZ3ybwwfOGSdCXJNd/EdIRMw/Ecidjl95buOfHBj8zcbz1tw8wsxlwmtg==@vger.kernel.org
X-Gm-Message-State: AFuF++mZSJuYaVFz5aeGwYFMkYLWqWf9qzRTg9jRPP0QGytFDAlyMFhK
	gZhCl1JIQKc0j1W70sGdv0OdjK/9pcG1SaQCLVwFI4Ajr6VSgh7/drCi
X-Gm-Gg: AYBFou29CwplaL6P73vITOQjbxlhaa7RurYLoovfQbPRLIbwpdvUI1ja7jbLom5SISr
	QA1qNBiSTKv88HCMTNI9Tylevh07prZ0z05XmpnqIBYXglctQrjatId9LU7YKwrJ2nQXbNpwyQW
	sy1Kqzzgc2STttuJ2yVkDJlQIAPNhekgwM345qWoXzkoIlAeHA9E5QPyYveilk0eJzzDcSoOZOA
	5ndwbV93j/uR+gKhLi+IOyLbO0Rb8roYdc8QH7VPzNCndCXp2WlXPBOJIgkb3s8K7dBvnVn1et+
	bhO3yFNygKjfCA0f7LxopWpDKQ5B8rBTqqfuY4GdcNx/McoM0qs6HBsO0Vi+AEtE9qoQ0FKyqdO
	bymdG8rXwlSRZ+pTEkV/wNLCjTD6zbCazIzZsikiROx1fa0xAqYuwY5C2deaO8ZqD4krF45Uexo
	Tvn/mYSa6A3NuiJ43gSwE+NGHGOl+Bp/jlfItkVnwBOTdPy7aE9gD59MxTE+CRo1G0RA==
X-Received: by 2002:a05:6102:91b:b0:7a2:7ccd:280d with SMTP id ada2fe7eead31-7a55a01da29mr7546943137.8.1790091083419;
        Tue, 22 Sep 2026 08:31:23 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf02ef491sm177075137.0.2026.09.22.08.31.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:31:22 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c67e5292fdso1600865e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 08:31:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx3Y5q0e5jOhDR6SU2E+fyQYjdM+CGq2oNINsJwIFIFwm3AHFg0+7P9+Tn7GdOx2TqWSE9Fvb352KfLYtVY9A3dDw==@vger.kernel.org
X-Received: by 2002:a05:6122:e183:b0:573:a779:62cf with SMTP id
 71dfb90a1353d-5c9b592206emr9513571e0c.7.1790091082417; Tue, 22 Sep 2026
 08:31:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260921110144.44425-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260921110144.44425-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 17:31:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW44-25RV5uR2=mn63xMy9e8Q-nB8fteaUveigvBt2Zog@mail.gmail.com>
X-Gm-Features: AclHuK8eE1mJ10XIW9ciQ8bZMT3j6oSiCVVbmbWm-UvOOnb6nS6TVY6Jb0Jgh4g
Message-ID: <CAMuHMdW44-25RV5uR2=mn63xMy9e8Q-nB8fteaUveigvBt2Zog@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g077: Drop unwired ADC interrupts
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 13:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove the compare match and compare mismatch interrupts from the ADC
> device nodes, as these interrupts are not wired to the GIC according to
> the hardware manual Rev.1.30.
>
> Fixes: a82a42963c89 ("arm64: dts: renesas: r9a09g077: Add ADCs support")
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
