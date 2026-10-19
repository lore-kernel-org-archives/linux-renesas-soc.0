Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426970;
	b=u1QDs06YciFMbwWOhK1yo1sAonSGZZ4pz1DeUfgKgWlDj06L7eWZMs9dfrKGqA20cOPj
	 hUrodHqXHPd59w23t7safVnCLaBBupoMQ0sqtBJVwsq42W319SS1kWZ7HfCVFB8vNe0wk
	 UYjvIjC1F0TOFnRkcJZg44ZGPHoUbXw9Hn5dA2/f3hThLPBXMy43gAEYlkvzwrVsINSMF
	 I4vLPtuA71WSw0wuiXjLnIKgImaMDmEDZKMjsxcLtV9V8k9e79CN9fYfNAXFpzYXpTSZ0
	 2GfZhBgz+V41VbT+ney7ZCfgktVgTiqoENxoY3ElCf5bYUjof/83tqC3zh3fZbYTExg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426970;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=VNVvlFmAYqdL7e0NbR8n4mhG40CW5PlDGJg9XCAnokY=;
	b=TEdevWd5Z058Of9auoZC8ItFBr5WsQNGXqtAhHIMJ96lazWJH+TpwzLUoL3SGVYMSsGu
	 13LJzSyE3U0yNxr6FCKlpZCJ7vdvmQOX3ONelMxkEzh7Ktgo7xH2XlTKuiPFxW/N2aAv9
	 /NRKnzJn6UmPTSXptZsPfwvBtErVP6D+deyhqxhX3lV0Mj3S/AjXIzlpVmg/jwIgoKIov
	 zmFQWal2a3Fi249FtNdx6GOsPCKpy+UPXjs4/3BmDiTYUIAtTK0fwe0SaebJU9U/ot4vD
	 vSdJVQwBS+CNzYjfDmQz+3qVefQdVOnTnmp94ZN0W+Y3e5PIMroATW5qKc/UuH7eBSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924B4606A31B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 16:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 924B4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b8b3c8c4bbso995639e87.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 09:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426968; x=1793031768;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VNVvlFmAYqdL7e0NbR8n4mhG40CW5PlDGJg9XCAnokY=;
        b=cfVeXNvpsdN8qtjo0D6q0ydjWiGuXoVdSEokUZGK3FWI5flT7wiuRHfDuXlhT5/Qea
         NRtRJ7Dq5zojsvx/rAlHeIrdXGbuGEpTlrkDqs68QbRATYkqVw3IHPD0aRZvPyE304zU
         xeJULXS9sQdLmcfIwGQTMGHrDc7O3v1DEXCQlche+z3uktHXNESbzQVO9EWG0HUnnEH4
         WPTw6sVkxzSmvjfOIq16sC58+6buc6VdCXZ3dDOzHpc0y2Yd0HhV/X6BIR5kW+BErfpk
         /a9z4tsgEYgH4BCAJUaUVTm5ac/7uuAAnH6L0y23kamm3Q2iYn0Q3lKCzGvyvYKvvKJO
         N0PQ==
X-Forwarded-Encrypted: i=1; AKwUvByEiRFdL3ZjXg3szUS9/TmePCATCc44c7ceoGqMM7tm9qJsq3Pv8gORmhP28jiNUNdFjnVenj7RhjqLm2asS6b7KA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJc36xvkTzyLxLACJCtd9ojmRyumCg/cetnUtVkjyhBy8lzOGkf
	esCxIxd8Tj7yJYwnSSSf7+yFxvAnMWcELpC2Z/52B4QQZzS4JLqTf1jbwqKfV97KtoA=
X-Gm-Gg: AYBFou3cQeKhMM2lmN6jcTTL17e2a1HnshqddHKO+wmTZWn78JGWGRF3DGRhSr3t8l4
	I6H02KFubeunUiOiT6K4nQKEyizA1ssBDLafGqgBg14yb/ZoXnxh+xn01mQC11BnIidSDL2hbHr
	G/f4qfyRsbhsii5n4fpbLhMdIyw1Erpn1HqkM1qkxWYrO9cKk0k87IaT3nVjDDvZSFESs22f9cs
	WDEogzPA8TkietNVipP1KTxxh9pYUIcYWirqWxWqXpE8Pa60vvrSFvIZEyeGHjRgeA0gc66zkpo
	/0eSR8JJ6j/ghjJ3K5Nxe/Kpg6+1Z73YowEJWw7hCdwV2+A54c56FBR3KHvJRl0QpluV/YQEYNU
	9Oy/g0MgEl2EPR11g5Nk3riwXaVIJqdWj7eNyPS47KUZg/006DrcW3+U3H/Yt5Mwt42WeG5jSIS
	Vpo9TpgeGys/Sfi5fJpr0NNW99Cv2dFoc8Ec/tACa36m+vL4BxJCRYG1y1awA4XJk8cVvQO+K15
	3QMKL3BoGyq46G0XWIHs9ROvQJdZvMlVByGoICGSwHSg8qAtnY=
X-Received: by 2002:a05:6512:3f14:b0:5bc:e430:9c8e with SMTP id 2adb3069b0e04-5be509f661emr2224245e87.2.1792426967385;
        Mon, 19 Oct 2026 09:22:47 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a3fcf07sm2084785e87.3.2026.10.19.09.22.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:22:46 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so11452071fa.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 09:22:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwPUo39KMxT1aJJEwnXXd8UQravel1i01p2HLGutVTkgRNyeuMUJO1MSFLue+jKHJoOIgu6Hw0iQbfl7hifrX65Pw==@vger.kernel.org
X-Received: by 2002:a17:906:99c2:b0:c41:825d:ed8c with SMTP id
 a640c23a62f3a-c41825dfa20mr602336266b.26.1792426550419; Mon, 19 Oct 2026
 09:15:50 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <c38d744c09dffff550a9b882051c211b572b8daf.1792163045.git.geert+renesas@glider.be>
 <20261019155619.GB3705@killaraus.ideasonboard.com>
In-Reply-To: <20261019155619.GB3705@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:15:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDgc+NMFQ2HgkngsvyhVd1+yEgnk3DQpyVmVUQ_aLvEA@mail.gmail.com>
X-Gm-Features: AclHuK_Wqb_TY8SIlHzico7Y9pGZs0pikimfidJslyUcM_WsFGAezgyxmzAMr2w
Message-ID: <CAMuHMdXDgc+NMFQ2HgkngsvyhVd1+yEgnk3DQpyVmVUQ_aLvEA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] clk: renesas: r8a78000: Add SCMI remapping support
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

On Mon, 19 Oct 2026 at 17:56, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Oct 16, 2026 at 05:55:41PM +0200, Geert Uytterhoeven wrote:
> > Extend the Clock Pulse Generator driver for R-Car X5H with SCMI support,
> > to remap DT clock IDs to abstractions (clocks) offered by the SCMI
> > firmware when running on a system with SCMI, and SCMI support is
> > enabled.  Take into account some peculiarities of the current SCMI
> > firmware implementations, and fall-back to fixed-rate clocks as
> > replacements for SCMI clocks that are not available.
> > Support for bus clocks used by serial, I2C, and SPI devices is included.
> >
> > This lets us avoid putting SCMI IDs in DT, and allows us to use the same
> > hardware description in SoC DTS for systems with and without SCMI
> > firmware.
> >
> > For now, it is assumed SCMI clock IDs are stable, and match SCP FW
> > SDKv4.31.0 and later.
> >
> > Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c

> > @@ -94,6 +113,21 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
> >       return hw;
> >  }
> >
> > +static struct device_node *scmi_find_proto(struct device_node *scmi, u32 proto)
>
> This is the kind of function name that looks prone to a namespace clash.
> I'd name it r8a78000_clk_scmi_find_proto().

I deliberately picked that name, as a suggestion for a future common
helper ;-)

> > @@ -145,7 +184,46 @@ static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
> >                       break;
> >
> >               map[i].fw_id = map_in[i].fw_id;
> > -             map[i].hw = fixed_hws[map[i].fw_id];
> > +             if (map[i].fw_id >= FIXED_CLK_OFFSET) {
> > +                     enum fixed_clk idx = map[i].fw_id - FIXED_CLK_OFFSET;
> > +
> > +                     map[i].hw = fixed_hws[idx];
> > +                     continue;
> > +             }
> > +
> > +             scmi_spec.np = scmi_clk_np;
>
> This seems to be safe because a NULL scmi_clk_np implies usage of the
> default map, which only contains fixed clock offsets, but that makes the
> code a bit too fragile for my taste.

Fair enough, I can add a check for a non-zero scmi_clk_np...

>
> > +             scmi_spec.args_count = 1;
> > +             scmi_spec.args[0] = map[i].fw_id;
> > +
> > +             clk = of_clk_get_from_provider(&scmi_spec);

... but please note of_clk_get_from_provider() will return -ENOENT
in that case.

> > +             if (IS_ERR(clk))
> > +                     return dev_err_cast_probe(dev, clk,
> > +                             "Failed to get SCMI clock %u\n", map[i].fw_id);
> > +
> > +             hw = __clk_get_hw(clk);
> > +             if (!hw && fallback != map_in) {
>
> And if the above is correct, fallback should always be different from
> map_in when fw_id corresponds to an SCMI clock.

True.

> What issue does this catch ? Should the fw map contain a fixed clock
> entry for clocks not available in SCMI ?

Originally it had entries for fixed clocks, too, as the firmware
restricted access to several bus clocks.
Recent firmware provides access to more bus clocks than before, hence
I figured it would be better to use the SCMI clock when available,
and only use the fixed clock when the SCMI clock is not available.

> > +                     for (unsigned int j = 0; fallback[j].dt_id >= 0; j++) {
> > +                             if (fallback[j].dt_id == map_in[i].dt_id) {
> > +                                     enum fixed_clk idx = fallback[j].fw_id - FIXED_CLK_OFFSET;
> > +
> > +                                     map[i].hw = fixed_hws[idx];
> > +                                     break;
> > +                             }
> > +                     }
> > +                     if (map[i].hw)
> > +                             continue;
> > +             }
> > +
> > +             if (!hw) {
> > +                     /* CLOCK_ATTRIBUTES is not supported */
> > +                     dev_warn(dev, "SCMI clock %u is NULL\n", map[i].fw_id);
> > +                     continue;
> > +             }
> > +
> > +             dev_dbg(priv->dev, "SCMI clock %u is %s at %lu Hz\n",
> > +                     map[i].fw_id, clk_hw_get_name(hw), clk_hw_get_rate(hw));
> > +
> > +             map[i].hw = hw;
> >       }
> >
> >       devm_kfree(dev, fixed_hws);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
