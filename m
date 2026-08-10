Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E0D3E451A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 13:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368459; cv=none; b=gRRfx4/ayEaQr9i4AyatSf8FKPMA+t+jH/q1n6Hwb2iLJwFQvtGVfg6bZEFCSykDQpCseixYwiJZk4U0ChZ9BmqqOkC6m9pIWPk7VVng09W/7ThIVJaJN+j0+4J8ryWdc9/dsone588RfDpz//Gyio5jw8QvKlp2SXIYiPFmhoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368459; c=relaxed/simple;
	bh=Gnbgl5mVqU8mPNjloFHOEKfL1fuKrUPNCeupq4lYc2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RS+u2p+QhA2HAZ74Nnwd48BXOYscgTIeN4VLMAzXQ2cp6Bm4A2KFTMAX6Hco+LO2YOSF0a/BHT3eWDz0A7KC6KG3N9k4pW7+M7QJGPsytORAaXyRWvmNPQKbBAwtrAcxt0LuCY2VYmOC5snBr6aCtVBTUyo57jB7HfXFTDeKXJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-977cf5cae50so286689241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 06:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786368457; x=1786973257;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0ZsTm0/auSNz1xVWhqZv/iaOuFzdnIG6fJxjzkxEKlg=;
        b=LVsnyCQ9WmuxhfPUGb9Ow7wYLofNK1D8kQAPapobW5aA6qrAV6OGxiJpZ8SSFLj9B6
         QCuV8hQVIqrYbFKF34uwag5scq3nR4+T+Kku32MuxPbuTBdfwgKOqzHH2V7KOIQ7qmDo
         oKtBuwmXoEJ/dEa9IPFUKBEueJSi0MO5c6O0KvomJqAgt7dHSnkr5rQwwToQAp7dkCCO
         VOpCJlAQtcy/IgKubeYcY6S/AGxeScFyTd15LS5ZTDaavUu2LQmyJ1ZNaMatqauL3OnW
         NAMqZupa7B1KNkaMOlnh+msm4HSQML3awZOFKF3YqP0f8uiG9J6V4xxA0zg3fZLVeLqY
         87XA==
X-Gm-Message-State: AOJu0YynpBUtqmm2DkvtjCFwIC1sulHrmGcdhrnxguIJMvXCXRm3Q5Df
	UljiF6RsdntsyznoUhZ4LzQqxs0cXyPm3zb6hRM/oMOYJfROtqIdsJE8BpNR0hIN
X-Gm-Gg: AR+sD12mpBbDUuYkaTQ45Mmqk/qEvQRrp1tAGqU4533GeneX+Jf7YrXBWUeIAmw4suv
	rtBtLFginpDSGJfKUp3/rjT76PFQZpVYNVmNZf0eiCZRhXvB6ybazT1LBzfwn/IVXQ/+RjYnblL
	aothzGQVdD7KuwhNqvEIzMstKwI0iDUDGKMLPUdk9qHjBkkUlh6syKrq7iuTI6wEPQQxnmuJ05a
	wHmqbLN8JwvXUxFT2+83nx7kZeWUBuoiNpkPqwYxu/vVvgBgR+hRdEYPZBt7Tjaksv/7zWo91/w
	qkn+u2QkF27Kbi24VG0qmZiE8gY1uY2PqdqjkMTnKQRZW5rWRtbpCTNSSxt9h3q35tW2VuiYYtc
	3N1S2MTLmmxw5EAIDbES1JLaib0R1kZyx9n8U2D/nxqXVt6MMgvPr0RLrIoHY+1TMYGo+wBBX98
	ong/Oa/gwrsKmoQtqS5l7OIvBFbTadI3Yz3fErUJm2gbqTDcDt0VYRNeTBMJN84W1iOLVN9OpxB
	0LAOnP7Pxj4mPl7mgC96H7QgA==
X-Received: by 2002:a05:6102:2acc:b0:738:9c79:7506 with SMTP id ada2fe7eead31-768e6863ea3mr332976137.7.1786368456691;
        Mon, 10 Aug 2026 06:27:36 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76400dfdfe1sm4387712137.7.2026.08.10.06.27.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:27:35 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-966eabad303so300629241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 06:27:35 -0700 (PDT)
X-Received: by 2002:a05:6102:54a9:b0:726:cd42:d023 with SMTP id
 ada2fe7eead31-768e8119d22mr300436137.11.1786368455456; Mon, 10 Aug 2026
 06:27:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716095935.13329-4-wsa+renesas@sang-engineering.com> <20260716095935.13329-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260716095935.13329-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:27:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCWvfFqBAQ40E+czhYHSG_ZuCqMobku6B2iEA8ezF5Cg@mail.gmail.com>
X-Gm-Features: AUfX_mwFov1LfQMLFyyS19GgkrQ9UqEK9GUp4WPrAZqURgAWlGHiGBnolK35VVM
Message-ID: <CAMuHMdWCWvfFqBAQ40E+czhYHSG_ZuCqMobku6B2iEA8ezF5Cg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable
 GPIOs on CN12
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 16 Jul 2026 at 11:59, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> CN12 offers some GPIOs independently of switch settings. Add the nodes.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> @@ -53,6 +53,11 @@ led@1 {
>         };
>  };
>
> +&gpio2b {
> +       pinctrl-0 = <&pins_gpio2b>;
> +       pinctrl-names = "default";
> +};
> +
>  &i2c2 {
>         /* Sensors are different across revisions. All are LM75B compatible */
>         sensor@49 {
> @@ -132,6 +137,17 @@ pins_eth2: pins-eth2 {
>                 bias-disable;
>         };
>
> +       pins_gpio2b: pins-gpio2b {

pins-cn12?

> +               pinmux = <RZN1_PINMUX(164, RZN1_FUNC_GPIO)>,
> +                        <RZN1_PINMUX(165, RZN1_FUNC_GPIO)>,
> +                        <RZN1_PINMUX(166, RZN1_FUNC_GPIO)>,
> +                        <RZN1_PINMUX(167, RZN1_FUNC_GPIO)>,
> +                        <RZN1_PINMUX(168, RZN1_FUNC_GPIO)>,
> +                        <RZN1_PINMUX(169, RZN1_FUNC_GPIO)>;
> +               drive-strength = <6>;
> +               bias-disable;

These pins don't have any external pull-ups, so disabling bias will
make them pick-up random EM noise when left unconnected.

> +       };
> +
>         pins_mdio0: pins-mdio0 {
>                 pinmux = <RZN1_PINMUX(150, RZN1_FUNC_MDIO0_GMAC0)>,
>                          <RZN1_PINMUX(151, RZN1_FUNC_MDIO0_GMAC0)>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
