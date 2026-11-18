Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795042633;
	b=n3oyRnt3b3+vs3fZwZQ2KElSI5bUSBdVjnBxDRjhsJUClc27MLSkGPnU+cGcrPTluqL/
	 8Hr7f2bcsF9KSB0+M7Go0X7nMgpSxtAxTdX1hV5a3RMuQJ6MV4+7R3225XuAmi6UWEykk
	 lP1AQ4xneq0RAviNK2fl0re+AnGJZiUyi4vdbYUVtRPRvtrA2p/wAWxktvLyGmiobJ1Eb
	 qRxCxVI7cxTICTJXCVZaQyYVOAu2c6Qb6wkslkzdVWD3H2y336Nz7X3bdfpNRQvhGXrUX
	 xEXsE/R+TLU//nF9q463isRnL0a8G1FKZLwtIg1u2JGeNHimAt41cpYotTGd8eLIQRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795042633;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=JUeLibDA+VYZixD/Sc/B3ZsReqAmwNoIsoQss3JiJZA=;
	b=dLKLIW+zeUIleEldsPalH6JFIexHYeGeIUEHPDmvGRbnS9+F06F55rojOLmEb/f0XvN3
	 1cXXGgDzUTfVvXAwPu1ZBNKL5FTSVtTfC5zkpOErMRia/7auL7YvWEAS/b/ZNr7RPUla3
	 M5EB+r76UIlWpKeW/9r7WuGNR/o5y1sI7VObnNl5rmnfdPmpxppapYEQwB8JEhhKtkWLO
	 2lJGeTEsS1gDAlqGbO3oG7YAXqODpI3N9gAqiLcPY30KVsoJHlLLVLL7uIAlGYH82Ig91
	 dB87dTvhbHbmIBAGzJX9sTBWzqSsKu+QlnjTQXzg7xpXp+DGXD4AHp4wnLtl4LwwqnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lfQM11qe;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5130E606A31C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2026 22:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5130E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lfQM11qe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795042632; x=1826578632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GBgs+ODi2ztYWUpi4l/s9u3RKGP0FkTFUEUp/V7X610=;
  b=lfQM11qe9uLmHuleg4OfDbkM/EfyZdrQfF1dMXODgPYT8egQwxbm6Hul
   3Olq5Y9HLgwUUKxXtt/LcA8+Y7DhL8QGa5qehsBTYJnJfQOKMJ4jltSvM
   QfDeHDnR1sGdUbDD9kZCjBofidcgLC4JHvPS4/8H31RkI/ckL2xKSCJgl
   tzATaujjGUS78SNbw2UTmBx7sbHhqcxTEBe8TQeBJmW26vkTLOwwKS0zr
   S7LakAa/hwAIaiKFi7sVX3yweW1EDIyHugiYG4AZHb1taJ4Bo8Lh2fBjG
   n3VvTV/qq1ik2aXfKaWAf0P2ctGUA+pN3Sc7R6jXEsq+tL41/iVcDGxmp
   w==;
X-CSE-ConnectionGUID: E6P0ZenIRZWnT2lj+WVXlw==
X-CSE-MsgGUID: uNs9MBd4QXOuSIPRdJWSmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3764940"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3764940"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 14:57:11 -0800
X-CSE-ConnectionGUID: soBvD0rWQ3yzozLTX4ssDw==
X-CSE-MsgGUID: aV3B+RZZQRW4xvSYvWCufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10402633"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 14:57:09 -0800
Date: Thu, 19 Nov 2026 00:57:05 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 20/20] drm/rcar-du: Allow VSP and writeback build with
 COMPILE_TEST=y
Message-ID: <av4tQaL6caoqd2w8@intel.com>
References: <20261118214518.29317-1-ville.syrjala@linux.intel.com>
 <20261118214518.29317-21-ville.syrjala@linux.intel.com>
 <20261118221114.GI1923307@killaraus.ideasonboard.com>
 <av4nb98f3ewe2rV3@intel.com>
 <20261118223911.GJ1923307@killaraus.ideasonboard.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118223911.GJ1923307@killaraus.ideasonboard.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Thu, Nov 19, 2026 at 12:39:11AM +0200, Laurent Pinchart wrote:
> On Thu, Nov 19, 2026 at 12:32:15AM +0200, Ville Syrjälä wrote:
> > On Thu, Nov 19, 2026 at 12:11:14AM +0200, Laurent Pinchart wrote:
> > > On Wed, Nov 18, 2026 at 11:45:17PM +0200, Ville Syrjala wrote:
> > > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > 
> > > > Make DRM_RCAR_VSP selectable with COMPILE_TEST=y, and enable the hidden
> > > > DRM_RCAR_WRITEBACK option by default, so the VSP and writeback code gets
> > > > built for greater coverage. Builds fine on x86, x86_64, arm and arm64 at
> > > > least.
> > > 
> > > Let's see what build bots will report on more exotic architectures. I
> > > may volunteer you to send a fix if I'm too busy when the builders start
> > > yelling :-)
> > > 
> > > > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Cc: Magnus Damm <magnus.damm@gmail.com>
> > > > Cc: linux-renesas-soc@vger.kernel.org
> > > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > ---
> > > >  drivers/gpu/drm/renesas/rcar-du/Kconfig | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> > > > index 80bd770ae0f6..5394f131c58f 100644
> > > > --- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
> > > > +++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> > > > @@ -76,7 +76,7 @@ config DRM_RCAR_MIPI_DSI
> > > >  	select RESET_CONTROLLER
> > > >  
> > > >  config DRM_RCAR_VSP
> > > > -	bool "R-Car DU VSP Compositor Support" if ARM
> > > > +	bool "R-Car DU VSP Compositor Support" if ARM || COMPILE_TEST
> > > 
> > > This will make it possible to disable the option when ARM64 &&
> > > COMPILE_TEST, which will break operation on Gen3 and up. It would be
> > > best to avoid that.
> > 
> > Break operation, as in when running on real hardware?
> > People actually do that with COMPILE_TEST=y kernels?
> 
> Hopefully not in production, but that may be the case during development
> (I don't though, there are enough kernel options to deal with without
> COMPILE_TEST).
> 
> This should do:
> 
> 	bool "R-Car DU VSP Compositor Support" if ARM || (COMPILE_TEST && !ARM64)
> 
> (untested though). Do you think it brings too much complexity ?

Doesn't bother me.

All I'm really after is being able to have COMPILE_TEST=y
enabled in my x86-32 and x86-64 drm-misc test build configs
so that I don't have to build on all the other architectures,
while still having reasonable confidence that I've not
completely broken some non-x86 drm driver.

-- 
Ville Syrjälä
Intel
