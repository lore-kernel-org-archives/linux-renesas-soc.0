Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FA6443E43
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 17:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407769; cv=none; b=g+sq7eumvrKMiYW4I+9QZy/m3tW3ewxfUtWfrIA8cq4+77ns7Gt62FD9ZevPuA7Pozxq+9GJu+z9mQK6DAcLM3eSoJxKUUCBkJ//H+HlT2wbUDuYaqs3V3l+Cp8wHLO4Ec5+zHNZknL42ZZNRtCf8Bfe0HRFz/DCOh+zYjozdts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407769; c=relaxed/simple;
	bh=+izH8riELWSAMprbT5C678K1jl8pB7zXElojauJucHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZxrvxKyRyBfcK4mTMpjlA8YPnBdTGsDAZmAXoV9zbn7MI2B/qw8na+7+QxWMPeC32QEuFIo+MMjXwCE3127Sjqt7MJJ4jyMIITAb/oFxuC5c2g5DCqEE2oyqCGp0pSlkgyjA4VspuRL1WQd1v+sPSxNQGYMUBr0+Yvfgi6yKvcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b79so491483241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 10:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789407766; x=1790012566;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gjfZXacAwr82/eq+UL7cs88Dit/YxtI5ifxFAg8Xa84=;
        b=U9AQQhDXMdlDOw8wQwIEHiPWi0ApPAA+VWus5P7mHaIn32yLxWk+Iu1S2JzSK54A2w
         M6vKqPxD6OjoUgcA30ZWRp02eM3qXVk0IVEwHlw2704LLFb9VCghmIgZZI4Zaa9HE3Ha
         xaSHN8yzWEUsjYzypUcYyTZPj+ET44Rjmi3qBxHoFQF4pBZAkAOSffzLJdCGMXw2bQ+K
         rdC54TYBBZkdJxxiTbj1qwPyEEBYf7w8u2rzFCxXQPXtkM8dwDbNyvj3he+TZouwNIr9
         8tWiFBmrCMPFJIQPPK7LsTN/nMfTFC95T1OjOoJQhWrIkbqy7L2titVNNpFI/UNAWrYn
         YgPA==
X-Forwarded-Encrypted: i=1; AKwUvBx6Qeo37fsw+6lGTB6OPspIKJbI+QUHZrSdybpaWv6hegWZLiMJ4RmGw1dKnPQEeVvR3l/BTGRTjvBbtB51EfwIeA==@vger.kernel.org
X-Gm-Message-State: AFuF++ndwkjYcSm30chhFWXvbHyJvbzd4clLj7/Y/KMAG99FMuiHQZa0
	EIi8i9plUWN65FgyVyo/DutFaK6/rtYcSqDivMGLYPtzACX9buR4xypEHjx/AAAH
X-Gm-Gg: AYBFou3BQsJnhwNkrFlheZNfDvQj0LrHnPtM+J85s5zlIxLTIszPV1bsuPH1X+Bxdet
	8G7or/+x+ERvBBuod5KN1vZN0UYx2LzBt6rxaEQ8PmlWRRmqN3/GgXiDchQhyiuo1dei2TeOl57
	SgoW8Hi1LnzgA95ryTCpOZtBLSCvYY3W/KTdJWUFpa6hdBGNwrI7Z17UzpcbrKK+QoHfUEqWZgT
	cFOwqQFmVFtfYYolmL0LG3oO6Mb9afmd1ZwNDOoQAOLcQ42+cV1twfdH9WCNPp7RJjz90ih7OFk
	SYvsj1XDkmKspAZoyTn4AQAka1OZnMt2W/EMWZ71z/0IBWR3B63/yp1N7RqTjp/DID+N46dkIID
	qfeTsRN3Bbb4qd//jAiD5Wqk/Zx187hbLEvF4FHWgYd607zUym/68ZowNr/9HkSADyVTW28kr0E
	xTZnfewuFMn00UfLRZDJvsXY2Z94DL8HnBPraKx1mS4evi65EhR6inRopEGfX98n9Ps3PROQoEf
	E2pCHZGxdObqOywD4I3uU3vACKm2iVYFYZm
X-Received: by 2002:a05:6102:c91:b0:79b:c51a:e5a with SMTP id ada2fe7eead31-79bc51a11a3mr4038296137.0.1789407766430;
        Mon, 14 Sep 2026 10:42:46 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470f4e30sm12099591e0c.10.2026.09.14.10.42.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 10:42:46 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-785643199baso752460137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 10:42:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBywJRfUqgGIh7HKeJdQw6H+I5vlT+AbRbuR8IKdnwJW8iN/7aMTxH1kG4dmlif788nD1Ms7P997HigF4b9IwDTTmw==@vger.kernel.org
X-Received: by 2002:a05:6102:54a9:b0:789:5f54:2367 with SMTP id
 ada2fe7eead31-79b579b0d38mr4032527137.4.1789407765732; Mon, 14 Sep 2026
 10:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com> <34a6d23e309aab5fbf369132d75794222097396d.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <34a6d23e309aab5fbf369132d75794222097396d.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 19:42:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYC2m3YgayTrCvZHoTVkj4v+7a5cvO1g=UFxR+6dJiJw@mail.gmail.com>
X-Gm-Features: AcwNN1XJ1dIjrp16s-r0VgwKaAicGc_4VU9cyLbRu-FG27nHPGFdbzVolc0-zaM
Message-ID: <CAMuHMdUYC2m3YgayTrCvZHoTVkj4v+7a5cvO1g=UFxR+6dJiJw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 USB2.0 support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 9 Sept 2026 at 10:55, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Enable USB2.0 support on the RZ/G3E EVK board. The USB1B_1A_HOST and
> USB5_4_HOST connectors support host operation only, while USB0_OTG
> supports both host and peripheral operation.
>
> renesas-smarc2.dtsi is shared by all boards based on the RZ SMARC
> Carrier II Board. USB2.0 is not yet supported on the RZ/G3L SMARC
> EVK, so disable the common USB2.0 nodes in its board DTS until proper
> support is added.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -298,6 +298,28 @@ sd1-data {
>                 };
>         };
>
> +       usb20_pins: usb20 {
> +               ovc {
> +                       pinmux = <RZG3E_PORT_PINMUX(0, 0, 12)>; /* USB20_OVRCURN */
> +                       bias-pull-up;
> +               };
> +
> +               vbus {
> +                       pinmux = <RZG3E_PORT_PINMUX(0, 1, 12)>; /* USB20_VBUSEN */
> +               };
> +       };
> +
> +       usb21_pins: usb21 {
> +               ovc {
> +                       pinmux = <RZG3E_PORT_PINMUX(G, 6, 12)>; /* USB21_OVRCURN */
> +                       bias-pull-up;
> +               };
> +
> +               vbus {
> +                       pinmux = <RZG3E_PORT_PINMUX(K, 3, 12)>; /* USB21_VBUSEN */
> +               };

While these two signals are wired to the SLG46108, which generates
USB1_EN_OC# from that, the latter does not seem to be wired on the
carrier board (SMARC_MODULE_CN P67)?

> +       };
> +
>         usb3_pins: usb3 {
>                 pinmux = <RZG3E_PORT_PINMUX(4, 1, 12)>, /* USB30_VBUSEN */
>                          <RZG3E_PORT_PINMUX(4, 0, 12)>; /* USB30_OVRCURN */

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
