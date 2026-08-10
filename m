Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEC43D6485
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 13:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367820; cv=none; b=mF4BdgbSHnU0ZJnNeyxbSRAXhYVRgegXagDPs8+aN7NsGrVJ0P5P9s3RprAZSSQDlJIxcwMx3LSg8x/teI8Pe54RCOsQz4BVEoAXj8Y46U+eVai7z5T6iyEwkRVo7omea0qde3v6jypcpfZkyOe7pDj1Eyd3eh/rhMNiUkaBZ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367820; c=relaxed/simple;
	bh=wz6Lak0uqypMbYCsIgZpyODVDVOYaTgDgwgpmJYESGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGH0m2pQHI974SxCWzDu2ZT2F6PX59M23TgfPMrs+deX3occKFS1itMSrjMAeXJ9r6t6EcySm3tD+oQO2FEjsfpVr9uFcv7dl2eYqb1l/P2tqc+jNx7szfVHkPFWPs3bNNdZ04i8X/yKrc5GVN9ms7kwr4tSJPvcelSRL3WV81o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97723f98735so1087298241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 06:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367818; x=1786972618;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2eRwfJFYjomfft/a1fhiXfMTFWRcLAVZWGYy0pUOEgY=;
        b=JpacIUYascsgEHQVrECn2BPigE4pejB+B9SzmgeDaLVW3hRRlNaTecBLCScPJ7buRe
         kzgpO65GDyOkU83iGL1rDUib7EyZ2iPZoj11hNEsx5nWPnFqo8JjBBooO6qdxjeHBXrT
         iK5ppFBlwOiAuPz5xmBDU+akR2isBZp2fK0FgDpvN+DIN1JMT4Ix/Jxvuy98H0HnNu6M
         fx/D6AynioV8UiZ800LoLI5kU5LP1HrWQUKwU7bXKVob94rOISjAN/zQzexG66wnCUQ+
         fOXXVY6VnOfPRS/bSRqaOSmaNBHtH0AP8X6T0Gdmsab6WQb0lnPIGj/Ha1fWErwwkZxr
         G6PQ==
X-Gm-Message-State: AOJu0Yx6+XQrLdsRnjsvPq6ARnHW0Re2tzBzS1tDy3/2oHEC9SG0QDIr
	X0yZHzFK1wORkSrAT2QvvNuIY1giQzNzsr04SniRUMusnOzMemFPXrP6XPgHoItE
X-Gm-Gg: AR+sD102Ad6WJrDNB/+4+T84pbyO/tghrbyhiPlcVLFp2uvceHfgxw5if1LxU//LafP
	2AVrqf5UNPULzuL7CtfCcjr3bvbKnIF9SXaTay+d6Kas95vKn/QhfYs14VaVfHDAFMK7hCLT3wD
	fvKfcVgkHhWx5o9hQXnzan95z1VbyvzCxQd9NR/NOY1p/a4bDHDHGY1SDGvI3P6Zl76KEsO9z7Z
	4n57czKkckqHXpFTa5JRq4Jn2j5Pw9BnBAKlsvIsFd9SbHZfmKovK22aezsUd2UV5ArsgtRki+4
	EyqbcAZlV+7pzq9/xqsf8NSIFx86fG2OD8RXqFKobmYwoA8Wk9gH9+i4BaQwAqtjGD/8IH4V63X
	XZYLCAgcV/oeq42YQfHC7itKhW11O9klfQorj8a4oh4r4Wf7EC7N7euM+kRTJWawspvE98jxi/S
	xsIJufalcwcZmS630hRKACHh0IrpK54MzaimpuawhznBW9NnbEPRCe6HpnLLQ4ZqIkyHcWHjAcS
	OvH4z7MhUvREM7OkN+QXKr21lw4kEc=
X-Received: by 2002:a05:6102:801b:b0:744:dd70:a364 with SMTP id ada2fe7eead31-7634d10f5c8mr8910409137.9.1786367817740;
        Mon, 10 Aug 2026 06:16:57 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f303c3a4sm3571024241.10.2026.08.10.06.16.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:16:56 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bfb5e20a90so1390930e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 06:16:56 -0700 (PDT)
X-Received: by 2002:a05:6102:8084:b0:736:e4c0:cddf with SMTP id
 ada2fe7eead31-7634b67beb6mr9095987137.6.1786367816536; Mon, 10 Aug 2026
 06:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716095935.13329-4-wsa+renesas@sang-engineering.com> <20260716095935.13329-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260716095935.13329-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:16:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8N46DbAzm8wh9j8zTpThPJxSHcod+Dkky9bQraNraag@mail.gmail.com>
X-Gm-Features: AUfX_mwPvHF74Oc-Dx3iRS8Mx6QncBSyuafc49W9lfl3q_2m7yCrJpaupe0_GAM
Message-ID: <CAMuHMdU8N46DbAzm8wh9j8zTpThPJxSHcod+Dkky9bQraNraag@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: renesas: r9a06g032-rzn1d400: don't
 enable gpiochips which are always on
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jul 2026 at 11:59, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> gpiochips are always enabled, no need to enable them explicitly.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
