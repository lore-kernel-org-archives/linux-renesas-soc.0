Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27DD468C3A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796832; cv=none; b=bNSGV9oqMqKaSgtAY3Tg4XFH7liGV/GKKaJawHF5TzbgPu3QjVXjH176pHxzHoPnrDp3f6djcOVsVxdMu7w3dP+jds1ngfXDw7/GqGoNppWU7XGwbYArtY3sSOlqHuyOVCFBdZYHeNfTZ+TzrOURv6wN4ON4B251gjw5ZRJXCpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796832; c=relaxed/simple;
	bh=gxi33VLZ2gMppChwwo0+nFM5QmAtnoZp4a1bQT4ATik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a7K6fZ2saITYSaviSVG78kcvdXgv1pnc3uewROK/LGfU6tPa9bfWTuLYRGoDo3tc+HN2Y7+hEEJuPzV2gueaK9JOrsnMHilV6JE32cJGJyENx/0kN0ZaC8G/c8SzcKsOqMpGKCE9NG8+40nTZTzkO3qcY0ZXttP03O5L362B9Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5e91e422859so767236e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 02:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796830; x=1792401630;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7R9Z4v42/hEW06uLFS0AmempJdev8RXIeASGOWREk38=;
        b=dW+W9QW+swMxnpt9Ltn/o7fkLABpGCGyhJDNcjp96MRcxEoGAvT7fnBIodni5Zqc/2
         fywe5ZhE65hcGfEZFzaSIqn+/qXLyj5sIfgZNpM1hbdrnevA1gUD7/zVY5+ZRtlGQRy8
         N28uzLaOKD3Xoe8H73bLYWntNvLlBdX4omgRoCuz5EKE7Gnvv9IJ1U2BClbRkRJZ+ruC
         x2bCw50xqXJ0GuWtCiT7ILPcu0v5LGpSlcaSNKg/icM+etdRcjG7VcvYRs3ANsZkVTBg
         i2QXh9buQVSoiFhUmWZXAgpeE6wxan43NLnOjBOxwvij1Ok8/WwDh7JeNVEpW86rCtZ9
         tmQQ==
X-Forwarded-Encrypted: i=1; AKwUvByKxatBLUe5edNxR08uIgdPPiGoTG7C1FU/eHbZzTPLc5mISRPsbJNlBinnjrr2vT6EQJRHZ+2pl3Mr9X6rbZh5Hg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKOizYkwNSmXAMIuT8fAVSuS7/kBIDFeyQTncZTiujf+1Ul4CqC
	Lm6Onz50ZFf5x7Kz2Y/gZRqJ9f0+w+UurCjVTwcrvPkYMFQLMhwAQXE6g7EPkeHE
X-Gm-Gg: AYBFou1FkSyrEWjKoX9nKpNgQ+S6zkJJYUOoAynaWWPFc+fXVntHnnOxbL/QehjGSsX
	K6B/y+UI9kaCOw1J+BPYst2Q5wRzdAgsJf8bkuypjaKIzLSjJF2QOlWqKKAG3kUXSN0B7pyW7Hz
	NPbyoiVm8zIp6Bo+5v9BJzhIbIJDoy++ApAE8JQkJn7nVA1PaqP9mDjAhur8hHc0z6D6kFUDDLI
	CsG3De7aDjFhENHNIfaWy9RwEHxTAZ50VXpsh/KghXwOmjO/qMUbnXJrPZcnVvuKxtKnKJDWG9M
	QxbQrY4zZVjnIRs7mlrQOLm7ayyKZfCVmAPAYBs+fNd/uZITuJRNFvjrgyiDS3vvzV4bo2AAr8d
	a+rJHRULAfVYLlWJo+o9WcQel7N6q3N0q8vV6pMq2AYdSWCszqMKGGXceRg9Hb2lHEiJt/K8l47
	iWPj4PZhSeK0h1Bc5UIzWQLsJbGOnPe9x5VcR1SMfmJGEf80IVY5Gq5is3P4QEU/zQAf9+Lyjze
	Rfm0H4cEXSZNW/LwDm3p6BCH/BTVeQGUohlOOK1GDN8oWE=
X-Received: by 2002:a05:6102:80a3:b0:7c3:9173:b5f0 with SMTP id ada2fe7eead31-7cb372bae43mr2072850137.20.1791796829711;
        Mon, 12 Oct 2026 02:20:29 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb35471536sm6279377137.11.2026.10.12.02.20.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:20:24 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so308685241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 02:20:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwO5O4fo0UFIIEk8gfM8+nyYZEK1LHNWfqNoiXGevr79i6hEwVT9x1Xezv9TYa7F9R2lDJtOKt5tMEYOO22QMnjig==@vger.kernel.org
X-Received: by 2002:a05:6102:5088:b0:7cb:1df0:813a with SMTP id
 ada2fe7eead31-7cb369879damr2230386137.5.1791796823865; Mon, 12 Oct 2026
 02:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org> <CAD++jL=tRpv_uX8daZqK5+h_dTiUxQBYyNM2-Lb8L6n4azyfHw@mail.gmail.com>
In-Reply-To: <CAD++jL=tRpv_uX8daZqK5+h_dTiUxQBYyNM2-Lb8L6n4azyfHw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Oct 2026 11:20:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPXv9cw-obvxW6B6Y817VFkZZFzOjTWi3z_TpOnTJGxA@mail.gmail.com>
X-Gm-Features: AclHuK9gy8WPXA70y2ILBUxdR_nY10la1SOqMg9bhKMA4oPFypGa7yRQ2ztCmtY
Message-ID: <CAMuHMdUPXv9cw-obvxW6B6Y817VFkZZFzOjTWi3z_TpOnTJGxA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H EVK
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, 6 Oct 2026 at 00:14, Linus Walleij <linusw@kernel.org> wrote:
> On Mon, Sep 28, 2026 at 2:21=E2=80=AFPM Linus Walleij <linusw@kernel.org>=
 wrote:
> > Describe the optional ISP DMA line-tick and IVC frame-start/frame-stop
> > interrupts. Add the RZ/V2H(P) IVC and Arm Mali-C55 ISP nodes, connect t=
heir
> > video endpoints, and enable both blocks on the RZ/V2H EVK.
> >
> > After these patches, and enabling the right Linux drivers, we get
> > this in the console:
> > mali-c55 16080000.isp: Detected Mali-C55 ISP 9000043.31032022.0
> >
> > This was done in order to enable booting mainline with mainline
> > device trees.
> >
> > Assisted-by: LLM
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
>
> Rob ACKed the final DT bindings on this v3 patch series so maybe you
> can apply it?

Media DT bindings should go through the media tree.
Thanks for your understanding!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
