Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B56F2ED141
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163800; cv=none; b=UyouBfHPb2983VlLzglm9GGq8tqg0iIYJJaYvQWAOjgF/fWoyR1go1/OwJTE20QsdVrfwXO3daVd/UPSPavBC5BAM9dLGA5/qroIYGngcuLtW2ym4qPgQILjhLpEfoFpaGAgnF7l7xxOzn3QfN2mbiY6Jf8682XqEN2iWMC+QXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163800; c=relaxed/simple;
	bh=toH4Nu8X0VoWmbcPFRUFtTal982WrI4JYNV+CT82Ubg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5AUfyMykiIzty67Fipk+o8603/SsgWszx6c8dahEEeXgp5FmMpHO/GxX4lHI0lKdMNkVohctVFPC9LLMP7MVHIYjxfXT+1gj6a9TU/7kdeC/iK5BIgUIf5IoEy27dfi1kggsAr2NCFvXI4bKGcg/Kpn7d8bOBQEFsiJzO+C7k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7d4so470512241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 04:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163795; x=1790768595;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AQBDufdUkXkchzPiebMikSu5M3FlCOhF16/kg+goO2I=;
        b=WipZPn5uY7opKZ2d3nOe9NCZ1aBRzzh6AyaL1rDh5P92hLrLDHPDM7emQLAsiIWZUv
         vBN3IYtULwzHW7qdxtVAhFYDInB4kMi/cBoplmwsWVrBtSponOiEkHGXWt7AMumoIE2g
         A6Q2UFzPKpkh3M2ux4egF+Bb6H5Ad0MQTWmMg1c/tpWPIEkHsCOAzj+ZLnwaIql/FSt/
         Lk0HF9yoQFggVNmlxIhkcvfb6+9rYPqnZvyh7Akub04BM22SPR22oaQJF+OlSLpPdx14
         3Lm/ya69wnYL/DSHE/IEa8cJhslQ1KNcJqVGVOn3XzqRuB5IgY+PU7rww55L2MrI6Qwx
         WwEg==
X-Forwarded-Encrypted: i=1; AKwUvBwuW99UZwn6TEbBk20gEnAw/s0SIFvpW/v1rfp2xcr/RdJrX3D1Ub2X2VZV6e5X9SM8R6D2M/v/nJj4PrXbS0kpuQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kvdzrXRabX0uINrYFcEIdr91RdZ3+SPXu9zapqdVj5jzMvbNsU
	Jl5zmOw3DJYMs4Mak6OqbayVK/7PpTovS86lioAU+RrcPSKrj4Sn18RFDJqewiPX07A=
X-Gm-Gg: AYBFou1+BQgmr7zoEFXxz2vZIcXVdrW5WTlSxG996CQ+Av0q2eCO4KbWvQwSZT2JXuM
	aB5/psqYNPhiJ2FHwaG8zxwQOAXm/qGsV9keoUdHyQ2+/2ewQu8809v+I9WBuAxZn4nFmEGdXwk
	g+Bxag0xp3ZMt4sO3xLotG6oF9ZKFuxRUXqUNNCYnXkAdCsgfMzpq2RYUDlUujnMwodc3EzXo1R
	ZRlmYDFFQ+9+8/bX0tV+miT8Ac6nNJzDl47+6MofcFe82VgJbdCeSxjjpQ0OIOFit/b1bLrnUpf
	AEkPISpZkLxol9IuyI0+k9gRqnTbquY9Yg7ZQXaMszLR4vIHaZ7Pt7Idv7mb5l10t8vp9seataU
	N8bz4Gjhy18MbDumbj5mr+kmmjKsblDZmd6oKaa0cwYJQJEl882OKg0LKnIHOfsif58XUJ6Ddcp
	4Wpz41xCKelMV3qPv0MTOrWZ+PUdPyDcFsO4gW99A5H8s5DBHezSeNHjp1g1De4iLIZalQWxb7d
	N3wuVIjNaENmylfuF6XDtZVLBVZoGEZgfcl
X-Received: by 2002:a05:6102:3713:b0:7a1:f7d2:e81b with SMTP id ada2fe7eead31-7ac1d2e8207mr2104499137.20.1790163795438;
        Wed, 23 Sep 2026 04:43:15 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf5a7fb17sm3122089137.7.2026.09.23.04.43.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:43:15 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78a7003f9f5so485959137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 04:43:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBydERrF2ZZd9a/2bC+uGEnJUpB2ZaovcXWGWIA1c1sWLG6u0erCDkmmlWJzB3OOl9sjaaNc4qjxETk6rVEzvJAZzg==@vger.kernel.org
X-Received: by 2002:a05:6102:5813:b0:7a8:2a34:433a with SMTP id
 ada2fe7eead31-7ac1b824983mr2135063137.9.1790163794193; Wed, 23 Sep 2026
 04:43:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-6-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-6-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 13:43:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9V4jd6j-Lcma5Nr-sgqJjBbbdwcnO3s+YFmvUz5qQLg@mail.gmail.com>
X-Gm-Features: AclHuK9nw9pQ2eMsnoclR1kgUt8L_8mX7NzQtyl53d74B8AUYdOVbDcik9Ofq-4
Message-ID: <CAMuHMdW9V4jd6j-Lcma5Nr-sgqJjBbbdwcnO3s+YFmvUz5qQLg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] dt-bindings: clock: Add r8a774a3 CPG Core Clock definitions
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add all the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC Clock Pulse
> Generator Core Clock Outputs, as listed in Table 11.3 ("List of Clocks
> [RZ/G2M V1.3, RZ/G2M V3.0]") of the RZ/G2 Hardware User's Manual.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Renamed file to include vendor prefix
> - Added vendor prefix to include macros
> - Added Reviewed-by tag

Thanks, will queue in a branch shared by driver and DT source code.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
