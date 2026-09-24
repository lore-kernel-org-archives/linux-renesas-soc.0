Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3207B3BBA01
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255890; cv=none; b=XTPe63ok6C3N8nQon01alrC2hIjdgXL+d+V5/5F2hq5VpDdMM1RK8cCGzGO5l+tLC3hcUjojEMSII0gAKUYCbjYUuN/W+J8tdpsISprEUpTOPiVWW2ximsm+ryXsMNds5oHR+UBEGdLoQCne+JuiRvgl0H2tsw9rDYd2YP3RnHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255890; c=relaxed/simple;
	bh=1TSXneoOU1Yt/tUGyZxYUZ+hB0ehAvjQVuOKhXr/ZFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cxbj8QLFj9f/hMwFrdme7hi2FzIEd7K7pI9qdyq/mzyIVilAApC271Drm9PEVStjTuju1BNvydWY6kJ0zwQmnc+l4vGOK3XPU63pIMSNBJYyUBhbv0AvTBYfNjxvEZ9dBugW7lwMEI3YufR9SmT6aOF7pKCssQzTuYCN4zyqUsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-98515937bcdso448036241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 06:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255888; x=1790860688;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/FyztXa1+P8ok6tdKKVDIJtTBDV2aFviJNLJni/q+qo=;
        b=vMRUbjOcAeEKaSZ9QgQQ6z0de0www/HPXs2xHhhFFy8MHzk8z/HzUJv/LMSYqfw0CW
         raIf0R2R9c5rB9KwcwPACgj2pXK6S/OHvLEdcvpZB3cdZg14OJ3aX+RV8O/xhY94bPsE
         3TwkqNwHLDsHwKjsYjJzt+0z3qXJP1a0EnJhv6kIBXEfyDC+JzaOChQMjtZIx0ugM1Bk
         DBt3DyfLlzwVM1h8baUX9miGD9M3IRbAjujGZfH9RRcSrE5qxSnD2X7gIUj6FqUjyHSx
         ndJaZ3zQoBwTlnOsz+3SM0YiooK8rgKkSlMFwvVcfZ2rhxz4P2aKpNtoea9Rgrp2plpd
         84kA==
X-Forwarded-Encrypted: i=1; AKwUvByXbEvuNiBzlkCqp6hqVUKahZsU3QbDX6N8+gdU5ADmYJJNhyLnUGsUQe5hDiovyatGNbnFt8zVUJIhJKwyJG1yPQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nXwqqrLgh12xeMQvjnfkejPJU9EBeZvHFc7xc5qNMXMWbxhXdB
	nO8QJWEnK9wuCcogbAlUk6ihY2HMjzT7Z42sijb6toMLPYAe2ngJxex+A8XLcnUb
X-Gm-Gg: AYBFou0/8KBeSLpnyCfCtaP3bZ9RND+tfPrOf+MsD9uBr/rkirnb7HQfMbSTqu9rI4k
	ycYSA7qg8TLvXFxhqFmTbE127W+NPnZdFHPhveCPA0nrqdp4m19MiDZJrmqbmd8Dwsm15FrNhS/
	eRsrZe4Jucojj1VTAuG5t4mL9vLlqBqWSQYeeZNWhP9gtWOeDonaybcRXeQTHXJ2pHOJRE0vMRE
	zt0fXVVqYuGQwb8HYlUxRlXETnU0ACrZm1sfCn5pUb0AMK20JLwvdFFsnVNXFiyVGVXgUkGi9/o
	Tze5MCrQym14n5NewZMnVv+mMHzZ2Ycu+uvdgskzY9id5bPzAA+3rdwAr66XPVGj76Yb1MFemtj
	fjErUtKwA3PVfmKLWm5AwhxVqVuEJjkB1K8w0eHw88t1RMbM+oRKZ7awr8JIByGCFUPzviP0Iz5
	ECvOkg5SN8nBhJoWbbbJPJGR8FXKXMqUs+YSs0hzZ2LJfuYyeo2dARPe70uu5zyj9xUsWK86CVT
	DLTVT5vmnwTwHAM4JWK7KKj7s+Lw+k16Qik
X-Received: by 2002:a05:6102:5c9:b0:785:6b42:b7b0 with SMTP id ada2fe7eead31-7af38bbdf29mr600310137.4.1790255887983;
        Thu, 24 Sep 2026 06:18:07 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98517a8ecaesm6431695241.12.2026.09.24.06.18.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:18:07 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-78a338fe106so850456137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 06:18:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxG+5DnbXj0omhId4HeDmOEDR+47i+nzLJ51D3I5VXTFQwNeTGQcekZnTwpZZnot8mx6H9+XWapNDHEJsteCc5yBA==@vger.kernel.org
X-Received: by 2002:a05:6102:a19a:10b0:78a:4dff:7b3e with SMTP id
 ada2fe7eead31-7af1d0a179emr770655137.15.1790255510966; Thu, 24 Sep 2026
 06:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924052741.130658-1-biju.das.jz@bp.renesas.com> <20260924052741.130658-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260924052741.130658-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Sep 2026 15:11:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV4dgpQ9R7StQaz9C=iA9+obiioyU7jgOkkTM4Tz9XoyQ@mail.gmail.com>
X-Gm-Features: AclHuK9Buv8gyRA5u_mR1kAGkw730VchazHFf46HOsFhnVFa58qOMppMCJ7zadw
Message-ID: <CAMuHMdV4dgpQ9R7StQaz9C=iA9+obiioyU7jgOkkTM4Tz9XoyQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Sept 2026 at 07:28, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document the RZ/G3L (R9A08G046) SoC support.
>
> RZ/G3L has 11 interrupts and 3 CANFD channels compared to 8 interrupts
> and 2 CANFD channels on RZ/G3S. RZ/G3L has 288 buffers in total
> compared to 192 buffers in RZ/G3S.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit description
>  * Dropped RZ/G3S fallback as there are lot of differences.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
