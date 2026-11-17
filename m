Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914519;
	b=n439Pv97nXn+6GDBKTRsGC3uOHhM7qnoCTtAySkvG4XlySAK2prqgfNtMo5q9JisjX/a
	 0rqh8tGYlWOurhwlJJ7LVZjP+n+Yn3QiT4ajS0eEmBHzuUOCPgkZ7wwPUwb5beI/iQ9+t
	 rWhHUuFHofZYw7m5AEUJqMioUEydQKWBgLSh+o8kYCsuKlo62k6fI3vjdGTCMhOEOrJsV
	 fxdXs/ERxm2GQ+Wta3KJtChMQul2P412MQsZ+PoMnPazqqtATHirTFVTIcohx6ja8mCR1
	 PEywsk9yhe0uklbkytlUv3rVeUNsQMH8XcsdyzswbUqY5Yxp6gMeBAATbWrfrenFH3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914519;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=cvFYVydmQCNuG61XmmYr+sAquJ4kRd4CpcFPkVmXEeM=;
	b=0NSXC/xW1UN3V1/TxxqnJA+VXDfGtHqdBeg/gWXAxEaIP7o0ygyPER3Zmqe3XQdCKaT8
	 XUpCCbOhQwXAMG0HykQG7k8Cf8GYpK2A++zqHW4f8fgqiso9cvSZ87rftLedVOhpaxum/
	 3NO22xl0D8Ka4ygbY0H4ie5uQdtIzMwipozXDg4dNDaN4TOMiVi0whW4PhuD0+XvJEf4z
	 txZ8Hlg1w8YL4/7O86U62EHRwIovVn4CcQLWhvMdv9KDbRcj6mEUDG4QBWD91kXgNIMB7
	 SltpSQWUBRRFfpViA1RzK3WVFtc7ZszGliA80wiCdkdPPH9H5yLVO2xQi9HByl9rpMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C59606A323
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 11:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77C59606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-702fd86d674so3626470eaf.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 03:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794914518; x=1795519318;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cvFYVydmQCNuG61XmmYr+sAquJ4kRd4CpcFPkVmXEeM=;
        b=SRmPArwOl7l3hl65Rg+A0KNowEEbKtH2CNmigSZ2YKqos9DCfPRN+LCdo7Aj2Uwc1k
         LMDgIp1puwVP/kG0mX0G0PbZy6MVHAlETwFUJYNictfjhJOVaHj1YrUA8/Gz09hUTgt4
         7yHvVu2WiIoY5lI7tM9Shp0xEwWn4nPWXB0arlRWC5JFMtr32HQQR37mi/sHr5Bf/OXj
         hyn+pqGtvNFYP+WPuWvH6B9DEC0JgxE53+RRx5NqT7MzsPlwXxZvmUt/OiN0ni9KkM+t
         gA3bq6KrkETKMnOp4VJQTUvagjZVkcKQSSP+DJR4lxBn6ZEHhYMxhu8puLEzTCfl1JFN
         KQWQ==
X-Forwarded-Encrypted: i=1; AL+hErFCy/n+FeRdYZBZNU+VjH0BCYl8i/re/DeYVvwTOGdgj+o4suyRiRuJ7VoHgVVMXreB6tcfbnvrvVMMOOoaMRUsjg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9vNq2ejHf30N9cUQb12F6Ug426Vd60Eg7kkkMbqL/mT4f78NVb
	tKclHgcVZFp2WSmqlwLrxnOEpfE9f8LkZegpknv9p22V/XhKdDFZNQS58FmaEkVv
X-Gm-Gg: AYBFou1DZtNd2L/td74sAlt8kbbzF4soL+ABKV7wNvhqHMsAmJ5INylgqUG/bLT13Hc
	HFs+TYmWEYWrdl937Y2Q1RA3KB5AGGSNj4lTKVOP4o5z+75KDI4VILvT7GUcLuEc4IYwbMCdR46
	/1447z6Ov8gIrAZ8+0ocFg5vMiJOur1m32cGzA4CtyT1Xh6AMCAPotvrf+Vg25MaZF0FN/LeMtZ
	xoVcYlAOZRS7ubJF5MwlyYPn8VKMKdoWjrJgFy3gBxN+3Y2OvW9ooQDpRK7S+4n/dITKKxQXGuo
	tBjCBHkIFBPahUlOHQCQ8J0lTSt/oMvs26xIucoix2sCNzIYkxlcX6WQdz10Ao+K9a4CGsI17Qv
	75WMFMT6B0aVuaVUrgEsIE6Ufxrakc7tvQ5N1XqN0IxDW0CMf3+Mf7klY9MQC8pPI9UXWkjVBv5
	5+EQz5G5lUMRpox4mYSkydrhyokN8/Dbz84pas2BUYRWIFUwatouFne0zys0B7906NEvs+nmMzu
	MNmOhV+FPpFerE9EPeVlPaGtc8Ab6V0OP82LCKlndSP2TCMn092YLJ+0SEg/VJ+1Jcb7mpnvwzs
	Lgx6H1y5hEj6hr2aOPhdJDau59vxOUufus+RQpE0FL1aQT9yzcZcTVUPJuMiKGu8Tqor0nQ=
X-Received: by 2002:a05:6820:c2c5:20b0:71a:fdba:b5c with SMTP id 006d021491bc7-71afdba1028mr1814524eaf.53.1794914518324;
        Tue, 17 Nov 2026 03:21:58 -0800 (PST)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com. [209.85.167.170])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4335912sm10468952eaf.13.2026.11.17.03.21.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 03:21:58 -0800 (PST)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-53dda625f63so3766806b6e.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 03:21:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHK3Swfxr3M/QLMe17kt+4t8wDg+3BUXJFIhMjJqFdMlFqxBPgjjpGlb0jaffAsdMvgHm17QF7LXTmRyv28BFIzDQ==@vger.kernel.org
X-Received: by 2002:a67:e112:0:b0:7cc:2cef:b341 with SMTP id
 ada2fe7eead31-7d64d482ff3mr2913593137.4.1794914018867; Tue, 17 Nov 2026
 03:13:38 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112133210.3004176-1-arnd@kernel.org>
In-Reply-To: <20261112133210.3004176-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 12:13:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUL1X9ZsXNiqCew40hCT4c5GyvG3CkOzt+jidZvVAUoQQ@mail.gmail.com>
X-Gm-Features: Aa3M54pZEi7hoEPcYj_x7DNHC7Dh3oAPfO1LjOxVJlXMmy5auKREB8le1SS7INw
Message-ID: <CAMuHMdUL1X9ZsXNiqCew40hCT4c5GyvG3CkOzt+jidZvVAUoQQ@mail.gmail.com>
Subject: Re: [PATCH] reset: rzg2l-usbphy-ctrl: add power sequencing dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney@redhat.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Xuyang Dong <dongxuyang@eswincomputing.com>, Drew Fustini <fustini@kernel.org>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, Guodong Xu <guodong.xu@linux.dev>, 
	Joakim Zhang <joakim.zhang@cixtech.com>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Sven Peter <sven@kernel.org>, 
	=?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Robert Marko <robert.marko@sartura.hr>, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Thu, 12 Nov 2026 at 15:14, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The dependency on CONFIG_POWER_SEQUENCING is ignored when
> ARCH_RZG2L is enabled, and this can lead to a build failure
> when power sequencing is in a loadable module but the
> reset driver is built-in:
>
> drivers/reset/reset-rzg2l-usbphy-ctrl.o: in function `rzg2l_usbphy_ctrl_suspend':
> reset-rzg2l-usbphy-ctrl.c:(.text+0x21c): undefined reference to `pwrseq_disable'
>
> Change the dependency to always depend on the power sequencing
> interface.
>
> Fixes: 5ca65d048910 ("reset: rzg2l-usbphy-ctrl: Add RZ/G3L support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch, which is now commit eac3b292a26e2210
("reset: rzg2l-usbphy-ctrl: add power sequencing dependency") in
reset/reset/next.

This breaks USB on e.g. RZ/Five when POWER_SEQUENCING is not
enabled (e.g. rzfive_defconfig in renesas-devel), as supplier
/soc/usbphy-ctrl@11c40000/regulator-vbus no longer has a driver.
I guess the same issue can be seen on other RZ/G2L variants.

Reverting this commit fixes the issue.

> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -279,7 +279,8 @@ config RESET_RASPBERRYPI
>
>  config RESET_RZG2L_USBPHY_CTRL
>         tristate "Renesas RZ/G2L USBPHY control driver"
> -       depends on ARCH_RZG2L || (COMPILE_TEST && POWER_SEQUENCING)

AFAIU, the power sequencing part is optional, and only needed on
RZ/G3L (SYSC_R9A08G046 selects POWER_SEQUENCING).
The fact that compile-testing required POWER_SEQUENCING before was
already a red flag...

> +       depends on ARCH_RZG2L || COMPILE_TEST
> +       depends on POWER_SEQUENCING

"depends on POWER_SEQUENCING || !POWER_SEQUENCING"?

I have sent a fix
https://lore.kernel.org/0b1c87b3173a789f6227f13658e4befdac8e47e0.1794913893.git.geert+renesas@glider.be

>         select MFD_SYSCON
>         help
>           Support for USBPHY Control found on RZ/G2L family. It mainly

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
