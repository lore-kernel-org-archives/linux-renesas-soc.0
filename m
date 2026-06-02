Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3843A48F6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 19:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780427839; cv=pass; b=Tfi8i9JWm9JqM/t2d25gdCDEaCWmpFSLq+90yfutiEOvmFxqHfGvuE967vEBF/dge+FM+hmqmM8ml8NgJoPh1n/BImTs4Ug1HHB20BdRUjG4shVHdUPeKbNY6554AO7NioVMdCS42oAGDrTQW4fASzEQor2eLjgFchu3a+T9oXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780427839; c=relaxed/simple;
	bh=mSsK1OjXsjkFlenkPIt8hS5iFOCe8M7xFGjamW5t7xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxOMWp/g6YnRIm+5wxMHDO7usrf8Kf5APih1q67rYvqvFUlO4SvgO+UWpwdylXIM1ewcwcIGRf2EnxpZAB/cOQ6pmEJITntGhxDWuBbOcL8KSq9BSXbb8jIwQW1yP+vkPU7+3AWUr8LE5yUgSNQGTxDXRzvEQV/ZQ5Uwbbm/zNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbaPpLC5; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbaPpLC5"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45efb698ef2so1887772f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 12:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780427837; cv=none;
        d=google.com; s=arc-20240605;
        b=gPCFHXuc72b87keaXjb5DFlj82frSDFLtINyxe0HAxHm3YZ/30euzEnuAlR7gVIh4g
         xDdaW1Pizk7MClNdMAHqdoVZeptwmtMXerh+zX2i3WdTdDb9sXKtEJbIRJ0YVaaWwO1B
         4oiJl9s8JySn9Rw578riEg24PFL9UC2nRtYvVUoZS1oJe3wPPzF26fOLVAcg8qet+O15
         LhmtGBVPUy2Ix+LvyQO/TIqBvIBqUcNd5kRhJmnmdJmqitLrBIo8zZVOKedQ0a/A+BTv
         5Nef8/tSIWSLgM3zZeOonC2XEamdc3AYZQOD9EyxqMuNFRiSXYlj0iHV28GSEv3pLBNM
         kbAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pql2O34i0Txx0WbzJHzF9j1Y7wGG0LWO3D8LOQNywio=;
        fh=OH41SU2eqOy0A8HfFGva5ZPYaApRNNIwZ6KikcdF2U4=;
        b=VWr7fUTYYg0lKxe+T5EhcHUM034n8JH0FUzaa4jOgZUJFfZd7QW4bks5gErns4HWZ6
         /SNQJQTxkp64k8/rr0FS1SZNwU7gstMgAfQuGQoG0xjZXiJDkHARYtzemjTAi+3K1pks
         nGAooSn4+RomjW4OR6cTjl02elNS+2hfKvYWMTIMP+JL7rKVarhdKIqI8XGpL+7x59MR
         3W4wEg1qgIl1geqM0hiuLbgKNCEidzJOPtoAvr4613lzMNRYWye3KS45t8HGAeBbvsTB
         60zScweIXQCUtFQoHXsAK67Bkdy7EP8xkFLpIEYiwLS1taCWBSEfnFG/WVQujTVJDcit
         MM4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780427837; x=1781032637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pql2O34i0Txx0WbzJHzF9j1Y7wGG0LWO3D8LOQNywio=;
        b=mbaPpLC5N/XjPM5qMRUoKJ2aBIuj/qRSOO2bZ1J0eu9awz8nOYP0Oh44NddXzgzPOm
         sF7MjXfbrJxHh5zU39v7uVMzZYZm1wKAJ9ffqqXE/wQwB6QHnbmrTpiex9oTtxy2HTbN
         jaflA7dmNjoQb6qC8glImLF99UT1e5Il1NyRWDsOrLRJjSA6Dr6B3t5+M6/STvlFP9FM
         A4Ke3mfkVv8IK80uufu4vnxIy2NkU3rrPNJmvJJP7dgkQCiIz2egPAg+qjMB9oDKUDc7
         VBwF8E3I39Oqyvr4YYumbWi2diJ9lN7kPifUEh8dgwAUMioPz/Jq/cLURatbnDVx4kdp
         NrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780427837; x=1781032637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pql2O34i0Txx0WbzJHzF9j1Y7wGG0LWO3D8LOQNywio=;
        b=hiWya5g2SzDNkO7cM+YpGMBfYl4/NOvNz/Hal3/yQ6I/b1gPiDA7qb4AeUI2o+fo4I
         PaDhvhn4dL9d/E/YfiPXYgULhS4FXma5lyXzC0ECWJxKGrX6qKEgomIdJKqkqw3A/f/x
         t7E818YuDocm/NilrgiXad7emRgWPFLV2YgE1/UQIsA6yL1MgNWbxESI/WDxoPW9H/jc
         rkmIOXD4ICkSEwqrQzQ8aSxG/94jQdPcU07Qd+7cs9ImxfBsw0ntO/YWi3MKCrRmwSl1
         xZt7oCNk7oi5hoO/XI/eLOravbdTkhWiwMA7GWHfSUEy8xP0CwiIYLSrnDkr27EQw2YT
         86pg==
X-Forwarded-Encrypted: i=1; AFNElJ/Xx2TJ/CesO9Nal37U25MPbvyzcxqB3UJcILM7mayyzXh8womnNM6+b+xhwSADPv24Sc3cAQ2X4ezWFSZ2qbq1VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnVNe+rONzjITPZMrU3gUqlPSU7LTCJZvQgVy+dCnrpiyiitKQ
	K/5HeW+5nMSiflPypgAnHIFuH0d5Mx8DQD8lxwCLR2UL2SEJW2nCE3D7lQBNkfN2ziJsDFN1xxS
	lFbQEkamtyRWgj2kIFVk6gKi2mQXpU4I=
X-Gm-Gg: Acq92OF+jWSc4KuBjMuhVgJc5fcLZBcu+4H2PI4qWAqPKLs51VhAbkpCdJp5kCOUjmj
	RT2B412zGMccmbaWoTxwlk92DOt22hrEr8mkjRFbi4I+8nUgfSlq0s0heIeMevdzSsGZu5pBm7n
	7ulYaAWtTYVtDi7+GLTusjqcDpqVtKlZ8t5Y65auVnXDo1b0NAUyQHPgMCRH7wkeeCU3pcaEnpA
	I1pKvVnJJw/bwD7dCiWzwmOaC9SI59RdcqV1t4fRrO5sNj0ursay9jSA4fR5o5xtgocPKwH814J
	HrFb0KVUirvvyj5XbZYkLvtfr6gxD2neACRRwpJugbOO3kuW6uYAwT/PVK733ItIEfe1gqipBe0
	WvHrzleh8m5iODH2KMICFeU9oGmilpuajFpo=
X-Received: by 2002:a05:6000:cc9:b0:45e:da9b:97d6 with SMTP id
 ffacd0b85a97d-4601f6412c2mr703236f8f.27.1780427836776; Tue, 02 Jun 2026
 12:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260506164914.3987293-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <7f6fe294-582d-4668-aa77-ad9ab47cce2e@tuxon.dev>
In-Reply-To: <7f6fe294-582d-4668-aa77-ad9ab47cce2e@tuxon.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Jun 2026 20:16:50 +0100
X-Gm-Features: AVHnY4LjxLZyfS_o0rliq9dZXkh2VKw4i42Fz-8_my21m69fFg09PCpHY9lT9Do
Message-ID: <CA+V-a8vjM4wY-braP9tORROxuWqDg06Mhpdowj1A07sedh0oeA@mail.gmail.com>
Subject: Re: [PATCH 1/5] rtc: renesas-rtca3: Fix PIE clear polling condition
 in alarm setup error path
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

Thank you for the review.

On Tue, Jun 2, 2026 at 9:31=E2=80=AFAM Claudiu Beznea <claudiu.beznea@tuxon=
.dev> wrote:
>
> Hi, Prabhakar,
>
> On 5/6/26 19:49, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > In rtca3_set_alarm(), the setup_failed path attempts to disable the
> > Periodic Interrupt Enable (PIE) bit and wait until it is cleared.
> > However, the polling condition passed to readb_poll_timeout_atomic()
> > uses an incorrect expression:
> >
> >      !(tmp & ~RTCA3_RCR1_PIE)
> >
> > As ~RTCA3_RCR1_PIE evaluates to a mask of all bits except PIE, the
> > condition effectively waits for all non-PIE bits to become zero, which
> > is unrelated to the intended operation and is unlikely to ever be true.
> > This causes the poll to time out unnecessarily.
> >
> > Fix the condition to check for the PIE bit itself being cleared:
> >
> >      !(tmp & RTCA3_RCR1_PIE)
> >
> > This correctly waits until PIE is deasserted after being cleared.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
>
> I think it also deserves a Fixes tag?
>
Ok, I will add (and also CC to stable).

Cheers,
Prabhakar
