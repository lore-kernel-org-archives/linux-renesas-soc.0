Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com [74.125.226.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B87E4E2F2B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611838; cv=none; b=adng9Nu5KKvXxTWyYYMVVta1gmJKLRiQbWfy6cGpGZFaGoUJW5Z70Du8F5CdW1wa1JFRff8dEFH14d6s822OPtK/BZQ9vnHgsKz1t2T4rJbG9kxw9Z3SResABYtEozurMfrKAfeXZ3qYAEaVz1h19IsxcxQw20G29/vozPg7xaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611838; c=relaxed/simple;
	bh=S5jmAjj9EtbV2wtaU3tPzm8z57h4Nf5RYtIBVSwNH7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7hTQ8+MkEpbvivIkU3rL5Gw4V+34kD9quaC/xQrLmaYxi2CEpSc6T5zoJJK3V/4+zfPtIHE+DMuNoGIMBT0hMg4Pep3BzigdQzYoaRxQ0LcfqIpA4nCrYns0va6+VChwkikgxs4cOFp2gthO0GyLu9I46FaFL5ug+VpxpET2MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986dfb672d8so1470128241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 09:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611836; x=1791216636;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Q0b6nlsGqU/6knVqqPIUET6/nAm7GVMX2LsazzutA0=;
        b=hCV8D0pB6FGiYMYHdbDxyBdvJjZm7dMSSEwJdo2XMINYawHpP5cKtcjXtVUlSgw667
         RzpahtqLh5LUSVWDfZUuciBhO0pslTWoyFMSEq+BwhiVj44lrW/8zoL0q5jeye7+kzQX
         Yj+x9WzmssCOXzgY9/CSPfJBIUW9JszzsaWrFCKo49yG7EdKuwPXmvfp7t1OYhZM+SSM
         o70D6zfwir4Ibmc1SptWEcoSSBk124nxV4Z8a2bAkKq7cgI+p7IIRo1CUgD9zrM9DkuJ
         aJdx4rV4y0B9h/3UpFZcwBhTZ00ZbHSHdkapT/QNF+yBBTP3DPRQDNHR+5QD97rqA/qw
         5EWg==
X-Forwarded-Encrypted: i=1; AKwUvBw0rjvIWiEhUO3EXPgkUoeifFBn9GmX55iz4qX8Yj2++Z4mIlFzv4lqbTg4fTjbaWvWxXGKj4Hx9pp+1Jc98Z3Yhw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJb/BdVSIQznRNV36BL1zQ4QbFsz4KCh9cNjo4JPJK2U0WnIUoc
	QOXPMC0+slYPRZsBABEMieEOTJ5toprzQ/oCAqWZ9DT7xY/NVHfcDE+9HZ1Lgbu1SJA=
X-Gm-Gg: AYBFou2VhM6eoD99eNuBQvXUlcUECP7mcviAzEllZoT0cvhRnkhSgwwueViB3WX85dE
	sITO6BnEnNd4MpW/p3RnoogxRtr7bVKP/SOSnAygjOuI+1lAxr8ta17wG+Xr72g6gT/HxAzazKO
	9huh1TlbcU+/Hjbum+abBBf7lWyekYXjGL6UREQrtmOPB2zPMlgRRsxXCvlGL8i/ExgQwgwJ0bI
	blLH+C3dlBWB8BK0k3vnvHFlreCCwpIZOyYZ9U2OwYCNrO16OFo1urxDu+Ar/Fii0aCbqGa1Amp
	e1iuUYUE0zWqFtZrwdyd9FBPOL9xiLmUeQW7MznwzzQjhzb1A9+tRXSIVZpNhnsz3dkAIxcFgC7
	lAMj2h7BkvAGMuLJUcUPoKLrkN7D6r7JnBdqP5pH3xMTGldhVlmdqps2rn6SVep7Mjqsgzaaexo
	APJSBDbwvdHO/SwNO8FGUOmrXSuvh3FaLhCu1xHPxVKToVX3PBkvN0VE0P1KtcCD1SUpMt++zz4
	B8ZlmHRn+yAm23d35muEyoVCzOQmlRm5Lq6
X-Received: by 2002:a05:6102:1613:b0:7b5:6bb2:53a3 with SMTP id ada2fe7eead31-7b56bc1b988mr1255978137.10.1790611835888;
        Mon, 28 Sep 2026 09:10:35 -0700 (PDT)
Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com. [74.125.227.39])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b159055sm9721261137.3.2026.09.28.09.10.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:10:34 -0700 (PDT)
Received: by mail-vs2-f39.google.com with SMTP id ada2fe7eead31-7b240d1d786so1618577137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 09:10:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy59DuCaapa84NVxzg8tysfY5rzZK9Xpv+3aeQeOBUNtAWIRn3ucuoNvfrUlatQNjzaalKp/cSCXQLcvNwQkoVb0A==@vger.kernel.org
X-Received: by 2002:a05:6102:3f46:b0:7a7:19aa:8a89 with SMTP id
 ada2fe7eead31-7af1f2fdbe0mr4785652137.36.1790611833554; Mon, 28 Sep 2026
 09:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com> <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 18:10:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEC9YoZySP3+-UMP0s9XHg4OOsS1Lh65ew2zka=5RC+Q@mail.gmail.com>
X-Gm-Features: AclHuK-UMUf9NZIHGIv0UWf0z0Dz2lXiorAQQxBHpxwCZfCPbVVPhasZYdlvx6s
Message-ID: <CAMuHMdUEC9YoZySP3+-UMP0s9XHg4OOsS1Lh65ew2zka=5RC+Q@mail.gmail.com>
Subject: Re: [PATCH v9 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 16:40, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2L
> SoM [1].
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 1Gbps RJ45 Ethernet
> - micro-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> While the variant being supported here is named "Ripple", shared include
> files are still named according to the full board for consistency with
> schematics, silk screen labels and other SoMs on same board.
>
> Description for microSD is shared with HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "r9a07g044l2.dtsi"
> +#include "rzg2l-sr-som.dtsi"
> +#include "rzg2l-hummingboard-ripple.dtsi"
> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"

This new include is not needed, as rzg2l-hummingboard-ripple.dtsi
already includes it:


> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +#include "rzg2l-hummingboard-pulse-common.dtsi"
> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"

Same for patch [09/11].

Patch [10/11] is fine, as that one does not share
rzg2l-hummingboard-ripple.dtsi.

As the rest LGTM, I can fix that while applying, so no need to send
a v10.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
