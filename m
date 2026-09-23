Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26303019BA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171321; cv=none; b=fp4qwjcixorAn73BGLYmYRlREvB5docU/Mgo7k+B+Z8CLCsjDpaQIq+Zg7FEUnsV3u9kso/4rzM2fd6WMk4OzpDnIxdUh1qjnSqDvO951JGt7O9rvLZrnh3by8ni16TAheicJ6jiVZmq/anNs4RfB3PjZf0979v0QBCnB2imOYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171321; c=relaxed/simple;
	bh=zQLNcKwt8lnNKrUhZWYc0UbpzKFARTsV6kXIZiSRVZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHfQ8H8S+yglRBTP1LeHfwgGVsZz8jQRqc44VSj2O4aAcVrhdi11GXo5xIE+vvAOqKwArk36HPOcX+Djb0dFbYXSm14riN92OaiJasgYd2Bki0j9YBP88JRXXrC3CNPVS5RuVGOM9ues+SKLwgyBA3yeWZF7KdN6nLvq3jJeK2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4f0c89e33so619551a34.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 06:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171318; x=1790776118;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cZcaHlSLoWG/YlsEmorJF69zsl7G8OYYQpV3ToGZCjU=;
        b=Swcl3TCSQKOEM6srCL9H2ipD0tPVVGKXKNoc68e6bDzMclUOXJiXecExeuRq/OXmkJ
         cEzRfHf8eaIaE0i91bHai3nl1MNPVv9S7EUSNBh6A98L9u/7PtXzMcEjEaEMrZXSh4Uw
         GFLNSmk9oSnHYvuTq5kurQdobc0RGiEUwkN5WO0VZTDawpOZT1blLDCuo8Ao7CrgwGGJ
         eGO7Ozml2QLYb8K52ywrkAVIaLh8c5v76R8Rl9+trHC3LV2km471JLYkv6P7MeA+L6jM
         BpPYNx3/ZHGsH3RGRh5xlS16ZTsivQPalFJppOsf5tapcIWsXo7cCvQ2X19KuwT8ccAC
         xGIA==
X-Forwarded-Encrypted: i=1; AKwUvBy1ryGLkSgw0zVFfF5Pk4rLB0zgVbUzV6W5/25gPxXWf/POZudG+4b/cspCr4Zv5ijrGrzjLgYKt+IwI9Ove8U0EQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nZoWXB0hJw33WK0KfGhJfSupLRohtoQXDKqcTY7KT10KNjZraC
	uKiZCLT1QtPrpkV5cdftKJ25rcdy2SDm7SXe/VHZ+9yYM2HCfqNfCQcjZbjGzEAvvso=
X-Gm-Gg: AYBFou1CibuRWari7nYuLUzif2yepHP14cDrvqKHotAXPKrXjs7L3exuUMwm760oUNC
	l24C3WaQiT7m5QOgJErMlBQYFlkYy2HSkKJjlY4OCFlloQL+ALh9EeOnKpjJqGceOc53Ns5qJoU
	eW/VZRxZolTPFf/nuBE2dkH0qq7J0iBiN7reLUxKvc6GEoDPo7RIAKqkYQI2z6nyFa/gxXyAk1L
	6qhIHb/tSp9gxC6roH1l6ZOHIKiDitv2Nii4yI4/dCzNIzNSjeFtCo+cJE5xUh7Zc+pgBs9006Q
	CSClRHLEkJg1G9m/v5HypZzZBIkrhsWQRfYgAmvT6jievO07MjkityqdBejDeOi+GSYbiIFzo4t
	KjAYZ/Xjq+fASz/cI2qyaxXrocev2RbPHH6GooNg9BaUZT9bGInvXAIfDNhQTMVVQE9HSJy8+lb
	Azm79cVOtMNFamN2BL01k56jiQgtJvw07N25AueIApIa0whNcqa1HtPZz9cIC5lNPtf3SrFdWtc
	ZKc6TWlPL40b/JxxYukkOlZmw/AHCj75+KFfQ==
X-Received: by 2002:a05:6830:4103:b0:7fa:5c49:523e with SMTP id 46e09a7af769-815f2141cbbmr2616552a34.23.1790171318399;
        Wed, 23 Sep 2026 06:48:38 -0700 (PDT)
Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com. [74.125.231.205])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81603fc87cdsm2957049a34.13.2026.09.23.06.48.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:48:37 -0700 (PDT)
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c13f2685f2so584074b6e.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 06:48:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwxfYrQuRgP/mgW5ifZygkrqIA8tyXOTXbYmOIthFZyh5NydcjldIlmFJE2PJEYzyHsKQJdVVPQJk/X2W3mBzE4bw==@vger.kernel.org
X-Received: by 2002:a05:6102:390e:b0:7a7:195a:1b26 with SMTP id
 ada2fe7eead31-7ac1de3a707mr2471914137.32.1790170950472; Wed, 23 Sep 2026
 06:42:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-1-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-1-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 15:42:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtcxyD4Zh+HyM1D43zu8KND-18FiLhi9OXTHZPojRH=A@mail.gmail.com>
X-Gm-Features: AclHuK-TckegHvHKUKBwHK2truVsVTBXY6gTl27m7I0mB2ihxriiWdVUDyPODHw
Message-ID: <CAMuHMdXtcxyD4Zh+HyM1D43zu8KND-18FiLhi9OXTHZPojRH=A@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Joshua,

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add bindings for various SolidRun boards and System on Module built
> around Renesas RZ/G2 family of SoCs:
>
> - RZ/G2L SoM [1]
> - RZ/V2L SoM [2]
>   (shares PCB with G2L and has very similar programming model)
> - RZ/G2LC SoM [3]
> - RZ/G2UL SoM [4]
>   (shares PCB with G2LC but programming model differs largely)
> - HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
> - HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
> - HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
> [3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> [4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
> [5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
> [6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
> [7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -508,6 +508,14 @@ properties:
>                - renesas,r9a07g043u12 # RZ/G2UL Type-2
>            - const: renesas,r9a07g043
>
> +      - description: SolidRun RZ/G2UL based boards
> +        items:
> +          - enum:
> +              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL HummingBoard Ripple

As RZ/G2UL is pin-compatible with RZ/G2LC, I guess you could have an
RZ/G2UL-based HummingBoard IIoT, too?

> +          - const: solidrun,rzg2ul-sr-som

Is there any special meaning of the "sr" in the middle of this and all
other SoM compatible values?
If it just means "SolidRun", I think it can be dropped.  However,
you already have that for various SoMs with non-Renesas SoCs.

> +          - const: renesas,r9a07g043u12 # RZ/G2UL Type-2
> +          - const: renesas,r9a07g043

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
