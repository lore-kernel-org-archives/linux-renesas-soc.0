Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13155559CAA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 15:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091109; cv=none; b=Hwgw6m4FSPYiRYdyANYnR7r7Dh5MASEqmmjJNS/D3bRxF3H3BLRS8qbSdWAHDooWM48GdTA7rXO9Gvsj1A5uNUmoiUuuFUj5utOVC/XWoOOWOrgoyrp3eF6wz9fX8tXCY22UDHT/baQ0VivJQOfuyyN4g7VWs2wYfEoB+lNjX08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091109; c=relaxed/simple;
	bh=/ukrFcJMdNfUbd95Oysy1/fsP+8xyb8tq0z0ZJZKRFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lod3I1GuyD23cJ88hl7IA5YCHhtQd7VjcVeG+yLukLGUDy8yX7ZC35q7cI6kO6Ag8CCRGe9q2bGIIah/LqKyXHD0aNgZwBO7jLCit8mk233jVg2Y9tjyZMy5jAsTsyoqQ/2fudronHHBNlvNptG8sCO0BWqzsmfryqp9bkkCjAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c963a787c9so1700557e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 08:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091107; x=1790695907;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A0rEYpC8SPWX296ZTPGePNnfJTd5Ihf4si8iFoObZU8=;
        b=Brv9HXd9XUnpA8Ev5EzVpNDKdlJfWWSBWvuV8XAy8Ra6/JnCVqYP8mav3NDl4HS4zi
         7ZNCMx+pPdZalt5Kpjka+7QXwHQXJk9zvfDU7mfyZgmrEnqIZvC8eH4zf2iUZS68MPDE
         dEyY3BoDEQcrrawIAhwTEtfWON9HtKXe6Nv3bQxL8+CPLQaHTqd1+pLezC8qw+3eYcew
         nAl05YPgyjVee7NVAJAaz6nFDC7yjPse2YqZ16Jgf7jUPVb/weJowNJLlNZFRjlXuSHU
         8CAstwJLfcJW/lRpKf+Tdigf8olC+kb7zZsQ/DckTAPsFeWba8/1ta/QpGZ0KSHx3COi
         yolw==
X-Forwarded-Encrypted: i=1; AKwUvBxYebESGfxxFZIlNorMMEKx60Jk9hPbRZWSbvCpaTU8BB5J+goUG7azMQVrSQKZ0m4naCLX8XKFnIiVTtNYsB8BHw==@vger.kernel.org
X-Gm-Message-State: AFuF++kmYRwIvw7FmZtCZ/k+bIPib2J/36DnDi5Je8oA2ZQI6z/jqG6I
	WZF0A4dMYQVZWcL7ViqTZYVmw02QbOngiiP7rEmYj5LtjLszEPEUrUk52c45x7th
X-Gm-Gg: AYBFou3RQ+a7wV0qgRU5y9Q7Jljw73RGEwRH5TCAXM8rb1YkLbtayvMJSb/8pZYt2N8
	m8+H7ir3poRNGMntkg2RGGEzkYMttBJByDkmRgHYRoSS7YkCp0+mC2WBeqI4DlJ90+AVrbXbVIV
	cfm8eTaH9z55a9X5EnO4hMZj5tJT0BlLB3sbPo8bT6MPyOOFqDx1M5INPbfQ0v/PyUZx0qSeb7F
	NWKVGh8NGMItCHWF2XqhTQnb7v3KalAmY/BzM0mGmKVToekR2XfVocdLYpbzkGO1TTrxDFoHvTL
	SeOhFQ8YPPFnH2E/AVI9nny1FZLfOQaAw8MDMIuX/ilj+c65sk3t4gmJJBmdxegwmr8See0yMV8
	k369j5bBp0QVXQJLeTlhQrJCJlru5LF52r5MfEZf2KgnID5tozn/ec/UHPNx996Ov/AC89eiMfZ
	PnBT2ArTdQQnctdpmkLU6i76La61JIiF0w2VRFgkAgFptRSUguCuIOQ6NB6khAdHPNnmg8LktDX
	mTWyMTS0g+yKEO2vXxjj/AE6xvWzrt43UUEdg==
X-Received: by 2002:a05:6122:400c:b0:5c9:a60b:e5cb with SMTP id 71dfb90a1353d-5c9b59f8069mr8695143e0c.14.1790091106857;
        Tue, 22 Sep 2026 08:31:46 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-985169f5783sm65961241.5.2026.09.22.08.31.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:31:46 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b79so1144357241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 08:31:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByIA2MPRjWMVy2iKSznq5IcFAzTBBaTbkb8voqvNb3RehwzySgPEin7K+WewHEGCcaXCWmdsOrClyZ60QLZEqzeYw==@vger.kernel.org
X-Received: by 2002:a05:6122:893:b0:5c9:c60a:e9af with SMTP id
 71dfb90a1353d-5c9c60af4cdmr7442761e0c.21.1790091105880; Tue, 22 Sep 2026
 08:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260921110144.44425-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260921110144.44425-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 17:31:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5srt57ABpHqXjM=hiYv+iAHBPu5LPsKb1u1N5q2ub5A@mail.gmail.com>
X-Gm-Features: AclHuK9iMHOIXZ9MmnycyGypUmOvSRrnhUAGxYcsZMveRI3d88Yc1uUP9CxLaUQ
Message-ID: <CAMuHMdU5srt57ABpHqXjM=hiYv+iAHBPu5LPsKb1u1N5q2ub5A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a09g087: Drop unwired ADC interrupts
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
> Fixes: 4ed27b4fdeb1 ("arm64: dts: renesas: r9a09g087: Add ADCs support")
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
