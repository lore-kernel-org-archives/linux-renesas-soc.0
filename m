Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD101556B89
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872711; cv=none; b=XKbI2ii5K1a0iSlaCml44nAGEF/LoV77WphI9Ln7zBCGgjtTTjCPlCU/nnxKAkfc+cP8TtryzmOlE3GZQZDvY8VDLmvokjlG3n86fztjnijJwMh5W3FBlCbRRgpGyN9O/89ckCLR7WHSkFjQ1H4b4tXwkW0HZLJQELwY71Iv8kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872711; c=relaxed/simple;
	bh=eGwYIsCScQ1MoY5AdqzWz6Y6GCZJqDlAiO/vY66STK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ubkOXN+Q1lIzMBMAfXGS8l6CIs7vAlXlii772iIgThRAFNutJK15yvzKhmtw5Lw5YcnDcsW/Md38MbHu1VGjuypKjAOL9ilcTKjIG8/hYElcd6PZsQOVFSEeS64xhgJQujjFf9li2TsC/+BcNcEDETPnbgp1dUIYotpZFWFqO80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c2ae02f69eso4015053e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 06:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872709; x=1789477509;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7OUHgNmhkRIilkfVPL7PZ1sjvxPEaa5xqUS0CzXrrac=;
        b=ejrmPuH7D1uv+gloOClJmTWzGgTPBdKSUSa4E6Yy6ef4CFsNmhnUY2j4eF6BrJrcIq
         qzvaYFaEYbR4qGizJwtnlohqsxGK35lkELk8WPPnlfh+O3emqoscYn7lkfPm8eP4kjPe
         mkwginZVrA/iDtRdIWoIpGthiyrl4dAH67P5dle56i5JP70aulst4KhFmzFwcBQoTfJ8
         QntOU0i1hYlCCUHa9/ECb7R0d6n33aRewYqYSfMrfaFQKA0CCoMhbL6/mayQtDWwTiO+
         bjeCojTiYbKFYUwhCd9gj5w2I94012mqrXylP2GOnzIDZ2rM1KAPab+Bv6362ZagFDtQ
         h9jg==
X-Forwarded-Encrypted: i=1; AKwUvBwQlUbrgN3q3Bcmr3t+NW53UQa+hbCTKWc1sQ+hrgY6XYBFWWyXM217Fluj0lpZMADZNNVaIbz/FVG45OhBpgVwNA==@vger.kernel.org
X-Gm-Message-State: AFuF++nUUss9G6OOX6HKbOX3RIi1qKaq55JkwtIskgg5WlnB1XQNZ2fF
	9cyu+JMX7gcwJGt1ukk30K2qmr8SXvjM8o1phihjwBdHBY+paB+ExicMtPOH+wZC
X-Gm-Gg: AYBFou29OQeDIMv/LkGrWo2mYjOnRqz0JeT5bOyDj+Pi2OLj5rlewB3w2vqeo6bG536
	kIpN7QfSEoqWidSG7TUWMU3ZKV2fc5CXzTuNspjw+o7WBv1V+IWHVwAv2kWSD6/P89yHNReYhkI
	mKaVVzvf0/jFGcTPSpLPyZ5Q8bSjg3YotsCJ+RYfH8Amf4YHcHEmSR9C63GZ569YKiTFThJbbJp
	ybTYQ0VCE4dik+aqvlLcPa4sX4erYb0W3WAJKS8Vz/uuOnoGprTjZEpDwQ9o1BS08wcOiUx0gUM
	/W+mkpaAzvYlMOHUC9iVL7jsyEe+3WKRUs3ffSPt44rXEZ6VOy8r8o/dNNU0B33GfsNq2rUUNw8
	+p5HJ24nByUkeHaCzfn034mXzHjxsqpJie/zWsovWhTfjS2gpB7s2AD6ZR51nMmCzMZI9R4kwXp
	eziIHV/oHzHxyB4wl9TTsFM0DHdMAPXfX4nmfy9U5X2Udqh9R0i616tZ/An8PSqsBKX+PXcmdGK
	ZLPzxfMS88vWlfaLgdoiqzFl45DuJ4F0AB2
X-Received: by 2002:a05:6122:2205:b0:5c7:ebed:1018 with SMTP id 71dfb90a1353d-5c7ed7f9e30mr14192252e0c.8.1788872707523;
        Tue, 08 Sep 2026 06:05:07 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3b2cb1sm9657423e0c.16.2026.09.08.06.05.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:05:06 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so2418216241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 06:05:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx8Dmxiy6n1qjwabJxpXhiTZNp2o0kVrYsI1Pjh4nHSuMEq0fClq57CFcXeXMARAG2HBNGg3jtKkUSHKJrC8XOOYA==@vger.kernel.org
X-Received: by 2002:a05:6102:644a:b0:785:d308:cc2e with SMTP id
 ada2fe7eead31-78a4a91b269mr11781521137.9.1788872706596; Tue, 08 Sep 2026
 06:05:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-11-biju.das.jz@bp.renesas.com> <apA0d2tBBJJ9FMnJ@tom-desktop>
In-Reply-To: <apA0d2tBBJJ9FMnJ@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:04:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXzDhSQ3Mor6ANhUPoghGNtVQPRbvc+F2iz9Mx5cm_YSA@mail.gmail.com>
X-Gm-Features: AcwNN1XSNu81MBsTxUenVVeLwj2EDvtMps-yBFlHKAFoTCMXmjHGUl9yLsJu0Gk
Message-ID: <CAMuHMdXzDhSQ3Mor6ANhUPoghGNtVQPRbvc+F2iz9Mx5cm_YSA@mail.gmail.com>
Subject: Re: [PATCH v3 10/13] arm64: dts: renesas: r9a08g046: Add DU and DSI nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 14:58, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Aug 26, 2026 at 06:48:44PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add DU and DSI nodes to RZ/G3L SoC DTSI.
>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4 with DSI resets moved.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
