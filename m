Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6763D449995
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 14:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582850; cv=none; b=myruEI2PcVDxioEI9uw5Iachc8KL/1syPdwqTrwHBkuB7EhNGT/2XZEICIT0BJOJ1X9oSao4K35NKcSrmxdhYA9PybAZhd+C3zWxAIuv2AuowovxQJKy2ODpa7za4hOZmyfTy8XVHq3Pm+OEGO0cje+yhkKTRhkx/rEj38w7sr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582850; c=relaxed/simple;
	bh=lzVDByOMJRdqe9R5u+FUOskx17lzI8QGDBa2Yx0eM/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HIPzgj93lu/5K9h+CU6MV7GW+4m6Wod+UrcD9s1iw84K6s39fKIIkGbnZVq9VmIDMradvYiB5a1sOMVO8ZWGRDeAzGkhdAxr+aczvJ1TkVdgBkiBJ3n6NOMXlRgucbeke2PoZ424yL0vLaW1kGYsFxZSFyQf7PCJjIs4TUvUKQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c3163a88a1so1102184e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 07:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582848; x=1788187648;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zpblJv2SEkmZc5HujuLgy2e4sDhnCcMQ0T+RP/YPytc=;
        b=n7AGH/7WgnR3Xx26tG/L9wW39+P/0Ecy9uMmGz/yqRN5EW0UDD5ECnQLUVJOZKs+Vt
         P0ugoo8kBz7fvFZRAr1aVH063w61MFqYcobSvp5a5whCZUjWMzyQtMgFmtYdxytTUhAb
         NVSjoRQGk0jom75MWqN9HRH/FItPTa+jZCOOOvUJqZmiS39czzThsNuj39mfH+yVhhex
         Mq6JIKEzDSyqZ7uKdtwbtqsTWRj/X4i7ufnrdGb3Apd1GsA8MT5ZO5TUGyXbkMy50CyJ
         byweCPKYjK3L5aKv9eZwJ0xsUEfPSOCDIGp5aVJ6FaOHupL7Rmx1hsA30TipSB+5rk+d
         U1Bg==
X-Forwarded-Encrypted: i=1; AHgh+RqI9Et8vqViANbypf90r84ib6aCT1nE8UGwbn/T2I2m+9D4SapkYVsU00y7GO26A7TrTKJPGU9VeB28qzfgKW1ZfA==@vger.kernel.org
X-Gm-Message-State: AFuF++nKbpxLtmDMBD5PI4BGLZecxSppJBit8rKBrjTnE7kwieQlXtjq
	Abbzqk7MI7Fg9I9igEfYDLpy4pWq0eaQMS0brPNYAUdZRCQ/xA8YpQoU9zgufvgFbTs=
X-Gm-Gg: AR+sD117u9kWlb1Dr3l5IZSLbK/6cEBdIgQyjxWecqSY2Ty7R1JF1ZqHna/GeNIXroZ
	huzSYxcCLm5r4xB5x0dONeQNnHcjTQFZhAuevfn3LcTDkSn9OSjRtSKOhu9Oqut+k9qSLx1Jh89
	ujXHSC+zE5XoWDK7AfquLKUa6DIzJNB6XsHLy/6Gd4k8wzXgbGElaxf+a3L1GJZCXYmvsW78RPq
	CM7it/OeovLTfMvxteEw0/NVg40X7WZWDZNj1unjtaf7Wv9aq7+3TCSY7BJ5pGUlrDFOlyjL6dt
	AptFkiLh3uWcktBFv4wxw3hop0w5T250MM/5vavdLjwKRuziVB8Zy4sIoYZ5A0qfzH45BDFcLvN
	HdmY/76qLwFo5rqhYHfjD64AnHPrfg0wD6IPgQwhUVkEr2WtA2NLcibOTO918htUQYXmbCYLpY/
	jYrmY5eq66W8WwAQBQRcUSPFYIYfemx+5ZA0ZKY5bK5Y0h8ofh4cWR/YUjai2JPqdtZaMzn/Lfq
	jLktUfkRZBkjAwaj4f8K3N1nA==
X-Received: by 2002:a05:6122:8b03:b0:5bd:af82:fd9e with SMTP id 71dfb90a1353d-5c60deb6161mr7350915e0c.8.1787582848072;
        Mon, 24 Aug 2026 07:47:28 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623d2fab6sm3672252e0c.5.2026.08.24.07.47.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:47:27 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-77e354fa83aso275947137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 07:47:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq31J9YqMEN4GTLVetYkpsZ2jrXZ72UuyhBjrlDahDZIRO1SoUjksJ4f59FwOOOG0BGcJIlJaFAfS5/Q5JViIrmzg==@vger.kernel.org
X-Received: by 2002:a05:6102:8092:b0:77f:2f7a:f07e with SMTP id
 ada2fe7eead31-77f2f7b3870mr1243665137.9.1787582846228; Mon, 24 Aug 2026
 07:47:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819191325.217809-1-biju.das.jz@bp.renesas.com> <20260819191325.217809-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260819191325.217809-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 16:47:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCjiTOw0XqQvcUd1So9v0+8PO6KAqpqWTX5xk6r26GnQ@mail.gmail.com>
X-Gm-Features: AcwNN1Vgxu0CvNeSEcZZhx_3TGW5jkUU2Jthh2_M3mMM3rK8o598dAhJnDmMzNQ
Message-ID: <CAMuHMdXCjiTOw0XqQvcUd1So9v0+8PO6KAqpqWTX5xk6r26GnQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] power: sequencing: Add Renesas RZ/G3L Power Ready driver
To: Biju <biju.das.au@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 19 Aug 2026 at 21:13, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a power sequencing driver for the Renesas RZ/G3L PWRRDY module,
> which signals power readiness for various IPs (USB, DSI, CSI etc.) on the
> SoC. The driver binds as an auxiliary device to the parent SYSC driver,
> using its regmap to toggle the SYS_PWRRDY_N register bits, and exposes
> {usb,dsi,csi}-pwrrdy pwrseq targets.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Replace the large of_device_id structures by C strings, and
>    using of_device_is_compatible() will reduce kernel size.
>  * Replaced of_device.h -> of.h
>  * Dropped local variable pwrseq from pwrseq_rzg3l_pwrrdy_probe().

Thanks for the update!

> --- /dev/null
> +++ b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c

> +static int pwrseq_rzg3l_pwrrdy_match(struct pwrseq_device *pwrseq,
> +                                    struct device *dev)
> +{
> +       if (of_device_is_compatible(dev->of_node, "renesas,r9a08g046-usbphy-ctrl") ||
> +           of_device_is_compatible(dev->of_node, "renesas,r9a08g046-mipi-dsi"))
> +               return PWRSEQ_MATCH_OK;

Nit: of_device_compatible_match() handled multiple entries.

Sorry, my fault, I accidentally copied and paste the wrong function
name in my review of v3.

> +
> +       return PWRSEQ_NO_MATCH;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
