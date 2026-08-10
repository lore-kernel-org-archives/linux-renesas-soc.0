Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818A43F6C26
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372668; cv=none; b=rhePEfgrlrBgZfOJcWEmOI12lso/xBEm9zISfqVWG18ytANjyYoB10xbGeTxgYMnpFM47BSRCqdh726D1CckHonKIOmQ2apHNnhbW9VhTjgo0LsOW79H9U/VIgyGCNdQFRSI/z+RmSQzgEX3fEPJBL5osu28NlqOLLlQHiUATEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372668; c=relaxed/simple;
	bh=uB/V/Xhwg31kLJGNDAMpcVbvCMFk1PoC6Tb+YOPqJRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6o4UmAfW8Dvg2/Q2+PKplbyCF21v4kbVL67wEAlW057ya/U/mTHf/bUnIpRyp2/TxI690iFMCLrK7QBV9XQ7ns5okFca/Q0xpYkOijUAZe/C4hf7KHnQFdphSHzVHFy/Nn7o/TlWSO8uR7BGUGSvuM+EFO+6+iH9m7s5srTY2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfb3347dc4so1201257e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372665; x=1786977465;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=gUXlNuAGJVlk7iMy/AyNCG+qSBsS1BoYFAtMeHjkG4JvPgtJ3l2jZWJtT56ZRridxS
         FKRhcO0jWjmz2901wLUMz/ab1u/a6TQ2Jy4QTSHI2vfobAHAIzVmCNuBy+lt6IMYbGKZ
         c6MnjB2BZ8W6+AQ09Yqcqi1FyanWUZseiWJ0y6v9g01c8PeDIAnDCDLNiT/rLEc0EAEE
         ZzOjOkhnGQN7KRYj95DaS9z1oYCom0aO3ELsGvIiIHeZ1HWxWzxWW6qq24UlCQzFYsE7
         fV+8ojqi80ksUlPr+Iw+cX+v/VGLtEizF2MqM12z++cKn6N87y1OmCz2OFtp7vv0zzvV
         CmcA==
X-Forwarded-Encrypted: i=1; AHgh+RqbvcWeIybZqnqqbWiMerX0PU/EC9jSY0GTZ8E+zJ2buQzVrPx5y+aHrpiYakVthgBHCG7hEGEi0VDhWYivS2j9tA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPOfhgMlqCXvahi3Umy96dbl+DRhaSvt+OUYO7odu7l65Urikw
	pwDWu7f5+fcHUm1Ho66eP1AC8kGxscUyr1ECcIZZfL564fj96dBN0/tmYYsS2LHs
X-Gm-Gg: AR+sD1245vgsGTTWj45OvuSzSKCc0GQW09I9zq3jJlC0uZdRe6CXoCgcTODly6hvo+P
	dv8aavvoLxEbZTXx7a5Mi9TrLaeNbZF0x/vN4Pe4zgb54Np3cA3FjR7cfSc29w1o4C1RGMp3F+1
	LxSe99BGum9p/hLETDMgs7iS4N8u16ChYx3zDWZxcPxfygUyWkpLLdB2+mCW4cg8holcPDZXz8q
	yG22HJ4bJFna8H5a0f+zQJ4VCV/jWs9eHe/QA6VuhNdJC8bwmKJS/PhsBsKH8IB7c5u5Iwc4N0O
	lB2t1Us7aU64+IecUlU2mmWn6xQYW/mzM0pqT/Hbpmo3DjNC8tGiERjVUpWm8+NXf3u1suA2iJY
	f07HhGAxPwpNhvIJFm6kp4RVKCHVjeOVNcCPrSDIQavYQxeiMj0FtsSNfBmyg3M+e+Zr1NkE9US
	sW5CThKadNw+WXpJjNU3bdzIKOuWd4lrz7NelbDAi4SuTpwzrIqyu6oGsL7RjKvyfTnXEYLWaWI
	7UpSgcqYG3V2hIfYpabiTQgKw==
X-Received: by 2002:a05:6122:e267:b0:5bf:ac34:ce26 with SMTP id 71dfb90a1353d-5c3d924f1d9mr6088402e0c.11.1786372665438;
        Mon, 10 Aug 2026 07:37:45 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b1a8007sm4523871e0c.11.2026.08.10.07.37.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:37:44 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-74ab99038afso1261079137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:37:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq6sdFXYIELW7dSCBbFJzdEyGFJZC2BEzqN12PmMju3AsWVBtzYDNNNsoP3HBIqbJJwRmhrBSyGDZruWxwR4cR1Kg==@vger.kernel.org
X-Received: by 2002:a05:6102:5045:b0:74d:ce64:efa9 with SMTP id
 ada2fe7eead31-760e9951613mr12721738137.12.1786372664138; Mon, 10 Aug 2026
 07:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:37:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV8xxRd9dXL81KkbZ1EDFsoEe=scSVHFQF_vRWW7VtjjA@mail.gmail.com>
X-Gm-Features: AUfX_mxs1_ZDykWyS01_th2qlC8zb09CRRUvphOnXvBwUpf5EaZWE70oCbGmkLc
Message-ID: <CAMuHMdV8xxRd9dXL81KkbZ1EDFsoEe=scSVHFQF_vRWW7VtjjA@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm: dts: renesas: gose: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
> the system wait after deassertion of the PHY reset and before start
> of communication with the PHY via MDIO. Opt for the same value as
> used for KSZ9031RNX, which is 300 us.
>
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
> reset high is at minimum 10 ms. Set the DT property reset-assert-us
> to 10ms because the KSZ8041RNL RM does not explicitly spell out how
> long the reset has to be asserted, but this at least covers the worst
> case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the URL corrected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
