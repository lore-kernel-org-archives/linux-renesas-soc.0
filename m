Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076178;
	b=Xlt7RVyoj3h2lHOjbxFRuZnC1bZ/vA71hv29fW9iDGaKkLbmDZOwmZeY9D9vkjKTQwZ7
	 2K627wu2Rh6LgN6k9LzYkcfK4GjoqA7z3QDu8t22aSd/KDZCaI+JxarkMZpimDDJdRgIP
	 RhzOwIsEasSMoETCnL1rId26ZPc7HS/NrwNCMKwdv+lnb8x017BG7SYQxXEupEhq/Qc4t
	 Hf3euUOZbFn1k+u9NNa2BnryuYMUn8oGidRIZRJvl5N4ALOn6AXV9EUO+9QFtZArU7QWX
	 qgvxiLjBfgmCMajCMdpC20agZNpp4IKbdpWozrSdP5aBNyhFUmmvZ+Fwidw5WhW8FSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076178;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=VuTS6EpHsYHfLtEyNSpadg0Vg3qtoZ0SyDKxE9024bk=;
	b=aHts5MdaUqUPk3I+ii4T0U0XEONKi9N6sni6Pbo6ZLQyjTc3+RKkE8uXSDcxRtt3Rs49
	 lHlXplcQw4f6/jfNbcjjrskMYI+Wj0FIm2pW7aRNeaSxv9bKtGrmiqM0+7Ah40jCswEuo
	 j27bEQpSTDnUPpkgVZx6U4sQX8CV4Ec1ymWTakj4pfjO0H6C8jwRv0Ft1eGr99lRDiHu3
	 JiSW3/jiLcLWv/ALqSFDZykD7dCuxxVHOaMu9ahO6vnHIGQ91fvQGZSsvxHeIlBqqvgUj
	 kq4+On4GdxvjljKccdjBce4HfEsRVMu4ZsrJNulXX9xXeg9RT0qDu/EmRiCtMoyZrtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SBDjvhVH;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681CF606A32C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 08:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 681CF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SBDjvhVH
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7FD44E6;
	Thu, 19 Nov 2026 09:13:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795076026;
	bh=I9fIZdwUtwWaOxKGVX5tqYUG9uEmcE9FWv3jz1LdbZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBDjvhVHPB97xZxJQgb9MqugDPRKfsvrtwFoiQ4CkPcjqRCwH3jjmawRiQz/1gvLN
	 YTd8sHGz1L4bERyR5buBiG3NbCFwIIzzsmS/+HM7YmeGKfaCidE1hAxe667EW0s6H7
	 R7EplmmjrHSZQLv5jEF3eFTZPUi4CJ0a41+sX6G4=
Date: Thu, 19 Nov 2026 10:16:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 20/20] drm/rcar-du: Allow VSP and writeback build with
 COMPILE_TEST=y
Message-ID: <20261119081613.GO1923307@killaraus.ideasonboard.com>
References: <20261118214518.29317-1-ville.syrjala@linux.intel.com>
 <20261118214518.29317-21-ville.syrjala@linux.intel.com>
 <20261118221114.GI1923307@killaraus.ideasonboard.com>
 <av4nb98f3ewe2rV3@intel.com>
 <20261118223911.GJ1923307@killaraus.ideasonboard.com>
 <av4tQaL6caoqd2w8@intel.com>
 <CAMuHMdWSiwX6AoPoPwF4zrYpO8xdaG=aq7U2JG_RjyS-E5UtcQ@mail.gmail.com>
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
In-Reply-To: <CAMuHMdWSiwX6AoPoPwF4zrYpO8xdaG=aq7U2JG_RjyS-E5UtcQ@mail.gmail.com>

Hi Geert,

On Thu, Nov 19, 2026 at 08:38:21AM +0100, Geert Uytterhoeven wrote:
> On Wed, 18 Nov 2026 at 23:57, Ville Syrjälä wrote:
> > On Thu, Nov 19, 2026 at 12:39:11AM +0200, Laurent Pinchart wrote:
> > > On Thu, Nov 19, 2026 at 12:32:15AM +0200, Ville Syrjälä wrote:
> > > > On Thu, Nov 19, 2026 at 12:11:14AM +0200, Laurent Pinchart wrote:
> > > > > On Wed, Nov 18, 2026 at 11:45:17PM +0200, Ville Syrjala wrote:
> > > > > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > >
> > > > > > Make DRM_RCAR_VSP selectable with COMPILE_TEST=y, and enable the hidden
> > > > > > DRM_RCAR_WRITEBACK option by default, so the VSP and writeback code gets
> > > > > > built for greater coverage. Builds fine on x86, x86_64, arm and arm64 at
> > > > > > least.
> > > > >
> > > > > Let's see what build bots will report on more exotic architectures. I
> > > > > may volunteer you to send a fix if I'm too busy when the builders start
> > > > > yelling :-)
> > > > >
> > > > > > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > > Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > > > > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > > > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > Cc: Magnus Damm <magnus.damm@gmail.com>
> > > > > > Cc: linux-renesas-soc@vger.kernel.org
> > > > > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/renesas/rcar-du/Kconfig | 4 ++--
> > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> > > > > > index 80bd770ae0f6..5394f131c58f 100644
> > > > > > --- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
> > > > > > +++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> > > > > > @@ -76,7 +76,7 @@ config DRM_RCAR_MIPI_DSI
> > > > > >         select RESET_CONTROLLER
> > > > > >
> > > > > >  config DRM_RCAR_VSP
> > > > > > -       bool "R-Car DU VSP Compositor Support" if ARM
> > > > > > +       bool "R-Car DU VSP Compositor Support" if ARM || COMPILE_TEST
> > > > >
> > > > > This will make it possible to disable the option when ARM64 &&
> > > > > COMPILE_TEST, which will break operation on Gen3 and up. It would be
> > > > > best to avoid that.
> > > >
> > > > Break operation, as in when running on real hardware?
> > > > People actually do that with COMPILE_TEST=y kernels?
> 
> COMPILE_TEST=y kernels should still work.
> 
> > > Hopefully not in production, but that may be the case during development
> > > (I don't though, there are enough kernel options to deal with without
> > > COMPILE_TEST).
> > >
> > > This should do:
> > >
> > >       bool "R-Car DU VSP Compositor Support" if ARM || (COMPILE_TEST && !ARM64)
> > >
> > > (untested though). Do you think it brings too much complexity ?
> >
> > Doesn't bother me.
> 
> It does bother me, as it breaks the safeguards encoded in Kconfig rules.
> I think it would be better if DRM_RCAR_DU would select DRM_RCAR_VSP
> if ARM64, so DRM_RCAR_VSP cannot be disabled where it is needed.

That's possibly an option too. But does

	bool "R-Car DU VSP Compositor Support" if ARM || (COMPILE_TEST && !ARM64)

break the safeguard ?

-- 
Regards,

Laurent Pinchart
