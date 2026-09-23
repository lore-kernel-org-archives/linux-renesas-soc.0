Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477EC45629C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 07:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149086; cv=none; b=mX62Fp2IKuw0gatxwlI6/nwWjzt4c4l+Njs/EMuq2CVPH/b6gTtpe9hfjfLu7emoNrAXUFRGQfaW1eUeY8sM1ch47Zvu4UbeEJRQasa1/r474/91zpK7SabPhOtKFwE61Mq+1WSd4mvksNgB3QNJTm1jNi9/bfgksN76Lb2UMN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149086; c=relaxed/simple;
	bh=pn8GhlML0JvQlv8XCkL1gN9RQZWKQflTUH6iKyoTXWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yq3CmJsDnImg81P9QipCSu7qPKOYUj5I4K+VAWZNUmnuEe56dvnwAKwbJ+ol0kQKClP3VVw6HWz4evZDDf+x7ZCu6Xvvh5iMrHwnXyRTcy2UW+ri0Ka8voHAz5nGjyKZsiCof8hL4z/HuWJdVyCn8gu/pGTWVPyTGr+9tZvnxho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e2ff27eso595989e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 00:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149084; x=1790753884;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gPyyWITg2Eop/iHLzqVBwj4t8oamM1QAzgzHz2VN9cs=;
        b=FEu3BibFzWhRe/stvjbLVoy5a7YCPvE/ZEg1tadOU/NV4/VHwHTu0w+dJXQT5ppmQC
         uHNZjQ+K0P8d+xgYEkV+N6RyBDBi9qWDZciMCHCgMrb8YYVxKPrWOrtlk42qB5DeOxx1
         fGv/ZcQUiMxBzAVbElmeH1NKtHSPyWell9QKQHfp2laKTSSpAWyhx0N8VTRiRxZpKWjl
         7dmNxLIFU5lC2NeCFFCtdzV8XD+915ewkN7Qzm/+9boSizXNGTNvw3H/W7x6BYw06WLM
         yEQ0iUp4Nql8d+NeSDf9iEcdH4Txdo+/a7zQUlB7KnxZt2AYGK6Lz11T0ctUTV+ptUTJ
         TWtQ==
X-Forwarded-Encrypted: i=1; AKwUvBytVh38/W/ci0gH8gWQp0OKqBcr9S7abjNQrMI26OEu4rJzqtSsHyX7d25MA5jDsHd2fsL2un2Te+6Jd5mvBd9nPg==@vger.kernel.org
X-Gm-Message-State: AFuF++nxJwgJi9nKRTQGeJ/gPtlftECYao/uCKLBQeakQ1/iNkTPxULJ
	GHbBiTQfkX0cTeXtLPDa8ZAOpLHg3XnxnXN0PHcUyKaI9606+rh6GHm192yRx06rDHY=
X-Gm-Gg: AYBFou0vfMXQ1fhcXdREFu8933DW7jtvlPl899bNR9Y3NLDFZULM0dfcAaNFLXT8hfF
	cBQEow+7O+Ei/W2CceZDV5/nchHgOKTzSbV36qVKYm06RkaCTMfGaMR11/IcGDqJL/KStsIKAO9
	vW5BOOgj9h5qMC173SwKweHLqYOwqYS/VDdV+6cheJYUmQoAayX2po5yPX1vfKt/NYh6+LwF9x4
	eTb2tfcl8o+pddCd4aeVPVNZUtIQ2Fb5ckhGTbROcUV8ti7HFukjWLvtuSNZekuuDWXJg+xcecT
	+/APso+lGlQdDKca/Lm3eFoS2sWvImMZb73wNOBZJc3QREOknxyYUvBuDv9kzIxdKoMhkvk2IHD
	z5DiLkiKlBMFIX00ZAn/fwl/5ByCKP/i+5iC1v2vYo08U1I4v+NjqKQelZsFB+CyEq3OqQiMZ2a
	uTjNJ/DIVVnQpGWyRFMRF2oce2D34t9xdNI5FiXFKoDBaEwKsvi92INPMrze8FYe5zynvnkciHA
	5vpukLZclhmAfsQt1yzumVLxCsskTq3ywhshOg8AjGOtp+m
X-Received: by 2002:a05:6122:4b16:b0:5c9:c60e:3a47 with SMTP id 71dfb90a1353d-5c9f168b0c9mr2220282e0c.19.1790149083893;
        Wed, 23 Sep 2026 00:38:03 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ca4604daf9sm303617e0c.17.2026.09.23.00.38.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 00:38:03 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7bab8eso357010241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 00:38:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwvmhi/J/RszMygyhDvtdl4KZjl0TugBjRo+ZNQxp8Q7hTc8z6rpABXhOtGLCRbcOazBwL7W81uOlGs7i6nt4bueA==@vger.kernel.org
X-Received: by 2002:a05:6102:50a6:b0:7a4:fb71:25d1 with SMTP id
 ada2fe7eead31-7ac1a6c6e37mr1941921137.7.1790149082786; Wed, 23 Sep 2026
 00:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916220801.240796-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260916220801.240796-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 09:37:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdv5up6d7rhhRyc7of9M5MthWFoeXCRWiTPSo+5B22Mg@mail.gmail.com>
X-Gm-Features: AclHuK-KliAgyjEnFc7fc7G0ednHxc9gvY5BOag4zMrSEzrWijgeZD9Diiyx23U
Message-ID: <CAMuHMdWdv5up6d7rhhRyc7of9M5MthWFoeXCRWiTPSo+5B22Mg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: ironhide: Align inline ECC carveout
 sizes with bootloader settings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 00:08, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The DBSC5 DRAM controller protects DRAM content using inline ECC. The
> current set of carveouts follows SoC documentation, which describes the
> three trailing carveouts as larger than the rest.
>
> Both the downstream IPL and mainline U-Boot on RSIP configure the ECC
> carveouts to the same size for all eight carveouts. Align the carveout
> sizes with the controller configuration set by the bootloader.
>
> This makes 1638 MiB of DRAM available for each of the three carveouts,
> which adds up to a total of 4915 MiB of newly accessible DRAM on this
> platform with this fix.
>
> Making this memory available does not pose a danger, since the current
> set of carveouts were carefully set to a larger size to prevent any
> possible issues until a confirmation from the hardware team become
> available, that it is safe to apply these less restrictive settings.
>
> Fixes: 6fa6ee724d8d ("arm64: dts: renesas: ironhide: Describe inline ECC carveouts")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

From the review thread on the original:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
