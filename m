Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335EE3CD8A9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Aug 2026 08:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164001; cv=none; b=ZwgQdPUN9rBpT1Md3dUVtIyBTe4/0YnxNZ+dtIeV50mVWaHd5n4MniTq6JFstfFS4lWoocyhfnHLuYknCypKhpK7McqDlOTbUHfNqukToadgEHvSm7Dk4sJcci0I1K5uCQVV4p/vhWwi655iacaZ76AgkWKeAoRmV/eU/lmPSpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164001; c=relaxed/simple;
	bh=+qn3x8nquazRyDm0Q+Tw3miio+SG11ZPkQozR/1R4To=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UrY2E65YT8nFR0x+JbHvO0kdEVtaSR9ZMXj6A+rj56wbQzwRiJ2DQiDVXhCGJWSJfh8n0tDwhpIeoFe+qs9CD9Z0Eg+iHbbh8SZxQR/etwuMSrBbgXPHD/h4RoOVZ2bOllIhKpyFo8bbc3GpwUClUukgOG1d0nwi9pL80fDyL0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso2494765e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Aug 2026 01:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788163999; x=1788768799;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+6mIWWcx/hgj72l0+IMwbJPq4HotcZmhxU6vYoZhGw=;
        b=E30oUwwIkVpURlSW7NZ3lNExzok8YfomIpu7VYHO1SiFxE6SlrtyMIk52kHKPyYKny
         3SXlmLUxZGy1Lg+lkon1JmAuh+CjEkxed6nstfHe8lmuPY9rVU+3j9MshT3u8sESNYtd
         0OxJMCKJXQPbpE/tvQlhTKBBda3N4tfMjlMmazYdnJ8ukG2ErbikW1TExTcIHm+6RiG9
         qxgPNQ0XsioFrFe6JR/vugwiUFKK9DjlXTKLcBPX4m8wH2VbHmR7iDN43fFCmltp6n8L
         KyIG8WTa/LWRJsEXwXk/BcINZO+B6VRqOw8+Nq+FwyqOszb9FKAHjPL0ePLgpBdHty+p
         SbZw==
X-Forwarded-Encrypted: i=1; AHgh+RoqRbvpyAe2MXA2GUYxVotCXmbHd+B4v2vQxiEZTtQrjUcbbohjNEwwogReD52b9APRuAyHiukcepNaeVR/eDpwTA==@vger.kernel.org
X-Gm-Message-State: AFuF++m23EmcRG5/oE+gwYISBtobLlGe0J4dvytgS5VVjG5Ke7a9sgh4
	uzWM1TKc0IwAugOAqryLyIgzdXdlwn90X9l2yOQga3Q+CtKWsfiPixKBDLbiaWlM
X-Gm-Gg: AR+sD11tJorfys9IexI/p792FOnjSz0daaPwWjhbzPVSONuMKrnlXfl85Vtm1jHobH7
	EJ3FsU8dqRceGJz3TEJ5Nak82P1T36vbAtr/fdH8BEwA3g52kAeacLWFO/vU3Vx1vVeOH6p9C4z
	UMuPnxsmaubKpLWaHGc1j1EtbdawitDmr/34vkAO49PCwJmLp9sK02ZGrto2EadG7jZDXbztT7F
	DBIVzhtn34aI2Bs9X7LnfyEFI29P9g8bUizSjD9ZsNtPsciypx3SCwKNbat2WtmaSbWkqhha/UQ
	sS8XDSavkFnLSr2Kyi0g2Q8u1z1aBQJa3y7yG6HBub68oMOj+o0UTqtfIFg0nHSwW8v9x/CrfKZ
	in4IhUaNhLdkfLCYkViffhicUJJDUFu4IKF2oyT1BzrSmMr8GK92JDHU1JjzdQv3cWvoJMge+qi
	kSDIZSVuOtYoA5dDHOrujH3s5cANqe2PG4OoEJq/dyTKz9AmSIsRPeofZQoPtoVG3McEEtCpnym
	7Vrkk5lNq+pw6Yk930Eq9fSqiqDvm5ZhrMJSo9J6iwKtOet
X-Received: by 2002:a05:6123:143:b0:5c7:a844:493 with SMTP id 71dfb90a1353d-5c7b103b359mr2445354e0c.0.1788163998985;
        Mon, 31 Aug 2026 01:13:18 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7242c4e67sm7461556e0c.18.2026.08.31.01.13.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 01:13:18 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97c940ef65cso1748042241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Aug 2026 01:13:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrFiPeRDIM3kdywZdndtvwYeUUz2/kO1GuPWa0KCEC9SBbkJYIgKG/Sl9Tha9lT8EdaTuMGVuLCvfcSyQq93FVyDg==@vger.kernel.org
X-Received: by 2002:a05:6102:f9b:b0:77f:7df:ddd2 with SMTP id
 ada2fe7eead31-785972e710emr9471412137.1.1788163994928; Mon, 31 Aug 2026
 01:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828192223.402422-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260828192223.402422-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Aug 2026 10:13:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEz=NoDkvvSjZqNwDQE7+F-JqEeduD0-E-NXTj4Ykbuw@mail.gmail.com>
X-Gm-Features: AcwNN1W_pE0AEcDpr5Qk2q9RcyT_OX0D891rRk8joGtPW1leA8taoV55ukV4EjA
Message-ID: <CAMuHMdWEz=NoDkvvSjZqNwDQE7+F-JqEeduD0-E-NXTj4Ykbuw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Document Renesas Multi-Protocol PHY
 driver for R-Car X5H
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-phy@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Hai Pham <hai.pham.ud@renesas.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Phong Hoang <phong.hoang.wz@renesas.com>, 
	Rob Herring <robh@kernel.org>, Tam Nguyen <tam.nguyen.xa@renesas.com>, 
	Thanh Quan <thanh.quan.xn@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Fri, 28 Aug 2026 at 21:22, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document Renesas Multi-Protocol PHY present in R-Car X5H (R8A78000) SoC.
> This is a multiplexing PHY block with inputs from five IPs, and outputs
> to four separate IO blocks. The five inputs are two PCIe4, two USB 3.2,
> and ethernet PCS, each connected into the PHY with up to 4 times 2 lanes.
> The inputs can be multiplexed to the four IO blocks as needed.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/renesas,rcar-gen5-mpphy.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/renesas,rcar-gen5-mpphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Generation 5 Multi-Protocol PHY
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,r8a78000-mpphy   # R-Car X5H MPPHY
> +      - const: renesas,rcar-gen5-mpphy  # R-Car Gen5 MPPHY
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 5
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: mpphy01
> +      - const: mpphy11
> +      - const: mpphy21
> +      - const: mpphy31
> +      - const: mpphy02

These look like provider-centric instead of consumer-centric names.
Please add descriptions, so it is more clear what they are, especially
for the last entry (which should perhaps be the second entry?).

> +
> +  power-domains:
> +    minItems: 4
> +    maxItems: 4

Why four? (yeah, SCMI...)

> +
> +  power-domain-names:
> +    items:
> +      - const: mpp0
> +      - const: mpp1
> +      - const: mpp2
> +      - const: mpp3

Likewise.

> +
> +  resets:
> +    minItems: 5
> +    maxItems: 5
> +
> +  reset-names:
> +    items:
> +      - const: mpphy01
> +      - const: mpphy11
> +      - const: mpphy21
> +      - const: mpphy31
> +      - const: mpphy02

These look like provider-centric instead of consumer-centric names.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
