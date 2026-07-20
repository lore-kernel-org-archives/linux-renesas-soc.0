Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FCD3E2764
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544649; cv=pass; b=I0Pe7Kvh5wefsvcPgBGzFMa87mGc0PRmbCUkWrsHuAsOotTmNXTEWcdn7/qDRZ8DCUSqtMupJmyyg/F9WP94WLUpwZMvltczcV6klBNEv+ncaPrSQ5r4Hu/a5Ww85pOB4qDg02p7bYmKSwZEQRVbA64LzH+7hWAWijRg8cA39fQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544649; c=relaxed/simple;
	bh=6LIKfbDAVneuMSs7+f/o47O+7eA2LK8R+Sj5PDUGEII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W5OGOVgEXFwJ9Mt27QgWfY2FnyhIfeJcrxlZEaLZ6w1PWaRJCjTUdGwBaXxzCARYbbBEJ4UGhCDVe4HCVmP/WCK6x2zA0fktgEPgctaCk/JNLvBNbwqhO0DAUsGMmgi29yPHyRTyrri0Crs64eC5b5As3LEISUq5ea5594OAxcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNB2gY/w; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNB2gY/w"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4758bd3731bso2942758f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 03:50:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784544637; cv=none;
        d=google.com; s=arc-20260327;
        b=eXBzbNWX4fZlIHOqqOBXLsRJe5cEbWOUeCQd+vf7upEpHTo/juRwwRayjiZJivWpoM
         52FlEEL7io0LqGvpN1+8eElFcIsyKZo7oxnc+/xZW7YfrSjgeviE1SDsN0YvW9wWvz14
         apgLn6rPFBqkTYpZUzalkc+8UmZ9Z38Gjxvy5Du8hsiXdzNT/9FEBWKS9o1qXPLr+4YA
         bYvaXsnS0YD+zUhFTd08MSv+sdzIBhXQSkwwjQ3HCHZU3c5Ok1fHhnU2apu/8X9wnmnr
         itAMXB7CGxT1kdScF3FoVLNlxBuUyYq4JpisvKs95iEunNxO3glapezhH525folWlX6V
         hokw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6LIKfbDAVneuMSs7+f/o47O+7eA2LK8R+Sj5PDUGEII=;
        fh=fEvdeHa8X1fX4dBsOFBy6hG9Udud24M++j2PRr18byM=;
        b=hngNlPFqdvgCle7iQFuwJZ9qRU/AKNiLaevf0kcJlBOEmwALcQxetdZKkHFrLnUKOH
         MZeLCnsmVDtPh0+nuqkaiik9pywdUUX4e6CSViMX4vwOKrbwsAyq16XrQZaUxzUzIxkf
         7KmhXZFE+Cl2EhiX+NuZGiAldQAW96srHTwnLyrcIXQt9pINO6H8hQGlhRmmim91qh9k
         3RgjanJdzgPfo41CDT8bK4S15xNy3F79UgMfg99MzT0xE/I3h+UxhvHYwTtSGZ9188f6
         vxWXnbY3VAWcC9ZT6mAgIIosO8PhuELb/eQkXuicfBFJSQBO6BBpPvxMXKxeorX8bRmF
         mkYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784544637; x=1785149437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LIKfbDAVneuMSs7+f/o47O+7eA2LK8R+Sj5PDUGEII=;
        b=cNB2gY/wccKpu/LF7vqqY6A3quWLN/f6zMGwZEqMlcMHEoXIwiYgHXpHpRta7bFryS
         cDxLrDX1BvAEI1WtAn1sO+YOfhvRN6lBEPQVmCWaXEMVpbR3U2dxJwhzeNTQMh3j9a6A
         yDmNTX7OYcDikeBt5RdQwnC127eYSfjoH+OZnhsX24MaNH8g46fAuFrsVJzwKQEUs7sW
         S1mnWy33WxjcoPafzgNqR+PKzmy+aLdFfusY2RpM84EpWG3XBM9EAXFlUaKU7w1Qok9U
         ZPftWxlfk+amtTZv37KYookH730ft9Qotzsc2rcPkVhFpde8LXtyQH13Vs0vBA9ItPjb
         i48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544637; x=1785149437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LIKfbDAVneuMSs7+f/o47O+7eA2LK8R+Sj5PDUGEII=;
        b=PYw83L+0oDMNDPBQ6QpwZ+FK/4kvByrla691vJUgShOcNmKouxch9g+3hhkZ2Dw39S
         dxNSiaO3pPriKGKndvO7yNditzk6iLId4KB01i6iTUuITttJo5NKmjJ7azCBw5CJKNJC
         dnztdNXBnUwShEfNoUaSW2EatFyQQBOHihq5N2BJzbKBWu7kRkhpzjYtbjO7OYD5KkQ4
         AOh5OzdK0K+BTgXDposXgxVEW47dNhOqoelPxrPzsvpV9ktre2QgNWeh+CPrQnFrMl2g
         nbCZh6IxVggL8HI6XYbI+/Hosi+Ty52dyvqXk4Vyrf16QnCcFkcaSq56ogKGmc3AiNpL
         g0vQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpxo9z2b+yFcPOt5wndtykaC96e+zI7qsx/W3rCAEBzbub8rghUWEWayQfhXMOq74LNT0E6H/V5GI1XQlpAORYjVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzq3Js+lmk5S4GS5w7qMtpkSzoMSf8PJTrhlglxjz8e2WsU/CP
	nKrM04/yeXYbsDQk13QTMC1ByzZEAL6qChqKtmajegm3nlVaSHt1NWEMBCu6gyrjgY62y0ZqIEo
	CMCqYjSgOwXBbg/JLt4e6E1SdJV8C2Rk=
X-Gm-Gg: AR+sD12YVHGEuGW9ShPsR59uafUAB/NmAWYbOTtgHlQm9ii11+uOuK+pBcqf9u1Q92K
	72sttJ16VLXibQ5jQ++BKqiauujKMIDNQrSmYo5bWx2nd8cpLFWbyuZOmCnXQV29oQY9un2ArKG
	Cl80oH8S8boSHdl8fNSxczCQLsWKtO4C5mk5TqQBjSYAko7zNAqZb1wrJ6AkTql7GyGxlN94QU3
	0qfKDnv6Hkw4t8QNKqM+qk5iT0Utwrbxz8z5UkAb/zfkRd54pLiCMYBOkZHUeTt92p1AB8lKCVI
	1X+2km/9IkfTKlCBbgXUzuZEs7Q5o2iNYOBuplMS9Q+DqYI=
X-Received: by 2002:a05:6000:26c6:b0:47f:71a0:c060 with SMTP id
 ffacd0b85a97d-47f71a0c528mr6994984f8f.2.1784544636880; Mon, 20 Jul 2026
 03:50:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260716123434.2576253-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260720-fractal-prodigious-spoonbill-86f534@quoll>
In-Reply-To: <20260720-fractal-prodigious-spoonbill-86f534@quoll>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 20 Jul 2026 11:50:10 +0100
X-Gm-Features: AUfX_mzmB1NqSZ6NtXzORayD9TuW5BGNtCQcsQ-KypuekoZwKlJVJ80qQGr5ZIo
Message-ID: <CA+V-a8tfCL58j2TvoO1VhhDAZf=8LB89R4O0SycLghYGf7Rr4w@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: renesas: Split out RZ/T2H CPG binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, Jul 20, 2026 at 6:55=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Jul 16, 2026 at 01:34:27PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move the RZ/T2H and RZ/N2H clock controller bindings from the generic
> > renesas,cpg-mssr.yaml schema into a dedicated binding.
> >
> > Unlike the traditional Renesas CPG/MSSR block, the RZ/T2H and RZ/N2H
> > system controller integrates additional functionality beyond clock and
> > module-stop control, including reset control, clock monitor support,
> > write-protection registers and other system management features.
>
> Nothing of above differences got reflected in the code, so I do not
> understand this reasoning. Binding is exactly the same as the old one.
>
A syscon regmap is implemented [0] as part of the RZ/T2H CPG driver.
Since the RZ/T2H clock driver uses this syscon wrapper, a function
pointer is implemented to handle the RZ/T2H-specific configuration.

Also, as the initial implementation used separate device tree nodes,
Geert suggested splitting this binding schema off into a dedicated
file [1].

[0] https://lore.kernel.org/all/20260716123434.2576253-3-prabhakar.mahadev-=
lad.rj@bp.renesas.com/
[1] https://lore.kernel.org/all/CAMuHMdU62updtKeBBk-vO3YP+qaWTGqHQnzKvFJbrz=
4J5eEPMQ@mail.gmail.com/
Cheers, Prabhakar

Cheers,
Prabhakar
