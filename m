Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0075449B454
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 13:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341610; cv=none; b=n8/Nxx+l6DLARBP7XFDY7+PLWJB0f7H4CdBJNV3rzvTQPQOkJbzd/dzBrv8s4dHuHDEbnv8nx2mN6UsXZoZHcvmRitbPARMvD17tHZxT82g6g+Bav0j46EoweShNmeXFxIO2j9LK/YT18PIm1RhO75Z7sdgp8TOY2bZxfIBsZ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341610; c=relaxed/simple;
	bh=p7SRRthxa+/+KaCVwpowLzFXgidOlmApik7lGDIYm3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KFnhsXLrQOFpuQRR+mFfSFUB6PS+9Qs0EbBSlUGCABZ7pWP7bsLDoM8RqTqGkhi8LDnHe6JKKQeEeMg+cV0HT7fVFGlPAH/HWQRz03CbPv1r0zwKYgK5ib4+A1bgtOjb6FuIXaWAJw5QYlzjQUmkxIMJzZPhXtmUOc1VouspK8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nxaf1gaD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nxaf1gaD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CEF1F0089E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 13:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790341608;
	bh=mItZqQbaW3/QDrUT+nD5nQHdQY4GfBGSvPlx5RFgiFo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Nxaf1gaDTrGz+5/iPzBajcMeo0pv65XFtdZdr8i99ADdQE2153bwHURdn1/F2JBrr
	 x11xLaxDvXBUx81HVliD3FXmVH3gJ42OAaYgI3leqUJeFnuLeIV/aMLIyFbSbUznnC
	 YpLvZW3ANPWmD+RjYJzg+dFz3ebrSMyOmXWdR8GLIo3tLTNwm1mrfJqO6fnria+pYX
	 eloRaWF9v0VYNJAiGGEY/8UCiIrsGqNxacQPew9vjXo4P75agW4PROAXpbQ36D+GEV
	 ilJqf2J2ETSpbnS1rHeDo3g7LpeauOHF9PBcpvpqwy/JQov+mI9IjbWHqcY7Znz+MB
	 zHI34S2jLFHhg==
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-8137b129131so521011a34.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 06:06:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByPGrxk9mWe8mVQDTVYXMUCZU+EGzkKn1PtUDsXBq2BpWNgtBIi8WACDlVkB1CxhhBaFP+uJK0uZZEY8ElnsswJQA==@vger.kernel.org
X-Gm-Message-State: AFuF++lmZT+i1t3Hw80M/kOT0BY3EW36B8fFbg8oJ9nQi+jYUTvnTyjx
	CglPe5g70CUJ3KiCsRbnH/DvsgfFiRW+/a9RDERj8NkZch7cUDVzO+vzaW7Rx1j89Y01NryAd/e
	5+/Y/Iz3Zd/5UmJFXegSLpPPA9cNL8yA=
X-Received: by 2002:a05:6820:814:b0:6be:4117:ae1e with SMTP id
 006d021491bc7-6d43f2c78e2mr5547333eaf.14.1790341608020; Fri, 25 Sep 2026
 06:06:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-mali-c55-renesas-dts-v2-0-69f728a474a2@kernel.org> <20260925-mali-c55-renesas-dts-v2-4-69f728a474a2@kernel.org>
In-Reply-To: <20260925-mali-c55-renesas-dts-v2-4-69f728a474a2@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 25 Sep 2026 15:06:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLnaOrdu4RPAG=swg21VU3OwqK3qLibNsccM8s4Rkcbo-w@mail.gmail.com>
X-Gm-Features: AclHuK_l7bzXHW17FB1VP2a3I-hXrBCVNV6beJF5K2X0xy55AbAGagok_zP2UHw
Message-ID: <CAD++jLnaOrdu4RPAG=swg21VU3OwqK3qLibNsccM8s4Rkcbo-w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 ISP and IVC nodes
To: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 2:56=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
On Fri, Sep 25, 2026 at 11:30=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Sep 22, 2026 at 03:34:01PM +0200, Linus Walleij wrote:

> > From: Daniel Scally <dan.scally@ideasonboard.com>
> >
> > Add nodes to devicetree enabling the ISP and IVC that are found on
> > the RZ/V2H(P) SoC.
> >
> > [Rebase onto v7.3-rc1 and sort the board overrides by label.
> >  - Linus Walleij]
>
> Geert commented on the commit message in the original series, that
> comment seems to have been ignored.

Hm I managed to send out the v2 series before re-checking the mailing
list for more comments, sorry :(

Maybe Geert can augment when applying, else I can send a v3.

> > Assisted-by: LLM
>
> This gives the impression that Dan's original patch was LLM-assisted,
> which wasn't the case.

This can also be dropped when applying.

I am kind of over-reporting LLM use because I absolutely don't want
people to get wrong information here, and the tag is a kind of
all-encompassing.

What I actually use it for is pretty silly: I use an LLM to query the
datasheets for information, the rest is mostly done interactively,
but well, it was used, like I use the evince PDF reader but that
we don't have an Assisted-by tag for.

Yours,
Linus Walleij
