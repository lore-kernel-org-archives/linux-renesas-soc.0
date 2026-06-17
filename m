Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D648F3B27D8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 07:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781680806; cv=none; b=VX+w3vqklhc+QmpOZus6VDDpoeeIT6xm72AU878rvPkIxTkSx+Bq17okq832gh0jSXOEWUSc3I//gokEJ92wXR1w2bMY5A1zDo5LTrbVndi0b3RrlmHLnuEATW0ouSEiLaU9swyp/G1OHPCQROIiyo8l8t+MhHwDT4FZUmVQwwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781680806; c=relaxed/simple;
	bh=5ly7+TzlKvMHDJG+KCFDA2OkEcHM6CaYu71eIzXrHMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FUy1S4XU5kArixRRM2Vf8uVfEz/9/f4MW+HuYR0mh7OLIjTIV+mamy0PhrN8m98gKcix+KHY0tZQm5oBzRGtIKcxNHLYJtP+OpCV/Qtx5G7/F9H6wUTntGDfyfye0DHCqPoyEr8MXHrg9567ZD4UbiR28coMsM4ghBFbWpHdC/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-963b04fd87aso2202245241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 00:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680804; x=1782285604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztFXz/owcY4eIy+dbZPgHvU1FccqokXXCpyEUGPoPhk=;
        b=TBxjdjSg1teUaE2sUksFV7kOQdGHRemh170//kSizIqvfGxYGvn79ZRvxikoKxBfkX
         SfJbNQubL+XeJODIDNOzjsADhtGzRLmUzYMdlmRbKjxl8MInGJfR1Bvo+whVphwUtvoF
         aAP4kzl8n9UOpsmB2jZvUp9EqLwSoJ6TiK+uQRglTjkqFx6sLyiF5OS08UPYt1wuVgPK
         bu1jzjfjsXGXiOoRKSePMRukEkng9dk+wc0NMXLPn/3vwTeYnpL38sQj/wJj47r/+f2S
         tYyBGAJm3jaGNfqEoRiEYEb4oClX3lBlSw6Vr/wQKKXwXn+74cqF0JxBdBBJgzlTMSDL
         iY+w==
X-Forwarded-Encrypted: i=1; AFNElJ+aRs5/KkVpvHRn1QxG8DGqwUMUEJ4p2WKwW8h4YIWIXhLxLPyy5a/CgB5X7Tqr5daYdXlxBZqX/ACHhuaOGZSP7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZDTvGHTqgY/F1f+hawxGkoVH1E8VCNtpes+Al5Wl7uJUTXLc2
	FURXjva9jSiuYBGfn/+I+vQnZjqevJ9ZXQxczulZ71QVkaegUeayuWaUKmVdybR6
X-Gm-Gg: Acq92OEBw+oSdeST4c0NyupQOrtF/hYgntLp3yX1HcgZBQnOb/t3iW2iv76WeAYpTe2
	2yaGBLghZdlecvKQxiPNyw5DCki0FIT90xVXOLaeSEM1+U7VrXS23sKIjeOcY8ysWASeluyXkZN
	Tul3aB6tovzDc3bxhINqJm9OacTliIkTTQWM21XdHaKtSXoFxAM35/MMEPK/LgRBnCOaWeIPdz8
	UKRFakf4xNPG6aZJNqBOz+vnkbniZg+WWA6Pv+32KhRLqK0r376rP6zi9Zn7KphCSDpCUeQu1j1
	0o+L4ozCv+Bnw6hvuYqI0mvAq5HjyZUHzfhy8AuEIDg0TpZe3qtj2QY4OxSiwYP1R2/Vcn4WTzu
	jMfr/RDxtHYVk7XChRdmmkJnBATL23qWHnnLC30wWi6b/fcHd5NajDoteEoutAcF3D9ew+4f3cy
	HL8lzzhoG17/KujyyC6j809vLLfkoQ6lTIHQyK07ABrC7K3V0hb1HQN+cctM4G
X-Received: by 2002:a05:6102:441e:b0:6f0:3c5c:76a with SMTP id ada2fe7eead31-7245a719429mr1343966137.0.1781680803721;
        Wed, 17 Jun 2026 00:20:03 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-720847c15a5sm6344450137.3.2026.06.17.00.20.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:20:03 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6cfdce656bfso1816460137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 00:20:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8DnLcoikioRgQOo1gwhDmYKMYOQECoVZAd9gKgcUY6KMvQzeDYH0mcwyHzePRuUczx08Q6/U8FXoIQfiFSq02P2w==@vger.kernel.org
X-Received: by 2002:a05:6102:3354:b0:607:4fde:1921 with SMTP id
 ada2fe7eead31-7246d33724bmr1269131137.24.1781680803055; Wed, 17 Jun 2026
 00:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615154805.1619693-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615154805.1619693-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:19:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_=9SQA8Vvt_MH+_dj+XjOozZr0ywYvqj_1rz9RdcFfg@mail.gmail.com>
X-Gm-Features: AVVi8CeCaocSZWOROZlkzUCWU99bSigpuNR2Z6uNxB9VqjP7r73Epe3QI4x_0y8
Message-ID: <CAMuHMdU_=9SQA8Vvt_MH+_dj+XjOozZr0ywYvqj_1rz9RdcFfg@mail.gmail.com>
Subject: Re: [PATCH 03/12] rtc: rzn1: Fix malformed MODULE_AUTHOR string
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 17:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Fix a malformed MODULE_AUTHOR macro in the rtc-rzn1 driver where a missing
> closing angle bracket on the second author entry creates an invalid format.
> Correct it to the standard "Name <email>" format.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
