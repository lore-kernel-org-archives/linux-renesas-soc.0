Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A62D3A544F
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532968; cv=none; b=nZPatpQ+UBYFIFK1YKFnd4MVlQShsA3zMBKmNltQh/u+tVHa6w8Al+OyZu4i55Y28awDp4d3kY8sSGExOJa7eMkkErdAKDVBMhiNA4ehQqZjwKRacL4+R5RnzHyqSYovH9wJGLVNAeMV+1JQ+Sm0WCL34dH6GsDubDoKGvasnKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532968; c=relaxed/simple;
	bh=TcGIo92RiATa8vkGJVdjHgxt9WlzbewL1KtAW6cGFCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQnp3yrUphYhM1W4/QUHvyfZ67QcFY3Qkw9dN/RoD0IduSWMmQLnFN8CV3dPgTnvE7iIS8w/D/mIh5JtyUOYd1m+TlpmEJADtU9/PQIuJJUUFXvv+vsaYHdWmSmkrnr9ifnJav+WlwYiQ7JYV/LfVFO8iw4Uod6a0OemzMXuHzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c56dbc3a51so402320e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 07:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788532965; x=1789137765;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iy22q1YzKGiQPGN9B1bpmbrGTjC/sYmYXe5uXN4aXJo=;
        b=AQDoEQ3wbdIUF1DN+BwMkZ0N7wMH4QFqcolRwvlKZy27je/SMfX3OMzL78zVkeNYhb
         htdHViTQV/CZtHH2768sPwofTDpNw2hRICJOZJoPVZT1AZDWUVX6TsxDee4LCCvBNJg5
         khnaDRk5SnsBIFyMveMw6CIQLjTDxEk1sV7qYRfMywlVUZpv1LPufLWAnb4st7c36J7r
         kXxM9gx6rKgth0xaUlEOiNAvniduEPfqjOBGBE/JY/0bEK8VQ3W+fm2CjXEZ/CCCFz6P
         PpiE2NV9oAWI3NSdgWNRflOhEFDXeeQXiRhQN1DGP2w+5eDGIncewBJ0B7uTRPSogHbj
         MqPw==
X-Forwarded-Encrypted: i=1; AKwUvBy/7XoTEIAQstFIBlCv4kQICcYBh9MDLSJbFix3GvHRKsmPx7EFOKvGR1yqg+7YhbO/CkH0xTj647CgRVOFLLdtmQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l0+pmOn68iqGxVQIwHBTFUqELB0sVng3wzBfrQ2B0RS/C60KcH
	u4p4Hc+DRSkLTzoO5LwJnGcGzffz0yGTLUg16k1tJGPFckhIEW2dEV5TFvOVzOy7ijc=
X-Gm-Gg: AYBFou1iB9OHTvqXWF3Cg6N5YKEp0pcl0e3fBsfvBQSE/MnZm17Gxo3N/+36Z7mMAh6
	e8ZsRWPToLuO/X9W5aoj+dFdbkUAwicpdNv1bVigW9gEAwhzI9fC6XEi6IrCZOrowHfx4tTRNKb
	29VeG33av/fpKJjuhOxMU7SfcwBBLeg5+J0UJjEwZ8/tdLTV0xt4QvQQhPsfcqg7bQlNnZMm6nO
	Ne2LjHh8xd9uD8MwSQFkZ/VFdBpEd3eBbO0x+tZfhloUkiQNoC9X25FNjlXTO2qWTF8sVVs7KmB
	/uqwxNgz1sZFcqmfbkyDGtsulnKfysD2BXGl9qQi1vl5vy3053yJTZ8awLE3HiMBxltUfdbpFmS
	ta/BkK/ZuE7Ou22q0ARKdOEPVpcV8kasPV+6HiYjQ519zqFsw8rIahJ0XVShiYZ15Kpk/jIQYgA
	Hl2M/vYiqVxzqBmCm9ZaYJyhb5Ol1UA+cnxcEzDquBATOVLqIAm8vwddH3qhk9LgODnky5DRb02
	rGvj6D9TO2X4HNukBtyGdplHw==
X-Received: by 2002:a05:6122:4f83:b0:5a1:fbbd:6bd0 with SMTP id 71dfb90a1353d-5c7ed45ea59mr2659748e0c.5.1788532964812;
        Fri, 04 Sep 2026 07:42:44 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1eeaf3sm2228037e0c.6.2026.09.04.07.42.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 07:42:42 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7466771f1caso371922137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 07:42:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzu2KdY3MsRAP6IdnmPJPTSv+ZnzyTqIyOEapoz9qgiBoFVUWhKIXdTNKrHbgvbx3MzBpp5SpDNDJ/7Pq0/XkiUmg==@vger.kernel.org
X-Received: by 2002:a05:6102:2d04:b0:785:eb33:87a8 with SMTP id
 ada2fe7eead31-78a4a883885mr1900429137.4.1788532960799; Fri, 04 Sep 2026
 07:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788338320.git.geert+renesas@glider.be> <2cf42d7ef9b452efbab3007ec2c2340cf87adbbf.1788338320.git.geert+renesas@glider.be>
 <20260904-fabulous-lionfish-of-cookies-0d614c@sudeepholla>
In-Reply-To: <20260904-fabulous-lionfish-of-cookies-0d614c@sudeepholla>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 16:42:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_u1ticUomZffY8iU2GoWgyTNDPaL2O6KB7yucr47dDA@mail.gmail.com>
X-Gm-Features: AcwNN1WAkp69Or55f6uh4v6WhdtMEG7Qz9QclhM1mQOZ0FBl4cYNnC9KwnYi2zM
Message-ID: <CAMuHMdU_u1ticUomZffY8iU2GoWgyTNDPaL2O6KB7yucr47dDA@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: renesas,r8a78000-cpg: Add
 renesas,scmi-firmware property
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
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

Hi Sudeep,

On Fri, 4 Sept 2026 at 16:03, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> On Wed, Sep 02, 2026 at 01:29:17PM +0200, Geert Uytterhoeven wrote:
> > On systems using the ARM System Control and Management Interface (SCMI),
> > the Clock Pulse Generator hardware registers must not be accessed
> > directly.  Instead, the SCMI message protocol must be used for inquiry,
> > configuration, and control of clocks.
>
> Why is this node needed in the devicetree at all or why is it not disabled
> so that any driver in the OSPM is not probed at all.

The node is needed so the corresponding driver can bind against it.
The driver takes care of remapping DT hardware descriptions to the
abstractions offered by the SCMI firmware when SCMI must be used.

> > Add a "renesas,scmi-firmware" property to distinguish between systems
> > with and without SCMI, and to indicate which SCMI firmware interface
> > provider to communicate with.
> >
>
> I still don't see the need for this if you disable the node, so still

The node is not disabled.

> NACK. Sorry if I have missed some discussions, please present the information
> as part of this patch in the commit log if not the actual binding itself.

That's why we have cover letter, with links to previous versions and
discussions.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
