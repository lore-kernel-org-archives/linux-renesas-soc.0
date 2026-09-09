Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0693D8127
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 07:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940682; cv=none; b=k+WS7jAx5u9ooPHLYMu2vctEAfe1E++vxcNsgdJFRnHavhwKbmCcAbYo3cnbX9qWBUp9kshX+W/haug/9jhG4O5U4tyUkdDeCp0si9qVhEamKSPJt5mDd1HLz9Smtmc5peWi05JuJJNABbGYgOh3/uG8VWLXNedQ7GxHKxHpNGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940682; c=relaxed/simple;
	bh=Dp0zVYlRV/ykV6DkWI/HZNZ2E595JooxGaLy6ystZi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ao/uf7nmIqf0RWKPqD9eSHD46FpMo+Bkm2S5P12ArRx59r4VpXIH9yxfcErAq1sWRRfV6Vj772p3QRcXKX2rwwu+uQokInMIZxFBrQmayAN3mAArXbhdCEA2IIWXZcT/8YWMksfFTWA9fnRqbBXZgPeyY5za3+sBRUB2Z/uzeec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c20ce3c118aso944404166b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 00:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940679; x=1789545479;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u4dyKB/emFRDPrDqz9X2vH5TTb96Md3MW8gLHSI8vTI=;
        b=fYfHQweSc2NnEE3HvgOSeGmBBlXUVyOuLTdgKSZhlcj1+qOQeDsi9UJ5PfFWQ6SF91
         tqoiZhB/UkzqnrW5I7qTTUnuEgWeLuMQUWz8dXZaYRTn84dfvIHxT+jEBe7y6B7FXlmS
         fSOX3IyTdifffdNgNtpESZ/R/Alj8MOuRZMmiNf5fNw+GbynEROajCiOfYkF8fKd+PvZ
         630AhPXyJa/yFhv8MOe6dV1Ns495pxY0zJLQZ6coLlodN32GgX45cCglvBLawKBWOh4z
         uzqu9z5qRsxe6Cwf2uBFoUSTQAIpOSnROyFJnzUixRbwGHDQP44LYhqIc04Hwm8fAAs9
         qZLw==
X-Forwarded-Encrypted: i=1; AKwUvBxdkYLDteSOywbMCTYq0yAv32feWw5vD3yH2RQAJOzJTWHBxKZYg+1PrUq2vU8rfHpKt5nKZqP04JmkHDauIMVZoA==@vger.kernel.org
X-Gm-Message-State: AFuF++lizGSlUD+BUMEhZ+TVS0scRrOhnTvlQ6wkgLVA9glH9V2kZgpC
	GvsW1LVIBYgqULMlQ8k4RGFdcxZi5/i28Hh4+O7TirNS8T+RoEgG6K/tTOLwcIHJbQ4=
X-Gm-Gg: AYBFou1NYepNslKwtOJVOoJKpktG9sBTIjxrBkM3W31aYirV7WZS15fv7PxyUQYQo6V
	+rkW86RIWQpJOGdoOYKp9mYNLv1UZICb7SzrQ4x4rfxb0VhVrSOrrIDsFqw3yTJd0ECOZvC7zBM
	m9jj5jMo3P6N3kI2uUOQxoQz0Gqj9Aiyc0cpCTSgWZ4mStFOidvBABkuSiNkNuO7jfReudfa+/d
	uI+byxIMKflXw2rUmKS1fUXh1PsFUh77UxMD1tYe94oNV052OMPWD4IhB7ubfT9YetzZPHGE3pq
	8NrmH36KhdEdZDSLFj+PWCpZt77cj9bXG3vVAU0gZEiYurhNeffKg3kduAXGGJV+G10cjFI5b0O
	il9eIoLQEqzNO4Oz12YHcn/ZGHPyQ0n1GP/HMPAae4MaMLoQJn+pfbtnDgufPby3aywwZs7BFjw
	hG6uZ2U4bXsWdy1v989y00qe8kDFhwssjfW4Jo+tx1SL5CQXc2y3yH2gUotCrM04SrW+1DMmb5J
	ISRGWO7CjswffU76JjOkvOKVRYbacSdVMyZ04VdFeKlUjk=
X-Received: by 2002:a17:906:c154:b0:c28:fdcc:901a with SMTP id a640c23a62f3a-c28fdcc90bcmr558133666b.16.1788940678731;
        Wed, 09 Sep 2026 00:57:58 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c28e4579395sm461900166b.48.2026.09.09.00.57.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:57:56 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a985799954so1460661a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 00:57:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwhUc1qONo1L9nkS0w+q1a0xbzA9F3I5V/5/qbZ0yEkS2deTARel+AaHC79wyKrmkwhn5HLw9NklMRv8No+Dt65sQ==@vger.kernel.org
X-Received: by 2002:a05:6402:3247:10b0:6a6:b2b9:7662 with SMTP id
 4fb4d7f45d1cf-6a6b2b976demr10117247a12.15.1788940675713; Wed, 09 Sep 2026
 00:57:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906140134.492084-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXKr-2+_kcCd8hSB84=AZpmOtDt2-Dxpgiewyg+67O+fw@mail.gmail.com> <b1a64102-9c86-4cbc-aa07-11ad051b0dc2@mailbox.org>
In-Reply-To: <b1a64102-9c86-4cbc-aa07-11ad051b0dc2@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:57:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJso7-432-pgJ7SJr_QC_krOgLE6U1dhP6c5=r_TL_og@mail.gmail.com>
X-Gm-Features: AcwNN1Ua9Vke213V9Nb0AugUOA6EaQLwJxCjzIaW2N2cORqAOZX-qMn7euhb-OU
Message-ID: <CAMuHMdWJso7-432-pgJ7SJr_QC_krOgLE6U1dhP6c5=r_TL_og@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779h0: Add GICv3 ITS and update
 PCIe node
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 8 Sept 2026 at 18:27, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/8/26 10:46 AM, Geert Uytterhoeven wrote:
> > As I am not PCIe DT expert, I am comparing this to the corresponding
> > patch for R-Car V4H, which I have already queued as commit
> > 7fe73a3a3f2c3718 ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
> > update PCIe nodes") in renesas-devel, but which probably needs some
> > updates.
>
> I sent a fix for that one:
>
> [PATCH] arm64: dts: renesas: r8a779g0: Add MSI cells to GICv3 ITS

Thanks!

> >> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> >> @@ -691,6 +691,8 @@ pciec0: pcie@e65d0000 {
> >>                          resets = <&cpg 624>, <&cpg 1121>;
> >>                          reset-names = "pwr", "core";
> >>                          max-link-speed = <4>;
> >> +                       msi-parent = <&its 0>;
> >
> > This has an extra cell "0", which is probably correct, given
> > "#msi-cells = <1>" below.
> >
> >> +                       msi-map = <0x0 &its 0x0 0x10000>;
> >
> > This is not present on R-Car V4H (which is probably wrong).
> >
> > Interestingly, Documentation/devicetree/bindings/pci/pci-ep.yaml
> > documents msi-map for endpoint node, so should it be added to the
> > pcie-ep node, too?
>
> I do not think we should be adding it until we can test ITS with EP ?
> This patch adds the ITS only to the RC side, where I can test it.

OK
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
