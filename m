Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5739F39CCFC
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 08:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857196; cv=none; b=ZkSdLT+pw1VAMIZ5PjLgAJ18VhIo/r+AcglIEbBchr64RIbnF63cu5c4iKqupbfYma0EHJsviQ6VNAnWSBJ3uofDcCuFtkT+xijZDeGMiG5X55AJkHfHBo3m/4QwdNRSHQFyW4x4NbmSxPdmGlIum9LZO8zJhPDMIB3+R80vt6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857196; c=relaxed/simple;
	bh=DaAQfNMDqfA4SiBqN/u9osdm8oWxv6NACh882Mgt+no=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r74jAeCJLJP270F3yvENCTusa8zx5WO+DQ61c1Mxxv4yruxlTHCzPAKoHOM9pw4iLkYxL71fGs0uEUnX/A/WWjwBUlcUrKEKMm2acC1jh8MfbRWjCui1vHG6EISrDdvwKMoPbec4Rv7K6f3UxY2dYv5btWPUEeKeL5p17dNvNr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso2024537e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 01:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857193; x=1789461993;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jpscs7JaPB6a7DSYaibBo7ovev0XT0EFpj0jxoPpShE=;
        b=bVOA8ExVnKBsQ1icLqFUmwx6KZS4bwcqJi1GLaYJdxWWj8mhkYVt59v3uWsHD2i3Sa
         C+Vs8eBhocGccKvgAyWym6Hd/Y2tws4m8yJ3yaLNHQdYe/N06r8J88asWCt1uofDfNuy
         C/7vk1UmakkMM8wvo0skMrXvJ5zOhnfjcCqROpJBoUk7QHzamQsTwkeW3CVlI4EowkQd
         3Af8Y5bpL8ceTJveDxLLOTP6EaTor8zVxqc07AOIir0FPqFaJeIXDBLAwjii5IndF45h
         svJYV3cSzWnQO+EB9FpoJ0ZrsbcNzn8UeXsamP49kiHDXHf81DS+TFPQGzUbY6RrlSE+
         rtTg==
X-Forwarded-Encrypted: i=1; AKwUvBydrAAy05vKAIIDZEzCnpLe9qvtSmozllYhAlCaufdkkXWPpt9MEumQodIMt3ct/G0AjY7cYnkBWPuos3Gnmi/xPw==@vger.kernel.org
X-Gm-Message-State: AFuF++kf1RzfoHnceM5AkE7okwzIvuP78oMZcA3suEmQnIcM2lukdEGu
	3782Orrb6uY9kml/So73zoxYuRbdpEaKYFkRdepsvEXw72D2JWzC3WbAkDtDU8Y/
X-Gm-Gg: AYBFou1qv3f3K64xt67V4dppTdK/jJ4tDbQlTn0yYYEMg8cehLo1qvk+aciivy9nN1s
	VVz5tLmxe3JcTNq6c4zIXDEPxcfAR50fRK9AkwWVmwvVCN7vQ5f1Y1XSjoG2m9X//YejbL4KBFL
	UdwEYU94thQZuBsr/wVYA8Hz2Y4lmpiP4GjHGHHYRwd6Gq8OiTuog92KvHx1oiq5K10mdBi5paz
	lpqI/XFvmU20t9q92tQgaHSMJF+bwC48FguH01auCWazYZUlHm21zDAzwX+0oXKruc47oHtqC5e
	FcVtW4JjivKTg0l2AIt7HGV3qCH8TITmw64sTAMFQPoKHtVI+zuIAD9ev4v7fcn3yyqqh2+Rq72
	nR6LMeKfywIAyc3jWT9nM4yX11wZIpoYYAQE65Yv/Gdj1JCoWQ4KRnEmcC6C6O4DSXGcjtktp/T
	xCPyLOiWdNVxNpIWF7gkqmoGrIDJkPv+pwGAETihRCM+nAMN7pJ3WgXPJOiRNTobzkV6YkN1Tn/
	dy/PhhfO3HmVybv4wVBT6GoOA==
X-Received: by 2002:a05:6122:4fa2:b0:5c7:c666:ec22 with SMTP id 71dfb90a1353d-5c7ed407509mr13028741e0c.6.1788857193025;
        Tue, 08 Sep 2026 01:46:33 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1097e5sm9479139e0c.2.2026.09.08.01.46.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:46:32 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97bf91b2e6eso924639241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 01:46:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxbBDN10yYe3t9WY6bWeCFN5FdoqS+lm0anHFcc04hk7w4se1ScpEDHyLtZ5j9asOLs7wpbZCopcYH7cGGSDw6cHQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3054:b0:726:cd42:d023 with SMTP id
 ada2fe7eead31-78a4aa3506cmr8542865137.11.1788857192323; Tue, 08 Sep 2026
 01:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 10:46:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpq170gW12KEzmf5cUkUfRQ-6Vj_hMyeGeUny_WUCohA@mail.gmail.com>
X-Gm-Features: AcwNN1U6U5lTYgv4OCUonWRRw758LHZnUmo8hmQI7dJ9Temn454yHA3PWD6OCBM
Message-ID: <CAMuHMdXpq170gW12KEzmf5cUkUfRQ-6Vj_hMyeGeUny_WUCohA@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
 update PCIe nodes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 9 Aug 2026 at 22:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
> SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
> and add msi-map into PCIe controller node.

I missed before that "msi-map" is not actually added?

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
> Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -809,6 +809,7 @@ pciec0: pcie@e65d0000 {
>                         resets = <&cpg 624>;
>                         reset-names = "pwr";
>                         max-link-speed = <4>;
> +                       msi-parent = <&its>;
>                         num-lanes = <2>;
>                         #address-cells = <3>;
>                         #size-cells = <2>;

> @@ -2148,11 +2150,22 @@ ipmmu_mm: iommu@eefc0000 {
>                 gic: interrupt-controller@f1000000 {
>                         compatible = "arm,gic-v3";
>                         #interrupt-cells = <3>;
> -                       #address-cells = <0>;
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
>                         interrupt-controller;
>                         reg = <0x0 0xf1000000 0 0x20000>,
>                               <0x0 0xf1060000 0 0x110000>;
>                         interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +                       dma-noncoherent;
> +
> +                       ranges = <0x0 0x0 0x0 0xf1000000 0x0 0x200000>;
> +
> +                       its: msi-controller@40000 {
> +                               compatible = "arm,gic-v3-its";
> +                               reg = <0x0 0x40000 0x0 0x20000>;
> +                               dma-noncoherent;
> +                               msi-controller;

Likewise, make dtbs_check: "'#msi-cells' is a required property"
And it must be <1>, so msi-parent above is wrong, too?

> +                       };
>                 };
>
>                 gpu: gpu@fd000000 {

I have already queued this in renesas-devel as commit 7fe73a3a3f2c3718
("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes"),
but I can still amend it.

Thanks!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
