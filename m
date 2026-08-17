Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28413DBD49
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 09:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786959207; cv=none; b=jL+dBYktAjfDTklruDIOQ24a0+O9smuiZIOIxcrB79s2pEU8InmIIf44+yIe6TocwSnWN5P0CFS4a6/La13tOvYyV63VIb9Zpwfp9lDLASLG4OAmtGWTbd/eYqFGlFQhod7lQC+USm1ZIyMDJCApo39pbLNjLLc+FbATFxCFeTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786959207; c=relaxed/simple;
	bh=QnCtmOFHNq+rrHMtk/DMj1rW7ib6+1hxaUUDGHvIyhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5AIRS2GehaJwB/aVtxUQQzoWTeEkpLiCJMY74mEVKzLVX+TEYUGjHLTZsZvcpmgHIBCPhbKkIcRniRsjtArVtwHiTcrrxYbuhPxS3ORu4g3uGdc6WhcSVRFnkRimwlyZp3lGSazvzQYjUy1N4GmsCfEUPxo39Xk5l5O52+BCIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=F75bvf8U; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="F75bvf8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ITeQ
	p0onRekXV1YXpOENHXX4k4/P1gnMGaucYM+uLl4=; b=F75bvf8UOwkBTdw976I+
	jhRGNyGvPwnEsUkGkGidBjlhgrVj7aF/491lz0tNknnQ91Q2Rrja5rmRSJ649wg8
	oqnH3PGoeYcuA9rumuwUafKuffEHSGNwyTrQPSnmb1+qO+taJXHR88srdYpc1ww7
	XMtWJcuz9MqGuyMdEfHOcTn2Odp178ttAIQ3PhInzSWGw3Tp6ShLX9iSzTNj7dLn
	0MgO8ADk9hrjjZ/ofcyhXzPXdBbCUll/9cdAz2K8hRXULCkMLzHz+uT0Kzzq8/lz
	JN1mmEh4YPj/h/SD/FWIBG4Po/r3B/mwhQFip9i/QJtZisTFRSLYq44O4XHgcE4Q
	+g==
Received: (qmail 3406528 invoked from network); 17 Aug 2026 11:33:13 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Aug 2026 11:33:13 +0200
X-UD-Smtp-Session: l3s3148p1@xDHv2zpZ8rcujnve
Date: Mon, 17 Aug 2026 11:33:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 2/2] soc: renesas: rcar-mfis: add hwspinlock support
Message-ID: <aoLVWPw8jD5WxDmG@ninjato>
References: <20260718182355.50045-1-wsa+renesas@sang-engineering.com>
 <20260718182355.50045-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdVUv4JOPkm+2n_sC8_sQNrK_38WtW6_9fjmiByRTCi2vQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVUv4JOPkm+2n_sC8_sQNrK_38WtW6_9fjmiByRTCi2vQ@mail.gmail.com>

Hi Geert,

> Any specific reason this is not CCed to the hwspinlock maintainers/list?

I relied on get_maintainers, but will manually override for v2.

> > +       /* hwspinlock private data */
> > +       struct hwspinlock_device bank;
> 
> Please document this member must be last, as it contains a flexible
> array, which is not obvious to the casual reader.

Yes, will do. If my hwspinlock cleanup plan is accepted, this VLA will
luckily go away then.

> > +#define MFISLCKR8_CH_OFS (MFISLCKR8 - 8 * sizeof(u32))
> > +#define hwlock_to_local_id(hwlock) ((hwlock) - &(hwlock)->bank->lock[0])
> 
> Perhaps move this to drivers/hwspinlock/hwspinlock_internal.h
> for general use, and use it in the existing hwlock_to_id()?
> 
> Or else, open-code "hwlock_to_id(lock) - hwlock->bank->base_id" below?

Yes, putting the macro to a public header makes sense. But I really want
to do this after my header cleanups are applied. So, I will go with your
latter suggestion for now which, in deed, looks better.

> The rest LGTM.

Thank you!

