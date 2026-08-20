Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5D13C81B2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219616; cv=pass; b=VWwSVKy7X2AZzOBBeKxmh47RNhtRHfKesmmFVkFwvEQYt6WxDcQh6KubD01qmeu9+zM5iJJfjVmt08VLbh12BGSbRxQmQGUYQ0sycm9D+Sx8bqtWi2YIIvwx7jog27NaHgg+mUwGlFQ5whAiJtxKroQbAOw0IkZASjn0KCx7Luw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219616; c=relaxed/simple;
	bh=4uFua/1SLZPtH58HJboPUy8UA2xsPzLVyw6OMpvii0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWHwA4SZAm5Xq4uOVvtnp4C5r3VwxPqxGesoCTGresC7YGHgWokupJyUThZfQPw12AN3pk3EZQgjV0nkpL5CDw0ySTyxCJRkfqQ3s2TgZEkPk/iIxRzVaA8I39igpQxUeW3mhjTNlXl3ccwoq76vejUhqwH4kPmqhP6w4Ngzql0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCeuOq8L; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCeuOq8L"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f633e6058so1691555f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 02:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787219612; cv=none;
        d=google.com; s=arc-20260327;
        b=mtRK/r97rowJsLylWZ6lCbFPaiLEEySCYinGLHcgOfJdbJ76ZwU2rqsYFLDMh6okWF
         7os1yXBtm3GR+XrTdW+fU7Vv3P9LrUCciiOLF32SdxakmS0yrNBb5RISGLTuiBITar3R
         rF5Ffulif+gyaL4ymlqdvMrzZsKViXbouB4rF8Pfl8uVeUCSnp/jZiM9hKkhdQ94hJYI
         ftEHM2TMyXMR2OurXscS105WFk0/At0srMrDUyjWDeoNPV+7JsQCiGo10bqSdFUz1SH7
         TOq3LgUjGBdUicXgUx7ORiUMBDoh36FIJGbu/MUNFIVl2k3li6WOdRJQeIao8WpEzXyx
         glhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4uFua/1SLZPtH58HJboPUy8UA2xsPzLVyw6OMpvii0M=;
        fh=fPUo8roIt60uXZ3HL56ibkkRi5g5CHsQTCRUPgAkTV4=;
        b=a5MQmI0qymoC+v10liQcJLQD7UlMFMvsbNnj8eLV50cr2kiF6ji15IMxbFOt2JMRVz
         6ysHJhz+PHveVJ5ihyLxMc+WOwcHydZUGQym9hnNEXhGv4hX69166KZFbOQzKEPrs7v4
         dGDF/Ijyhm4PwAc8h1s3Mw3FHvEufBlDewb0tcxGWKdfcz85mzHVKeR6DFo50UW9wzi9
         y+ZHju/BMc34s4q+6+M9o+5+MwseV4/Lv4I2SjbCREod+XfNFlYetbZFG9pjbkoC+VUc
         7KXolF2wn/csr3nlnQDWekaVGvDBUUiLpzBqsD0kYgvzu7UGbLK6Djygi1JJ7Vf79MWL
         p/1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787219612; x=1787824412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4uFua/1SLZPtH58HJboPUy8UA2xsPzLVyw6OMpvii0M=;
        b=OCeuOq8L/hFALKirAgzAB5gMVR/19MbuNtrhrKETJYScT+IL8ayv8329DgBIz+ls/n
         bu4NXfj0gtbTyPNl/AeSLyiXeFbfeToSzOkUxITeMFwlqd1kvK9vLhWNKnHmxvw3M2q6
         FHPUGAJ0DY16BhgSIGjlXXpYxmBQyGHJSU2zliyF9TpZ8zBwzKO///UYKey3yfXAdeUd
         xOvKSpKVgAtbVn2qn5p/G6BROqYqT/Y+5aFaFrIatt67FB0iKaTnOVCeHyvQ+DTHVd9H
         sltPZksCfpKrVYz4I0TF9+UrP7KDClcWufICY4tPtQTZzAXlJgjerH9HlgnD4MZgLKky
         pe5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219612; x=1787824412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4uFua/1SLZPtH58HJboPUy8UA2xsPzLVyw6OMpvii0M=;
        b=C95JfhKz4zQCe0NAFK55adDnLDlNL24QQP5G3KM2rIICSzdyld/7gkKnMN0bsD1MTU
         KoKGdhMn59lfYCMljHOcOjUE50449mcQMYOU6T48ECeY+hmvAH9moE9F6K6sK/JDI2JE
         c/Tcc03r4dIEjNGS+rSvJQ+cpiOqyB/rjMYuYNepR1l9mju/lyfjvfMIQ1vSuME0DzE6
         gasV9k7GCcLqIz9EpauOPW/8WJ7D5zbX/KXJXWohnd+OzFiOwD/XTRiHQvmAvF33FQ5P
         FTFnb9pm/qOrUwDqq9xYbr2vbd0ZxNq5eZrRYssCwn84m7F1BG01lz71UhHKWSU/Oztt
         KRuA==
X-Forwarded-Encrypted: i=1; AHgh+RoQodoD0kIp8zW2NFvuktP/hKTjGfMb1SqB7duXlN0EayiiCpXMaP5FaPpfI1Ynfcnn9/Qgw05+fmYlKPxUuLnt2A==@vger.kernel.org
X-Gm-Message-State: AFuF++mk7wvMeKdVrVlRrvWzz7fq9Hr+aHw3OI8IEOAN/CQaVXWzghdA
	8UFy2Nwg5Lxlb1aX4+OyIeeBIMQttE0JDlsGSGIO3pbsbhnheT8F3V5Vt8d874y43xhFla/2m0C
	frWGpKZv4+B5fSHxawBi5teLnQfYDrQ8=
X-Gm-Gg: AR+sD12xbtGiASp+oemW/tvg0XGW3jiT5S2AyRzvoRqYeq6FmuVEnkuEgce4X5y3Bcd
	4tCKsNz4JyaHB+wqyMBCcYgPnc3OyhzOANWubxVFd/n0XsoPfwmunucimfbgZArzcUb9+0yNx/z
	56Cq3Kkipt+gAw6Kk5XWVpuvoGWblm1vMn0RHXtP91qkZ6OclaiGA1aPh0BuZT+xh1ZYMw4p6NM
	MKq9YTmgCcGdG33+Q8G/NjQbOoBbKBIpZSG++f1zKKpQbCBlr32pXXwJ6aKvQZOlDT0bGABsK+C
	ECXVlvRL391yAZqaY7eaUpsZs9IigpRFzNiP8kys/5mEugNnJ0uuBu88MNXtswLZ7PMK+jXHyTO
	oIBP84/7RXC9RrSfaFevFPvPSdHAb4wlmaaMxLWqHPw==
X-Received: by 2002:a5d:59a7:0:b0:47d:fc20:e7ab with SMTP id
 ffacd0b85a97d-482b1e844b5mr20227184f8f.4.1787219612250; Thu, 20 Aug 2026
 02:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-15-prabhakar.mahadev-lad.rj@bp.renesas.com> <aoWsDIfmFgkRpDje@shikoro>
In-Reply-To: <aoWsDIfmFgkRpDje@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 10:53:05 +0100
X-Gm-Features: AcwNN1WOm3KalsDKNgN_Ouo-4r3cQno4NAzdUolNyABXgRrO98d1tOFgxu9R-9E
Message-ID: <CA+V-a8sZ5nf21z6Ku-3xUaG98=ZwJ-4Z4OcVkkzL8+pg1w1r0w@mail.gmail.com>
Subject: Re: [PATCH v4 14/15] rtc: rzn1: Drop trailing comma from OF match
 table sentinel
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Wed, Aug 19, 2026 at 2:13=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Wed, Aug 19, 2026 at 11:39:25AM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Drop the trailing comma from the final empty entry in the RZN1 RTC OF
> > match table and mark it explicitly as the sentinel.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Could be folded into patch 13 in my book, but not insisting on that:
>
I'll keep this as is for now.

Cheers,
Prabhakar

> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
