Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7DB49891E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 17:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406958; cv=none; b=oOBT3lt7daITi+jUNlNe9bJpgPcVuej6eONrvXSDXOmPYm9omJQ7w+MIQzNrXWtWxvqhkPMmkndtGvYpmY9/8qNqr9NwU1WPwRq+a6W40bDW0guuXGWhxCBGiujUJlDwB0LMv/f18027zptB9ZNiSyRL3Q0jFkfTe25dg6FuEsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406958; c=relaxed/simple;
	bh=L1VXsdM/kax6rRlPlpjSuL9HfeLJx9UTWUqPhEH9lWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZbOZh+Nqd2STcrLaXhsPk/0bkdI7/MnxPzY4kKj4RJaCXVFKMcSpvfxTyKzJVVyjl6EtoW/7gLsXDxUh5LXA0S8MLh+hrHyOpFz1y2MIkGt6NzIXIsdQlDWEV0iL9B7+eGaeZyvPZ8MpBMUhTos9Ui8+tJamWBvZ66blT8oFsfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e2ff27eso1846814e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 10:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789406954; x=1790011754;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FY+CeR3ViFOh1Uwf42KLiS0O9XW6l4dUqQ0DH9Ddl7I=;
        b=J0T54EmyO+XruNd/7I+JhXkU4fweH9NNziKU8Zaw9TAwnugrRNbdnnRnnKCchNOoiN
         AQ2CLCsrXR7vtPXrx0cytqM4xrfaJguRlgPDnZxf+OZWMNIlPSV+208PF0P6qMkAzPGd
         BacCWtQLUwYMrojigNkbe91/v/2Q0gCRFGlFF++TAOu0pZHL27l/spV231q2UMNibLt5
         dSw9KM8AlyfGqKG/uIgpn8waRwFsMw8D4uGQEvNCds8sSPBLVTuEZyXn9NGDun8YRGZz
         xObBRRE9OFFjJbWq06Ai40TQciR9jk4iFnZeE7IBx5liyk5ytfgIeP8Ic/wzINe92oMw
         TRPg==
X-Forwarded-Encrypted: i=1; AKwUvBzjFYikcqjQgjffJ8aub88wr9lFrlqqA1BaO6M/cHEPd6oq+7WL3Lk0z+5uWQjmOjRafZCUDqnwg/PGb4OinZZ3vQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l6ogg0asb8H6p/F2Uryk9kkslsXoQ0wPCjsM24n7r5c6UUNR1p
	bLQUpXI+l+5QMg9SeWRlTK7AgGlTd3iBCSNJ6fUWcACtNrWMetLe+vBXTF0SIFoF
X-Gm-Gg: AYBFou1TZZLnmoDmPGRtV19ckjhsMigx0M3yloe2EhfGwLDE43WfEExfs02Eqma0x9+
	+n6TjDL4sclpNVt9eECzvqrPDuyoonlJT9TbLOHUZcoeCEkTNdv2Xc1vvdOD3SUipPEZ3dpj0sL
	w+fz4tQIYdkTvoj0obg5/gbYCtoJ65EN12KzcJj4MnlF8ZqC5PVFXnm/99neaqInPZxoaX6dYYU
	gd3zCTupfL6M/6N8kcaCjSO/Hp57sNBv7f8C/m03rKxDd0xCYNf8U29W3LZ44EIh6sgK2/fE0r8
	I2ACPRpjHrmtziGDGk+4uLHgw0JAkX+aAjt1EfVed9hY7SoV+zfXRUNAlBuVQowBhVtoeCBvqSC
	zgaeQEWFBp9atxR8Fg/LzfP2A9XomBfhQpayy7s9WC9aOqipA1GKZeYckMCVd84QbV7lZrI7015
	bQiBUIDx0PqO5ZDCJETRqYlj2uaRda+01Qj6/upQXZxOk0wLZ4KbAcYJZPBEekeKb98jww30pSx
	NQODODpMW8bo/1Y5Z7rwOBvDmqohOJlc8EwsA==
X-Received: by 2002:a05:6122:6992:b0:5c8:2c83:9cb with SMTP id 71dfb90a1353d-5c981abc29cmr5329021e0c.2.1789406954407;
        Mon, 14 Sep 2026 10:29:14 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c847122e2dsm13039510e0c.14.2026.09.14.10.29.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 10:29:14 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e2ff27eso1846804e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 10:29:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByymR6yDZldhjthUdJO5cgK78ntfZv95zWYhG01bjwE/+BTnB+Gi9LFRsowH0esmaRjPGzaZ21hwQdTgMvpEwUt3g==@vger.kernel.org
X-Received: by 2002:a05:6122:6992:b0:5c8:2c83:9cb with SMTP id
 71dfb90a1353d-5c981abc29cmr5328408e0c.2.1789406948981; Mon, 14 Sep 2026
 10:29:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com> <0e2d1c3bfad30090784ca52a20f21b001b662527.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <0e2d1c3bfad30090784ca52a20f21b001b662527.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 19:28:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJ63Bdwx=+6M-4HhsJuY2sqodh5cpxSMZfWpoUAnEhHQ@mail.gmail.com>
X-Gm-Features: AcwNN1Xc60GOOHQBIk-obYhOrWDLq9jmMnCcKuxJsWOoFFbpr-LREz3rUfzZ1C8
Message-ID: <CAMuHMdUJ63Bdwx=+6M-4HhsJuY2sqodh5cpxSMZfWpoUAnEhHQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] arm64: dts: renesas: r9a08g046: Add USB2.0
 host/phy device nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, biju.das.jz@bp.renesas.com
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso, Biju,

On Wed, 9 Sept 2026 at 10:55, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI, covering
> the USB PHY controller, OHCI/EHCI host controllers, and USB2 PHYs for
> both ports.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi

> +               usb2_phy0: usb-phy@11e10200 {
> +                       compatible = "renesas,usb2-phy-r9a08g046";
> +                       reg = <0 0x11e10200 0 0x700>;
> +                       interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
> +                                <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;

No clock-names, while other SoCs using the same bindings do have it?

> +                       resets = <&phyrst 0>,
> +                                <&cpg R9A08G046_USB_U2H0_HRESETN>;
> +                       #phy-cells = <1>;
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +               };
> +
> +               usb2_phy1: usb-phy@11e90200 {
> +                       compatible = "renesas,usb2-phy-r9a08g046";
> +                       reg = <0 0x11e90200 0 0x700>;
> +                       interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
> +                                <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;

Likewise.

> +                       resets = <&phyrst 1>,
> +                                <&cpg R9A08G046_USB_U2H1_HRESETN>;
> +                       #phy-cells = <1>;
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +               };
> +
>                 pcie: pcie@11e40000 {
>                         reg = <0 0x11e40000 0 0x10000>;
>                         ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;

Looks like U2H[01]_INT and U2H[01]_WAKEON_INT are missing,
but they are also not listed in the DT bindings?

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
