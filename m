Received: from mail-ej2-f9.google.com (mail-ej2-f9.google.com [74.125.228.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267CA3DE44B
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Oct 2026 21:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791234845; cv=pass; b=hjxgLYIXPAJLs6Q9KuYK4k410mZM9m/Pg5ey1BJRfg/Mw8aZIlSX5N9bVixoq/7mQzSXJKkimfIsX5ol7eihAPcaSBzJQhTJ5j0FwPM1sRilr+i1v+bFCgA5IYIw8vPqar7mJ7lRJMwSYQPNmIIQ389Sw2c2ZsEsHa4dzH5mTYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791234845; c=relaxed/simple;
	bh=Jg+48cepgWrDgUNaKNya1rXBAe0v3PkEajJvFhN8l1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mpx8TDzQNXHki36w5zIjN7HDlU07GGxhxRo1biE574ktoeUBZ5P/O8+yqdcgZvsYJoImVj/NCgfIl+j/gvxWXSomEQHvhcmgQkU6kHbtFcdYz4Rk1v6OvP8TDUc47f/iW1wUWlbuGPOjbzqySfB6rF+lGA1eWHTc3SDEsUWBA64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLu7YO1s; arc=pass smtp.client-ip=74.125.228.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLu7YO1s"
Received: by mail-ej2-f9.google.com with SMTP id a640c23a62f3a-c2e2e238134so151270866b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Oct 2026 14:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791234840; cv=none;
        d=google.com; s=arc-20260327;
        b=rZX96/QhUn7uCjBe/eBuU+UzEXJkrGHUjAc9tdhv6oyAeSvz2q6kadTSr4mxL5llau
         EwU91vuD7MAq5+Jnukn6g7Jjx7cAoDnPQE7facSLMKbmotcwUf6rQlqfSOi3jgUG6spB
         DPnDumy7L2/aFxLCPNbDYKxFc0afRMw3oF+pTU1y7i68Bgbe+6IlC0xujvjyi9IV6VTl
         E53OWAvBfDUYyAbkkErJwXxxVZ3gMC7T+w/MLKVA0bN9GSbe+Kl/AmzK6NcUkeWARkL7
         GW20PmhJQXIbxcB/JD/rUHKaqKMjF1gn2A5SKgcyNeCDgsasWam3yvv06b+vhogJ3zHC
         FzdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jg+48cepgWrDgUNaKNya1rXBAe0v3PkEajJvFhN8l1Q=;
        fh=lH4z99r/jv41WfFHjblEfTPZ2Qe44VtmONyjjjv0VuU=;
        b=sQsNB5KJc8jUu4peilRivjrAgTbHjj3jChNLN7A9Tqtb9UXPMbJ2pT2ff04+/BA6gm
         r9dTW7pe/8c6tQfwPTUU1/c9Q5j23aQjdBCSKdrUTB22M5W2BjfF77r7SNHzC2W5aIiC
         XDofYdEXi84a3mJ7SolNhm609PIimLXQ6WxfUn+GAWKDd8Pje8SZMsVJdP6IxXPOszJM
         t9FyREEsfMpo7iHCQPSGRwZBH66QcSqPgmh5vRWVQHpI6TGMgpH1rXjIIlCc28BI3dBc
         r7ecPmt3/HE6pMQC5F8jYd83n1bdu4OL9JG2ZJWi1LcfpvgpfgGwSpWGkLFQUl22aIh5
         xYAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791234840; x=1791839640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jg+48cepgWrDgUNaKNya1rXBAe0v3PkEajJvFhN8l1Q=;
        b=lLu7YO1slAZEk+Wl6hSffZxM6Snh1lZSsi+WQAaXaQP1v5bvYdKtKSYhsF25BnML4U
         HcAmNaR1PG9wcCytglUyreRWS7KO/AQPpJ7F9m9KzqPlnUqdYVvy2gRRLgQ2BIZl03K8
         xb9tmKEGvtt8s3ek77sLxtrQ7aINnKfHP0ZyIfCvUU8nQZHqAMo6SVbKZMkI7qKXCZik
         27/FLQ6WRy15QyDVTGHvsnjOdlYnpjD5DIJb3MjNJAUU5+imo662ezsCPYAzL2qWrAtY
         i8pw5jFnjpiDUwQDMWI+OXVq/Ui0SOLBkBll3qYBsMJJ61hCONI1cQM8TJCPUXJcJl2N
         rpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791234840; x=1791839640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jg+48cepgWrDgUNaKNya1rXBAe0v3PkEajJvFhN8l1Q=;
        b=1h3IiHF4RCn+l2gW7kdRhoxgbMr+4xCy3Ghg7o1YLFpQxWfiU+jSDZuPoT7aXozCBC
         pX7lvg0gBtXbgTPwZyOhxoSyL0rn4BfSDr6n7de6G+MZb13o1r8L4/i9vkLurtbFqxUL
         JapbPk5l/a9AY0HtJZSH908/5KGmk4IHrVRQhG9UzSOLlhULzL3wQ6l5IWc1gOkYG5/r
         wxwQUPe5/blNy4elrkIfcHdgKhJIujfBL839dOEp6hcjUHEwBmF9h6xY8kvL5lE8it+i
         5UiqZ0ttQFPLCGhcJvLCVK+/b2g45FXxxnCNOHDHBXwsw1RiTZlNXzjRBCsEndQ5tsI3
         J3mw==
X-Forwarded-Encrypted: i=1; AKwUvBwuS59O4i9gUoYavAIDRrwxlpADxmdebQQr7NkCaYz56Y+uyCBYSXpOBoQS9Onq6yK5eut/348UJ8Gec2VKCp+dEw==@vger.kernel.org
X-Gm-Message-State: AFuF++lJl7d97njvVODIXMKZlCAb/vijNJj9vw6X6YrDICWR6Ki3g0kV
	OlfhC7xiNlg2BnQSWEufWIb4bQ9eq/N06Y4I0o152StKzO+W5IIXr6is5Hx3W90dJV1wCnz7+j9
	crNTT4GhYEkV01CDtLFdjKDjBGCupmfo=
X-Gm-Gg: AYBFou0r/br48163QJoQWObJ8jdwOrpCBz3t3IVSHKCxsbBqDPhFczTVQYUaAoinLyU
	bNaot9cacPUC6g8LZ2l+zJXzUUfu02LO+BV1eQBXW0gSRnBz1TX11dOGJRV6aje99bqCNHT+V1m
	JeO1ITR0mrR7874vbF7weLWe4RI2n4edRoHuVToFBKynTNzAW89cTEjIohEPra8atMefgMo6ncE
	JRmunih6mCbHF36L1u2+MukJT0RcaWiGGFoDGXkHjFmtLAWAJLphVfu60v6XL60HX+9XdNMu//c
	XTEVFD4MEmSi7adQy/o3V0gnhbRPTeBejMchHUv5EIxCmlVCL9Y2rrkVNg==
X-Received: by 2002:a17:907:940e:b0:c29:62d8:68af with SMTP id
 a640c23a62f3a-c2e4b2bc542mr1047723566b.47.1791234840255; Mon, 05 Oct 2026
 14:14:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20261005135833.37376f20@kernel.org>
In-Reply-To: <20261005135833.37376f20@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 05:13:49 +0800
X-Gm-Features: AclHuK96Q0r6tDkOyMFxRRlJTRgYT5CZFZq3doTRuVETMpVpnBIKbah20Qfa8QQ
Message-ID: <CALj3r0jgyhtmwSR03nZm4UJZ7dw6Y16X9N6-ASq9puY40zeBfA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 00/11] net: pcs: add basic support for RK3568 XPCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=BA=8C 04:58=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 23 Sep 2026 04:03:24 +0800 Coia Prant wrote:
> > This series adds proper SGMII support for the Rockchip RK3568 SoC
> > using the integrated Synopsys DesignWare XPCS, along with necessary
> > fixes and refactoring in the stmmac core and XPCS driver.
>
> Someone marked this as changes requested. Not sure who and why.
> I was waiting for an ack from DT maintainers.
> If it wasn't you, either, maybe repost to re-queue this for review?

Hi Jakub,

Thanks for the review.

Regarding the "changes requested" state: I'm not sure who set it, and I
couldn't find any specific review comment explaining it. If it was
accidental, I'm happy to repost the series to re-queue it for review.
Please let me know if a repost is what you'd prefer.

- Coia
