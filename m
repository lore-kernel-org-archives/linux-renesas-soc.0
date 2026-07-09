Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAD833B97A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 15:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609446; cv=none; b=N1hD1qwTAOd3p+WP1O48QhCdmUI9jNUGZTlGih8/4dgUrh+tvHtTRT5eBm2MLnsDmdU1RIlnl3nAjcjyckMnWbKr6GW1TthEWSvgq2JZ+rFsWa2iyMIbTFLq7s6fgXB2gF2owKWmRMJPPVoxymQ5HxDEzjJrxp1KDnl6X4I6xN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609446; c=relaxed/simple;
	bh=D22bs7Gp//BQpXDOkWsc6nFgskYAhYnSTHhJDh0cIUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNi28WrrOfUKXoJeDcDtBP69jppLEfi23kNGmpGnrOeLz4yTv6Z0Cc+C0EPtZ5ARROer2fAweuZh5kgOTe2A0mqrVoQkjB7dEOZ9ZhmKRGnlIqBZQihFy7+1lOQqa7SrHfQ9S/gPk3hshfST3R2hafeXfEuWbJljGxogWVIsMEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so3427381a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 08:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783609444; x=1784214244;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c0vL8AgSCv4ML2U2UtgOvcetG/7O+3lMpH4bSkibr9Y=;
        b=s5Si/VBlLiLwLtkxS+NLdvjNdOI5NXsRzA3+Cs2j6FvZvMA5MSi+nWgevhSxmc8fi4
         Ktv9/9AktszQUY5hegJigNwd0LSDi0DBsV+i9msOeKgyGSZPqEjD4JJAclSwQkbU7U0Y
         FVsC18OM75hiBlMjtrF6csD0Gcrk36TTgU2rK+NqpA27LPin5og23e1OOHOA22lfZv2u
         g52ei7Dqr7DR6/4pRafnWH2zizADlCDENl51pbRSoT90c7pInzkcqsPRavrDHGe7uGEg
         CHLo9Ip4W5U/CmmTwXBdRvycKBzQQb5PpthoZ7lCnAFY+XS4BpCAnSj0Vgoe7x6F0MJ9
         BksQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHPwDB7QDKJT9pzXnwrb4nHJGesNksMKkyMGJ8S/KAIE0nC+t5DNe13lmCWA2MCHTD5Lnx0ZHqYkAUhrioBZl79w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9nQiMxNHlCYq7yRViOetisEAss4L7tyJoIsrVztQFMXN629E/
	6a/XAvud6Q/KCfAImusA2CJlBHKLt7AvhCSbJ27DyvvmFu7ZsEwTObYLQzUfJFPaR34=
X-Gm-Gg: AfdE7cnicv7klu563s8/uiKoqzNkZ1wGxUSAuOBFl45v3p7bl8qTh9u1GltcZ2/ElSZ
	LBVaRh4X3PSRKl8er3xtCiG1B8+OBXfhAuuMk0CXFtMNGCCIl/JS4JPxy+7UpFLAR8Xl+z20DLn
	GzyeJsRULOaucSrRmZfnJZ0YToIYV0TOTEyFcSZ4p3LGaD7IV0gJW5Bj99qPxP3DcmrBNpWhMUx
	OiznPKQHXG3DMgEV7ikFMi0N6E1E6jOSTq6zBMDLfLnptyoK3fiWymOHGppwCW9YnhyzY5MCUWj
	CwQjoG/wF50zWVtWlMlkbfp51HrT7ZW5pkQGCxkjArm6ORvDpQOx0Nb6ftgbwj5JTKtpjd0JGfL
	K3kqzuznSMHa5R1aJl8udoQLvZ3mTfIGIPbkDbojZQLSryel9/JpsIvihlLukjxT0OVtlVEmdSa
	PtH8ObH9fWy+SnRv8Ea6b20dkmBXzbtvbrXjaJ2SV9yPDh8VLJKA==
X-Received: by 2002:a17:906:3b49:b0:c12:2aa8:dac9 with SMTP id a640c23a62f3a-c15ce0c5da0mr317730866b.32.1783609443575;
        Thu, 09 Jul 2026 08:04:03 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15beb53b86sm372453466b.25.2026.07.09.08.03.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:04:01 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so3427101a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 08:03:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rre3e5tl+tlnhaFflW6tbSasYH7Y8bLELEU2hcuu+gHIGEjRUDEz/nlrumIs6B7SuUvMdSyTA+TTrwcFyJQi8ha3g==@vger.kernel.org
X-Received: by 2002:a05:6402:1cc2:b0:699:728e:48c3 with SMTP id
 4fb4d7f45d1cf-69ab445e9c0mr3209549a12.9.1783609439594; Thu, 09 Jul 2026
 08:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708172849.227915-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260708172849.227915-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260708172849.227915-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 17:03:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUuPH2GjmTos8cHoTJkH6N7sZs5uqPAHfT6PBFxPYZr1w@mail.gmail.com>
X-Gm-Features: AUfX_my2wAkDhVcCsKhAbEjp5BgVr1WX4DivmVuOKMgII3pJ_dksXAqoZy_HUkQ
Message-ID: <CAMuHMdUuPH2GjmTos8cHoTJkH6N7sZs5uqPAHfT6PBFxPYZr1w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g047: Fix PCIe dma-ranges
 memory space code
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 19:29, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/G3E SoC supports up to 8 GiB of memory. Update the PCIe dma-ranges
> property to use the 64-bit prefetchable memory space code.
>
> Fixes: 1ac57c9830cb ("arm64: dts: renesas: r9a09g047: Add PCIe node")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
