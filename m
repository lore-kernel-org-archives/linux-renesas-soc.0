Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B459C22FDE6
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2026 12:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018588; cv=none; b=jZpYlDM/eLEmEQqjNjB6mBl8j0QahTqEX0cIi3QXZE8Na6kkxFglBW4rYiE85xM2LamsVTKJLMaeF/Z94+LkWZB+zNjS23NJuGITHVVQCcvlDpZWQWrDu4etYBdFgfbMMCfYL2f/F4alTqTtKShpdplWZ8SBCe8SeZLgPO/LF/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018588; c=relaxed/simple;
	bh=MfcI2RhcsTr0yzfFod4885W1pqBXaezKzSsvnaGWzuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tKOZrPYtaeCNECNGafmfkpS5ymst3ArRbn1x7xAexf0BhE28VbS3rEsMZC13yaEpjeiTRbe/qccTT3yiDNNoQ/DtvOMmNOX8p55ToIEi/y3VS/wFNsXX0keSW5gZdDkS2OTnx1aRHxxgurgz1K3+jwRzaU/es7K4nNiPMEvJmhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-963f63fe025so536254241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2026 05:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018580; x=1786623380;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U36O9R4trTBcyOnxyg/ehmF6oGcafbI8ItUkmxAwOdM=;
        b=raifRy6T5KwPcgRBeYqY1VSBZV+lH9Et0myZPJMsXS9HohTZwxHkU8613W4OaHjNnU
         UBXHMSIaweFzYfqsW5xFPwi3yaVGJpLwHFGLfNMDMgYOwq8pDJPEZdE+zdr+wswZADxO
         MU2s3sght85AI0JV9TAuP1rGT8ti13b3JlCO/EfgcDlJp5wS3ZMxrtMe63DRKKB50ZoP
         dk1rug2m7jl1VRi34P5qksuzyctAyHtyAp1NckvlqTvEh8CLqt+7UfRoCchXEeUmAXz+
         BZd8ClnfOPJayrPInMNpGDY88bUqXdc4qW9EqfEFE/m2GUNrmooOL1wnUYMD20X5dLZQ
         QPFw==
X-Forwarded-Encrypted: i=1; AHgh+RqILP/6pSVAVe/bsFXHRTUEwb/APBzlekeDa2vdIzv8ySCqMY6/GD5q9qghpTE1Dk+xwn1RAeW+YrHpczjRf/5aKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlQCZneBdjLgIKOEAG1J89iIrqa6gbcjT3kt8fioSOIK3E6kkZ
	qKbtEEiAhWENjkyfzC2bkvUbIr2eiyW/qI8PH3Uk+4S6YhL+vDMQnWQ0gBlrMMch
X-Gm-Gg: AR+sD11FsG6M2VHjox5uk6kt+Mnx4FVbujcW1LRil3t6NePWNec91F55PGKogTjhAR5
	EueCKo47O4y9khzEvJOMcaYBZfvrhNXv4+9dB6TUGOiefSSABTMLqY8ZLvk11f8cnuKVGmti+Nl
	9Xt03+nhE8be7VHMe/igcC8xlJTNbBIqOhW9+EFySsr1QBWgpo0kSL8uAZfEgm7Fq8G606WaDPD
	N5i4yn16EkBd2H4IMosYEjaPmr3YL52/CR3ZS/cI5oQUwldkYvVoBXkbVJhjO2BahQJ5krw8Mcq
	LX2qoqLNmTAYMOYeOCPLve/Cc6KuKO8bR9AxY7vN+7giJ0w+mL1ZbCWEttU/u4DsHm0HPrnQmXu
	Fy5wbqkMTnSaUdVNjyIdqKCiC1G4R+EcakViR7f/KR5xp26gtdYy7CuUNOlyQHVcnFKTOA0J3Nx
	wS4PeBMVGoQBEQcCEk6PugdBXPyMb1VAq0GpoNyQxd6MHYzF1WFHohT5Mra5RaUEKe9H3+bA2ui
	xewjBhMuChwsjpKTIHB5TIYuQ==
X-Received: by 2002:a05:6102:3f87:b0:738:be73:55e0 with SMTP id ada2fe7eead31-760ed283c97mr3179170137.12.1786018579689;
        Thu, 06 Aug 2026 05:16:19 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9782c60f854sm2608173241.0.2026.08.06.05.16.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 05:16:18 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-963f63fe025so536244241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2026 05:16:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqzbElquP7tL0+228vwLj1bmRQmGc4qubXRA/JmPDlBNznzJri48zm3qDLouysEoILUlU3gpRemR1bpae1CQF+3Ow==@vger.kernel.org
X-Received: by 2002:a05:6102:449b:b0:745:7f23:a876 with SMTP id
 ada2fe7eead31-760ea84c5f5mr3661787137.1.1786018577628; Thu, 06 Aug 2026
 05:16:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806111018.782380-1-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260806111018.782380-1-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Aug 2026 14:16:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBxvXQW43P9QGJxYnnoDrwGxJzCv1d7bXiAcP8CCw+_g@mail.gmail.com>
X-Gm-Features: AUfX_mwjDsO_L7mP6JsEcg0THPfhb-ZJpCX_tP9gPgzN2ZLuyGkUnH850M6oOv0
Message-ID: <CAMuHMdXBxvXQW43P9QGJxYnnoDrwGxJzCv1d7bXiAcP8CCw+_g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: i2c: renesas,riic: Drop clock-frequency
 from required
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Chris Brandt <chris.brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Aug 2026 at 13:10, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> clock-frequency is described as optional, with 100 kHz assumed when
> absent, yet it is also listed as required.
>
> The description is correct: i2c-riic calls i2c_parse_fw_timings() with
> use_defaults set, so the core falls back to I2C_MAX_STANDARD_MODE_FREQ
> when the property is absent.
>
> The stale requirement only produces dtbs_check noise on boards relying
> on the default:
>
>   i2c@14400800 (renesas,riic-r9a09g047): 'clock-frequency' is a
>   required property
>
> Drop it.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
