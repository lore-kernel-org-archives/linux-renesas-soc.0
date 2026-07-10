Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8522410D32
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 11:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681376; cv=none; b=BJBKq+INAuRbW2mv10nmkB9/gL/pGuEk4nLaVidN3rZKk4ptnZE6lCbeuf33Y4o7aAbQttIhtA8PkzlDAUmzH6AOGJyi4HO1LidQySyU82XQol+2T0yVcrC5d79MWWv1JSIQ2SShJkznc1uP7EhiFcM8drZiKUkkvbL78W32hq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681376; c=relaxed/simple;
	bh=TAoC8AtqfvyrcOiH125Z48ckCbhqCjSDAUjYBMGFx+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYJSDa/o8st1gnoHwNPr+OVzFCekpjHWHtvzLd/FTulNCdbaJ7Bc/RN1cSglIMshvSFY/+5AX/qPIhNu2sd7O/vOpGffFAV/O5b1cf2u8x1SopIA8KLjPsjS8klT2Knouo5prGm+A6iSugG3QdsYlRbgkXM0b+6hwWSxljkIKJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-726840fb461so202785137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 04:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783681372; x=1784286172;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MuUmGqSSA58rP0nRidv37IIoymAVqS6FDOb1XQHbyds=;
        b=XA6c3/ubhrLY7cZ1lx+GchfwqPsEdCDwYxgO0Mebxzwlpsdedrnf5d63zUolPapIlp
         xqBEu6Pw9PI5hwDxDdyYbO/lBl1n5u0+B0wSLHYwNiNEUm83OwPDr7d2TVI/g6SPttDL
         87gxtFmgcBdBvDBqBvw/9zwzCEQFOM8k4n2btk9f7p8sEHveeazT1IpZyke/UT8HdoyQ
         dwol8jQmHDgOZ9z9V+IDw09anFkIxAT/FjuEvi5e2PhosusIjYzHVDdkxEP1YGGXj9PF
         OVBcCwk9n2WvVw7JwZrBKMLurqzLMN9ZNOpAPo8BkNbUr1Rl20fFMwu8drCUkF2N7pK6
         zjvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfMd3hAOyKUVmcrzskbq9Zf07WAJ2ntQb4a0nAeTtKzfOKWpK1Ace0/gGGdMnIKA2Rrte3AlVuTj5oVXP+ltpVJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCTlRyWh5psJQByQfN5IxxSIGE3Dz4cu/0iMjMo2GT4W6Rbluy
	9nqlFSeM2WC3l224RJzU9ZyUOBVzug4/B/A5cDCzEFf/UbKo3O72s4+pv9i0c2C7gjI=
X-Gm-Gg: AfdE7cmwhPa7N1IjM3e/NXIUBUyFHwAkPWFVKGAxKlGyULYhPdNxHD7rmpoWVHHqJFk
	1jKsV6G8sJNKIV5UsQxj/NNVT3ljY+9KNU3G6UuxscaB1bt+28i1oBs1Qre2+hpZPqrS7ERlzWL
	sQ4H8WummfXpaDtgvwOI+wfGpm3NfPfE3wI6MBj5T8tCsPqcWlmbPt492cRgh+ePirdpVS6OPF/
	dt7Rjgq2pmgKqTxdaghmOcj6qRNUN1NJbf+CEcz5Bb51SwIi6p6S9Fg0Ez0m2oorZf40WVu6qCD
	zaFW3S+ohb1FxQYoX5wki5X+ZAPV92CEcHeC6brQGQXEsOEGhUJ2VdQ/uVMxaH2MTmPcE2GPUl5
	bJAreux5tES22yoT0HAPrT9FZ2Gy4fqgFOOOTzWbg1WDcPSNze6CBZUMp0uJZPw3z/lbjASQxvc
	GudLbw1Ny15dqSM3czeFjFsN4kzda9UXKtvxWrGOyWxQTxonRBCBcsbesDrgTf
X-Received: by 2002:a05:6102:5e93:b0:738:5853:fe7b with SMTP id ada2fe7eead31-744e04524c5mr6104434137.28.1783681371535;
        Fri, 10 Jul 2026 04:02:51 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6771d49sm5313435137.0.2026.07.10.04.02.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:02:51 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9690c99c917so242241241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 04:02:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpRYOT+9ZTplhvPIWKu928+PYZvSJUTz1Sfbiuya76odRimsruyas6982b54MAppsQn/phPE2PXjtpJTtzjwj1pug==@vger.kernel.org
X-Received: by 2002:a05:6102:5789:b0:73e:9fae:5844 with SMTP id
 ada2fe7eead31-744e0426fd6mr5821388137.27.1783681371174; Fri, 10 Jul 2026
 04:02:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll>
In-Reply-To: <20260710-adventurous-burgundy-chimera-b2fff9@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 13:02:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
X-Gm-Features: AUfX_mypDnJ4qFpPLK-a5R1Mbwkbc6yQr178xDsRkCp5yARGuoX_7FuK_KFx-r8
Message-ID: <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Fri, 10 Jul 2026 at 12:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> > Add a firmware property, for systems where SCMI must be used instead of
> > direct hardware access.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
> >     Pulse Generator".
> > ---
> >  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > index 4e23bba334382346..fc499e7cf52e4f0c 100644
> > --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > @@ -35,6 +35,12 @@ properties:
> >        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
> >      const: 1
> >
> > +  firmware:
>
> RPi is doing similar, but I have doubts. It looks way too close to
> generic "syscon" which is disallowed.
>
> I think this should be vendor+purpose specific, e.g.:
> "renesas,scmi-transport" or "renesas,scmi-firmware"

The disadvantage of a vendor-specific property is that there are more
cases to handle for fw_devlink, cfr. "[PATCH v2 02/10] of: property:
fw_devlink: Add support for firmware"[1].

> Also we have "firmware" nodes, so this might cause conflicts in dtschema
> validation.  Anyway, the phandle itself is fine for me, just the naming.
>
> I'll ping also Rob to chime in.

Thanks!

[1] https://lore.kernel.org/de34ac0c52695d92c67cf950b3d8e9b30095d305.1783505329.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
