Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2843E7145
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Oct 2026 22:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791238476; cv=none; b=BtpjOzLpbcQc/nQTUHyQrBLdLkaItkP7t4fjU5IZsvAAYzDEWlMFj4B5toZf5J7tmYnbofX28Ltu7c8hd8GooJUPtR1DAlmPNeCIOz4b8YvIfLCiKzWklxcble8KBq5Q0gcpukrBQmokAcTe9wlcHoW+Hg93lQf66MSeulHV3Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791238476; c=relaxed/simple;
	bh=3kh/y7b7kjRrc0W1s/odQvJJEQlic9f37fMtluWrsX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fDZSW+JZxjbXWd9NqrqlOb/34h3TSGMPxrDob0Azz7pX9lI0YMXrzxgUMP9iZ2BSNHpfbFalZHB/u/mr2pidpBU9YY7a+VGPSLT1bYgJjJC2apKOTCAKOPXeq82uJHrzs5uW5LYG3zJh8G+Dbck/4B5dD0lwW+gwi4ITdg2MTEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S76oCP9k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S76oCP9k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3ABB1F00893
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Oct 2026 22:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791238474;
	bh=3kh/y7b7kjRrc0W1s/odQvJJEQlic9f37fMtluWrsX0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S76oCP9k/Z+wDzH2ZVHngef1X0bYVP4t8e0GY3jfGnd7JkPOt0KV84KIS8GX+VcCg
	 HcdCQFo6MF9oCiq9KejmOX0BDJdLgpXYUxaDyYZLbzCgSfSRMOdrEA8Q7phaaR6HkV
	 4GALKEf/H6vuqORhPPQe90n6iFlva2M0xvNYvw1HIjDi0zfQag6RU4DGvLEbz1OoBF
	 Op3hBk/AfMjbyFhUyMnnTWkh4eUfltlHVjTlltT44m+4sxgytKZdicFuB2a+wdXiN8
	 EwZDhq6sKNuSLHNAxf37jhsKsgUxI3zERwTJs0DjCk5rQZz/ksYzfR4wGgYgTzb5F9
	 BL3Mk96crPX6w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso739547e87.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Oct 2026 15:14:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0njgV9ucQat09HIXzZvve5UU0d0M7A9ugxflxfPXd4yW8YK9TG12q0k+3P/V/LXgbuhCxPyeTUQQFvO/PIeUbXw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLi/lSjIzVBLvie84fn5wxOTgXten1kN1df6lmeqfAVm2Z4ElKU
	17oYFtvyiq0mNscVGCL0AytUB20VD2iNc7NtSSVeIvXzVBN+M2D0b5mJu3DhzZSoKa0H+li7qpn
	iGViWONjPxXBcFoeGC5WMVSFd2fRjsvY=
X-Received: by 2002:a05:6512:31c6:b0:5ba:3782:d524 with SMTP id
 2adb3069b0e04-5bcb54376b3mr3263153e87.23.1791238473706; Mon, 05 Oct 2026
 15:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 6 Oct 2026 00:14:21 +0200
X-Gmail-Original-Message-ID: <CAD++jL=tRpv_uX8daZqK5+h_dTiUxQBYyNM2-Lb8L6n4azyfHw@mail.gmail.com>
X-Gm-Features: AclHuK86agYs2DVJkwb4V_l0VVjlnzhx3tLxdnlBI5x5AiiGFxy5kqV8Sor3B-w
Message-ID: <CAD++jL=tRpv_uX8daZqK5+h_dTiUxQBYyNM2-Lb8L6n4azyfHw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H EVK
To: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert/Magnus,

On Mon, Sep 28, 2026 at 2:21=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:

> Describe the optional ISP DMA line-tick and IVC frame-start/frame-stop
> interrupts. Add the RZ/V2H(P) IVC and Arm Mali-C55 ISP nodes, connect the=
ir
> video endpoints, and enable both blocks on the RZ/V2H EVK.
>
> After these patches, and enabling the right Linux drivers, we get
> this in the console:
> mali-c55 16080000.isp: Detected Mali-C55 ISP 9000043.31032022.0
>
> This was done in order to enable booting mainline with mainline
> device trees.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Rob ACKed the final DT bindings on this v3 patch series so maybe you
can apply it?

Yours,
Linus Walleij
