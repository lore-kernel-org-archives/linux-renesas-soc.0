Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9F34A3844
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343698; cv=none; b=laBrRT97mYAbqVtp8vE55Hr9OGNQVJE3nnWpUPbSQDbsHNRUUY+ynTz7ytGpzprDNhZt5565TGFhOWzWKjs4dSYob6IqKIrcPHCzWAnxNPobCRA1ntGw3KysC8neHNwpivBAFoKdnAC3YmzwpjbJ9eoqJCm/nY2CIfb/qxMMrqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343698; c=relaxed/simple;
	bh=IRtWVZhPlxkGuhXNUXiZXi34XFGlsr0PVlco6/vlBjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNUcw4JWJJMr4memQRi4S1eRYakmwtM+yUv2kV6VsguGYErp0NZYyNDc2tq5lOIueOsqhUylIgyHi9UNl9+NolIZqRXjiU55md0LVggF7169xqhR7OSd29C8V+UPt98/NDPyeyIlB9Wl+DQojDyr1EnFJ7IAWEynDKxmC3oZA3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1xWgEJn; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1xWgEJn"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db18fe433fso3408065ad.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 06:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790343697; x=1790948497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8EotXx3jLW9THDoTXZj7S6IwWVn80ZyJZJ8OuSrsBPc=;
        b=l1xWgEJnp8GxM1E0xz9z46TwbKCuVUeG0h8hsoUAj018u7S1pUC/MWYtJ4BfD2ia/y
         t/pnbsMLl4U8kKPqV0sQoYBjschNQKU6PQDdQy7ZjYq+HNVXV94Snphw6jPl/c5cOI3C
         +oHjGmMCrsr/Ci7bDJ/4FsM5CRLT9EiKB8nI3BWkJgV3oR75eqc7gw5StQzX9RAkfYDI
         hHEGIbOvgASbqesCH1px6+wQf+AHM7cdhmqxuslthVZqgzpHJy56dJfMzcRVBZ3Mmjqz
         katNu5haZNrANXS8tyJ05rpZ39ZDx2v7TJrvzdhu54eoHIC0oo/xEwds28GlHYHhk/KS
         LlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790343697; x=1790948497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8EotXx3jLW9THDoTXZj7S6IwWVn80ZyJZJ8OuSrsBPc=;
        b=WfQWzj+I4/1uoakTIGVdGJ/MThaK9ypS5Yt8QLL0cHgY0gotbVCNausxERfM4D9Dhx
         EdKlarnJRpDHoZfJZWyQG5/8iO+vdT/NAXYrpseghA6AXsFYtD57DzLH6atRB2bpveCK
         h5BVdlt2ALSTpH6+97Zda4Pn9EBvj0Pdtn7H6wCOoTVtAdY7U/I+8vyA/wAfVFmysbvc
         BTTBCdOWEHSlqpQowk93lW9s6s1Hj/TNB1lP/FC7pSsRFR5DDfkod8xurj6gU6tqmTn4
         xqMhTDOO40T27B3xjAcG44gNr5O8S9ErCE7lO7sB6CM2yyrJpXB5spS8St5xEOVkqTAy
         T0wg==
X-Forwarded-Encrypted: i=1; AKwUvBxAZy634Z3Kao5uAC2rgTIAsKLWqSrYrGOrFzFPHcJL/OD8joNzM10XZv+0m5GeckH23E5Yoo+K7E+v++/w62tGAw==@vger.kernel.org
X-Gm-Message-State: AFuF++kJFBp1KGanqsphRE5swqqTZBgo26cN16Cwz6hDIds/T7UwbAni
	RtSeak+sZsCR/FO4dBd8CtOXvW+E6Wj0zpx+jm9DYr51XYA7I1OoOE8d
X-Gm-Gg: AYBFou1236odCZYYZ+RJIEW68XbgeAwCIAsn2dgN1Yc01LFGwt38rlLn9cEj+sSs0NW
	afMDbJz66nxUmItjNvMYcs0/+gtoX7AcvZq7/6y6CFENrx8pNKF8PUypbzwW6Nk4LMs4S9HBRo0
	aeyeNJrEp46zNkrOZPqA/htpPEZJwMqXG2HZnrwDYdLYF2b/qyge2JgxQE+KWjTfB8kDSwXevcT
	vIxSm6nY9lq1ycj1oV166cNikzglxUibFQHFRkAxAAY9LG0cYNcWxLQeQsL7AaR/bkteNBPfvC0
	7TQ+QbExZu8zxSDfFEw51CD7llUaeKwrh7/cbM+ZfudQ6fcid2YVNvlzjGVXRuHPt42/WOGtv1J
	59X1AZyzCh5laco+4PvQuw0dux1DQoMNhol3ouxiwBnQs4ni6ORF17+ZmF6kZefy8P56Uy5S+Lv
	muqfThZjHXiJcwB2VO0iR9aOJoYgsxViNPt2L/VRK/92nMKCsr5rI7Z0SU6SZ32fG2Qb38Motsb
	SlM72qrIhBF
X-Received: by 2002:a17:902:f54a:b0:2dd:c100:b2cc with SMTP id d9443c01a7336-2df7dd61e8amr45900365ad.55.1790343696491;
        Fri, 25 Sep 2026 06:41:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91460aaasm10567165ad.73.2026.09.25.06.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:41:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 06:41:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>,
	"robh@kernel.org" <robh@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
Message-ID: <17c04451-7e11-4d5f-a463-371466d41b0b@roeck-us.net>
References: <20260923105237.7B87D1F00893@smtp.kernel.org>
 <CA+V-a8uD16uG8cc9m7NHVZXT5bU64TYfu+_1POuXeioRAy6Z+A@mail.gmail.com>
 <4f5aadf0-8f23-4871-918f-430a0c99900d@roeck-us.net>
 <TY3PR01MB11346CC8B3C7374C293E0F3EB86802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2d32d7f1-f87b-45b3-9ccd-95e9773ca658@roeck-us.net>
 <TY3PR01MB113461EFFC2B9B39A53ED1D3386802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8t3HKQ6D8jb_y-XM64BHkWm3vRw6JiTydSp3rqVr9nhdg@mail.gmail.com>
 <CAMuHMdXZwnRtp=f0iOiDqoLVjBTGVYNbbLeP9E3qjTn3RUEkUg@mail.gmail.com>
 <CA+V-a8tzLEScwpJ1Va-vpEHdJeOjo4v6K8_xTH=aAGZoxFHHbA@mail.gmail.com>
 <CA+V-a8uoYZ80rpmJ4RhOA45FwouJKtFtLznjrXDyiFp6Wne=Kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8uoYZ80rpmJ4RhOA45FwouJKtFtLznjrXDyiFp6Wne=Kw@mail.gmail.com>

On Fri, Sep 25, 2026 at 01:24:32PM +0100, Lad, Prabhakar wrote:
> The DT binding patch that adds the renesas,sysc property has now been
> merged [0].
> 
> While keeping syscon support, I propose adding
> rzt2h_cpg_wdtdcr_count_start(), which can be used safely in atomic
> contexts. For non-atomic cases, we can continue using syscon.
> 
> What do you think?

Whatever you folks think will work. Personally I think this is
over-engineering. If there is memory corruption or some serial
access failure (is that system really that fragile ?), you'll
have much more severe problems to deal with than reset not working.
I would not even try to "handle" that by mandating a second reset
handler, but it is your code, after all, so I'll accept it as long
as it works.

Guenter
