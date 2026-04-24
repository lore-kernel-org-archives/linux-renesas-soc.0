Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433773D9DD1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 13:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038378; cv=none; b=H8YKhpA6C1km13OGISRBfdPZUKIj0ovAvKDKAlrjh5QkPRtIrQ3o3XfylbxI00RzBVksBxw5ywwibNMhHoh7FTbQgWg6Nk+4rZtDib+EdHZ8bnlWf4XJgICReHLqzZSLEBbqOanTUcQFhxzm/poCpOP8pDi8BNcCl5d3+jDe06I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038378; c=relaxed/simple;
	bh=koZZaqymAh5kIvdpCwiZv1PBzDpj/zf5HXiHOUdGIX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SnYc3f2W+FsqsFZYLC5w8xE8DnW32ly7LxEPkL2mPTfzxY2orND7J6cLf5/G0eYcn9C3HDbuu0ehK43mIW3cWPZzv2HK19Unmqb2njjUmgoPcAfuW8vAwd/QedPn+bwkO1qkF73+oZQq5NmyA1rtrV1cBuaMH2na22Bm/V/u4q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-676e62faf2bso5865301a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 06:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038370; x=1777643170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLliIgC7Zznw0AlYmN91F7ir4F1HBOk7zj2xfpT4/Jc=;
        b=IxkAz88dUgWcdk+bDXbBGhaH0KkuNF75zk+QuRi5i1oJ4HIZPqVcyQX1AqZ3MmvbRA
         fHj071d23Kcf++H2D2r3+Vnytzp9i9cVY0xcTtkFMdxqWOvGtRdicuyTh7/KcTDQsHRY
         H/8Mb7ZIvyaEqhVX19QUNS1SYU4hUyN5YQ8ZFTAEvlSbVG/FJQwldKw6pK6NaYk/v59Y
         uI4sbXaiVAC4/SbD2kpp/lXMkIq8+al4No+NZI6m2wRSyepTB1tgDMIIGNG8Xf1t7UsO
         e1LC7w9nO8u8t95qiK2dntG9WICVZaAL1FRFq38HPFvqCHcRy12v91Er2Dk0IvABi7ln
         Ykxw==
X-Forwarded-Encrypted: i=1; AFNElJ89PfUdY9pEAC5RWXAcHT8DfsDphf+gkN0wSs9h1jt6rjHz65mJ0RQNOGOmvKeh7qx2JRzDMRBFIpWVYPkXfyQJ7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUXSOjO7I1RJVmsdLV+kJDciMtL3x9hxInYAS1XcF/urQKuAG3
	xV7w/RU8gdEhYwRzsWolJqqxqHuhWfNSUGjXi2VGUDh7WgfR4Ja5y+U7kH6Ymd5F0AI=
X-Gm-Gg: AeBDies1yGMOiRx5DQKauMY9g03j9xhF24gmy2KuDB/PIaOS1TEhMbgo5ykuSlCcsM7
	Q6/66obSSLuXiprN226HNDtdcZxdNH9B0HfBCsOiSealrpNqAb3IwUA3J/Wm/iG6zhUrg5U4y0C
	asUEMu3AvxvO4dqv8QK1CtDpfTQJOJoGRyg43IaExOaLsCHTK1N1YX1d1ICC/KOr8jec0XMGvnV
	H88G+NYH8DMr2STl5unza2MjPbn1G8vrU741vQTRSaPuim+wEOJLvSVO259gHkjqjCaRrdtzzKb
	sfcMMI+5XFQaJ09NK2onsE4rKfL68K47qgwIwRn53rnZYbW3LY4+9UxB5gfdaMUKBwsj3rQ9ESX
	u/OsGX6IlEYXCEtYAz8yAkc8jYhRU8+g+TV9BxcNkvifNWj7PGLMZXo+e9hFsu2j+CsWyM/3Uv7
	MZVcWKoJ5aON/HOt+qud2SoN+5yrLPPPFSg2Ov4rHEt7KOW/8BnBATLDKalDjwponoh8+6CaA=
X-Received: by 2002:a05:6402:a0c1:b0:670:6b0f:f77f with SMTP id 4fb4d7f45d1cf-672bfdc984amr13177549a12.17.1777038369485;
        Fri, 24 Apr 2026 06:46:09 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-678974e23adsm968428a12.13.2026.04.24.06.46.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:46:07 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9c3a9fe80fso1151989566b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 06:46:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/j/YFccAXM7BgYJxtAYhn3q48JHU65DtosjDk2xRAO8xIr/9v7Vn1Wa6m4r8ne548pWWyuv3NZ/TXzHzBsWSOAvQ==@vger.kernel.org
X-Received: by 2002:a17:907:268b:b0:ba5:1970:2bb6 with SMTP id
 a640c23a62f3a-ba519702c56mr1350019066b.34.1777038366261; Fri, 24 Apr 2026
 06:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org> <20260422233744.149872-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:45:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXb7o3NJWjNeMvtTqoMZtZJc8e-8AGAd=WYeMa-qhgk2w@mail.gmail.com>
X-Gm-Features: AQROBzCeUf1K_8djXszLWSG49-1ZmjC232gBnM75vFZ9xuQJc1mtkXTcurZTMVs
Message-ID: <CAMuHMdXb7o3NJWjNeMvtTqoMZtZJc8e-8AGAd=WYeMa-qhgk2w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock
 on R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Apr 2026 at 01:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add ZT trace bus and ZTR trace clock on the R-Mobile A1.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Add ztr/zt clock at the end of the list to match bindings
> V3: Keep only the trace clock DT part here, extend the commit message.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
