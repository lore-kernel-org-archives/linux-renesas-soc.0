Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791217;
	b=lxCvf9t5WcRSc2ADzzUYgUuBF/K+5xMiPFMDfmyD8uxJka8Td/wIdVOC0ynYbMKa1M26
	 jkQ+FoCfgfcWjn0Z2Si7B3ZdFqd4DfKR+Y2ysLrXdQFQM0uWan1+bzLPYscHW11oiU1rF
	 SyeybVs7xOVKQFzaiiMdZ4kZAegxmdXRM47qH7B7N5nSWV4WP8gP5jV4Bv268HZ/kH9Yy
	 r+JWV4h9gNtW2uLgjT47OUAVkEbJAgFIV7fHjWUa+qaoz/pDzWpB+dzbBUUCBgsspD9Jj
	 zG/Dw5Vhf3tzGSePUlnDg/V4o0Jsp+6eQuc+mxVz+fSmJAP1dfWz4d58HQ4wgJbt6gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791217;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=lzQLKADfxQ9TCWJa1S2TSrtlXnLWUhhAlPObmwIJFi8=;
	b=MRftzSc10UssYaV/jQmTNlUzf4NFUdPVuNtwg14UrxfLfFJod+NtovCPIb9BIOhSHdgV
	 3yzMIIXLYj0Quct3xkZl4TmVDFN7+6yPtJH6v7gEF3R07tnZ7O/lR51hDRinn2Pwa8qgX
	 sCqZmEZE2bU97R/wVx834wCqisPqkd8HGN9NxQxtlWmbBM055e6xtco0wmq8r06/g97I9
	 qcN9Arrjo0/OWzH6E+6alBUvS3zImzaLWX5kAQN1GBFXp809oZy0xrz9pEqQI31gpyvQF
	 cKmpRB645x8QnZlZZqmuC0PpSOGKAS0m3dGXksNUmrcrXWr4sjxhjMjG3/WJLq7VNjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=HubSv11P;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A68606A31C;
	Fri, 27 Nov 2026 14:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04A68606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=HubSv11P
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 929A9C51;
	Fri, 27 Nov 2026 15:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795791059;
	bh=lzQLKADfxQ9TCWJa1S2TSrtlXnLWUhhAlPObmwIJFi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HubSv11P3cglUfjJv1577nnNJImg6lr5FRnEsZDxazooMyyNVUunyKhU5eHmy1uwS
	 4dC5GktoFYofOhJLTNLBaHFFJ/R/jdAwbXdeQSatV1GkwyJJWjl4/BZhMklCktSIbt
	 GgWCL4agbEF1FMZN9CywjuNzqzClafYbtoidLEkc=
Date: Fri, 27 Nov 2026 15:53:31 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v6 0/6] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H
 EVK
Message-ID: <awmZIipVYLFh4meY@zed>
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
 <CAD++jLndZTg0tk+GRo3aZrQ=0rVL+5CA=Swi7_KKQr=iBDs6Vg@mail.gmail.com>
 <awPxSN7wctw6xsDf@zed>
 <CAD++jL=iu-zT5BwUwiTmyzQpWf2M0ZBT6FsheGziKT-+xRBGYw@mail.gmail.com>
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
In-Reply-To: <CAD++jL=iu-zT5BwUwiTmyzQpWf2M0ZBT6FsheGziKT-+xRBGYw@mail.gmail.com>

Hello again

On Mon, Nov 23, 2026 at 09:39:29AM +0100, Linus Walleij wrote:
> On Mon, Nov 23, 2026 at 8:55 AM Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
>
> > I have queued the patches already for my forthcoming PR for 7.5
> > https://gitlab.freedesktop.org/linux-media/users/jmondi/-/commits/pr/mali-ivc/for-7.5
>
> Thanks Jacopo excellent news!
>
> > > I guess the DTS patches go to the
> > > renesas tree and Jacopo picks up the dt-bindings and the driver fix?
> >
> > As we prefer, I got a PR for all 6 patches ready.
>
> That works fine, I don't think there will be any conflicts.

Just a note here, I synced with Geert and Hans after sending a PR to
merge the bindings changes through media, which I now learned usually
doesn't take those changes.

bindings and driver changes will go through media
Geert will collect the dts changes

Thanks

>
> Yours,
> Linus Walleij
