Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A011553ECF7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175131; cv=none; b=gF+4+QS7YZM2lXuuAyHj0jIQ5K+abmLJdmRLiuMC+Ubf4Oq7XNtbEEG/UDIjKgsEhipxoOSdm03K9ssCDFCsvvCN7BvbcIqgM35vP86ateJKWTrk8wZabRLD4Z0hQoXjCJxdrLBwwSqEcbwYwYjhVrocjg+OnPAF/s4HR3SniB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175131; c=relaxed/simple;
	bh=AfFgK5O94TRbSz0v+n2agZrfGhkoCKVuFplQhBhnZO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ULlu7AgHkrVDVWJsDBFKbeEK6qrjtRCs8vi4yNgE4WzH/4EaHcq1jNZB07UpxrZrJsZKv+3hp4JVEiM3/kPEzyE3AGWkYdRdjzEs3fO6KIpvitgO/qM8axOrP216PsrOfq1qHHyKC2w+ynehHhuAuLyUWckTP09wa4BzzcRnsm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c67e512ee5so415233e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 07:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175127; x=1790779927;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OTVINLgc5+4Z1oNwbQRG/rtTEB6pkVDW8ACRGjhrMlE=;
        b=R8F2FJGzLZH15KB3iIjT4Lc+GNzNTTLIY+PyLTS+KLZ3hyyyhZH6u9EVbDMYlaHPBR
         14HmgZQz6ny7laouCO0mlrG/3Id2ws1ZX2EffGECs15lqAPAi45SYGvYHMGpijEeqNJp
         P63kmnIIEuWMI+eAR6MUhSar3L/w6nWz+GJyOF8PryTCrps+zqHzJKrjE313qfuCzEJ5
         Y8bwctxe4WO7bGfSwh8eZ05ZUmPizJeyecgYuly7Pcf7bxZJtNyZMWORvPqY2Bgdezu4
         mylX5tMC200eGE+3388TxS1+1Nijqp+/LnZmyjT0iMw/dgjWnsAxVCf+6FlyKUpOAHz2
         9KdA==
X-Forwarded-Encrypted: i=1; AKwUvBwTm+ES2HogJ7Ap8yBGsSDqOaQ/uR2hluQ7a2xTrIWS5ySeVBFphA5fVtRx4iLa66fLfc2CxU5HxcX6ovP3CquJbA==@vger.kernel.org
X-Gm-Message-State: AFuF++mi6+D5sj9rTvVW4haVVD2sqUT9gE5QVxYx8L7lijQ7kdwamuHU
	MC/1o0sZxxzEHR6/9lq7iJCqdLfPQWVMJfNR6gH4P7Hqyoburp6u/aM6zTMFpOEed5U=
X-Gm-Gg: AYBFou0n3Abl4CA4ka34yH1+EFJvLq0iWvJI7hGMbVI35/HKSTrN2xb94MJVdbaT1U/
	gvh760Oop5vjE58JUUs7bZm43kt8qh6LVptZBuRTzU3soup2fNppWKe6BtrZpgaOB+JHTVerYLy
	jkN/15RyexbB0pNeyM6H9WLXY2/3xFPSdfaPrv4lNVB0t3nxSKNkOiGdsnhLkalmfAZZpOIqIYo
	20Orz91LRujKD8RCQypb+lACyQGioQhr5VNVtS1ec9NHU7jlQb1toRcXEoyEfmJUm/0BB8lXk4G
	M6RhoZvJu6M+Y0Jp0g7a8ruRyakqIfX3CKX73NHukyrL6YHGS8iAxZ2AlUYIj06sjNsbv1R9kO/
	r9ZV5ZbUBgVyt0ddhc4jtLqnfKDQdsRHaKycez94NcJiUX9sdAD7+1wj+6zsLl51yc0rhZ7/sRK
	RFRduvtzhjoUGxJjtg0zzXhdsu66QfDHBcPR92nGm2ccyNW0GeU8LjmadtViAiGAQMadxdZT08+
	u/CxNCh1TkDOwxyPpVFbWuLkxUd4KbIBVvS
X-Received: by 2002:a05:6102:5696:b0:7a1:f951:f2fe with SMTP id ada2fe7eead31-7ac1db32676mr2251239137.17.1790175127170;
        Wed, 23 Sep 2026 07:52:07 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf5a7fb17sm3743083137.7.2026.09.23.07.52.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:52:07 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78ffc0e2f23so409256137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 07:52:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBytc8z0uXAmichKojGa8KV4DF8Ugz2O8RX/pqCRTCZrFBW7nXwwsIzVhXQ2VyKBsS8eAjWxz0tjIJeRkaguTdMq6A==@vger.kernel.org
X-Received: by 2002:a05:6102:370a:b0:7a7:3485:33ea with SMTP id
 ada2fe7eead31-7ac1db33f0dmr2430482137.19.1790175126732; Wed, 23 Sep 2026
 07:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-6-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-6-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:51:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5HkURikoQjpm_tw7qnHfGbLFtug4nBMgO7vEtpyjA2g@mail.gmail.com>
X-Gm-Features: AclHuK-gsUhfafKUl3WYFPzbbNPmdS5PRweR7PwdMXMcSw8FWUkpxbAv7z94Jqg
Message-ID: <CAMuHMdV5HkURikoQjpm_tw7qnHfGbLFtug4nBMgO7vEtpyjA2g@mail.gmail.com>
Subject: Re: [PATCH v8 06/11] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
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

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2LC SoM [1] on HummingBoard IIoT [2].
>
> The SoM features:
> - 100Mbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard IIoT features:
> - 3x USB-2.0 Type A connector
> - 1x 100Mbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
>
> The RZ/G2LC SoM was designed to be pin compatible to G2L SoM, with
> slightly reduced feature set.
>
> Descriptions for eMMC, microSD, and RS485 are shared with G2L.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts

> +&eth0 {
> +       phy-handle = <&phy0>;
> +       pinctrl-0 = <&eth0_pins>;
> +       pinctrl-names = "default";
> +       /*
> +        * ravb driver does not configure mac internal delays for RZ/G2L(C),
> +        * instead delays are added by the ADIN1200 phy driver.
> +        */
> +       phy-mode = "rgmii-id";
> +       status = "okay";
> +
> +       phy0: ethernet-phy@0 {
> +               reg = <0>;
> +               /* Level interrupts are typical for phy but not supported on rz/g2l gpios. */

Nit: "RZ/G2L" (in all patches)

> +               interrupts-extended = <&pinctrl RZG2L_GPIO(27, 0) IRQ_TYPE_EDGE_FALLING>;
> +       };
> +};

I didn't compare with the board schematics, but the rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
