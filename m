Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199200;
	b=NZ9phZjq71KVITBpnNy/qVuu1VRaWXkcyFkQGctL+zCZKFTpVQeY8XqSqwwOR+NAUhId
	 4XoldvqH1Mr7g4/cSJcZqJIca8g6OaG22K0y69uVSAxT+5VLe5onbx08nzZWkdye9i24m
	 ZrneRcMtgylovYc8urgA2XtyqTeLHRqQOLlOE/oGplIJBR59UJ7ZGXrE4rFsA8DQkBljk
	 s5orh13BSy9kIIK6qsJZ+U+hx546lTdYvIQZ4g9pgG2KWhd8b6e6BZObUJKAeXXpbncGS
	 1KxwyodPTt7d1Q3+qSQcFJet3io06wm9NDhxe5CSornZK47NAqsZcSiKGzxKh403+5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199200;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=w0XcyVuxu+AYup+CNvj4V5SJOuKSRNC3QzsPNAgpgU8=;
	b=tCyq8eOtOT3Z/eampuamkKODmknkl1uJAbcJLeXd6cdUVBt1nR5DPXUolXrVLpRvoO0C
	 zuO42gMFOQoxyhh6GlIRcTdg6Z31XHkVNYsCUQ1pMJSrIFdSpjLbFx1Ya1qnUdX1jaaUv
	 Cs8mwvL6+iXOJbKNtoGdhXzJceWwp2yRtlUGKMsuaaW4ceBGU94xlRYil7F1dNU+UYtor
	 5UUx2XTTyISInVBbkPtZGPgOkmmBmiVN3SToKTUn9FePmkPVi/lNfdvYq8SX84GKecgUe
	 y7o/IyCv3Ju6ypheNLLYkMrXPWQeSg4FdNKiqg65HBBu5iw2azN/j9LEgoLXv/EeNmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=rlUpQot1;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6051F606A31C;
	Wed, 28 Oct 2026 14:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6051F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=rlUpQot1
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D8384F1;
	Wed, 28 Oct 2026 15:51:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793199064;
	bh=azW8YPi+emTx4FgT7E7yfRZY1IuV97x3JqPiSHLS0rQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rlUpQot1XLCeJ4LMqTuTyNgNXRdJJDfVT1PNxwHpwGlwnKGsQOpC7YfVP9GlA9WQx
	 F8JgpZ5o/hZkJ6EX33tW5OYxKeH7wFnIohvku/Gm44uhjaqKRSNh4J/vGnJK76QQ2B
	 x0WwjNaoS4NL5yGvhFl2RWl2Z/BuYdVS+gQAKW3g=
Date: Wed, 28 Oct 2026 15:53:13 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Linus Walleij <linusw@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP
 nodes
Message-ID: <auILoa4Tn2sgkC8P@zed>
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
 <asz8oEtow_lrUU7K@zed>
 <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
 <atXol9eFjLKxgTpg@zed>
 <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
 <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
 <CAD++jL=0ak_CzxvLf14XntE-cZGFVN6ZpGtkZfTJ8ae0G+RR1A@mail.gmail.com>
 <auG_dr3VFeWaBxKw@zed>
 <CAMuHMdUYXn_tZ8r5Her0y-TYfN3qd3DZ0JH1N3_fmEUHh4e0xw@mail.gmail.com>
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
In-Reply-To: <CAMuHMdUYXn_tZ8r5Her0y-TYfN3qd3DZ0JH1N3_fmEUHh4e0xw@mail.gmail.com>

On Wed, Oct 28, 2026 at 10:47:37AM +0100, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Wed, 28 Oct 2026 at 10:28, Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
> > On Wed, Oct 28, 2026 at 09:38:05AM +0100, Linus Walleij wrote:
> > > On Tue, Oct 27, 2026 at 7:39 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > The driver uses Runtime PM, but I see no calls to
> > > > pm_runtime_resume_and_get()?
> > >
> > > It gets grabbed in *params.c and *stats.c:
> >
> > pm_runtime_resume_and_get() is called in the .start_streaming handler
> > for all video nodes (capture, params and stats)
>
> OK, but not from .probe(), which does hardware initialization
> before that?

The driver doesn't depend or select PM (to be honest, I don't see why
we would run without PM these days, but that's how things are the
moment).

So the peripheral is manually powered up and pm_runtime enabled in
'active' state

static int mali_c55_probe(struct platform_device *pdev)
{

	ret = __mali_c55_power_on(mali_c55);
	if (ret)
		return dev_err_probe(dev, ret, "failed to power on\n");

	ret = mali_c55_check_hwcfg(mali_c55);
	if (ret)
		goto err_power_off;

	ret = mali_c55_init_context(mali_c55, res);
	if (ret)
		goto err_power_off;

	mali_c55->media_dev.dev = dev;

	pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
	pm_runtime_use_autosuspend(&pdev->dev);
	pm_runtime_set_active(&pdev->dev);
	pm_runtime_enable(&pdev->dev);

If that wasn't the case, the driver would have failed to identify the
peripheral and would have bailed out in mali_c55_check_hwcfg()



>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
