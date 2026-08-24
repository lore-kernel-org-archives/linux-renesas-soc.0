Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7A54399E5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 14:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581976; cv=none; b=CkjKrynoxnc4ABlKzc4zovKYB6h05yZd/Z2FUeqLQrR5GPHGyCs9kwCUlKbGo++XC3jrzzoVIJG2bgPMg7mb7ZER7or/0OIgdbCC6RI4Sg5hPRbM0zQB3vpTgR11v6wRbOFQ8ZgZ83VaOZfBb2tlcmbHVSVxREx7NxqzKcOiGSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581976; c=relaxed/simple;
	bh=V2oxkcG1MhidPAYJ3ueQIK6gKYyi9t1JdqcvUuOn7q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJoiPF6xVNrpdbnukYmTuExzSd84VfZWMrJjRe2yCRhj8zrUg2n7JxEdzIwlJfwLpFVS8XKqfzl8hI6E9B7G1YCZMDsh15ZIvoXKyJRBaUfyW8uLF1g7tUUIuwGEGM8y3B5LFH5S31RYhlFOkEpyqsMxmOu3dogYSaCS8cu1Uyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c214e625259so514783966b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 07:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581973; x=1788186773;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u5jqhhZCvBwkj4iNziFMz/+JSHAuGMQopfaaYzj1YvA=;
        b=UQURcnbNtPD427XpMBvve2g1bU19phM/Ba1c1KkIcZR9rSkxGzlyaDLSckVG6y4RJv
         BU7NyK0ESWzt5Dc7mYcURlKIMyK52luP+7h6KcSHSfiyiPsw50b2MajMdk9TMHQDJjMu
         IYKiMZ2BmU+5x7rfTTj1nv69aDeLMbhykYUY6DdJgNv3HLjVtOd2kL5FDbJ0Hr+GeURs
         5aPSowQZL/SchnntAr16YAM0TG95vIsNeX8HL0AqYdSlHlJDzmoXCgbpUA9JHNjW3CLU
         CBY1K+U6GaUR8oMoJ5kkBFx4IWhhQFKRUyONHtJ9zyJn7GeogSzODvrfZXIuO7qDnEeI
         m62A==
X-Forwarded-Encrypted: i=1; AHgh+Rp3otLMb51R87H7rWXoQv6zGeWs6qzxUaNeYV+9+sHHMfG6jImi1tUBiflGTwG3odaB+O6fEJuiHukJK2GUOF6I6g==@vger.kernel.org
X-Gm-Message-State: AFuF++mr9WsuTVtMz/ibSAt8rGvVyifeyRZiAt3fkBfg9Z+thsoe40az
	y9z3n6MJ4unCWybz9AvGqpzHkl3ClkDYAw/ulQXw8hfOkVNOM6N9GqrztUzE0d38Kqs=
X-Gm-Gg: AR+sD10/1ztMySZgGbMWrZ5tkRC2qXJ0jWqfV7p/fEchiFaS3l28HLSycjDgZH61kzy
	5rc7N4GVmvXwDE/FsKMeQamyE+WYi/3do5ZVgbXO+0gzmqJGjlypZvg+3JsTwbzorK7EO31JMGQ
	ahj6eyF8l8dHQIQQCf7B7mJDJu5e3k7PlnyjqY4te075SANpwFx2P1MJ3C2yQTYVV8njhDqGPxu
	nOGuxrkmcD3PDGyUHPdyOTF+SVEeH5WoxrlTn/Rn2t6ntloQlRko2rjblYnD9o29ce5Hzcwd8yg
	mjJtdXSYqRTTZEOMZBi/JFQhhj1HjX9to2y+1LjFBpmyeT+iNwCgKQhDQl0wWURTF3GyzETZD32
	RLiJFEL3dVqMhZXnBgT33wu799dxa3xK4ETyqSiHpywWoRPP0iwgpKsr1Lg37RthlyH8ro+h+sX
	vrtRnGdkrlWsNhwT0VWOHfwOey6U4JF38Vo1x1CCmiPkpehLrQDZaXL2rZwA9Xms4X8A8FyodKS
	nlCcw7jVjTvTNYAUKtWmiOAnw==
X-Received: by 2002:a17:907:3e9b:b0:c21:9870:c4f7 with SMTP id a640c23a62f3a-c246a6799e3mr3166574966b.20.1787581972979;
        Mon, 24 Aug 2026 07:32:52 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24962bbea6sm1206495566b.27.2026.08.24.07.32.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:32:52 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a3fda88184so5526180a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 07:32:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpq7ZyHX5TxBR7DkmF7RZ8+//Snj29sXIPKE3HAOEr5c2JGmkXOEmcc8TgaIrsUkEifIceWmyi1vQIhljGItjnp5g==@vger.kernel.org
X-Received: by 2002:a05:6402:2b90:b0:6a3:8586:9b73 with SMTP id
 4fb4d7f45d1cf-6a42f111a58mr29148166a12.6.1787581971956; Mon, 24 Aug 2026
 07:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819183829.3953529-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260819183829.3953529-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260819183829.3953529-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 16:32:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcsP6yy99S-kZWADmy30STEbWoDn1W4xsgxbwmKVbWdw@mail.gmail.com>
X-Gm-Features: AcwNN1WtsJF-mPHpyKXJvzUBbPpUfkdecnDz0u0gaOiDM2z9dpA6Q3CaLi1p9ag
Message-ID: <CAMuHMdWcsP6yy99S-kZWADmy30STEbWoDn1W4xsgxbwmKVbWdw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: rzt2h-n2h-evk: Use consistent
 switch notation
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Aug 2026 at 20:38, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The switch comments in the board DT files use inconsistent notation, with
> some references written as "SWx-y" and others as "SWx[y]" (and "DSWx-y"/
> DSWx[y] for the DIP switches on the RZ/N2H EVK).
>
> Standardise on the "SWx[y]" / "DSWx[y]" form throughout both files so
> switch references use a consistent notation.
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
