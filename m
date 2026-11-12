Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476021;
	b=4pjMQTXNbbHcGBHDKd52vXUzE56aaj2RZlboSUg+bHnWgvaO0RWjnfDT6CxO8CLRpc7b
	 3pzXiibMTl8q9LSnnEP8kcjv4HWS6JyymIxoKCtWNWe63LMB/SnEKQ5wgsxHRyXPovzaY
	 BihdmBEdiwwKMY/AYPtDFnYMVxVUaB+OKtU+vt4M+b9eKxEURXKdMLuoKvxq9AshHTCJx
	 CJu+3vVhLOiROHx1Pxp4cX/lswRPbV5eTLXaXU1nKqE6Z2i3aSPhkqxu5wsxcBtSQngEt
	 OL+w8qUXmdZhHyxw6zoSrVtFuKlwBlokUt2ueGzYUJ3RsLzfgqKrm4xNacc+CWPOiKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476021;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=PvpQNatVTOT2KajcSrAsH8RPa9CV8xCGN1VjSKKPUwY=;
	b=tvmGn0qJe9D9Dp0RpbNgLjMne1L2S7xlvjXsUgrLhlTi7fdCMTT23dXXp39ZZyB9ZS2p
	 eUDHOU4PFig+Jb7hA5EiS5Ra5JJul6YMTyeIow2zgtnuZybwmv/faZUQUrUpZVa2ocMtA
	 MZ67jOY9wr0LN3mYx4WjP/FBQWBZt+2dpemQVPnPmsuE0mS0Si2/x9+4U80aXAsqdSva0
	 Sbk0lpGKeNeOOSMYFeVmoBbouLiqTFriFFfO+Xp5ps3vr16B26fM+FfnvK1PSnFHE+pw+
	 Cbq+f2Igi8tLs55UT5HiTA9Z8pfUDWKwV6/MHwfFUF/051yNB89ABE56r9RcEawyoJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3A5606A321
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 09:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF3A5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-998749fe872so1962670241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 01:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476020; x=1795080820;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PvpQNatVTOT2KajcSrAsH8RPa9CV8xCGN1VjSKKPUwY=;
        b=CmcSmZdeSjzbGvLLaFGeRCV+blu3BPbQyLOXVej2XzIwykGCmI6J3buDPOWhsJ+HRY
         REMAUE7WItcrNPrgXhcJUQipm973F81J5lvykAP9ivi/1jgtTzMM/Nie+BEv7uKQgawp
         1RefwcO8uQFnsw4579zfcOElT3vka1/xTGHK+2RPXlnPo1GX5Yw1/NLC6c8X/DuoDdf6
         SrOI041DKQXoyn7Q1btzG8oMajviKIbD9eVVEkNIGIZRJdMTF72B6jxffnnDz20XsarV
         BbHrOT/nlRpw8+0C2UlXIUSTni/UHrkjtVLM9vo1RJclk4gRNOekYEHuyZcHeLauk8aU
         vTvw==
X-Forwarded-Encrypted: i=1; AL+hErHCanznucgqNXCVYRhsIlT/Zii+C9s8T77Swf66EUZKrWL/LMp+qzeOqKPCJ5VCszdbNHRci/FK9dVgHaaeHG2q1w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9doRXgr7TD0/ghEGsvs+biRTgF+rAeeDpNoQNgmczKYfcjPEWT
	K9jYJxl7gDOxRELZMpF2H972FmJY54A8KQNpJ+F7vDSdTNFzapIdTSUxgzOQYAy/
X-Gm-Gg: AYBFou1z0xXWfV7sLA5pOd9Q6WYMeFDgVwadlKEdDsZ9PaJ0zB/zzGT9192z996EPBW
	AyyTPLrTFzrEPY1ClfG+JIkHeV7v7siajGFVWG+ZsNRyyKboRw4NDZmzJUy9SSIgfcCq3I0t3Ui
	g9Tvm3c1fNGfmwD5akmQIkfW75Wf1sc802VhypEskW6fdWP3x2kM26nQvQhljwW+V2OevbLqoea
	CIksbLcnenAExLQkB9Z1LxzRAB3oE2Fa2vB8O5cpQh7guNF5SsSinH6oTMaDy7WWIP3rYPjPFt8
	YMdbqivzr2HdCdts2440d/nRWm6LYzTSpAjsds8FqsGjlVrbUFTaj0ri79HeVR3I7CYJdS+ijl2
	n5dvFEkRUQoJuqan4NDJH3U5wCjxTBExQLcJx7XIkyYM2hdaknesek0jDfC0vLXDxDJqCzAsz8u
	tePPN2tmv8vuGgEukYEKvdrFlJdDhaU5xW3acE3w2e2i4GN5nzIM8qjnmxhe97KACW4+GEmBcZP
	eu3izSJDxjsdsyVzDwQuBdIkwTxCgHplS5sxdnP3kFYEwmzM5A0PAYYupdss+iaXDqaUm+HnEaH
	gGhNxzp5z9jfZoYOn3d3O9ehkX1APAmQFRcs+RjOlGzeNE+yIFEPR9tnXX9RT34nnXc=
X-Received: by 2002:a05:6102:2d0e:b0:7cb:bc5e:7d9f with SMTP id ada2fe7eead31-7d4fb2577edmr2166472137.11.1794476019565;
        Thu, 12 Nov 2026 01:33:39 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fec2818sm5035293241.1.2026.11.12.01.33.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:33:39 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99c0c1d07feso1896815241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 01:33:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF4qQ+CoJMSgwAmzQFI+y1Fkuh9ne7wSgczMC6p7+HNcepDScBoFMpvXuB9WiIoC2X+vDcYBuUHat2+XrI4FnmLyA==@vger.kernel.org
X-Received: by 2002:a67:e7c6:0:b0:7b2:f3ff:6b34 with SMTP id
 ada2fe7eead31-7d4eed5b7damr2202052137.1.1794476019144; Thu, 12 Nov 2026
 01:33:39 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112021818.1819-1-laixiangwu@cmss.chinamobile.com>
In-Reply-To: <20261112021818.1819-1-laixiangwu@cmss.chinamobile.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 10:33:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4YdVWBLKozBVKsk-cqnBjHY-4H=2hZP7g1H_3p2O8cA@mail.gmail.com>
X-Gm-Features: AclHuK9HKr87_qOdqG_vlcwyWmSNoZdZ0yGoPTgdymMg3LMPadA1Yy3iSiEgPYs
Message-ID: <CAMuHMdX4YdVWBLKozBVKsk-cqnBjHY-4H=2hZP7g1H_3p2O8cA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rza1: Put fwnode after parsing gpio-ranges
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"

Hi Xiangwu,

Thanks for your patch!

You forgot to Cc Andy (and Jacopo, for the original bug).

On Thu, 12 Nov 2026 at 03:18, Xiangwu Lai
<laixiangwu@cmss.chinamobile.com> wrote:
>
> rza1_parse_gpiochip() parses the "gpio-ranges" property with
> fwnode_property_get_reference_args(), which takes a reference on the
> returned fwnode.  The function only consumes the argument cells and
> never uses the fwnode itself, but neither the function nor its caller
> drops the reference, so one reference is leaked for every GPIO port.
>
> Release the reference right after the property has been parsed.
>
> Fixes: 5e455dd93397 ("pinctrl: renesas: rza1: Switch to use for_each_gpiochip_node() helper")

I will add
Fixes: 5a49b644b3075f88 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
as the of_node_put() call was missing before the conversion to fwnode,
too.

> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.5.

> --- a/drivers/pinctrl/renesas/pinctrl-rza1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
> @@ -1183,6 +1183,7 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
>                         list_name);
>                 return ret;
>         }
> +       fwnode_handle_put(args.fwnode);
>
>         /*
>          * Find out on which port this gpio-chip maps to by inspecting the
> --
> 2.50.1.windows.1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
