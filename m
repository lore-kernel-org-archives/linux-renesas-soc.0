Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2F639CCFC
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857191; cv=none; b=JvdZWiyCuYt/BN7G968iaeb2f7rXgt4uXcyDyMKWA67eJ+Y0XHxESCLq1U7r51YJhTfNrGWdzyHcsy7cZ11mLGMr/spcx5jBSxHGtuwi4t9iGyCPJw5O+6fUmICRBV2akpL5XShhhqEqHgjjHzTZAXHXJApVKsdx3gKkGyCPTqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857191; c=relaxed/simple;
	bh=92gyEZZTnYL7xeeh6ZEwBFSKdx2055oIqu0lK/Rebu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/E/50dzAn3ygTkyefnEeUEZEqFndnk14NX3R5i6XJbbPnd3biwGYV081WtdDzZVS6dZcJesUv8S6G7Jz8VWJlt2WTJUl7pHzSYNRBXGWRLtZ1qsdFlcttaWvtfJuqeVdklAaZdplpGYm7XkBz/QIZwpNXppHUnri6xkRjrR2w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-789fef9422fso1189616137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 01:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857189; x=1789461989;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ApssUKPvTBDPBMVIhSzHAqwCbeQAa06dIhcXYuDQzKs=;
        b=djrQkzCP86wAxGd1uxuniuhT4WW5qwIcjFrSeuSIF1ihh5BX0kQG/P1y3A9C+gWpFC
         H3wQi13W3XDo65vRKK5h7VguK7lFlHp0OXEVFcgZ3q7Ec40HuPRnaFZs+QvrSZ/gg7wZ
         0iwnxcRv66EC7+YYBXUECiN7vN/oiz8XTpI7Tisa3Njd3FT5QTYVHcJErFjDVsznzBS2
         rtJh6EpfOSPvI8RODF+5pLL5CaJBGcZGdsaZhXES//8awWeHNmleASV5SpfR+/HntwQ5
         2jEhLWFwoVD74yUWkM9vwnMFbH+ICyIdyNfSknLSJTcOjRMa63Dwvde/HCpXgMIwLGI7
         Up5A==
X-Forwarded-Encrypted: i=1; AKwUvBxoKc4wwzXhj1BlgFYqLo8QlvPyygI4bzxBkx3waKMu1J19cfeANtKiFvn+n/RFIJuJAc4Rrrh8Enl5AaN7T8KpsA==@vger.kernel.org
X-Gm-Message-State: AFuF++laOmTP2vDTFFxj1Qnb09Criz8RJ2dbCCOsgqiOfwBdR5Tle2ES
	1dVogO6mZdOjTCIomr0oRepOe1qL/4YO1nODdxrIiUb2WO+L0F/VJArs61DIoLJj
X-Gm-Gg: AYBFou0UKYmmoV3zVv7whDxKkQPzmQfOwg0UO/F9uAdzCcDqBklFy5KihxfRTVK0y6T
	4UJa847hFCuUHyeqOqdr9Y2H0CsTIxN80Zy9oVomQyRcMJSsAEWwfee6FW+8QkVLzTtH/5Z7ITD
	gW7e2vT8wDUwDCFXzdLKVjYFZTG4hMqvJZjn91d358smour6bseDh7q9vL5hdBi15sm8GEryOmY
	ceNwqO/AbVC/AtfoDOi6sTnEAuvoEEm6GgdowngrtJ3fnJ4FjLsW3SDXoNAycMwjMKCtJJ2OXxj
	XlIhhgQvd7ymXu6lDGviEnESBsv9qdiiRZLxPsHY27YKPXAKBqfV0m32wsY6Kt2qWwoo4AcA0Z8
	ziHq1k4MSaIi+xyq+RNdfivSv0aBuTLwHGfGtn0XLp23sx7QZQ23YS/veIfaqspOk+0etNDPHKX
	wx+yGCa6PZKVoa1YROmlHVC95JeRsIb5UEhifSPJGd+3Seyyn9xTEatsWmXPIeZLLUbS/nJGqqA
	Y6NJyiTosPilJCPKmCNWpZbU0ax1w==
X-Received: by 2002:a05:6102:b0f:b0:784:b9ec:910b with SMTP id ada2fe7eead31-78a4ab294c6mr10622724137.12.1788857188855;
        Tue, 08 Sep 2026 01:46:28 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ae8dd2sm8482907137.8.2026.09.08.01.46.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:46:28 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c681c2a6a7so1651031e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 01:46:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBydQUPKiDmfTNEg00wLACuC3WnRfILbX7J/1Z4hnnCS1cII51ru4bbiKsuUwM8dt4JPE1f8KiOt/GsQSelsrGA4/A==@vger.kernel.org
X-Received: by 2002:a05:6122:e189:b0:5c7:a9ee:dcfb with SMTP id
 71dfb90a1353d-5c7ed3d6e40mr12626919e0c.5.1788857187476; Tue, 08 Sep 2026
 01:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906140134.492084-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260906140134.492084-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 10:46:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKr-2+_kcCd8hSB84=AZpmOtDt2-Dxpgiewyg+67O+fw@mail.gmail.com>
X-Gm-Features: AcwNN1X8I3PAUGIRvp1JcLzwLyyr5hfRt4h4h2_fZyfEgH0XnWVqbEIcNTcm87E
Message-ID: <CAMuHMdXKr-2+_kcCd8hSB84=AZpmOtDt2-Dxpgiewyg+67O+fw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779h0: Add GICv3 ITS and update
 PCIe node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 6 Sept 2026 at 16:01, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
> SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
> and add msi-map into PCIe controller node.
>
> The GIC ITS does have master interface to issue transactions to RAM.
> The interface does support cacheable transactions, however, it does
> not support shareable attribute, because the AXI port signals are tied
> to inactive in this implementation. Therefore, add "dma-noncoherent"
> DT property into the GIC ITS subnode.
>
> The GIC redistributor does not have cacheable/shareable, therefore
> add "dma-noncoherent" DT property into the GIC node.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

As I am not PCIe DT expert, I am comparing this to the corresponding
patch for R-Car V4H, which I have already queued as commit
7fe73a3a3f2c3718 ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
update PCIe nodes") in renesas-devel, but which probably needs some
updates.

> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> @@ -691,6 +691,8 @@ pciec0: pcie@e65d0000 {
>                         resets = <&cpg 624>, <&cpg 1121>;
>                         reset-names = "pwr", "core";
>                         max-link-speed = <4>;
> +                       msi-parent = <&its 0>;

This has an extra cell "0", which is probably correct, given
"#msi-cells = <1>" below.

> +                       msi-map = <0x0 &its 0x0 0x10000>;

This is not present on R-Car V4H (which is probably wrong).

Interestingly, Documentation/devicetree/bindings/pci/pci-ep.yaml
documents msi-map for endpoint node, so should it be added to the
pcie-ep node, too?

>                         num-lanes = <2>;
>                         #address-cells = <3>;
>                         #size-cells = <2>;

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
