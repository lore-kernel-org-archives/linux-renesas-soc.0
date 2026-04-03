Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4434D1D5160
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 09:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208239; cv=none; b=quI4qCKHeFkNFzWNmzZNTZCgpD4YoAYYmvgHu4WsnODZONOKtSyo33ldIgBKlkrVFeB61uDOVb5Zjur3tP7ExarHf7y0wPyN6M9wBRnpKYKnZP7m2ZTzgbglNIxgcf2Vb6J1iJjcoVMP00EC7K6v87Zv+m3GaK76mKRiUy/+pS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208239; c=relaxed/simple;
	bh=m2vUozNn0aCng5ExIKXIT0OdW62fj2vQIm4HslRovuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BsD3okeRtN8lvDdwrdMR7kNEft5lMhMDR9/K18Q2f0oe3I8vgoq5cv3BBjK89VgZjhtBhuY6WXoqFHdsag92k1S0AEZZMfiezW01hHuuVFQ0t5iFJ56B1sHJ1xz/6Nyhho6PuDXcVOATb0qt82DN3rjVopxa5eqjOildbUd7XBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6058b3ec384so482172137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208237; x=1775813037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWOTSXRsWHBcjZnGGoJtQR/fyfNuqFqVCJ+5pGTBWnw=;
        b=C5aTGESAYZyhWeUBZ9wHygxAFSzvdHDVjaLMZK9MPScTLdJLphXSmABnJMmBjLDV4s
         AUmmUaJRI4ikC5Mp451BgyGynf9DhuzlzhaSblIr9oeSMk5nc8TLcIcKl+qKbLpi/Rlt
         +vWtSpmKzJs2kEJ4g1d/z/Iu3IhMITcqu6nOmvqPT9enfK3hjOQ4bPw2bKZLzUmBBfMV
         rVG/DREidfrZD6EThknLSkR9lbW13o1lrFzudqVjTrG8anDmWT2uGgGPiScvdSp8eoeS
         XDpgVimr5gx88rQ0E6HhQPZFu2gg8doU+bIWK1BC04bJ9TJKCSchdWzeV8LU4MQUW/vc
         v9aw==
X-Forwarded-Encrypted: i=1; AJvYcCUmyxzSAu0lSnfC9NfUtDgnvMKF0Oygd2/AMVoSUI1rzMDj8jUBxT4b0LpwCKJxcZjBWM1/Pv3ZB09VebAa0YXVMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKu0RjUOUSc7aMyHJXwSkgmNK+ViQBr051OzKDj3TMpktC9vDA
	ci76/kqXDA7LfV6A3uQkpxdMAIoTO0D79ETU1ITV0BlM7bZ43GkVt+cboTAgIwFS
X-Gm-Gg: AeBDievgGOWlN67iVVdAAC2G3KHMekEjt2rkgJ+LCmmTieh63LewYL12TJ2dNYUtAFZ
	V0Ne/SN97DofofK5kCe1AvlfLYUIUTAQRppIklqeb7sA+WUBX5y1hsTHtSCPfByOD2NLcio178J
	SQUK9hiuD9EzasmDYXYSEw6DW4hyoYA0khY4b4AqStc1iGKP2ptJWPhv4V8buwNnyLdDwqJXAL6
	JEVoZVE7YyFEKWnj1/kQxFgu6M/LENIjT7qyBG/SYVmV247dYKvBg3NsDSxPOxXrn3uh4JH0U5j
	avbAQwfshEVKCEXAa/uyLVIvR3VnkqptM5fjzZh9fPj05ndP5Ka4X4Ty9FAMavKoOjRgCLKf0OS
	mrQVjdNF0sFtbdJQlnXKnV6eburLy/G7ze2HffWlWf062jwCFse/9F22hMOwiAoPhAsYsCmIF9m
	2mTjglerU57Rb7hJ4zk3VAI/y3ke0+WbPSNMYmES+d9yxnbsapPPz93awYJfrc
X-Received: by 2002:a05:6102:3e27:b0:602:789e:9dea with SMTP id ada2fe7eead31-605a495b982mr794683137.0.1775208237125;
        Fri, 03 Apr 2026 02:23:57 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e73126sm6951469137.4.2026.04.03.02.23.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:23:56 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-953aacb9d78so518653241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:23:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAE55CL7B47+OcvpSDCsjgh2vXZ0QRTKtcoS+sX1cH3QCLdDabaXDSMXjDpKEXiva0gHtki0b9Oq0HWlitbdKRCQ==@vger.kernel.org
X-Received: by 2002:a67:e718:0:b0:605:6089:6745 with SMTP id
 ada2fe7eead31-605a4e54dabmr739558137.9.1775208236667; Fri, 03 Apr 2026
 02:23:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:23:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVY8ZDeh8sGJkjtVj5e0EquhwhqeCo_T=CTdnDjKdRWvQ@mail.gmail.com>
X-Gm-Features: AQROBzCrzWEeQ4kO2P7sS9dJ5S9Z5ZtuN0jTbygabX6Hc16Zm1QvZSNSKwYRCCc
Message-ID: <CAMuHMdVY8ZDeh8sGJkjtVj5e0EquhwhqeCo_T=CTdnDjKdRWvQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] ARM: dts: renesas: genmai: Drop superfluous cells
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Mar 2026 at 00:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Drop superfluous address-cells and size-cells to fix DTC warning:
> "
> arch/arm/boot/dts/renesas/r7s72100-genmai.dts:28.17-55.4: Warning (avoid_unnecessary_addr_size): /flash@18000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

My bad...
Fixes: 30e0a8cf886cb459 ("ARM: dts: renesas: genmai: Add FLASH nodes")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
