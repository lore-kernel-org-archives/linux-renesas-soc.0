Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E8A483BE3
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526812; cv=none; b=YFizcjdHiBiwLAcR9LHAKOEcgYR49Ztyzq+cHLMoexxCQqFAJiHtHP8TdelhbmY2fTDIn/dZq/eqINLrP8sBPYM2h/IOfSVI+V+1ldvukhJ01KcChHsaQe9SOkNFMRS2btXESrHre2JPAvEt0DqrkqphTUcWKbG8XAzU3mkbt2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526812; c=relaxed/simple;
	bh=b+jsB/SxR9B4doq4j9X1OsN7P3v9KOS03k/c0WlWdws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CS5JZb5POcwlNphlhtcPaA/cAmlwHX06mTs4UEyGIFuCAfRAk6HBpNgE/7NQQHQ6c/whBFcNOF3H+HZKmjVg0iPTaoLW1NocX7w5vCzt3B5SamY0rfMGKdnvUQrJUSMgRlA71XIAeO0CtL0fbml1o25CuLY+7SPE0IQd0TA86qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9808f46d89eso432715241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 06:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526810; x=1789131610;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d7GgODhxIjczQScbRESMbRZWtgZnkVvNT/nl7txte6o=;
        b=laBlIwkj0stGSMmZvy+5I9AJljclCZjLJVp0C7k7rJoFhqLELUKe5eQJcEI8IaZifS
         hGaMJtagkc3n4nDHB9Fifi3Et99tShzdBSibu+xSz67w1CU3QB7YwSDSIcQVy16nwtDg
         qzOeWJ4EOIAdhEqHgq7sBKTyEWEKjOF2gHGsPTFM3Mb3MhUjTMEj2wXndUI2GkXSVK2H
         NNsyvT02FCPAonznBU9Ui17RAma2JWfF4ekQ7nUIoaz280+O8JoNMondQDWhgG1UyPSF
         jF0t4XIsnao5AKcd8jkGmfU40FRYsTvGFIbkRbZb5VP/re6VKSKd4HUMLOpShcMY5H6J
         z5XA==
X-Gm-Message-State: AFuF++m7WtNlfJpWpDutBAdudleuMck6cbkueaaV5EYwozyCmrOD4XIF
	rjMVBjOFKUpprNl8U6JvTqaaup8CCvKQ3PgZzV7nZZqpl73ip25NDKWovuT49Z+xats=
X-Gm-Gg: AYBFou0XssR3Avj0677RNa9qXcFcxKD2+5PxxplCnszwdAoAgISD+bBFkEQB86HKXyM
	jUDQYuwK2rbffBALmDkLYS38AZXbhy2j74oEpNzjYJ6cDxMD5Hf4xanenYlNjWvev/To/g+QOd6
	+8YqqQR0zSz76RVlAoG5DAv6Qm4Pk1QXATBou5ns92gnno8ejVt+Q4z6QJNFygywd1bO46x0teH
	iDFjyli4RV/FTM/PPgQiqvHsXxeFQswbY+ooGhU5IqhJL/lIoiVAJf30xFiDLNQadekaLgEahKY
	r7GtJHXJzfBDY7c8igs93R1SHC2p8haxOnb9HdGswltPvuzQ6qCLVfrhTL/eGAvO1xjBF54B4rp
	E5oCCvUK0YccCrBwkeAGXTxqLZhke4aHsnnS7mSLd0sd7ZEFIrRipricR7Up8rQrWWaruDtj6vP
	vZeslRC2s3hnc6OuogxSBn07yINcVGsT9iIPGHJzVxwypEi7/lPVmVw7YJCoxcW9fiaPUwrOGce
	jI7YOSi0lOFRN5rdnwxBIK/Vw05Z/Phv0Jp
X-Received: by 2002:a05:6102:2c8e:b0:785:b0ac:54bb with SMTP id ada2fe7eead31-78a4a9eebcbmr1757216137.7.1788526810333;
        Fri, 04 Sep 2026 06:00:10 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed1d832sm1501830241.4.2026.09.04.06.00.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:00:09 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-777c2d69446so688716137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 06:00:09 -0700 (PDT)
X-Received: by 2002:a05:6102:5487:b0:738:1ef6:51b9 with SMTP id
 ada2fe7eead31-78a4a96d8c3mr1844791137.5.1788526809409; Fri, 04 Sep 2026
 06:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com> <20260825141542.30901-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260825141542.30901-9-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 14:59:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTw+rJ4fx+vuM_QdgXE4Bxo2LPX9y0NH3kd7sM2oKcug@mail.gmail.com>
X-Gm-Features: AcwNN1XaEv9Hx-TPYsSjIBjhBVyHhLCKgIrxqOUUTGt6324d-7yS_6EXvarXIyU
Message-ID: <CAMuHMdWTw+rJ4fx+vuM_QdgXE4Bxo2LPX9y0NH3kd7sM2oKcug@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: renesas,rcar-dmac: Add support for R-Car
 X5H SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Aug 2026 at 16:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Also add the familiy compatible because X5H is the first R-Car Gen5 SoC.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
