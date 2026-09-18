Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C94C31328E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2026 07:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717918; cv=none; b=GzB8FZmv59TQ3BmMlWo3EGbOqk60e7fZVT1DkrUyBOBBhiiFyDR4OevlxYgzeOLWhC5dpmwQ7jhKjCWyY8KZOXlmYw4A4ctK+T/Vk0OXxz8g1rK9YNcSqoL/RReu/nRcKhJM498/E6/o6U7/2gryiHaKSumKYaULO1zKTC6k2Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717918; c=relaxed/simple;
	bh=wTlung53wgG0U6uz6ynHrcjwVaYOb0YK4Nvyasm8+go=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOVlP4gHq4NkUPgK62s6DkVxv03v8oQrkglKPpgNBJOc3/JgAvo81uiOB2bGOHaLVvVn3lgHlPnHgPXEj+8idjHUlC8at7JuLFgJ69St/3Dbctlg/BAEr6KOb8m5zSYc/zJQC27FNw9TK7btpmBeQKKUrUSiw97sZWZmAXfIzS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c2c08ff3f8so348864b6e.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2026 00:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717916; x=1790322716;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y+tYCkkvzZJmFoYOhTQyYw6fM+qA/usgZs/lU8fn+ao=;
        b=T1k1BIEKJyFla+wvxy6ludVPjjNQvA2R3Ukb66AcwumftTXZlVPoYwnwQdAMxogbEN
         hrSFoZ2/mjZDHnPzfAP4k+KOHAv68M1w2ZL4wOAh5qYlhaNgQKec64QYGyddc8zkKo//
         beCg/WQm1OtJI6bzC7DI5LMu3zjsoGhodw2wpch9tlz+Fx1NUVbQepMsgCe4bdun8T/4
         s9hfZlTNAWKGiCDAO+PTUMOSWbmTt5XOT4IC1ivaEVg1j3gUsXWSifpeVKoR+9rMiLq1
         pwCJx5yNDJg9JAaFrnM1tul1E0gsQJL01AwnaCr4OR9KbxlumLqVUscNjdaCJDsNNf29
         TXsA==
X-Forwarded-Encrypted: i=1; AKwUvBx2xeLj4cAJhpzcZYonnN2dwJZSyY/0bZvZlV7TqURNdwyxLaDVg2F2YJbpmxA0jfPFTcQVJgmxpW9syULl6XpRgA==@vger.kernel.org
X-Gm-Message-State: AFuF++nwM0r+05mfvtjwDGM6W8Ef5x8s3Dm3jgvYn4PKiENMTDnwWhzW
	kRa4xxbdlxC+PWuCECfcLvUrGpGVhCBuzb897BV8eR5+OUt1bXdmpXEVClK9hDJk
X-Gm-Gg: AYBFou2Y5om3YIOHmjG7J1VAOEMY7rVGGn1cv3h9WdE7bzmZcfzKvcXpGdSmO7Ox4j8
	Gie+ThCr4ofQMg3DjbLAGQtnBngrzd0DpCBmLcuhaEM+vp1fI0loTfFKbyKUX1O+VGnYur1/mgt
	mtdhTWXkXluwZW6RS/6+Dr/fncwiD2sleMR9wb5uXNrFuklurGNVUN+Z1UAuO3c3aBUHkm3uSmk
	RkIeX4HT7CY5gOGEcAPKIujFMPyyFCgSIcJjKUIxwZu2oEbIWci0GPFG3S0RzNE86Td1ocXfNfK
	O5gQ9eDz6jrrrB59/vZmltZ6UPaFq1+b1mippdKfwkI4n4vwGn5DbClI791n27997bsNOW27Rot
	Ndm/ff8ZutrCggJSYIFFsIcuY4141dm2+bhikdRKHXNJGaZuTfMWYSDeUmqb0nWuqYLibNv3kKC
	dHZRYWkMqIn6VLNRvdCGgnDvyQVe0ErObz51MfCaudEw4HIBrzd9ShjtAJH1WRFtHcPQAg2R8nq
	zetMUby4FyaBVNhL6gC3RbqrwBHVuxMDQYq
X-Received: by 2002:a05:6808:3087:b0:4b9:a829:f01e with SMTP id 5614622812f47-4ccf7df51damr2355919b6e.42.1789717916026;
        Fri, 18 Sep 2026 00:51:56 -0700 (PDT)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com. [74.125.231.76])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cd691976b9sm483773b6e.3.2026.09.18.00.51.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:51:55 -0700 (PDT)
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46a63c34533so514862fac.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2026 00:51:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzf5hzN0fiTXyvyR/ns+HozOcJYwdElDb6wmSG90gka1mcjcWM+mBNygfGXvR4siUnuKh2TbNKX2iUrzBfAymQuMA==@vger.kernel.org
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id
 ada2fe7eead31-7a55af2df71mr547985137.4.1789717606396; Fri, 18 Sep 2026
 00:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788338320.git.geert+renesas@glider.be> <1d5c56c80291e447208ac8777aaf90ad6f0a4f4d.1788338320.git.geert+renesas@glider.be>
 <20260917221647.GA4038349-robh@kernel.org>
In-Reply-To: <20260917221647.GA4038349-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Sep 2026 09:46:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCFY7-SEGLjhaO1uCDwsvogc0ocdqSz=1C_gsWX6T_tA@mail.gmail.com>
X-Gm-Features: AcwNN1XFZho-l6FTtqXfFYSmbjO5DpuymjytNtvp4sOSdCdr5EidSrnlACqjwyk
Message-ID: <CAMuHMdXCFY7-SEGLjhaO1uCDwsvogc0ocdqSz=1C_gsWX6T_tA@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] of: property: fw_devlink: Add support for renesas,scmi-firmware
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Fri, 18 Sept 2026 at 00:16, Rob Herring <robh@kernel.org> wrote:
> On Wed, Sep 02, 2026 at 01:29:20PM +0200, Geert Uytterhoeven wrote:
> > Let fw_devlink create device links between consumers and suppliers of
> > SCMI firmware on Renesas platforms, and enforce these dependencies.
> >
> > This prevents probing of drivers before the firmware they depend on
> > becomes available, thus avoiding unneeded probe deferrals.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3:
> >   - s/firmware/renesas,scmi-firmware/,

> > +++ b/drivers/of/property.c
> > @@ -1417,6 +1417,7 @@ DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
> >  DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
> >  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
> >  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> > +DEFINE_SIMPLE_PROP(renesas_scmi_firmware, "renesas,scmi-firmware", NULL)
> >
> >  static struct device_node *parse_pinctrl_n(struct device_node *np,
> >                                          const char *prop_name, int index)
> > @@ -1574,6 +1575,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
> >       { .parse_prop = parse_regulators, },
> >       { .parse_prop = parse_gpio, },
> >       { .parse_prop = parse_gpios, },
> > +     { .parse_prop = parse_renesas_scmi_firmware, },
>
> This is going to be a catch-22, we can't have vendor specific properties
> here. If we need this, we need to come up with a distributed way to
> declare them. Linker section tricks is one way. Maybe something in the
> driver struct would work?

Quoting myself:
"I still think the vendor prefix should be dropped, or replaced by "arm".

> Can you just avoid a property altogether? Why can't you check for the
> presence of SCMI at runtime?

A system can have multiple SCMI providers, so
of_find_compatible_node(..., "arm,scmi") is not sufficient to find
the right one.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
