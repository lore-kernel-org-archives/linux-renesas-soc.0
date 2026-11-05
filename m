Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873441;
	b=DsP/IDgFIK147CUypGEfEWFAsClDjpQ1ceyNXuHLkShQE8XND7P0ue+KuzXrG/RFyvdP
	 15ZewAHrU+atSCm7Lyu7JnT5m6ysl+nrNBHik1bLMPtbXKIV0LBPCbv9NbAGVjahpItPa
	 1MVbq48DxVLCgyavsg4W2uk9YK7i2YZkZ2sholHL6seVp4Ojbv9HZQ++uOueixpHY7FkU
	 PqrrnM+cnXEsdxGf/YKzvCimPtnaNJXDR3YUTT7PD+6os/i5bLJf+SVYiVniljYjJ15Ef
	 8umDnwSf7+IyUJ2Ylrlm64gDXwQmasjXjixJyi5vo3gHtqPKbnfvNXq5E9lawwd/rvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873441;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=VISxwQyrQTqbIZfR1K/ooQnU7ixN3hi1RiWSCsvjQSA=;
	b=iUhMsPxEYe/z8dpffLy36fgwvx9D1jzVGstPoDy9NpjkAStpc1k7iMwfqirBEuoCqPlJ
	 DawXPWScBdjw5+QtsGGbPhqFRBdBaG4mpEd94kXKoyrcJE2mwhj+x7+g84JmXl10y/ZaJ
	 srEIuHQCJTlKZ8RtP1KGy02LxQzJfyE5s8ww3EpoRVAG+j2Bz2y1jkQfDm+BSiXIi4A4u
	 +yqtARFx7Cvue4TN25WpT5BmLFFpMRfU462SOdyyY17KwRiMd76VrKGbKIbdUXAylDJ5v
	 u8DFfLmUWI3nBm9AtSPf/XIHz59e7Coscu+rnc9mHVNMH0vHSRsuzDaTunJkID231tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=IZUKvrFB;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673B5606AA6E;
	Thu,  5 Nov 2026 10:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 673B5606AA6E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=IZUKvrFB
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 323A9ABF;
	Thu,  5 Nov 2026 11:08:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793873298;
	bh=VISxwQyrQTqbIZfR1K/ooQnU7ixN3hi1RiWSCsvjQSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IZUKvrFBYrLvbjPv77meOLR6Em6f7zU6Jc7jF295Ty7uvyyjOENSyBgyFWbvOtNSR
	 SNJU7PXQC/KMbhQD6ppcQDN4Jp5hZo0vCMPHkc+2sjliIkW7OLYBocwpsQuWp+uZFH
	 liEFjA38q+DWfAE9UmUIKCy2/oOAkASj7BbjlUrk=
Date: Thu, 5 Nov 2026 11:10:33 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC v5 7/7] media: mali-c55: Sequence resets explicitly
Message-ID: <auxUgg0PP9xXqA68@zed>
References: <20261027-mali-c55-renesas-dts-v5-0-51bbb43969c1@kernel.org>
 <20261027-mali-c55-renesas-dts-v5-7-51bbb43969c1@kernel.org>
 <CA+V-a8vEub2y2gvXp8jkjVHOGuj1Eqkbq75t8Nezz95iidtL3Q@mail.gmail.com>
 <CAD++jLn_3X65zu8q-DfWbn4xjyPrSfp5BVH4SO96XCxmegcvXg@mail.gmail.com>
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
In-Reply-To: <CAD++jLn_3X65zu8q-DfWbn4xjyPrSfp5BVH4SO96XCxmegcvXg@mail.gmail.com>

Hi Linus

On Thu, Nov 05, 2026 at 09:58:09AM +0100, Linus Walleij wrote:
> Hi Prabhakar,
>
> thanks a lot for your help!
>
> On Tue, Nov 3, 2026 at 2:47 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
>
> > I tested on the RZ/V2H EVK with the clocks and DT left untouched,
> > changing only the reset order.
> >
> > The hang comes from the reset assert order in __mali_c55_power_off().
> > Asserting vresetn (the ISP core reset per the RZ/V2H manual) before
> > hresetn/aresetn wedges the ISP. The next power-on then stalls on its
> > first register access. The deassert order doesn't matter.
>
> OK I will drop the clock patch and keep this one.
>
> > Asserting h->a->v (deasserting v->a->h) passes repeated runtime-PM
> > cycles and also works with the IVC enabled. So 7/7 gives the right
> > reset sequence, 6/7 isn't needed for this, and the existing DT mapping
> > (0xd3 = vresetn = ISP core reset) is correct.
>
> So this is a Tested-by for this patch?
>
> > A smaller alternative keeps the bulk API and only reorders the names:
>
> I guess that works, but I'm not sure the reset bulk API in the
> kernel guarantees any order, so we better keep this patch as-is if

I was under the same impression as I have memories of quite some
conversations around this and I recall a workqueue was used to
schedule bulk reset operations.

Now that I re-looked at the implementation of
reset_control_bulk_deassert() and its history I don't see any trace of
it and the documentation says

 * Deassert the reset lines for all provided reset controls, in reverse order.

Was I hallucinating when I first suggested no ordering was guaranteed ?


> it works so we explicitly show users that this is critical.
>
> Yours,
> Linus Walleij
