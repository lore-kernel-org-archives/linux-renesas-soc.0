Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87F740EB9D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 12:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574756; cv=none; b=ohQMz2YXh2nGyWZoYFJUPykBknxwX8o9uPnnKVJidLnHiANiqkKZcaT+SqTtlN+LE1JVx6ybGCDB1q23QagJMLOJy+5wGJzzHx54xywa+bXsy/C7+ORKOhx+rkme23IC7tR6dsy3zotVnA+iihPpAPYdHP46/Y7g/AaGXTZP+TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574756; c=relaxed/simple;
	bh=DEZT2iTUyT+wYINbjMVwPLrK23Cyo32nBz5M20vfPFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hFWKyWd37vcJ2nQAH9lfYC0RCKZNbLmfRO9JsfEi8GjMsl5zbmt7D2guo52nnAyBWMe4icmjbejqjCq7qSkORXMvydruLyQJnA0y9WWtBsEJ2XPkJfL91uZRMLMOCUIQnIuBCJU9POVH7pVlryRnVOBg/YVUmrsMTwRM2hgfrPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-75609e844faso2440950137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 05:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787574754; x=1788179554;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zS58fBhFuvoJHzKpw8/MR9X6Crj2kpawACKthu0lOKM=;
        b=b798pPCqoU8uaag5JWRtAfVzpfFPNRRxWy43QyOURt/F65MHAw7sOPWHDuSF/M/wii
         DBwCqvU39FhXrpw7QmkkBeUwDMQr4f3oPV1Ha1xU450HQPmMMaXlp7KRAx/d5EpY9m36
         2s/D+4AnBYTM3uFEZbfeLUZHZC8n3hkyjGy2ue5Y0nzJ4i+5RDj2ftG4/xYviwGz1OYk
         SF8xjQ2Gk0j9WiLQcyojKxisFY304v7vict/iXrNwLsYWHwqtd4WWl6ZldXo5PtBCOLS
         mV+CpU7ES9EKMG3Kp2QK6F3ikHLj3oUnlyXIB1qHQpYUeqXpx6JY3GFu6Fgjvoi1R8C2
         33Gw==
X-Forwarded-Encrypted: i=1; AHgh+RoYsXKU6fbfqPjZ4eZmbPs3K/Cd1vOxudPDbKeTRHqEv4gOJHEz0jJ6a+s4ZJk9yx7tDKt8My56o0bJrJLa3FaqAg==@vger.kernel.org
X-Gm-Message-State: AFuF++l7RRGtl9WED33eTz/9eREp6vYCQZPhFTfyjYb7iQmSLAQH+lh2
	SCkGSo/+7vHAsAaQcDgD9Tk0sM2kg7DlWCbY7NrwPqogQ+ncdS4AKwH6RmXdsJMt
X-Gm-Gg: AR+sD10MmuWV1g83UH2xLijSeBfTVjq+4Bo8NlJeOZ3ObAd4+39FPfxYHWNE8vtvplX
	vSB8Vk7B/LkV5cEri2HCzLT0zcPPRGp/n/nzozcHFk+x2mZC0qllw3nTs64ueqq+x9FkIyZjoJQ
	uLAjiwDxtgw7DKgSFqqwRc3cRviwjN51Pj/Wpwn2O6WBoGGnUsFQM0BdHSyXHW+Vyk5N9ENcpA/
	bYafP7z2KKwYTFBgqtlut+GhGzFtBUOHBgI6ci55FieZApxDTiZtmm0OiME31DAw4BkMgKKFYdd
	7hEBmZA0BbWAGC4YunCUckQkcwW2UKpxoMueznNjZGptSUWpNbSHX6maPyorXrceDHjXcpwbac6
	VBbnPzhzA5BO0cgyKzqI9xPeDsinxh+rSxC9nJWG0gFGnaotQBlp1SmuynEVxP+U6Qo/v8etVFR
	rwe+PpV5Ezh2OkH2UccsZL6H5VAVNGUTXTzDoO3a/wsr0yceXiogvfXm150viNuBRCdKBgf03Xc
	qlFLloRfS0txOdr9HR6FYV6iw==
X-Received: by 2002:a05:6102:3bd0:b0:774:ce64:242f with SMTP id ada2fe7eead31-778f3dfbef6mr6632596137.20.1787574753716;
        Mon, 24 Aug 2026 05:32:33 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c8db56329sm4885124241.3.2026.08.24.05.32.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:32:32 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7564b7a9490so2985989137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 05:32:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq0jDB+jM9pJf3AzvgGcoUW8WFQUVdgjJNaqAh9ij7d3Y6bGWrIOFzmdqUHpTb53cJQru5POykhusE81pvHXQmBAg==@vger.kernel.org
X-Received: by 2002:a05:6102:834e:20b0:778:290e:a080 with SMTP id
 ada2fe7eead31-778f2cd6323mr5912697137.13.1787574751661; Mon, 24 Aug 2026
 05:32:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260824075936.2904336-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <aowOJx0TMIZMyFUa@ninjato>
In-Reply-To: <aowOJx0TMIZMyFUa@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 14:32:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUULBe5y9tk7qj8PogPZ2+o8c8B3v1LD1+35ncV-RUPBA@mail.gmail.com>
X-Gm-Features: AcwNN1XvQ6CGj1qZ042NYJollJLUDRjaipOrbn0snBAOqHjlrtNJhLJhV7ICnUI
Message-ID: <CAMuHMdUULBe5y9tk7qj8PogPZ2+o8c8B3v1LD1+35ncV-RUPBA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 24 Aug 2026 at 11:26, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > +             rtc0 = &rtc0;
>
> Maybe 'rtc' instead of 'rtc0' throughout the patchset?
>
> @Geert: do we have a rule for this? There is also only 'gic' instead of
> 'gic0'?

There is only one GIC to rul'em all, but there can be multiple RTCs
in a system.

> What is this alias for? I don't think this is HW description?

I understand rtc0 is the main RTC.

drivers/rtc/class.c:            of_id = of_alias_get_id(dev->of_node, "rtc");
drivers/rtc/class.c:            of_id =
of_alias_get_id(dev->parent->of_node, "rtc");

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
