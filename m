Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451674DEC1C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 14:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606285; cv=none; b=RnGPgEwEeczL4e4I6IcvYJ+p1+WwQKud3TLiLVmhrhNCueruyEYIPA8GG3MWlWQ9vq0k+qxc1JC7cvtp6xn9OP3DAF2b/ICGLfiTlILQY969j0pNSr7051yDumJW6jGgO8k78Rtu2hKaHAjcVI3XOGSW5igP4f1rP+uFYPZI6vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606285; c=relaxed/simple;
	bh=ll5jxnO1LxSP6VOdbTEMyX5P1KDm9LihOkdaoeyDm7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dNRy0U4zDF75GsHLhi5HNeqL9rHe/GS1zX0xzc5mV4OjkVPG7I+e5xJuu4ZxwZgZQ5biHPhk8QyWHq/FdJkH/ZicQrdAGHj7avKvtnSvWA/BHDMZRaIy6mvgvZ68BJso/pmPnILRB1db5GDJz3ziDgfo+IXRQiYni68cuOC6Rus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93a40a9a01aso401924885a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 07:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606277; x=1791211077;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/3m9boaHoB6pESjCzvTfI8L4swM5eZahhrdnO03H/Os=;
        b=hnPrSrrd2ewZmoWHsswq+ksjvaGk1rUF+Q9EZcrWcZAwp9Emf7sWQ018t/pejblIsZ
         4vRd+tT264L/IfsHHoWZjcfSYtBpLU5mF8HY58A99EwErtZI47HxJZ4/CRO3Rj1rM6Uo
         9PBCOjDJVbJkU9cMwlwF9/LactH9BD8tu38a7Mn1YcjCiyQEtnPYF/08RDaYbqRmmuxL
         4ooUlxGOSZ4uML29tNytzUoqV7LRGah45/Nrd3lA+JWWH7SPW0SrflKwrFmuabN8Qqz0
         6TCtblkG5svFkqRvx99rIEMQo9IrvB/Oj8H8H5L++k8mKUmM5byjBjbwiaHbBsSAQWrk
         BMDQ==
X-Forwarded-Encrypted: i=1; AKwUvByeIyJEvzVT4y6ak1hfHNmcKpy2mvU1c7kAlb4gAoCO7lhgVXaxMKA8i1IshCgMaE97vPzg3UkAA33QOPUDSsfM3Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kAJoqGae8+JqSSGs7+knUGphDIEC2LXRAX3N9wuVF4VBiTMDiX
	oAQMCdv/zKXv5P0RlWreXz+bsPkG/HyfcpgkZ85JbfKQZTlgNeoMfKa0aGRQMDpH
X-Gm-Gg: AYBFou3c+MCDFC3HL/ju+m9cEITNqo5jTbtmcqv9xbg/jXZOZmuL9wdfdas+kBDoODL
	vUP8xXa7HDrSCBquIRtWASeYXYqvsrqD5X+0OZJjFPH+hwEPTOfytfpPOWjjw5GGeNFsBZGM0he
	68EQzD3BWdUIGpOjVdnllD8aFDcuRbrvoEZ4W5hh3+ionByQ6/mDKQKeoOc+Dryi4Sfe6OmJRSY
	AP1s5nPysx8pIAtdp7cdlq5YRI0SiHuvvlMJKCoHGrRbqRvSVTVYCPr0iWoIReb1TL9AaveftgZ
	fWFbWE5g+L8okRQZXwyUa8dlqBAbiHx7haCRM1cjTjF5nouefsP63Oo9AXYIa4+iHaC9Q2x88XR
	K+dEcrKxsIAmsrxNooT2hoedmPyIugLiyHn4UUopBnsU6iRINOawPgrDnyAcsq5oeLUNqQ3D9jl
	PuRKEh7uOfrJwUbQh2E03YiJLZbEqroqRS6r52igAuswF1Ee8KKojWnzgMq9H0MQhnf6ogYQDTB
	I9i26s2zNCZmirYDJjtMbXnz7OmblG4aaaY
X-Received: by 2002:a67:e8c2:0:b0:7b2:53e9:87c with SMTP id ada2fe7eead31-7b253e90c7fmr1903277137.26.1790605907432;
        Mon, 28 Sep 2026 07:31:47 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde587a790sm9100402e0c.9.2026.09.28.07.31.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 07:31:44 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-98515937bcdso1841560241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 07:31:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvxK4ibEKpOWhLXlEh9ivInvI6PbgcO6uvwtEkh3CaVUFr0oAhxerT/1PZ6GaKJ7ewEE1byWwFK4sS1+VGjbC2oQ==@vger.kernel.org
X-Received: by 2002:a05:6102:1a02:20b0:7af:efe6:2bbe with SMTP id
 ada2fe7eead31-7afefe63c7fmr2495728137.16.1790605902970; Mon, 28 Sep 2026
 07:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
 <20260904-rzg2-sr-boards-v8-4-94c4674927e8@solid-run.com> <CAMuHMdUGOLr6TQvfS9i2W1ihBWUUuTG0=TcfyZ-Seb02+XW_3w@mail.gmail.com>
 <133af08e-be3d-4eb5-aa64-63090aef6e97@solid-run.com>
In-Reply-To: <133af08e-be3d-4eb5-aa64-63090aef6e97@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 16:31:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9NTOgPR_Xd+YVOZzd8V=uOnwjoJxRPL_-wy3i_n45mg@mail.gmail.com>
X-Gm-Features: AclHuK_hO01Uu8W5tQcoOhC1vcw0bnPcJI__NCNgulHZI0GJtePof15Jh2gc_yQ
Message-ID: <CAMuHMdW9NTOgPR_Xd+YVOZzd8V=uOnwjoJxRPL_-wy3i_n45mg@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 16:11, Josua Mayer <josua@solid-run.com> wrote:
> Am 23.09.26 um 16:37 schrieb Geert Uytterhoeven:
> > On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> >> Add support for the SolidRun RZ/G2L SoM [1] on HummingBoard IIoT [2].
> >>
> >> The SoM features:
> >> - 2x 1Gbps Ethernet with PHY
> >> - eMMC
> >> - 1/2GB DDR
> >> - WiFi + Bluetooth
> >> - SDHI Mux switching between eMMC and Carrier Board
> >>
> >> The HummingBoard IIoT features:
> >> - 3x USB-2.0 Type A connector
> >> - 2x 1Gbps RJ45 Ethernet
> >> - USB Type-C Console Port
> >> - microSD connector
> >> - RTC with backup battery
> >> - RGB Status LED
> >> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> >> - 1x DSI Display Connector
> >> - GPIO header
> >> - 2x RS232/RS485 ports (configurable)
> >> - 2x CAN
> >>
> >> Descriptions for eMMC, microSD and RS485 are provided as overlays due to
> >> their dependency on configurable mux states.
> >>
> >> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> >> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
> >>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > Thanks for your patch!
> >
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
> >> +       aliases {
> >> +               gpio1 = &tca6408_u48;
> >> +               gpio2 = &tca6408_u37;
> >> +               gpio3 = &tca6416_u20;
> >> +               gpio4 = &tca6416_u21;
> > The TCA64xx driver does not seem to support gpio aliases,
> I have confirmed this now. My expectation was that setting gpio aliases
> helps make /dev/gpiochip numbering predictable, however this does
> not currently work.
> > so please
> > drop these.
> Is this a good reason to drop the aliases, or better to define them
> regardless?

Yes please.  Aliases are meant to identify labeled (numbered) connectors
on a device, e.g. first serial port is serial0.
A GPIO expander usually doesn't have such a connector, and the various
GPIOs are typically routed to a variety of places.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
