Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290373D301B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 15:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662462; cv=none; b=Rp5bfxOju7fUH0gUgKxrfHB9XZBdeRr/t2rubgyfYawEw/BJz7vD047uXS5ZaNVUYMZULqD/3PUS/Gj+rnH0gXQrxjwuyS6ncL1SMsZHqq/uxBIghZntWSkqpG9V8E4Tg7e0tsL7wtmtCl2Ff1kPfDLQtYkxQ1uWyGg637sA6J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662462; c=relaxed/simple;
	bh=G6a4o4J/VFgrRY98hxNA8+Jd9PbHm27qUNfSQ63t12g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWwoIIQ4b7goD/YyB1IhPym6DhlxnSWmdiJSGXpDacMnYwW6mt5bcN9ivErhg++zSxQQxrbA1Q0ZxFsmnF8A4MMNmWzg49wrMExI5cJM9y3XaHMxnyT9DLnaVH5wmwmPaySuCX49XUes5X+Qvv37Ezd1csXCfDsBFNSb4qj36NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-953b0a7ee18so1667283241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 08:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775662457; x=1776267257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y23OAcv1YH4CvmXqVtpKVA6lKdyjuNRw51Tt1bV0ONs=;
        b=sKvgduxgyZSeRMcO6V2yCZU3Pmz2vNlNyYl3t6HEZ6jfRmeMsZJtcgymeXb4fduADW
         j5SF3wMch0RiOIDbRobGRRqicdiE7orQuGutwbwT3x/nWjMZeTTsfv28+7lcxHZXIZvI
         ++q6HHDsshRZOuBrL/QgjNU1mlr0cVjhomCb4vIkcCNO1aKIlngRNqBdLPR9d1qSyOv0
         bVGMfvKrPHHQT8q6ndw4fk8795cTlbz045ZK/fkqj7li019y17BaA+d4bGl7Xqv71KrK
         uDbL1SUhPSGOCQMVhs9GPm74akA0d9ddwV63bgJjqHnotGMzcV42BuNO9xr6M66ZmhkD
         iEtA==
X-Forwarded-Encrypted: i=1; AJvYcCXKObcIujDuKgkvqOsE/0pXfboWFO8Kexq9oW5XrjBcAk3oyzx7dp3YGA26pOCqFSjXpsCNnFyuWYD/d+/Nsx7gCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN17LBH9DDZNsuAUxjoIiVdoUu9Q7NR+Oy1Che4H8gtgLkUK1h
	ZZPLSzZl46LwxJqagUmQcHh6Qg4f+myYEKbdLz/pxO/ew7Hr+XMwHl4lR+fGsfFA
X-Gm-Gg: AeBDieu+GyBkAfDm54MltK03uDFFMPdQcnJnoS0fifzuMvCyyP5WXCNKT5uN43JyXbw
	FEHoO/Fj1hjod5IYLM4iOR2fMhy3QCtVYxx/aW3LgcTD8jKcOol2pgLBn52M4sqBEb3gBQRn1Bt
	ZtiGWx285uPle1U/H/jJn4C9AxOYKwwNThaAul6e8J8mOtt8gbAh8XUmubfiypPGVV2GMM05Az2
	Tnfeo9N/pjT2eeiAMMwCCBKjoHr3S0VDkEa0Ie16kywhrwY1q4lEgv6vNBqdOnIhJJ8+PClDFRP
	1+olN+wR7hhO/RxKkRp6ibz/yIhhKb+tGtDzFGJf1Q9z2hABl7i114XvESdJnZ3iKgPXim4ohUq
	Rvvdu07RwzcI7Cylw5+zKYJOWxgTaAPlrlcNhPBRHewsQN3ZnLpPqg+cQMU4gUYsCSCvDiU6OCK
	hjcSmJjxbiTn28FL8ZXMMMSH22X039qasyVzEsMKAzUCzU9uqzRWW3Ecw5N4AJ
X-Received: by 2002:a05:6102:943:b0:605:ead:8f38 with SMTP id ada2fe7eead31-605a51728a1mr7425164137.29.1775662456887;
        Wed, 08 Apr 2026 08:34:16 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6074fe8cbbasm1950719137.8.2026.04.08.08.34.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 08:34:16 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-953a44f8404so1648009241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 08:34:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWX6AlL1cmDZRmWxS7y6QOvlE9Y2v0vx7y9nqU066CQ09YMbJKuZGa3m/JQeh6zvZhIjLwIqlP/lPkJY6Hko8ET7Q==@vger.kernel.org
X-Received: by 2002:a05:6102:3749:b0:602:7a74:fbbe with SMTP id
 ada2fe7eead31-605a4e92be0mr4855674137.9.1775662455968; Wed, 08 Apr 2026
 08:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403141341.2851926-1-claudiu.beznea.uj@bp.reneasas.com> <20260403141341.2851926-6-claudiu.beznea.uj@bp.reneasas.com>
In-Reply-To: <20260403141341.2851926-6-claudiu.beznea.uj@bp.reneasas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 17:34:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpEWUnLT6AEdHcx3QxjMJ_N4+RpuTK9KibpzUenkLQaw@mail.gmail.com>
X-Gm-Features: AQROBzBTWyV6DTM9q7ESncHlon59RNmeUazsZdqibqcXVnSwKUaF6OQQ34FtWTo
Message-ID: <CAMuHMdVpEWUnLT6AEdHcx3QxjMJ_N4+RpuTK9KibpzUenkLQaw@mail.gmail.com>
Subject: Re: [PATCH 5/5] soc: renesas: r9a09g057-sys: Move common code to a helper
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Apr 2026 at 16:13, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Move common code from rzv2h_regmap_{readable,writeable}_reg() to a
> helper and use it to avoid code duplication.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
