Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495448;
	b=Bq1DivSv/aGkySYuEyA/gF+zseeh4zpkazW06UaIkcoA2tZlw5c5Fj0c0KZyL0ETSxD0
	 ImfhDR7yX5x0UsF9qt3tNOnhbIQdmv4+iq5B4WxcHH+Z3ZT9SRM5xJEUaMBREzYd21LRm
	 3ds+4G6UqpJ77f8jZYbGoWn1Z60sG+o51oEpTbRga9F7zLLWV6vL0ISuGtSuHuOY3FG1/
	 8df0Fa/iyupCRvA1dcUIgESf+Dsq9Dnn8Keb/JBcbrcBrB2aOgckI3QdUuPl30Ii/Iu+x
	 Yz+TaiXvsuK6o392ULdy9aL++gy8qMA+enDeeNBKVs/qZGwZxqPajgD7hKyQ5t6BppQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495448;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=mS1ut25pAkhX06KpI5+b6SzLMFwF8RaPMcofkkPb8+I=;
	b=5aBLrKinfqB9PMZXK/OUIoJ1Cu1RuQHPix9Iqlt7T08KOwdFdPp8sHPhlsANhtIh7kA5
	 kVgpppw7xr3P5HoJc742hQj1XFgcHe+kiXj9JgkulXCKJT1rM8vCUP8uRn9bs+RVj7ljO
	 RQDMScWMVm+du5f2zErxeHJhYLMwrEsnhe0Edn8P41JCbKLws+TthbEzFiyn22JxG9DWU
	 qusyqQasaRCrSQJNnoyLQ4Hfo4bimIg7TWdxUMo15IjFYymUzSy4bb61UV/pZlp5pau6k
	 EHTGFVncc2qny76IAgokdEF/qmsiL/7+540Fv3WYrNv4iJ9PsAJO2rw2dQA5WNYNFDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94B0606A33B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 14:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D94B0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so2238821241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 06:57:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495447; x=1795100247;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mS1ut25pAkhX06KpI5+b6SzLMFwF8RaPMcofkkPb8+I=;
        b=XElb/Cmg9UM9SWgGtbrVAv2MpDiCuLc3Pwk+lBDH7VAu1AnSfUMezIbBPvSv7q8u4K
         e7V7IOpsoOJXJXM9vr/+cGjBSG+dWtiwk6MYNRa+5tsZ/BJTiyqyEu51jfGVnsDAKCwc
         RrAPvSbtVVfq4bRAQvWqeX1jEEAJ2IzNqRipOmoyNhACYfHhXECAb/a9dil9o6EeK4u9
         R1G/uqWOiOLwI6YAomAKvhcfwwiWElfaVqOczDK9t9kEvLPod0X2NcFK+MQ3z8vXmq6S
         OsaY+kvY/9LkbFhPLikEaxJ0rp4D2vG6CO3qQ8LhAcVMN3/So0bRJCU9mT4ME7UfEjTV
         xquA==
X-Forwarded-Encrypted: i=1; AL+hErFwmuyGDLI72d3NIh+QYA7/eou7QgeFjoqF+no2SUSFUkohRNRGzzboTa2QiG3IzGxY0vJRE9SyrupeEb1NNt0Zdg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+4by2k0lj7ymlRFYTuah01iBQJR8vUe8U/LLRHQBblA2pOO7Ab
	XEWlsH+MSbXozSxQ0smobn4rsMWFcWfWT7Iy1gBSXT66FlkUTqs9pKfnIgvvYSF+r8w=
X-Gm-Gg: AYBFou3PfHNTuOzAQHxnkMAyNqm4xuzMdizdK0BfKC+4rLKAIw/K2J6oawjYG9IzNUs
	GRzjWQ3oE73oJ7uEXYsOqaO8B0W7KXoCqMTbNQSbODpYUFlUljmYdZTtcT3wEHnm2FO/GOkSEzi
	gagdhQBAcLupSRnHdFF+qnz342UGgamCTQ1B+n5fyrOsbd37qE8b1klpcgDs+/aQv0wvJbsYxBL
	VGKBDJUN6aeeh3W4tfbZ5JlGWw5OAi0TLrJg8fVa79nELjIshs4HVQlSSElY/y7whvaXvN+ijG4
	BlfEjzrn1sGmLtyZWOyh3SqQIlkSsQ48CnB8ldKGT2rk55ZnD8APzWDpT8OoTzPZEy6fEyHuV+L
	0JHEwmndO/Bt1NLh8ph0RGeB0OLPZxjJBOOSgHaTGZIdM3XhzE95Tu27xz6CLdCKdsfdzlFKHgp
	wxfNBIz8pm4hy25uesRqD+du9zAE8+5SqEl21X7T7yXoIyX8na22PQvWlBgJAIElm7HPmxB2IS4
	p+IkBW1HjXoSr0Wmh+3TFy3aSiVMPmntUtVDXVVPhqkmwIxK5uueWwE5oJ3l/PnA2VZ9v29QKUp
	UtTJQivvg1+WlHdZ3iKvIV34QO+EO93P4lJhpCgs3xZb8SZa0uin2TBXUx8YdBrCnhs=
X-Received: by 2002:a05:6102:512b:b0:7d2:c786:5a95 with SMTP id ada2fe7eead31-7d4fb2a5924mr2500144137.13.1794495446898;
        Thu, 12 Nov 2026 06:57:26 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3245d9bbsm75091e0c.11.2026.11.12.06.57.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:57:25 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-990703f817fso2115357241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 06:57:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEQ3yDxAEIm+RP73KSDaf701yl+1Eai0MHpVS3celsMi2xPm3atSbjhe2buX1obKRVdx5Qju7cNa7gefXtedAHGAw==@vger.kernel.org
X-Received: by 2002:a05:6102:f10:b0:7c3:9982:67d7 with SMTP id
 ada2fe7eead31-7d50609c9damr2546296137.16.1794495444511; Thu, 12 Nov 2026
 06:57:24 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-5-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-5-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:57:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUvhf=zEmd2tfodo7zf1hh9n8m88Okk7KZpq0n=mDR2A@mail.gmail.com>
X-Gm-Features: AclHuK_otbzgK2u3WYfd1DmRW9SD98NHgBcVxYwHNEPtms-IkWdgisCPqESp0Ec
Message-ID: <CAMuHMdUUvhf=zEmd2tfodo7zf1hh9n8m88Okk7KZpq0n=mDR2A@mail.gmail.com>
Subject: Re: [PATCH v4 05/13] arm64: renesas: r8a78000: Add FCPVD and VSPD nodes
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:35, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> Add DT nodes for the FCPVD and VSPD IP cores in the R-Car X5H SoC.
>
> Use the SGD1 clock as it is likely to be the clock used for data flow.
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1574,6 +1574,196 @@ mdlc_aon: system-controller@c1338000 {
>                         bootph-all;
>                 };
>
> +               fcpvd0: fcp@c5010000 {

Please preserve sort order:
  1. Sort by unit address,
  2. Keep similar nodes together.

[...]

> +               fcpvd9: fcp@c5019000 {

> +               vspd0: vsp@c4800000 {

Do you want to sort the VSPs within the VSP group by unit address,
or by label?

By unit address:

    "vspd0: vsp@c4800000"
    "vspb0: vsp@c50c0000"

Note that adding the vspd* in a later patch than the vspb*
means the latter need to be moved in front of the fcp* :-(

By label:

    "vspb0: vsp@c50c0000"
    "vspd0: vsp@c4800000"

> +               vspd1: vsp@c4808000 {

> +               vspd2: vsp@c4810000 {

> +               vspd3: vsp@c4818000 {

> +               vspd4: vsp@c4820000 {

> +               vspdb0: vsp@c4828000 {

> +               vspdb1: vsp@c4830000 {

> +               vspdb2: vsp@c4838000 {

> +               vspdb3: vsp@c4840000 {

> +               vspdb4: vsp@c4848000 {

>                 fcpvi0: fcp@c5030000 {

Shouldn't we keep al FCP nodes together?
Same for the VSP nodes.

>                         compatible = "renesas,fcpv";
>                         reg = <0 0xc5030000 0 0x1000>;

For the contents of the nodes (except for the renesas,fcp properties,
as I couldn't find the VSP<->FCP links in the documentation):
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
