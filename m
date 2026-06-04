Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0191175A64
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579105; cv=none; b=YtK1yDebFpOWs74Qc9io2ynDsgfOjdeAzHIgv/eEl/daLrVCIv1v2ophDAldUVMft2xIqEfeRK8qLADX6ZN14/e9h2AtR6dBQQmscRPEZrgttd7QlyELjZ869n/xjNoQpKpJ7os4UkRdp4ghZvYxFT5I6Yk3r4Nkj/AsxMy+rPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579105; c=relaxed/simple;
	bh=bYwokgzjJMEgskZ4MF14lZVcdA6LPWC4F2K8tkcWBKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRD9J62Xo4o7c9s1bGQUm3wfEf3Ml4Ig5qgSUTeW+7DwLHJjInVUVS/f2DgxAHzd62RZ4eUYgXplToINpDuIQaKEiLYje9iZm1bvgGtg/wGoihREdtSsqqfEjoGYF9YcxpHiwU8LzAWlY8/7aZAoeht7bs6K3F3x8Y3G4NWEnaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5a082548de2so170154e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 06:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780579103; x=1781183903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZ3z50sIILn0aoc9gJVhIXVKE06Pnx0BbiI15tZf6Ug=;
        b=RbHvpgpAXqopBSedf7ri/O5zG3/FrCZzudleXsCjMKi6engXgHb6BB+zBOmBo9G6sP
         f4d5nX/mlGQ01VQ4+lsmDmOOEcGo5LAIMumrQyB4W/V0VcPmSvpLO9ZyOwN3EwZ3aiJk
         1dfDdq5iO3hhOYXhRKlwVsosit77IgTLFEvH4xYB83QghBSk3dzUcroslwh7sHgDIZQ4
         LWmpkYfTtXkIvTW+gwRKvvZYDhL2yKNzWoNA7dE82TEskAolWKE1uBx7hfo3Q5WpZ4E3
         sIzO975UiJj76n2b32IaF8+y9X6K4zfMiV+x2545tmaQN0rdgIsckvqA0pAdnwv5A4GS
         FYYw==
X-Forwarded-Encrypted: i=1; AFNElJ/nbeKKOVpszNR0FswoN3KdMjGbhzagE+Rn+RxiaFKVh9wOZYX699E1dk2yuWKBz8feQIq2N6nWbxHhRxqtY0PFgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4KirQJsb4kQvpryIwTKQ6E0OLrCyfSk8D1yauZ5Jk/0uHpxQq
	7a3uCDR2hQxFd4rvCWlbyWctIQE4840eDyCt4PVVnRtRfC28gcZ1pyI4cHpE1gjxyXU=
X-Gm-Gg: Acq92OFfjNFZmcvgsXF0vDJPTKP4MjV2zC64NSBz814i2T59xBjbBowbRooEAxB2BqY
	hODQE//z76Df3OoHLkMMBd2SUHnLAijW6S42HcYbwiUIbrSAUlqbW3ig6zoQi+gy4eUUKfZ5j0x
	AFIZSbWiKfZvDgAUSQELts9TQjcN3KZgD1fW9yJT8jcmoo9alnMInNPeswXS6VuidaDh+0SU8ah
	Ws32BzQwREhEDQH/JW6wX9LQfHo2Fi7I6eA4zqr3tX+H+oXl6MYGd5/JNG65msGWm18bIt/FTNf
	M75ubWoH4Xo5GOiDrdw9bq6ijS9xUfh0Gro7OLHnP2RHnthpQ8zA0jZ0fFlQ0V30PRVjHI1RfUN
	ygb2M6PG1cUNaWDl2J/S4bFvQ2TBVMJFnaqGZ/1Y/j7T/MgK1wFbRf/gu7BFSf7uX608dzGMzyn
	jh7n3+Nhu4K699Z6O3V//8guEl0bVOx7H9Pr+l4d5ivP1gpdoAkmlmVGaJtYf4QaM0pgOWdWxeh
	wg=
X-Received: by 2002:a05:6122:608a:b0:575:29ef:7e13 with SMTP id 71dfb90a1353d-5a6e4470317mr4278669e0c.3.1780579102914;
        Thu, 04 Jun 2026 06:18:22 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9641414e193sm4383136241.11.2026.06.04.06.18.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:18:22 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59c1bacf871so216462e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 06:18:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Zl11nRhPCHkR6ehC8LUsRY8nSUXhqLe1XzCgxxGhaDELI6F4nx0rx3M+IiXBl0WqiYef1KuASZoBaSNZzjD2Zkw==@vger.kernel.org
X-Received: by 2002:a05:6123:147:b0:575:3b9e:db3e with SMTP id
 71dfb90a1353d-5a6e446fe58mr4336399e0c.1.1780579101614; Thu, 04 Jun 2026
 06:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260528134752.79813-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260528134752.79813-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 15:18:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0YT4=2x20GOkCtETj8abCfjoj4S8VNCTfEuVue=A1Yg@mail.gmail.com>
X-Gm-Features: AVVi8CcsBMYTe1oqLUPm-cmxBRqWCx-zfvbyGziog2OzBpBmPSOTKupPMWje6n8
Message-ID: <CAMuHMdV0YT4=2x20GOkCtETj8abCfjoj4S8VNCTfEuVue=A1Yg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: rzt2h-n2h-evk: Remove unused
 MII/GMII pins
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 May 2026 at 15:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove the unused TXER, RXER, CRS, and COL pinmux configurations from the
> gmac1 (ETH3) and gmac2 (ETH2) pin groups.
>
> The Ethernet interfaces on both the RZ/T2H and RZ/N2H EVK boards operate
> in RGMII mode, which does not utilize these extra MII/GMII sideband signal
> pins. Update the board switch configuration comments to accurately reflect
> the pin ranges that are actually in use.
>
> Fixes: b272b94fd2239 ("arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support")
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
