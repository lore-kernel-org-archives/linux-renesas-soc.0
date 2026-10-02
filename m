Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC58457E64
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Oct 2026 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934894; cv=none; b=DNKA4gCoHR4+WKjufpk0xdsI8g6Gdv28MuVB1LuZF5BuyeLr875/HlvLBsRl019B9tD9ZUxPeyU4zrEqOZnUJFpGsbNJTXLcukl425mXsRZ0z0SoWTfQo2HNWC6nwCyi+kHef5ipyx9Pe7m14uCpgzySGjUwZ9sFujuu+0mzQkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934894; c=relaxed/simple;
	bh=GzAnx2xBXfEPO5tzd00AnUoKCvkCiQ5XrGLMnwGIK18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8xDSvnqMFybDFUq6oL0u4+8FunrePboGvXWNPRZGua1LTDbdbqzoBTYBXxxHqZSWKb6ygmCdc6kNSQrsUQ7lfxz5vDQrXqva8ntDKGW1t1ZKg5nJni5y6PSQz0HLGyw9fyoVwKnUd39bDjqzmbDPCpg84ZZv8IMLv/bdE59tUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c979c5eca8so5633552e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Oct 2026 02:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934892; x=1791539692;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z0fxwGjBjqcCfabEbDLAIlWYoRpsrY3klbqZYJ/Lvy0=;
        b=mGETvbhFwWN4BpY2axVXOrf/AwoPTKsSrX31gbIJEjTX1csxj/itaKavnUTeEG6+2s
         S8XHVH43QGxxTpdx4+c+k6IqSWUn+gVCoufaqh0kHSoYeg4BcC24UJ3Mi/OOAM5djQpp
         hPTZHpAsyrNvYIBikoCeo9mtYfbkuKxhKu9hTFBLvbqw043PJZ4I6KHFV1p9NbwGqIxl
         Xkotop1aqtjQp/hog26xdznxXUauSczJ1z9BQdYhaywV4gKHJvtlHzQijEuWGPBg0uyJ
         D11hK1iRJdtX+o/3YVLi24nptpS3nQCPyHsrl+I220XO6RixM7+NEg+4l0n5a+dgm6Ao
         zCMA==
X-Forwarded-Encrypted: i=1; AKwUvBx1zxpQIojtad2O2t158WpEVO5VWsc/Z7obbeoSDC83FGB2A0rql1m6gqPy7bo1kx3fZHd31hV9Qu1xJjnYdN1I6Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKRkXdaM/gTbegnv6lC7SP9Q4wP+f5Un9o+z0S/9DrRtZLDKmwc
	ncnkyk54OSLGlYG1Be3BojDTDaanJyxeEK9E7iQUrrzdNqRwlPq6JFUM8wQKsHSX
X-Gm-Gg: AYBFou0CZNQb5PpLbAu02z4uuGbJQaK9NYzgts/LuW7uSqgGMz/ABoUUwyBuJj99v8G
	J/Xue5aWIaOsbK6QTovN+Pv0uKGa90bquKYQ7yh71QDsVabWK+RhF0jrdS+/G5vtKX1hzcz3ukt
	9MQhjIGyjoBbqF0ctQt3IbdxLxy2VS+ahQldxPqReoFv7aSrp4jm5tz+aBaWP75ZkdCUaVcLUWQ
	zByN91SF3wPH15aT7StdjQJpapwrjDTYEbEpnY1Jock0bv6yfwACmLB5EeiahLHn4b0YaBX7+hy
	NSnvcv1tmwUhnCM0SWqeKWMLR9lq3T8EpOmP+5rZ+WW+xN+Er9EujAkBPFOCeNzfzMRhmWOyfXe
	5XaXdZWbr2wxRJxzeY+QdPY/MG8ACMbvsLg6cfKg/mdzmp5TtJkTwmkruZIV2v1Hk06RaIvinH8
	/RbhvWXnS/k+bRVEofhpLkGY9LMe77M5EsgnIwoGI+/wpdOYAziYtjxXPuvpdkFF6KGkEk2fChS
	7wEKXWeTxUqPQnY3pNr1C7aEPwnju9gA90eHw==
X-Received: by 2002:a05:6122:d0b:b0:5cd:575f:9396 with SMTP id 71dfb90a1353d-5dab0eb6dbfmr672280e0c.12.1790934891910;
        Fri, 02 Oct 2026 02:54:51 -0700 (PDT)
Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com. [74.125.227.37])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da62d10534sm2936124e0c.13.2026.10.02.02.54.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:54:50 -0700 (PDT)
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b42f1cbcf3so4021240137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Oct 2026 02:54:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw+mmzwRDOMdSDdDZclXS5T8wIeMFYJEyVs7mymDc1gTqILf+6VaNRt8IuS/lT6bEpO9uHzNWGNRhI/jlVV1RvAew==@vger.kernel.org
X-Received: by 2002:a05:6102:162c:b0:7b5:6bb2:53a3 with SMTP id
 ada2fe7eead31-7c0f498afacmr661636137.10.1790934890369; Fri, 02 Oct 2026
 02:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com> <20260928-rzg2-sr-boards-v10-4-91752ea39cbc@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v10-4-91752ea39cbc@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Oct 2026 11:54:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZMcdpgmZ8r3khF2er_ZNLsHJOXULbPmWj8ikCyeigew@mail.gmail.com>
X-Gm-Features: AclHuK95-pOI_InJ83kxtHngxLL78Cpy4C0cuDPVuyEs-ntx9z4X1Kg0cbn21cw
Message-ID: <CAMuHMdXZMcdpgmZ8r3khF2er_ZNLsHJOXULbPmWj8ikCyeigew@mail.gmail.com>
Subject: Re: [PATCH v10 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
To: Josua Mayer <josua@solid-run.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 19:34, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2L SoM [1] on HummingBoard IIoT [2].
>
> The SoM features:
> - 2x 1Gbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard IIoT features:
> - 3x USB-2.0 Type A connector
> - 2x 1Gbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
> - 2x CAN
>
> Descriptions for eMMC, microSD and RS485 are provided as overlays due to
> their dependency on configurable mux states.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi

> +       sdhi0_4bit_pins: sdhi0-4bit {
> +               sd0_ctrl_dat03 {

> +               sd0_dat47 {

Node names should not use underscores.  I  will replace them by
dashes.

> +       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
