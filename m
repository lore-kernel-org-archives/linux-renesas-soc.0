Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1C7371885
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 09:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798099; cv=none; b=Y9Rop8WO5CD6yEXZzi+duq9F30OyiTJGgIdBlCcrCMtXgJ/jTcVmA3tXdl2BWPi3YPWFVMYMYjDN2Des3J8iwB0hdHrPVzpeulV9IOpqmml+D+g0DNNo0Y2zIPIkw6+DR3r1hFMoSoyEZFBAI6Gm9VpTfai5cyBBZFj8odnYeI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798099; c=relaxed/simple;
	bh=rIZsMejbE7O8tt/1m16n8pgrAw/N71ziO6Vk8ZHEQ4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTmottEuuKU3bi/2IQiM4bv2Fngv76AVZOizBpF1m8hjR4acNqi8oqYlovdIhUsTXWQMIiCwEUZy0i29YtIn7Lc2VkIjWskcc5ZNBWXhc7jBmDF7N6QTaz/fw7jS4cZZuA9O8vGgorem6g1TwNJ8XHYiUnviDqTMEgmfRQlq73M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdGDIeTh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdGDIeTh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6357A1F0089F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 09:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791798098;
	bh=rIZsMejbE7O8tt/1m16n8pgrAw/N71ziO6Vk8ZHEQ4A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gdGDIeThzSNCxI2f/9/TCAEfa/+72uMc3LZLLY4oteZidxC5QZTzQ3qds5A/vhViG
	 xei/7/QVPiTiHc2yAiC9qsQcUbV6n675H5nQ/eMk9RdJoeq/0crqV3JL4HsAIPoH/j
	 yAjq69jQM7ImDDsgUAUbghdEuMR8liNEmgY8drOg0aH4lwpMJd5mhrkL754c24VNoj
	 oM4cPVACsUWzbwIgoLc29wkJQgtB2WsDuuapcMG93EJr+UgTFHprDXI2DRNH7D2NqZ
	 k1dqxj9yLDTJsyzvtEmamoIiwdLtZpr57f5Q9UjxGnKvxsBmLCeE27OxQAk8WQVGSW
	 rzODH2j024okA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a7754c2471so14372051fa.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 02:41:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzYnKjiuFHTRjdxAL88Nj/mSg5JEVeB6U3VXtNswLjCytOmROiZNVPM2oltiN65IElx3EBHRH8vXzLwI+xZ5KJZDQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLcVLBPH8HJIEdujYl0f/fg6+qivARiUellgWkygc7erXz4WWRl
	OIs17HJJewGHfjm+MWLuK7ety29T6PfrQ7vd/GGwq42Wwl2fp+kjaXeRAlNGidghHllQ2m+FWEW
	femgmpaOQN6MvavHyeZMtzhQ9iHkR/II=
X-Received: by 2002:a2e:a99e:0:b0:3a6:5b2b:c50e with SMTP id
 38308e7fff4ca-3a9c539af0cmr21868541fa.4.1791798097161; Mon, 12 Oct 2026
 02:41:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
 <20260928-mali-c55-renesas-dts-v3-2-2cf7eb746ebb@kernel.org>
 <5bc1553b-465b-42d1-a4b0-66a514b897d3@ideasonboard.com> <CAD++jLmBbMUjO-tbiQ=+G8tf=4RyKQ+=h2y=o2C+g+NY7HsqQQ@mail.gmail.com>
 <CAMuHMdXO+pZbrgG52zxOZ2W1aVcC9OT4v0Sd9C-HTHQXixksUQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXO+pZbrgG52zxOZ2W1aVcC9OT4v0Sd9C-HTHQXixksUQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Oct 2026 11:41:24 +0200
X-Gmail-Original-Message-ID: <CAD++jL=h-hFn39nsMgr0gK5-nJXQx29DZfieE32uVqno3KAgwQ@mail.gmail.com>
X-Gm-Features: AclHuK-nLh4A6ZC7C29VdQxDIFdnNpQtKMbLxMttt5fBgtbdMjdGWpNe-ulHgYg
Message-ID: <CAD++jL=h-hFn39nsMgr0gK5-nJXQx29DZfieE32uVqno3KAgwQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: media: arm,mali-c55: Describe DMA
 line-tick interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dan Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 10:48=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> > I think interrupt-names are only used if you have say 100
> > possible interrupts and only want to specify 2. So you can
> > look up the 2 you need by name.
> >
> > I don't see any situation where sparse interrupt supply
> > would be applicable for this IP? It's just 3 of them.
>
> How come we suddenly have three? There's still only a single
> possible compatible value
> Perhaps tomorrow there will be a different set of three?
> So that's why you should add interrupt-names...

OK but as you know new bindings can't really make demands on
drivers to use them, so there will still be a strict ordering
requirement for the combined interrupt to be specified
first to remain compatible with older operating systems: we
don't solve that problem.

Yours,
Linus Walleij
