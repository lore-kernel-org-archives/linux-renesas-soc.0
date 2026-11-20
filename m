Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134536;
	b=DT7kMIyqo+Qhu6FNz25MEV6RqJWoVQJOeBhV/c/cxOpk3cNSqvhPrrzfoqLk58UbyCdr
	 ox0SbGDciBjlm0xDXGujD99e/EzvTAkjYrmIu5tPuUfo2s6wBM6H5+IHtZEoPFRnuFUtB
	 sDi60E62RMfwDr3UQnggZ3EjztbMu5Qg5i0nCO0zUQpshe8bUCqXzaz1XJv9hgdZ+i5sg
	 35diAJkEPD3Pvi7Uv4saQ6tvYX6ZyygSs5jG2+MK/mUXoLyhYXT02pxsmLCKggxmcyG8O
	 Zns4t/frztYbaFcrnkxNrRsa/HDi7bjFfE6pzKFL1rsfUSvdZY1Fn+G/W1X1fVlucSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134536;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=qqqdeSrEj5JJjmC58KE+C1rK4yKhYWMNP0yjqPp0SNyAl0CzLQ1f8N1VmaQZxhP3B4YP
	 LJo2dTaehKxu2I0YlYpqXBUImzWLU5TO5+siJDjPYNmdTQEd4/AV8FYMBuaAQpKNCIS5c
	 PZM9WLRdZy4JEwN4gDoE8lq6r2Jxj353FaghSS5k7+uMKJAlbDCKvKRvhwWQpugX6yQWB
	 T7PLEi0TzhE5dF14/TgRNFoMIfflR0dPxlnIjGwLNM4+kO7t/aYB/5ZSgSHlp3lgzXuvX
	 pn2F+sTlF8VuadnlsihFNeKJIOwQw1hH6t+KbGqk4wHYsowBxKW/JFkYjUhG7KQsbEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lzxmicZu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C22606A320;
	Fri, 20 Nov 2026 00:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lzxmicZu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077661F000C6;
	Fri, 20 Nov 2026 00:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795134536;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lzxmicZut6tLUv7DTRhOtWb71ejkzuXqC7mFNlyauczYpGBHJyQE09JRRVRHy4LCe
	 sG2BfUUv/p6aHphGukkk1f0xEkfoe+Ua4YSbTZqY+GFZIMZAcNKE7ItoFuFNh9dLt1
	 79jnyUZtPlXNZ2FzeJYsA/lwYpbsXlIG0LYi7d3cs0W5JYlAABt4WuzQt+RSp8bVHX
	 B5vwVDlNdqB+GfnYE0/orxo5/t7P4Fj/PGBjZAdQPjGU5JA65sWhIxo3/yxlriMToN
	 ybAnVUnh/HbXb0i4KOIn+5iDz51MtNxGc/ihy+gvXFe7LcHrGNYS9/oqR3o72A4LZf
	 L6f0afLIbQbrQ==
From: netdev-bot+sinfo@kernel.org
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@linux.dev>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 Prabhakar <prabhakar.csengg+renesas@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v5 00/24] Add ETHSW support for Renesas RZ/T2H
 and RZ/N2H SoCs
Date: Fri, 20 Nov 2026 00:28:54 +0000
Message-ID: <179513453453.3291.8493509332739817258@kernel.org>
In-Reply-To:
 <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
