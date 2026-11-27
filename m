Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791547;
	b=wAXCb1ImIjPueyTI5vlSnE8UQZ325PPth4M7JBpJlfyGvsrJsrg/XLHSlFHkyVYhkH35
	 fE01cf2qLFGbVutNzHPtd7xx9r3GwAktjpAuJm+hrcFzF/QeG0rKfo9nCLFasVTqigMbY
	 e++JH/wLJTGacjWfGAAlcTBjujui6NhWq2jAhHyGkTrqH05lMavbaLTrJRHMVyUOZDPOo
	 Stm2GUFYd3wKoQr1BgQz4BLPsMSvljTUsGZYWuwmieill0bN9E4w0X4Dyf2NrSUeYY/3w
	 nrY6zX7fjvjW4JcFYZmTtwPWL9bwnGRgM7NHgOjWG7PcPjigv3nHGhJEb0aT+l1Eiig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791547;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Yj5c+ox4nuWF69zrMTOilDX3l1TsP1Ogx2b44cY9d4g=;
	b=LhmaCjnGRyjMh0fGI1fdBnMpdHHYGsn7AL7NxKDcJfLVqqumu5DyywDjBjTGijhV4vRo
	 6fp7z4/fvac+IH7H+cqn3b1rbvWI9tQiqEmACATBWBCNhqr1d+To4bUbiVCLUhWJXnXhE
	 Jm9CGKNLgDZWW2iYbs1kKs+8ASv2TLslWb2dnf/gxvRtmWmeDvlRbLyQE8YeJMCkAgVRs
	 irrCcFoM3C1Z9D1MXaZkQEwd/GPOvz1Lr5ISyolv9CIbknND+lDFaPnLYdIjySCUGaO0j
	 eafBGF1gznR3OOX6BnZIZ7kdP/PwT32SAYR0pZjLBdmWC+cuvuFuGB03h2cgucggCdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="KQO/8FsK";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0E6606A31C;
	Fri, 27 Nov 2026 14:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA0E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=KQO/8FsK
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32E2CC51;
	Fri, 27 Nov 2026 15:56:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795791389;
	bh=Yj5c+ox4nuWF69zrMTOilDX3l1TsP1Ogx2b44cY9d4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQO/8FsKGchsEjQhdVhARYu1RDE46hTrFZj6e5yIKVxVok0OgyRi6bLD6OYTrXct9
	 +3oaxYtiLSqKmXPMVYVr2A/YTn2jWXgbz1uOJgMHk8PgxpuS7HKGhzluk0nHr0Wf1N
	 QPjGmBn2EAQnyaFvEP09zdf830YZrpFeqXbzV5/o=
Date: Fri, 27 Nov 2026 15:59:01 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v6 0/6] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H
 EVK
Message-ID: <awmaoP1hE-9RsodR@zed>
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
 <CAD++jLndZTg0tk+GRo3aZrQ=0rVL+5CA=Swi7_KKQr=iBDs6Vg@mail.gmail.com>
 <awPxSN7wctw6xsDf@zed>
 <CAD++jL=iu-zT5BwUwiTmyzQpWf2M0ZBT6FsheGziKT-+xRBGYw@mail.gmail.com>
 <awmZIipVYLFh4meY@zed>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awmZIipVYLFh4meY@zed>

On Fri, Nov 27, 2026 at 03:53:31PM +0100, Jacopo Mondi wrote:
> Hello again
>
> On Mon, Nov 23, 2026 at 09:39:29AM +0100, Linus Walleij wrote:
> > On Mon, Nov 23, 2026 at 8:55 AM Jacopo Mondi
> > <jacopo.mondi@ideasonboard.com> wrote:
> >
> > > I have queued the patches already for my forthcoming PR for 7.5
> > > https://gitlab.freedesktop.org/linux-media/users/jmondi/-/commits/pr/mali-ivc/for-7.5
> >
> > Thanks Jacopo excellent news!
> >
> > > > I guess the DTS patches go to the
> > > > renesas tree and Jacopo picks up the dt-bindings and the driver fix?
> > >
> > > As we prefer, I got a PR for all 6 patches ready.
> >
> > That works fine, I don't think there will be any conflicts.
>
> Just a note here, I synced with Geert and Hans after sending a PR to
> merge the bindings changes through media, which I now learned usually

s/bindings/dts

sorry

> doesn't take those changes.
>
> bindings and driver changes will go through media
> Geert will collect the dts changes
>
> Thanks
>
> >
> > Yours,
> > Linus Walleij
