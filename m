Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90563C1974
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 13:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367572; cv=none; b=b90jaIzgGlOcsW1mAiAS0SgNt6eaaE9UhC3W6Ma+kFOboJR11QPJPZHSz8uVkaPC0OqRkA7iYWZcy+0iY+7pbdt/Val1xGKNLz076C0hT6P4jNbGhd77j/1emUyCXFuG+04VAsmPdtm3LM4f2g23/SGItxSgL4UgaYA3iVJq5zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367572; c=relaxed/simple;
	bh=MDiIHt4pFJMfzzoQaazMXxF6x94H52+tPmDWmY40+jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JW0v1QEQ+8MtuUL2A+bHqZ+eeXqOs450Sgc4JTeqYJN16+Tw0Z+pvXCmnrUVYTpyWXkDG5kKHCN+XTB24Ja0IH6uYCeYjRpRPgMzWntzKZUEVNLq3KetSOHyW6fFA17USh5jhPtllDl0f6jemRHzqZDK0xCHHdnvV34YVtH2EwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97a1c419c17so222208241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 06:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367570; x=1786972370;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1fUOVbZd6Xb+ghjtUrkja8gWXIgxzVDYDCvCRdWIg3Y=;
        b=W53mFMf2YuKAAcp+kBCsHcPiBKzCj/5EbBgLxbaqWzS2j+wKxaAcIzQ3kww9ruYON3
         B0/G09Hb9OzTS9AXmwd2j/vPWCOAip/lqZCs0aW7u5uyuSlolmfaa0uFawe20KDjv2YC
         g+L6JUgJBy1Al4ov2+w7sHCczRwLeuLuTV5uKpqHpEhAl/AdFdWpTJACSiCbQ6skyIND
         XMAehrZQpVjcrLjQPfApBaQclKpaaxMH9TG8hJvdAWTHRtYw556SvcKYrhx0yBTFWhBh
         othb/OV80K3ExGpXWNQyFJxVVtlc8xQ6EbMcE1KfWsW7kVqWJJ/z+rYxiBmfctFXdh1o
         BrHQ==
X-Gm-Message-State: AOJu0YzANDbwBHIkozbAQXPOrD8xNF7afgJtv1BlY5+6mkBjOzaYpTMz
	vD+cj/KRBqukojDTtQJ22fPtSYI45bcNXtKOkZV7AGZsube667shuVLQqRjDZ96a
X-Gm-Gg: AR+sD11FK86aLF75b83E3bAxrxeAgNiLGEEEoTNs6Nmxag8uES6Sv4+P6VUJDzDGKRB
	rL/NN4dcrAYzipkSWcKQp06MNFlh0QsLPJ3+KO7fPu/s/Ci+DVpYAUDriV6tWxQMWBnupIpegVi
	3i+zKILxOwwhkt1w0x74ZdvU34o+5QCerDF4PkzJ9OldrmUpG4oE80RzkLDyJeoNfT70sQxKLL/
	g20nv53bLOuD8GhkLSI96VDxp5uv+azF1XtI0PT47cToGxG5zM/xXZAMWb2Ac2mIq4yLKZJUO5v
	hKeFQ9eTCYefvZrFKDsS4Zzn7lhCXUSsABYaRTuBDfk16ELiM8qSdxJE6JjZrfP5EHuCBfZnmR0
	qM0x2Xhhu/0s9yFyzI/+ghy6CBB43rbZnUk548TfJdp7oGzbyaXz8bpJrg9PNToWhRarkXon9rI
	KVk4iQeZsc0gOcGQmTt2SeY0yXdbidtmo0cgfvaxiYbU+boo5tukmG9msmzmveCsRg1FfiQYU3o
	PtBUZsXg1Al0+LvM1nblVPbp1AE3g==
X-Received: by 2002:a05:6102:4490:b0:73e:605c:405c with SMTP id ada2fe7eead31-768e8849024mr252241137.12.1786367569713;
        Mon, 10 Aug 2026 06:12:49 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f303c685sm3447367241.9.2026.08.10.06.12.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:12:49 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bf5370d38fso576965e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 06:12:47 -0700 (PDT)
X-Received: by 2002:a05:6102:2922:b0:6f0:3ba3:7d84 with SMTP id
 ada2fe7eead31-768e664d4b7mr301407137.5.1786367567387; Mon, 10 Aug 2026
 06:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715105306.25147-4-wsa+renesas@sang-engineering.com> <20260715105306.25147-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260715105306.25147-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:12:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-0HD9AoVBiwkjSDB9a0-2tWuPHwjTPYQ7gE8jUEP8Qg@mail.gmail.com>
X-Gm-Features: AUfX_mzaQlUWSJzjmiThQr3A3bQUcIywY_poA2NcJ8075I1jVF1wz1rUsvtJafY
Message-ID: <CAMuHMdX-0HD9AoVBiwkjSDB9a0-2tWuPHwjTPYQ7gE8jUEP8Qg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: renesas: lager: use inclusive wording
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 at 12:53, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The feature is now officially called "target" in I2C documentation.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
