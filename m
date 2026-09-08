Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F4F563FDE
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 13:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874296; cv=none; b=I/DT+RJo2SPDvlotxP1fGq3Ou6oXqQYc8HM83zdufxb09rVCZCCl48n8TYL3Vac3kK6e6tR6NHBF5dbNxVoZEdQCR4+en1pY0lP5nULNM/87lgFMunN2TjOCiPjhO9lZHBeq3clI0xOIr6a2K5zCUsIl2HGE3AeZhF4fTmmj/x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874296; c=relaxed/simple;
	bh=yu9OZgfKfzPNFzxIZHgRFCy5pcqiTq5Wq62oensSFpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=egC0IdtInJ4r70qc9Ljk8PKxINrMXX+AmNA/8pOsfGZjxYTuriqqmmvxtm7McjInXB+FQ4Ro7pzYxYj+fP1cgBmGfc0zYus5s/AQ0edYLWio1uGLS45mPSSydnlFKWI8CdqHEVIerWUOtCwvlNZ5W03Lw/+LMRlhapHv4yMfXY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e2e4ce9so368053e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 06:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874286; x=1789479086;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EwjnLI9Ep/r7gZDtAe178FX2I6j4lZ75aWazhYEJCj8=;
        b=PytFnxpoiEFu0UFZuVWJTvyEUvVtGFCe4HwVGin3Hylr+V6tDS2SCyT6XHpVl8WAYP
         Gnpf4A58vDpmc3UPy0P+f2nGb+po34As9dQUw1Ks7etMseSsUPwXTjVxrw/imvVInwND
         wXJNgszmsQnMi6mf83u7NX6fMConGO9r4QbXgr3lK+l4HOK+i1cPYaS75I1i3l0SbYCs
         V8DzhngR41/sj92A6MrVB4Iu4u5QdHw7lPF9AnrPRSmZlghSFPoduPgs/OcQaTP0HWXH
         N68neogBGnfuiKAqltciPQrjwQy6Tt8YFgp6YhaaqvUWNgyGaDVxm53cu0Os6dh37wiN
         Awtg==
X-Forwarded-Encrypted: i=1; AKwUvBydcV98mteaWdvW6Dr98RumOL6GaPtRyw3tapPJPLn6atFQy2EO7rej41l72XuFP1a8Q6E70A/2GkVgwYfQ0j5sRQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kYzCyLZjlycOHTRA9k9IslCP+7EhVmZtwpWCL91sy8/aa1ebl0
	rciXjuHsSxD9/RtiDo2VJhKG7olGJKlxevBf8fSlt6MqJAwqbf0Yt5R02fPhobBl
X-Gm-Gg: AYBFou32hzV3b6iwWCja4ntZ19yAoZGeMoKRUm30MPC789cPevKsYX81PoXyAwrMODg
	i/A6fxQGnN0dmViER3zCDKK6vIv0CzuSNNHlr9SQ/KHIdW5p4WePc85Cx9NlQWCZzUBQQsw+35k
	nQz7/QSMON/IyiUpvUm+cJBKP1E5wUiAUlYs50zaJkG5FUorWyEaGU+ydlgl16cEXbNWzwQFFdK
	GKZLex0oN5EJvVUmYyxnLZqLlk0wKlH+sI1w2riLv/ARyXxmVQodjBcD/kpW4UZuxju8X7Sx5Hi
	3avLBKjhSbyex9Us84tSbKuzCvCBivl6IUaul8PFAMKbGojr49snQ/ijnCbidAuGUExyM/CaqwE
	o6XyAOPvGWtgF7nUt14G48F4EycA9PcU/lEWZ/5OdRWpdV+Y+PcTpQgbWr5VCYbXipE5hIBImN+
	QDF58nhxxTkBMDDpJxQmpuEgUWbiNHibS8udNAxl0lGP1y4WEDUCY0JEab+aV/PFvbt+c9rMAV6
	/ZZ/PBryfuxkZF6FHdt+ChpHA==
X-Received: by 2002:a05:6122:3b83:b0:5bf:889f:e7da with SMTP id 71dfb90a1353d-5c81a8203b7mr2179294e0c.2.1788874286011;
        Tue, 08 Sep 2026 06:31:26 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec386599sm9697704e0c.14.2026.09.08.06.31.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:31:22 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9809ce25a29so2467770241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 06:31:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxHnPSsetPJu3LWegRLfxz+/wn59I5B6PJsggH5jGPbIcEgFvPIRCaRX1It29CjzozrGcn/jQcGTfIErMmoULpd9w==@vger.kernel.org
X-Received: by 2002:a67:fe50:0:b0:78a:5bc0:4b7b with SMTP id
 ada2fe7eead31-78a5bc06bd8mr4345758137.21.1788874281039; Tue, 08 Sep 2026
 06:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com> <20260826174854.199139-14-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260826174854.199139-14-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:31:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKpWtp6dXe_1qk+GuV-n065LjHNQBGGEfsOfVz9_T1+w@mail.gmail.com>
X-Gm-Features: AcwNN1UocVhmKEZQcX_zmxc5OTroh0qtOuTM2DsW1-WXkXKuXnRy_MiHk8uuF0s
Message-ID: <CAMuHMdWKpWtp6dXe_1qk+GuV-n065LjHNQBGGEfsOfVz9_T1+w@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] arm64: dts: renesas: Add LVDS overlay for RZ/G3L
 SMARC EVK with ITE6263
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 26 Aug 2026 at 19:49, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a Device Tree overlay (r9a08g046l48-smarc-lvds-ite6263.dtso) for the
> RZ/G3L (R9A08G046) SMARC EVK board to support LVDS-to-HDMI output via the
> ITE 6263 HDMI transmitter.
>
> The overlay enables the LVDS controller and the display unit (DU/LCDC),
> and configures the ITE6263 on I2C2.
>
> Update the Makefile to build the overlay as both a standalone .dtbo and
> a composite .dtb (base DTB + overlay).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0

Any chance this can be "(GPL-2.0-only OR BSD-2-Clause)", like all
already existing arch/arm64/boot/dts/renesas/r9a08g046* files?

> +/*
> + * Device Tree overlay for the RZ/G3L SMARC EVK with ITE6263
> + * connected to LVDS and LCDC enabled.
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
> +
> +&{/} {
> +       lvds-to-hdmi-out {
> +               compatible = "hdmi-connector";
> +               type = "d";
> +
> +               port {
> +                       lvds_to_hdmi_con_out: endpoint {
> +                               remote-endpoint = <&it6263_out>;
> +                       };
> +               };

No DDC?

> +       };
> +
> +       reg_1v8: regulator-1v8 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-1.8V";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> +
> +       reg_3v3: regulator-3v3 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-3.3V";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };

Any specific reason you cannot just reuse the existing &reg_1p8v
and &reg_3p3v?

> +};
> +
> +&du {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       it6263: it6263@4c {

hdmi@4c

> +               compatible = "ite,it6263";
> +               reg = <0x4c>;
> +               data-mapping = "vesa-24";
> +               ivdd-supply = <&reg_1v8>;
> +               ovdd-supply = <&reg_3v3>;
> +               txavcc18-supply = <&reg_1v8>;
> +               txavcc33-supply = <&reg_3v3>;
> +               pvcc1-supply = <&reg_1v8>;
> +               pvcc2-supply = <&reg_1v8>;
> +               avcc-supply = <&reg_3v3>;
> +               anvdd-supply = <&reg_1v8>;
> +               apvdd-supply = <&reg_1v8>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               bridge_in: endpoint {
> +                                       remote-endpoint = <&lvds_out>;
> +                               };
> +                       };
> +
> +                       port@2 {
> +                               reg = <2>;
> +                               it6263_out: endpoint {
> +                                       remote-endpoint = <&lvds_to_hdmi_con_out>;
> +                               };
> +                       };
> +               };

No audio?

> +       };
> +};

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
