Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC133F4DFC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372596; cv=none; b=MxpP1A++hZbiWOzp/MjV/M94n8nrgi+Y48nxl2s+xpbNTxo6o47xHWI5syKogG7rsNz1L3XHp8m58FHUE5TAnwGlTHFUEliBxqN8BlDUHWAs3/hfl0y8LNtU88moRoc/HF2fcUpnQGrK37cZ8ZdWRRCK5p+vfc+RfinEf6xxOtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372596; c=relaxed/simple;
	bh=Jc+Wy8u3z1Q5y0+m0+roJV0C8d+2E9bEUT1AowBjBhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VBV1KRauIRbHTSDAWJWfXUehj+f4nwDbGcWdgQ6G/kFpzXk9E4+4FaiSkIS2futNBAv2AQmUL9/1V+TapRJUWVvwaRyvNV0Zqo/97kr9RyHhBStG+H/67nq2Pga/+Lx9+moP2deaSCyamUo4fIc50u3jADcVXRPtVslPaM5xBVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c3fabe908eso563657e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372590; x=1786977390;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EbEsllBk0EU/5gfHmuE24f9NsGRgf+tdlgI7A13kj8Q=;
        b=gEXH5D94gctRki6GrEA9CyiL1AXBXkqX7Gju0/A8ICAafEVORpa4i1W3cEWMotSNp/
         Z4q0gAK0YFcT5nn1ootWrhbL5IwxUpreXA3TWItsJFOe7fL8rq4bykMIpXB2xB3WCUcm
         K1fAGnxvbfd/ZyWM92k8HNnCpg3GUVV6z+MClHUY9eokpxy4tG8wk6++l/wH/hOx3omM
         tsxTsqM4+s1EXpYx6gBzBm9GnSlzHoYLnHl/Jl4kcIux2hCW8C9RNl5l5qrUtkPAc/Cl
         9JbGh0uLF84YUNIx/JZ8GmWILAyNSaFaAVaPmh06ri0GwW45mTIEPMb1XfRkBJ2BOss/
         Jz4w==
X-Forwarded-Encrypted: i=1; AHgh+RqbjThokt12mgHCrnAKZvz1XhoTGIUbghEdW5bsRxX4Zltmujrcs7ThMAukrPJTfd1EpDVOmq9kSTiLzMV6ifJ+Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0oJPFWbLuL0jPqX1CsZHM4wf6VTS25BNyRUpMx8xDFdnLHxLO
	kkOcOIdsCvd2W8wXv83uPQP9AEpEw0LF4BGzTFrHKhEM265ZM6CM94BCULnfDzVB
X-Gm-Gg: AR+sD13C6zHiqwjaRQiiyT1uPEIKciiwBU074HqapRCNnHcH5eCPzSEP1oGmljKEQBe
	i6Hx075zr9Rv/NhcgAukdDkK7uqRa02Bdpvs80dOgdYjRcIPCKy5w8B23WN1wW83B7Urd3WpvPx
	/W4DNYSttJTZGwaUzxzEZvfEqxLx5w28buxusdQ1u9Tt/aSCSjarw8fY4vG5KFypDpGySDMrxX5
	jZSAxceXpu0FSuupaqfjNj1vZrGaVBGLXVi0NMJeR6LqS5ISbK9LHWcJme++j9dvdB3N/L0mth1
	9d5lK6GXn46r3QoLlLeWV1chbjfc7XsxW86k8hsklgrtCvX6wjCiIj4dhsIk6+XxC1iWDEdDKJE
	l1OnVBC1Gq3TebWgjbK0SJVEuOl9oUXZcb/yxwny/T1JFCzgYpTc/E/SnFckYXnYX/ZceBGz4cF
	kQ7wBd2jTMGn/KUkWYruyeCT4WC2FGz7Dm8NZVN3X/sgU4xa8iGXfeiTaN+X8lMfSmauYEEZzOz
	giqmoIEXrwO6rU2rMf7MDJLpw==
X-Received: by 2002:a05:6122:1d93:b0:5c1:1965:6243 with SMTP id 71dfb90a1353d-5c3d9272795mr4378887e0c.13.1786372590113;
        Mon, 10 Aug 2026 07:36:30 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b20d380sm4399723e0c.15.2026.08.10.07.36.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:36:29 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-967327a0c7dso605386241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:36:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro176GC/3VaBnhT7K9bmk9kwnK5dtclW4XRnJL/YVZiWA30w541g7BR3QpvQIK4BLiEhB6VjLeHUjAXeLZYZcXNFA==@vger.kernel.org
X-Received: by 2002:a05:6102:3e03:b0:738:1fcb:f276 with SMTP id
 ada2fe7eead31-760e62c939emr10451604137.1.1786372589081; Mon, 10 Aug 2026
 07:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:36:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQi8e1iKucJtg_nWZ1eWgsx4eJoM7ei6F3w8bqD+z7oQ@mail.gmail.com>
X-Gm-Features: AUfX_mxRGFAsneILwiGbi03_BcU7Uq8jfCmWcA753H01LUA-8HtzsaR9xWF8_vc
Message-ID: <CAMuHMdUQi8e1iKucJtg_nWZ1eWgsx4eJoM7ei6F3w8bqD+z7oQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] arm: dts: renesas: stout: Specify ethernet PHY reset timings
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
