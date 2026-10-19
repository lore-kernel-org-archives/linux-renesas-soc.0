Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427874;
	b=ifnsFgQBtROZ7jO1pi01jaFrQ1RMxyZVZ/s6WtXdC+gqtPTelONcz/9gLzq4LfhkfG6k
	 uOAePE7gRXuBzQpPBvvgU1sDuKMeyPEVSWe3JYxF7xkf/zBpvtbJtCe9JqBU2f3IBnt4O
	 rCeAdVWZlKl3cnKnENKgAljA3JJfWye5OUHsax9YyJooS0cTjwZ1dDthG1h7AVUNSqyh1
	 4NVlwNIRr9jq7Lf9i4Tr8DQgrAIXVEZN7xniePpXIzOXEThjSaTaVKzQfi+DV59uQyFBa
	 E8SSyUaQ9Gc9sKXFc4L/QDHiPCWL8a8HTuboirqYNhA5osSiQkhdnVWD1povja40JqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427874;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=PmiGcIdjfKIGHCu1gzOSxutdw7IHUOocB921VJoVgxA=;
	b=LjRQRb85nEUW87BIiBBT6hFHbc6wIvDd4PtZdO+79MRlYw7iZeZbKmtfAMW7HRxE6mbb
	 Nve89WmhlrilCCcmCYMF0p7OX1pM6G8yUaAxKPZR/nFvDgKXviQ0Cat41dXsB+X9AmXXM
	 o7VEmF6NmjLx+gq317Aqrqf33hoIbMCw3/Ox46cKsVJNrdj9t2G+WmAgHlrhumaN3EFou
	 xLQr+9BPQDgKh9fHGO7O5E0Jo5kihCTT6L57sXIWbj1rsj0MkTUks7QBRpFLiEsLcG7oR
	 paWzSlWniqAfZbJMz2iywu4zH4Wht7GlSvu5XnsrnUbv2ngEE2q8VjZXzbdqvkFcVhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68320606A31A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 16:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68320606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so263569966b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 09:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427873; x=1793032673;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PmiGcIdjfKIGHCu1gzOSxutdw7IHUOocB921VJoVgxA=;
        b=pufCFZoSUJgZ2zcALcJPSSRuH4RYj/KsjWLr8z/E3pcWEyt4qewqLLrspezCoHzUDB
         qLb2Zs6qrsW1dXE4rWTi7LF+hXIDbIOqvJTF4TS6/S0ASqTQWZwedCFmGPd5c4jBbKNX
         XKEwYG9NMzkp3OsMTeCHfY1ZUd2pzcV2Z0NaYX08bYvf8HKilHU/7PCn4+FiXkW5figz
         ibeDakAZ+1XgUaU3EUncjOVJqZcBEQnN3QkXqtykU7bcfv2QVI0p4iiySv0mYXqp8AGl
         OU4lvFnKufC9qnmzoA0HWiuggnnKEJtz58PRTcrN6E16X4oyEa+piiusQHcn0OSfEBIu
         RJBw==
X-Forwarded-Encrypted: i=1; AKwUvBxg8YpY+HZ6Twn3psuHdG1tEd2wSuz8ZtXnV3kUtP0JzNMmkv1IY9EQX4l8SYBdC2FYpVbArYKnxUpz6WvzYNmaNQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL59CCa6KiGTk0HCHjnjcJmKrpidCPHRRplcI5i5E63K+FqSUS/
	J/8Pcu1kSgmQr5DJvcpTDHggmPSMOagGfy8c7RfMbNkEIMaWWK1IFbC1stnuIle/xgY=
X-Gm-Gg: AYBFou0Id99dS7z2qhYeai/3uceqvthCQS03cKIQVjpT5GYB/pLW4mSmSrc8L0j1UMg
	CZQPLsc1HaC2L5X//ZfIAK8QMVYR9h0Qh0tE0ADLHNQewwmSykyf4oAH6JuvOCxWsE+kSrqkpgs
	4U0JWGUlAwsAZe80704sULy/HQJrTnsvD4SdQJpU0tKwkBl0Vs+apWZkER43cHJh+CLGDFT0xcf
	/FYW3yntCCbTDFQg2ruaKB56jmEN/FgBJJ0P6UeudbQO44uZxdDiSzZeR0l8uoraIGkv1dTQFsJ
	4DC1NlmM+DCOA6NkrJwAFm3UOo9NlSOss9Wt63cIeCQbvuxuA4EYsGabCwiziTvcVAM+IvIZT2g
	J1N9YdKUwwEXVViUBMzOMfD1tgqLibL2USflXXpPL+llgXzsE1VDU80rUx8VHSNmmEqutVvtEb1
	kwQrrv69fVlQTezbJyBXoDxYu3dzHzDaaF2uu+peu1SYh1vMmMfJ0r62KTkG3InRx8ZHSdjVCYk
	gVXeYkCTecR8g/sm98tOv+EA5TR5KMsFaf6
X-Received: by 2002:a17:907:9720:b0:c24:6f60:3f7e with SMTP id a640c23a62f3a-c419a846304mr618537066b.2.1792427872702;
        Mon, 19 Oct 2026 09:37:52 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd3190sm393105766b.23.2026.10.19.09.37.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:37:51 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so263563066b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 09:37:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxqZz3ePXJX8FB09zt5bx+SFVvAlNdLJheeGUgv4JfeQMeNi4SlU70ei3f8imqwKC+cV/hds1z0ALFr2SQrraVSxw==@vger.kernel.org
X-Received: by 2002:a17:907:9605:b0:c3e:ee86:d2c with SMTP id
 a640c23a62f3a-c419f31c8bamr564444366b.27.1792427870527; Mon, 19 Oct 2026
 09:37:50 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
 <20261019144256.GC763679@killaraus.ideasonboard.com> <CAMuHMdWkAvkxHkzRVviF_NkZHP7UeCBjebxciE6jFN_8ViM=aQ@mail.gmail.com>
 <20261019152203.GA5830@killaraus.ideasonboard.com> <20261019161436.GD3705@killaraus.ideasonboard.com>
In-Reply-To: <20261019161436.GD3705@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:37:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRvguzV+3CpOfkR+b-a0p5TrmUUF1fV0kdafXuNLV1oA@mail.gmail.com>
X-Gm-Features: AclHuK-8scCJz9rF32kL_0712rSWvXw0tvi_Wr1HURn1pKiiIZROkb3-2ONTagY
Message-ID: <CAMuHMdVRvguzV+3CpOfkR+b-a0p5TrmUUF1fV0kdafXuNLV1oA@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] clk: renesas: r8a78000: Add clk_hw to clk_map
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 19 Oct 2026 at 18:14, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Oct 19, 2026 at 06:22:04PM +0300, Laurent Pinchart wrote:
> > On Mon, Oct 19, 2026 at 04:56:28PM +0200, Geert Uytterhoeven wrote:
> > > On Mon, 19 Oct 2026 at 16:42, Laurent Pinchart wrote:
> > > > On Fri, Oct 16, 2026 at 05:55:40PM +0200, Geert Uytterhoeven wrote:
> > > > > Prepare for mapping to other than fixed-rate clocks by adding a clk_hw
> > > > > pointer to the clk_map structure, and populating it up-front.
> > > > >
> > > > > Move r8a78000_cpg_priv.fixed_hws into fill_clk_map(), as it is no longer
> > > > > needed afterwards, and drop NUM_FIXED_CLKS.
> > > > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > > > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > > > > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> > > > > @@ -16,19 +16,24 @@
> > > > >
> > > > >  #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
> > > > >
> > > > > +struct clk_map_in {
> > > >
> > > > The "_in" suffix isn't very explicit.
> > >
> > > I can add a comment...
> >
> > How about calling it clk_id_map ?
> >
> > > > > +     int dt_id;              /* DT binding clock ID or -1 sentinel */
> > > > > +     u32 fw_id;              /* FIXED_CLK() ID */
> > > > > +};
> > > > > +
> > > > >  struct clk_map {
> > > > >       int dt_id;              /* DT binding clock ID or -1 sentinel */
> > > > >       u32 fw_id;              /* FIXED_CLK() ID */
> > >
> > > BTW, do you think it would be worthwhile to reuse clk_map_in here?
> >
> > Possibly. I was about to recommend just using a single structure and
> > leaving the clk_hw pointer NULL and unused in .rodata, but the memory
> > waste isn't very nice, especially if we end up with many entries :-(
>
> Actually, you could even turns clk_map into
>
> struct clk_map {
>         const struct clk_id_map *map;
>         struct clk_hw *hw;
> };
>
> It should consume the same amount of space on 64-bit platforms. Doing
> the same in the MDLC driver would save space.
>
> Or, if you want to save more memory, you could drop clk_map and store
> the clk_hw in a separate array in r8a78000_cpg_priv, using the same
> indices as clk_map_id.
>
> struct r8a78000_cpg_priv {
>         struct device *dev;
>
>         const struct clk_id_map *map;
>         unsigned int num_map_entries;
>         struct clk_hw **clks;
>
>         struct clk_hw *fixed_hws[NUM_FIXED_CLKS];
> };
>
> where clks is a dynamically-allocated array fo struct clk_hw pointers,
> having the same size as the map array.

IIRC, I considered that option, but rejected it, as I still hoped to
put the (at that time multiple, per version) tables in __initconst,
so they had to be allocated and copied anyway...

> Too many options.

Hehe...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
