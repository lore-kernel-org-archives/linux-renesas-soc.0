Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6340E4AB1A2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 10:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639223; cv=none; b=XqX/44z6wNor51G5+xHMlcz/daWABl1LZygic0hKm8iWid96npUOeOwxhrG8D8kS0ye3PcT8SpSvCHrK7d41nYb4Lun6nlXQTsvfMswCyGA2nVsIBZZZC66pwmc274kOqEOvf/Rnl29pI1KLee8WqekC/cPJrG38R8VEYtU7PWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639223; c=relaxed/simple;
	bh=paeQyicGy4uOJnj9MMiYfbfBIScuQX5Dy7auLPzshnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uh69fieSUOK3eXYc5kw2gMUP6NFzqlN+8EP27ZpFJMDwTFLRwi6OjAGYobRXeffQy09l2wNzR+TQq1ztFtpE5QJ26c+pAabQIe0tfyGTt1Vg0EyiluJdnSFoifSQdSlugq6qI3UJGHHwB3iC8agY7MeL5dQn55ui9vWF54ETJXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5c83be8db39so363711e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 03:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789639206; x=1790244006;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PgwBsZe/a4Fuzb0Py083b181bySHfV18F3y848rFS0s=;
        b=SYyK4bcVugbheVEgkvXcoUuilYWtngHU12Lf3NTygBDJWPIXtJOUSDo2TOgg+rihtz
         AbAE+qEy/Fy8pLPWPlUrwJnei+1TdCKoVoRXgqwwbtgclAra5YHUUXd54hP5Pc3AU1PT
         ALx4AbEIYwXKRUwFo1MRs2NBsex++f+wVOKTlesrIJHxbyZwSz1bXRfkreGrD9QFhSsj
         Pq/PYlellAaqBufih7kUph8PpKOCM3413Us58R0b0Pt9pfzhV1mRiNeTpLZ945tm2fUD
         vS29gBMnShaHd69124VtKVnIE5nI+yo+O4SZ1yG7fe3iUpp3IRBK5bGU5PzGpAM1zn+O
         wFvg==
X-Forwarded-Encrypted: i=1; AKwUvBxI8W+JjvEbKUrOEIez/28SEmPQx0Dq0yMch5QIFrkze2XKGVSJCLiSWKM7nNb7lqt0GjfM7RvSIdgtqGMQQk71Yw==@vger.kernel.org
X-Gm-Message-State: AFuF++myBFprJRrC6zxBVEd5l+kKw6wNP/SLvK47jNK7HzL+IMC3j2yA
	aOrmKlN7Kjan5QZOQkP/m1kLBtcVb3pzJdZZgE6hGC61NcBDhhCzFD+PV1Qa83ipGvE=
X-Gm-Gg: AYBFou3fR6bWMkjTwOUCSsHhw65aWa2+AQwe1RStR/cdO3dds0KU3DrBjHDlanVGG/W
	qPzndTTIZAH2qpbn1tnSkntnIe50cTPTZbj/NZPTz20ieHJCFEil1Zgx2Gk9apVEONt/dBq5qwe
	A7raDJurCxSkbXunAL7SCBMwddPSHr0kLdQvJxPSTNAD6MY82dkLFDE/Y+EVkU4ja33cpBhs1Kl
	cSuDyf0zx29H8khi/HYhln92uiEjL0RmQeVwSIXNa7wL4mottEOznXqwzhTwpQeryKAjxSQOvnz
	VOoft7RD77iluJaGIN3zzc6gVM86jISB5VKUCohVyn/+2QDa3LleARKYenVu44yYuLDBWsb9OdX
	qR3vbEhKBzn6pC3y7TqsPfFTAlAqvegrkhv0c5LATwMUvP+CyU3qbcinn7IfFpUjjpgDGnh34Pc
	DDAZUKwLLin355H/0PCZRcUJbov5UeMzDp1pTg6rMSQvqFHRppEAa0qnxqrRU6aeWCsLhv0Y37V
	Cqal+FRrTG9gEXounoGuOTz1xZmITT2q8bl
X-Received: by 2002:a05:6122:1d52:b0:5c6:599d:8730 with SMTP id 71dfb90a1353d-5c9a629f878mr879020e0c.3.1789639206133;
        Thu, 17 Sep 2026 03:00:06 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9a5429518sm2112529e0c.14.2026.09.17.03.00.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 03:00:05 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-790b4aeb66bso407176137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 03:00:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBJl40JtSXoMNVyDiXUgmaN1zogVdJSjXGOLDNcCESaz9MqDrxw78/N5yUh6YmwuDE+B1vBU/fbrMma40Eb0CrkA==@vger.kernel.org
X-Received: by 2002:a05:6102:9d0:b0:7a1:f7d2:e826 with SMTP id
 ada2fe7eead31-7a2049c966fmr811148137.31.1789639205042; Thu, 17 Sep 2026
 03:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910085430.3173166-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260910085430.3173166-10-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260910085430.3173166-10-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 11:59:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcPMD9kzEUbkZofv6O6EoCz7mZ52Rp-ennBYP30v9-Yg@mail.gmail.com>
X-Gm-Features: AcwNN1XQBPUy3BHOan6ZOGxBXs0JV-45PEV0B5RSS4MUAdKXHpMlIwNQ2uEPp3k
Message-ID: <CAMuHMdWcPMD9kzEUbkZofv6O6EoCz7mZ52Rp-ennBYP30v9-Yg@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: r9a09g087: Wire up DMA
 support for ADC
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 10:56, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> RZ/N2H (R9A09G087) has three DMA controllers that can be used by
> peripherals like the ADC to offload data transfers from the CPU.
>
> Wire up the DMA channels for the ADC peripherals.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
