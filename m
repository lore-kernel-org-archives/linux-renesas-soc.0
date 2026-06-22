Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF2025B0B2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 14:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138238; cv=none; b=V+g411hwvm/HqbwPyMt3XCIBrafmwPJt4tGDqj34/c11UzCDd9wkZzb9cW+ohkAUrgrkiqPcjAJ+tkgc91xhIT4NxFdcplCLIdXDLDIB71p7Z2jMOgcdzQBeSaVVYz8ovFGeWUmHrYy4uKYfFa9xnsM3EtXbGpuW7+hYWNIqDCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138238; c=relaxed/simple;
	bh=r3lJ4kiRDypA2TdCk466l6gnOvWQLdaxP8w03fLtVio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i3AN+AQ0h7dqlKZzLzDbt5H7h6Cm44/1KmwzbrgS25Kk1Me+WQv4BXSMFKWI1OxDYpsx1A1wWzjlw8Ge1DTaCksKy3J8Y54Xrw85ODldyUoDYXu9A9/yHcVtSadg1L36barPG9kmt021YN5F9qXRlllaP8ZPK9eTBrBNBpxHXtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-59ebf30a91dso1567050e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 07:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782138237; x=1782743037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTuN3bG+ueEYLxM+WscVd56YjnZYXVGUSccycTk8sM4=;
        b=iFEN1XEigM3wr7ZxOYSMrL5JZO+7pRbLcO7tdIRm7AysMgTOgrElLEAB5KYF0yk5Ut
         5899Uu5T8pk5OPbWTGo5vQ6fES3r7XDJ6lkG8Mhofyq59WnKEihs4cPG1SDGitWK0Do4
         MToUjr9DcCNJgbNyCTFo4BWVqdP8IaWqPueRBwboH6sApBq0JNMGsAI1e7BJYhq7/+nC
         fsG5iOsqP0fWxrl7n1FRV+MjUh3eckg34mFc3VnOhMnIf7uWEY/iq+yfzD92SbayN23U
         f+c0gBiSY+yU/oKfVlhsBrxjdWFm2kkYM8Xxjx1lFkC7HvrZt8tQaJrrgIZHXnAivFDt
         L9hQ==
X-Forwarded-Encrypted: i=1; AFNElJ9B5XZXsJEQV+6BK387qiq51n3KYfRYY7XTIrtuumKpWYYhjAl8TN1ANDYH3L5FtOWlGbDlde0m4yv77z79qP+oAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/VJBOOpc1xp94FxWTb3ZbJpy1Jk3I03FbzpJNrFpfvCVVkqAb
	fm4eJ0sA45fwy8tMuVdudL4JpNCrTZNUy4C2Fsjfw2juRXWKSQbSAdySSj5bkmXm9h8=
X-Gm-Gg: AfdE7clHga7ZdXVJqRwgD2LcAawOzolZ+t2esrX+W82wpokYHq8yQOtzlSJCHM3g8Dr
	v9eRj41qt5t1cjO6lq3Dlm5VdO0wnNd/i5gzU0zoiN+upyjGgc8aN2w7OOYFDTVBi603FA9prfU
	TGfqIfSLx8rBEPHQ8Vj+AqayRn002Yc4a1h4Q0wPX1gt5MIGpBP8VuAt19s1u/gA+6GeJ3kBFcn
	IQZLiuhEQ09FVqVrkKntntOU+gLnijuF/MjE0bojWOAsK+II6U6czhVoo3uxoVgiI1TUItlytX5
	gP2nUGMpLSM51YH/HeqCbe5h1EwaU59S6tgV7jTlohoK06Zc9PXWHVBxx62edkq0GqYhvqJKGh9
	BOYNnXWDnVN0SRt2rPkwJKf71s5DUnfA1SKIkBEA4qPE8kHk8qLbLxq/5sUesidxnQWHTIWhCvC
	eE13VUubP07R+0guBOlsnp/uAkfisANjhLCOvogLu287dQV4KOuQ==
X-Received: by 2002:a05:6122:6161:b0:56f:a3e2:66a4 with SMTP id 71dfb90a1353d-5bbeba3e5e5mr7205783e0c.1.1782138236673;
        Mon, 22 Jun 2026 07:23:56 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfb7d309asm7136719e0c.1.2026.06.22.07.23.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 07:23:55 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-963a722ed59so1460908241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 07:23:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/vzd4sY3aqWma82eFLd86SuMfOO+WcwDZWZq2iXWT31GG/qHjMg8+zYTgy0yrUvQFy5DKRn/26Bu6ZK55/hEoexQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4425:b0:643:80f1:33d8 with SMTP id
 ada2fe7eead31-72a0168eaf6mr8780905137.4.1782138235741; Mon, 22 Jun 2026
 07:23:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429115054.158160-1-herve.codina@bootlin.com> <20260429115054.158160-5-herve.codina@bootlin.com>
In-Reply-To: <20260429115054.158160-5-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 16:23:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_PT=H6POjaQDNe0T3wDnRR0zzR=DERAs8tCmbd7yhLQ@mail.gmail.com>
X-Gm-Features: AVVi8CcQco2AWKdlNRMxb7JEavLjHlygQDEK2M26qkwC5lqRACV6o9lCgFa_anc
Message-ID: <CAMuHMdU_PT=H6POjaQDNe0T3wDnRR0zzR=DERAs8tCmbd7yhLQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] MAINTAINERS: Add the Renesas RZ/N1 timers driver entry
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Apr 2026 at 13:51, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> After contributing the driver, add myself as the maintainer for the
> Renesas RZ/N1 timers driver.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
