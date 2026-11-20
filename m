Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795185925;
	b=RH62FMGLjhVYN7JG//hCEMg/wGi2DQpVRhwJARrApRJl4WM3xoztl7p+q+E9fcLIeCGg
	 fpCP/Qw3dA3nVWMU5qFtQZHlmh4q19rE6BcMn76WatGPSeEhhJfbxg4EsRVH02uKDS8NV
	 S0G2D5jyaaFs9bu9OxWXoWxasJvGYz5Hr2r/WtqHIZVyDS+e4yliHOD3I5nap7BzV/D6V
	 ouLsUtZRvxuQTSr+eab/NTQNiV8/CuHXRGMxeKD4bliOtE+Q3Xbpv2bPPP0EKiUb1Hf5u
	 wTedPUxDU9EC9dkY41ft5JEv+W+aLRgOgJhdcEfeBAKg653sycBlKQFoXiXS1XgbqTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OM7YsIV/hvTviymzlQvqiY7ZSEwp78sZGDcRYlQvLWQ=;
	b=VSzvWfGs0QvikkXZqgjtoFOOPvNhHjHJ1g5X3yJEOFZpJw2k2fXe22INUPM/70KpgMXY
	 s64eK1z5KFzL0+Juj3fiUmQy6DYDRFk13LORTDQcL4lv53zmNWq6GLh4OqL5nRFvEeqgr
	 a7CQYYR5r2QZysrVovmBjCaeL3HsA89BO4+siXpUhpx3L3aFPhX1CIwlgruhiCyEHA/UJ
	 /ByiOhfumqsrRijFkTJVW3BuEjeEZoiIa+Z2AzHOpCyaoi+K04dospqj1zbb5gTRlZsl9
	 A9omh/AEoO195luZHkRrzTbhiG49U7fFLj4tEdrUNxNXvTLwNISVysCX6p9sxstFBrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f633lngd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B44A606A320
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 14:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B44A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f633lngd
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so16582005e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 06:45:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795185923; cv=none;
        d=google.com; s=arc-20260327;
        b=ZGZu7Qclodfu1owALEucCbODnvrrsBw7TxFzWnDAMc+X1p777yaDj16+Gir+X6bBLN
         RrCI4OVisHSNH4Bqlxcex/P1On1+G8/dJwrVHBaZqqUdTZMBaOJ6HJu1/IAG10O0iYsQ
         N9XZMpiNTbPCy6Gj9RJijOkgJ6LbvBJq933Jqfkxn9MjpJeFkkPvkHxNxdztrbpQBTNe
         McWqKxmjmRAxAllstZUKn/4zRiBpEFLAm793He03n5nzmyP/eUtMOcqSnFru+ML+oztJ
         4qIdanSbjShvvliXKIYQuhhK+vB3L7yXSzBJVI88w5IOiU2k9L8VWG1rIOsRBsUkoE3u
         cPMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OM7YsIV/hvTviymzlQvqiY7ZSEwp78sZGDcRYlQvLWQ=;
        fh=2JNrnpjyA69VxXA2ZNkX+LXDCg/0gu3ia/RpiBV+k3w=;
        b=YvM3T4GIi19rx3EMJQXHOG5JHUgmVCHrp6RHniqdQ7tObs54f30OkAqsPtJZuuzNAF
         mOXYRTR56UmVjgkAmIpvBRtT1wMwjUAw3GW2imvF3jZomhCnObnMPLep03O1SOwt7Bc9
         mIOlSV8o07Sh3u+tvDpfPe/5ZwNI4R/On/fGMHCYxs84duhqYKgRzo16ydtnaeGEH5cT
         Pw6o5HSwgSwFslFGfUM0sY2EfWzh1HzTcwhOTxUtNTHULK27r9L8293pjNN7bEPApW/I
         DD/xt9UkCmUqyvgSyOpe7xmjMsTE5XheZIj1KOfmF+H4qD/GGMzec+G07vt1BeDleVXW
         /tFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185923; x=1795790723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OM7YsIV/hvTviymzlQvqiY7ZSEwp78sZGDcRYlQvLWQ=;
        b=f633lngdGyeQgB25tTiMalyiPph+6hN8WmbHgECT82SJswThbaePLCy4l4EPftPtIp
         PKShHiUnceLJ8YtKkiJ9WD4HOohsmUPru2Rk54Jp7v+h+lt0sXRUB2JmL+vGrnho9nNL
         iNvOIx3kaDiNtxVzZSBikjptHRr4HrX4686RYbGwj4IMuKoAKLuUfOqJAi8gSRPaPPW8
         BMOEIsSuJsOCSRF04JxQaO5ZeWJ6yMpC3+5AFtTLpXCYCXRwHkR2Kh9vOi95U2BEzdFO
         6gFFqoSY53nH/uARMgEdZ9SRE2KvMbI/pXAxGuLZuo5Spmz6F1berC8LPUD2OBeVwLrd
         2gCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185923; x=1795790723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OM7YsIV/hvTviymzlQvqiY7ZSEwp78sZGDcRYlQvLWQ=;
        b=bGzgCCOJKG0jglt4W/mOJnoQfUGxw0WIoSCoN4lHRwTfsvGHgqrv1b6lvbvAMbRIxi
         dsqNDM8LtTiPuU6CdyXlL32Lo+ybGx4fUbUHhSGwqH0QA4nXQL3fAr4dd7Fy+zmXo2OM
         myfRgPhUiBe20inglBoJHSQbCfg80gRfQBIWqUVDaXqHTaf/x2l+8IqIJVvnP9YL0xXs
         293WxbpKevi2oP0KXXIZMryShpzxEgMPtX4i3vQYyIuNxTXNUZKWnzyelOM0sZAQLhh5
         W/Qpg/0VRjGecltOPRvH/0J5TCBJOc6Cly4/MEaKh9SDqcFt5YvU1clkXy0dP5Oek+eJ
         KKFQ==
X-Forwarded-Encrypted: i=1; AL+hErGlkSQZkJq1aUH3F+RgMjrIbffnSeOkgqfjfuGbZHg6fvD3ika3SJ4PgvNKB3lUZaxL5ayvnRJElTgC0igVi33aQg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/XQRH5GZiBbpO8IYi+BwID+rHcOLItyJnwnjYw77nruccqILWn
	JBUnOwYGm/s1ZdEjjfpnw+0MUD2aAn6mci2LnrhQlzRwM/JdF5hQbCcnHKKBpME886X1norkPHs
	QOYCYR19O/PfhbU/IxztRDuj3pX4jJzA=
X-Gm-Gg: AYBFou1IUiTY53o/e923yM3+ZnOQHYu4jASc4AyWh753bsvDavjdQGBQuHNSJDpMCFo
	clhByM7w9dyq0+uncO5nKw2tq/7N/Rqtn1XJof5UbH6RYKs2L7yf6YUEt+F9h7dWxzlnJu69u9N
	diHRP5njlMUnVm6r8NT+BWna2H+6Oxru0nFfFyXXS4nKeqRxM8mcpKwuCaCA0JWOOWfUEX6N9qT
	ZFw//NNyIzup5DOUMg3oectDJqIQwWXNkuVNFgGRv7iagWInelkLuchmOA6ZU7sfwDE45td5Z4P
	w2sLHqO9p+dH7GnRCCmCk6I8vESAq4u9zb/N4lVdB+uGF290R2qlwqifQShNV51eIc+jJYyJiKm
	A3aDLGjn0OUKT0J9e08XzmheT3hyZAnSF1LLtIxx70Z/SSOA4rFEWN5hUknX+wwF7P+vFlU/ItM
	BxmKnfuKmiulKYe8bvMNG5BStFi86QpogLTyYjuT6+hPrhEiUGeI4uSvXM7g59JQrLuHKBCjD1j
	pWG+FSSZ42UV7/f1GiG
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id
 5b1f17b1804b1-4bb887fb678mr70511175e9.4.1795185923328; Fri, 20 Nov 2026
 06:45:23 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261119191426.54709f08@kernel.org>
In-Reply-To: <20261119191426.54709f08@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 14:44:56 +0000
X-Gm-Features: Aa3M54pSOd6vTx4q0dKEkhbWmYi38SveFg9iQJwARff5g85g_o0F_47BDGOOQQk
Message-ID: <CA+V-a8vB25ypt5693HqdaRMefWUu5Dea52xY156jTT6roQ=q3g@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/24] Add ETHSW support for Renesas RZ/T2H
 and RZ/N2H SoCs
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

On Fri, Nov 20, 2026 at 3:14=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 20 Nov 2026 00:25:10 +0000 Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The max series size in netdev is 15 patches:
>
> Quoting documentation:
>
>   tl;dr
>   -----
>
>    - designate your patch to a tree - ``[PATCH net]`` or ``[PATCH net-nex=
t]``
>    - for fixes the ``Fixes:`` tag is required, regardless of the tree
>    - don't post large series (> 15 patches), break them up
>    - don't repost your patches within one 24h period
>    - reverse xmas tree
>
> See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#=
tl-dr
>
Thank you for the pointer; I'll make a note of it.

Cheers,
Prabhakar

> Looks like CI has already wasted time processing this, so we'll let it
> finish, but if you break this rule again you will get banned from the
> list for 3 months.
