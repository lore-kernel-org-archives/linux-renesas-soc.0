Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0153DA5AA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 17:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790183880; cv=none; b=SfGVfvoPSJ5MEIENL9EOIa+vnzlwsimdnUO7NeYDZXB03rZneppRdatK3D7fw9qVGqslc1KWz9LeXNaAVDohi335/lPhgLq9VOu8RpxeE3OUTNeLWmnbGNNDBpJq6ccz6oLdfBCewwkJOTDfJtEC0avSMtXs97QamqtN46Bn/do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790183880; c=relaxed/simple;
	bh=ZljQMqHwG6v549mZDkNZDLzWMMaE3AUJ15PolrDNw9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRwl2kWPr2E43oRE/txerJc/xHkuIexXEVXxDE09D9wRQCJ4pielC8pTD0PJrtq61SLHOrhWhrZiMklvyFycfpqUnHt1XnGeFhRhVNmMSuCRkPWux+9YCFqBadG6hjzoLLgzJPdazy3/5sdfJnykn937f0L/sO5YIkbgVLgX2j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPCf4TPp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPCf4TPp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4707C1F00893
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 17:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790183879;
	bh=5/HoST3GzR63df+Uvj/3fSC/SiRAcz85RlsI38ulKQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kPCf4TPpXdG00im1YFmuExugL12qlxr5eXpZhHYpKLJPAjjXg/+c4jwYtYBlbDyXR
	 u1ilx+VZLfYhcrbJhfkcV/tridnYlResg0ohNSfnqycyf7A95bz+EDZTNMUZX00TwR
	 dY8MUYtS5wNk1p8YM53VAAnvczZ4XJEBy6q/ENiiNlUh7N4g0805MSdJ74VMP1otPX
	 z8fsc1jAA/UeweRgY0blN9J30y/HRANZ6u84qcAsJumJ+xoM0QPg8KIXmcHxg4mw8u
	 +FoHQTqc05UeWd3moWkRj+khB+rcUOS2jCQbeC64UlbTqjd29RCqqDTK811Q4G6tNA
	 nf+gaXqTo1dFw==
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6c2613d8157so629776eaf.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 10:17:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxlVIADyUGbwmrquTT3KQdFNYjF2VjD8HxRYrGvlEh1YtrPo4qhc44p/aouyfzQ8NY0ey5HpotCFk3wTOIG63iNjg==@vger.kernel.org
X-Gm-Message-State: AFuF++mvJWmBNiTZUu41lPmHqrXF6fpQCcZ1zAjSiApqvmSYqmL6AHt5
	kn1vR8DRhaO22dJizKp1arc2iBhChLZFjQPxtJE7LDwSvlVMHp4qPyGijtx83E0SsuKmk7glY5E
	FgjiXuzUAtRM68mKAm37s0aEF7PxEbGw=
X-Received: by 2002:a4a:ec45:0:b0:6cd:3fdb:fa5f with SMTP id
 006d021491bc7-6d2d3110fa4mr2598258eaf.74.1790183878613; Wed, 23 Sep 2026
 10:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
 <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org> <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
In-Reply-To: <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 19:17:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLk6015ShhR0XAB+NfKF1Gf9ZWA8Z_=9uU6zNZ+wHS97fg@mail.gmail.com>
X-Gm-Features: AclHuK9qcxsg_lsJQiEmVWX238l2BVV4tmPh6rvzYQgz4V44D7-NMDrSTTn0z90
Message-ID: <CAD++jLk6015ShhR0XAB+NfKF1Gf9ZWA8Z_=9uU6zNZ+wHS97fg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

> Hi Linus,
>
> Thanks for your patch!
>
> On Tue, 22 Sept 2026 at 15:34, Linus Walleij <linusw@kernel.org> wrote:
> > From: Daniel Scally <dan.scally@ideasonboard.com>
> >
> > Add the Input Video Control Block and Arm Mali-C55 ISP to the device
> > tree file for the RZ/V2H(P) SoC.
> >
> > [Rebase onto v7.3-rc1, place the nodes in address order, and sort
> >  the interrupt properties. - Linus Walleij]
> >
> > Assisted-by: LLM
>
> Dear LLM: Please take into account the review comments on the original
> submission:
> https://lore.kernel.org/CAMuHMdVCeMaQ8yFnMgr1Nko+0yQxn69BR9fGJ2WPvADMc2gvRQ@mail.gmail.com/

Don't blame the LLM, it's me.

I didn't find Daniel's original submission, just noticed this
never made it upstream.

I'll address the comments and send a v2.

Yours,
Linus Walleij
