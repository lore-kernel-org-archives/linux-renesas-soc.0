Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431A8169AD2
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 13:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432434; cv=none; b=sAXPcPmiMG8jgono2Raqaa+kEJyxdmU7MSS2qBmaNL7A5AfHaqrcdjEmf7zmuzAoshYMaWp5NFDo58nnu+Qd8ByPxrRBxi299wHeera7MlPyOEOYL6l6I6TUQYTZ22cqY/TVZkwratWO88+40Ansg+HLR8jTJHDK+4To1KkEJ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432434; c=relaxed/simple;
	bh=udmceW3RUM6Z4NairZqEwML5hnOEjadjcWJnUNeYGNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9ynKIh3ORbkOU4Tjgj+24LInI+aeHLZHrRJIfDIyAi/jPCSKFd+QDBD1NSVIv2Py4aZRnssnVhQEAE5Rx+Bds0p4Zgqk/w57U+wjMNWk4NAkrpCRbrTF7DX9nxE2Y922e4Ojw/hkCEn9/Pmesrbtfn7Zh/lNm7LoRVhZJZZH3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bf62388d17so197328e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 06:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432432; x=1784037232;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1iENYh9jXtsnzxDKPGUvdWRKZFRIqtHgeYcjURDhBgQ=;
        b=MSCI/47flC5MCaig9+IKavSa5eNluuXag5Ofck/9s5H11pEqcvxO3gNW1Y3QkTFAih
         3PtpIH50rB+0fYsMqvvXtthUtw7T2VkFXxTjUdUEO3RuSBqA7lZZPiuBwnZIKSvxt0gJ
         qbTrXGK0rs799GBmFRnXrOOYMfQn3xZY19wgqkowgA8NKJcsQ16xJsVqX5niO9Qiqe+Z
         DebcLOZ9X21NIcbwuxX0oiX5yFv1wKa3HQp/GmheKZRb1r1rw1aT+0jUcaJ65EYUPqZu
         wa5hfzsozS49iuKf77dgdW2wyhNFVh07OenyBCgH/v+bsmp8PKBQIYWRCe7TGW18rg7s
         AMBg==
X-Forwarded-Encrypted: i=1; AHgh+RqlcN6W3liuZsiJfQjpH0vZcoInREafx3d7cP6jl7slM91Tcm+NRm/TfyQNNR0vjE5bewVf1tIt5za6i1ottcmjtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbP5YHDg+WFXbWy6mqECTOKffXNuqal6Kyww4vF6HZ6MZQ4Onq
	TwZ7RGoDqrbUycqowqdIzcTKYCu0OcL1BnR/15CrAzhg/mHI8EAx5nGsOOnErbGA
X-Gm-Gg: AfdE7ckooOdlFyt3ciZ+/xnAm7W1kNqq5XqgzbZZO5R5qt1TBTPNaQJ8qOQ9Xw0tcTV
	3mCHxMgHAKgGsdsXF0eW+sX4QAW9ppWmQh5+bcjAZvkknv56OuxQXrKTVN/mWuurdjJ4d8NhWwY
	aBHerJu6zHqwL7Q7PIgW0mTBMZnih4uyksS7Z50yRqMUyRy15FdY/OBhNLpmUlUH+vIffkFMaWS
	q3Ru2BPQZpXnev33Xhj4p0L52cMfW+oC1S/2CxHOcNFf2dCQ+PmLa4P+/lnlEP17vR/vyRzEkkQ
	C9o+0Hq02dHbLbLhcKPUXC7nyqSWzcZ7T5gTZYwkaP4Ixl4NjKkvLkcQcjiaMu0V8ycYeaqj+gH
	nVNu43KvbvF11FgGKSXClAx1y5AG+9sg0V8BlJPYoe/zYp8gOCDWxJELwszEz624G9pGDlIK2op
	ltIWxzI5z4zNiFekdpbcHYtCNmLQC0AoXdah/+8Rw+47JxdF+5vQ==
X-Received: by 2002:a05:6122:16a8:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5be89740b71mr2870565e0c.1.1783432432132;
        Tue, 07 Jul 2026 06:53:52 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be02937266sm7266465e0c.2.2026.07.07.06.53.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:53:51 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-73770fd1b65so877703137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 06:53:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq6N1wOv3wnCIcBq2UBQ1N2WNqjDuhQX4jog3lU+dvHNs6YyZYIzUeJycXnt/4Bh6HBoek/hMH0SdFdQt8IgjGpMA==@vger.kernel.org
X-Received: by 2002:a05:6102:5127:b0:633:2389:3a82 with SMTP id
 ada2fe7eead31-744b7e691b5mr2984877137.28.1783432430667; Tue, 07 Jul 2026
 06:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMRc=MeyKGv75rTLauZuGxSfgjCPXVE_r=A7uNduRr6kAd43aA@mail.gmail.com>
 <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org> <CAMRc=MegYyuqMVkG4_E_TF4hzoy1PVx=omXgZUPvnARd-Eh+7Q@mail.gmail.com>
In-Reply-To: <CAMRc=MegYyuqMVkG4_E_TF4hzoy1PVx=omXgZUPvnARd-Eh+7Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jul 2026 15:53:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnTatYWWxXS9p=_fQVSEH0fH4KzYMKKiNCN+ocSTmoww@mail.gmail.com>
X-Gm-Features: AVVi8CfRhBid3_aQOmlg9c3jWMm5fQMFfkLhy-yd2xfIq0EhzoNaQKJfylI-H7k
Message-ID: <CAMuHMdWnTatYWWxXS9p=_fQVSEH0fH4KzYMKKiNCN+ocSTmoww@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Tue, 7 Jul 2026 at 15:48, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Mon, 6 Jul 2026 15:06:01 +0200, Marek Vasut <marek.vasut@mailbox.org> said:
> > On 7/6/26 11:19 AM, Bartosz Golaszewski wrote:
> >>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> >>> +{
> >
> > I am hoping to get some input on this remap function.
>
> You mean its potential impact on performance or the implementation? In any
> case, as Geert said: a table of function pointers could help to improve it.
> I don't mind it in its current form if it works for you.

A table of register offsets.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
