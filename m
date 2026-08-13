Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95073BBFDB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 09:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613160; cv=none; b=B0x0HEubnaEb7teBgvzDx8YXTwF1w5cMh91VSkQ/tZe20sLXWy4KXlFZfl2PY1EL2FST6KOSuULDddQjj7i0eSoxR0RmlibMurZgdU93fhooeMEe8LIQKm+TC1uKFwLziA5Tix7bJtVJJUIm+7ONBLE4YnBhS5VbX0Wl5qBHyR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613160; c=relaxed/simple;
	bh=z6DTFuPGv6FWaGZrtsoIb4p3tEuSyUOB0Uv5doIJz9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpY2A8c7zfkdJm6cnE25w0EobjBPtFbAsZIM8iDOy+5LqGeHcUvsHpXlEGWFw8KMaVNXTNRIjJng7c5D04sy7ZnsILBQc7m1jeZlDgvDEASCvNI7Iz/Ive/W7flPjptNR6E9mh4ydhMUyG9RYUnhQrw5A3OeqznqlUTR//7QtGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9674d727c0aso543205241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 02:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613157; x=1787217957;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RqwpdLB7TrtYeRCXVjCM9omQuKhZ1BXK2srBTA+xeu8=;
        b=swBJgYQ5rEdkOMXxN4ivHdWW111EesUdTyp35HfLE1l8W2m6q1YgjqMLPRbezbQRKJ
         sELgWdjfjt2PYoGtGeWm1nm8ddWF3351/ydsh2BUcDqO39sRTXg2kszlhDIEddrkJfJ4
         naepdXSRz9IAgaOZzpt6HgWnusRb2tlBzwsD/mq4bfEDemhLviy+FkBCYnnTwJiqWqLE
         kFO9e7MUMlq9qyJcoHYwJu3LD+PRqUnBruJPFfySB/USSX7f5iKRKGtWYEU3zlpSSygU
         sIzFP5G+DQBIvV1c60daqotWrf9Slz/zBlQJ0kSXMkimb2yBNnxWgODWgyWguNmLtC+f
         7fMg==
X-Forwarded-Encrypted: i=1; AHgh+RoZ9R+Wfkf4R5K++b2454CxTVLGjzagjx1G9Jib5yZJ55gurNuZ2VRFX4xB39ZneajXSjPwcPMRhZYkmwEbuE6Z/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBuar7NStTbSTU/EkX4Qb8WXztkcMcW4jAIff5ijrMrgZJp9Vv
	eUTaogvtC19JeE3g+DYzSWUK15+w6GBiAPpeCuHMUQ6JigkOD8i+JiVnZMDX5TKz
X-Gm-Gg: AR+sD10hPAtJdiWYctTTYQBpqVxQOyjjc3Kbq+355eZdKJcjncjue8sVjf6lz7cRuOD
	lx9veFE52nvmW/7QDZKCqpSUj/8OgDAB2yO7hmFTexqZKuy04jxCIZvbFA54vh+t7UbKn5aD15X
	YZm79Zxd/TI8l6iLA5oTybtSKBYBLN8UWuESwqXRkKqezeYTZ4IVYqjvMN2xS3mkdLLqhff6FnW
	EeiUXM26K/HdrWj7MWZtJ3QscyMMjbCIPCwTVhXZveWjZ5L8DamUYIT7R9d4m6eCE+7dkE7yP8m
	h/srah51J9kS1vDNjgb3ogMHhFbzwqegvv0g/Leg/hX81AuRJXQkwH/uONNE+N2bgzoSFnxv3Ky
	9z4byMn8G489tBBhEk7W0G8OASLmoYl6Dp84cRrVte1IlC+xVK4hy2SEm8gFaT/U8qNLToCi5Bo
	zjXYZB4GtYUHjuhqvy+2VlB36qPitluysSR90YllJUDdLYlOgljb+wZGj7J3nGkyvMi0EkHZOet
	l6wm2xyru0HQCyzeHv0eL5nSZSF3g==
X-Received: by 2002:a05:6102:b0a:b0:6ef:dd17:a04b with SMTP id ada2fe7eead31-76dda4ab598mr452933137.13.1786613157541;
        Thu, 13 Aug 2026 02:25:57 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76dd32b3d9esm752630137.10.2026.08.13.02.25.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 02:25:55 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so587608e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 02:25:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp/d4LEgtWAmH7BMmLdowIJZUoEIzWiyfV+ab823CWIwzTqPBPYDGGi5ECsXGaG6+cM8AZRw66I9DCIxGIUgcChxQ==@vger.kernel.org
X-Received: by 2002:ac5:c74c:0:b0:5c2:a30a:1a08 with SMTP id
 71dfb90a1353d-5c57bad1c3fmr407701e0c.2.1786613154174; Thu, 13 Aug 2026
 02:25:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615115455.1412098-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615115455.1412098-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 11:25:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVD5OHjnpBJS7hgFoU1i+6AFHctB4d30HFHHpRPazsESA@mail.gmail.com>
X-Gm-Features: AUfX_my2gqI3H_UNJDW6a68Up-CId8ad7_1-724yfN_7o7bmeKyk3Bb75eFn08Q
Message-ID: <CAMuHMdVD5OHjnpBJS7hgFoU1i+6AFHctB4d30HFHHpRPazsESA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: r9a09g087: Add DU node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 13:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add Display Unit (DU) node to SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
