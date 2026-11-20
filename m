Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795144467;
	b=cDDz6qPU7nS3lgDN2qNFLVtdmQdYH6kNwriUll4pwmBB2uH6w9AfPviiqdJ2E3TuGF0h
	 hjdSUVZGA+CzHEU+icnUNTu5krwBEv4uc+LBaGVCTvXyjiZ2lHN3abqToTCEO86AYy+X3
	 ILlo6ewin44TCvoCjvRxRD/GArYmDSjU7O2KbmbUzj066NCXQQuQmZKBNd6/SK5moaBBN
	 j/cfQfhTH1DKgOiBFzfyw7bGyJQwK2zgNVm9HgbHubrwMLYf7BF5eEIynmdWMZbhWbkXl
	 sy+R6wGJy9GEMkPowT+8WjwZtQ+OPY7h2ClIfxioKi0L0zj7Ps0/HiX+9RWojTAPOjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144467;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ciRzu8MyjkNcy8WiMA7e0XDmBm5HzTeIk4oYYLr2Jn4=;
	b=2E/jKIUjy32yFq4iY4hN1yv83RW9EAcUdS5J19NNGbUqQYNVdFcuuHlvbxKslRbU/p4S
	 tcljdorQHp3BEWh4OIo/sWdNWA2mYJF2VaG98Sj5vNY8TA8q7VSVArzjX7OWWo8QK4xcm
	 bd69DWfPJA6l8Xpr41TkZ7TACFEoRhxSrvyI6Zgk/U6UE29NvhJyW0h9Tz5bmk7fR8Kbu
	 yIQGyyeV8GBB8C5mGqRBxfhkDv1n6oG2muPD4of22IGmFpMeBQH3dOAoGtQmWLtdTnhSr
	 ux2qByFZi/BTRlW1u9q2k77Fn/sAQnM9vbQmuZWJ/t4sehY3KNtXbQUIyygyDpzGt1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="f/uZ/Wgm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36C7606A330;
	Fri, 20 Nov 2026 03:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f/uZ/Wgm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B361F000CF;
	Fri, 20 Nov 2026 03:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795144467;
	bh=ciRzu8MyjkNcy8WiMA7e0XDmBm5HzTeIk4oYYLr2Jn4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=f/uZ/WgmpPuy8le18X2pOf+InT9Iz8ttI4uKEDuv4Dbtx9cLzQwoDDnD9lyTMyvH3
	 jNWNW3FU9BLsIXUHVOfcyBIr9l+xUyvPf5ljotQnXTxCdDuqN+miM75sxLGKtbgmGm
	 TqgHTf0P9SufWnW1EOF9+6qGOQZdrGDEFoF20oQ+WMvkNHZhu5ZuFSyH578MWY0rLT
	 eb47yMyoajnyTYHdMPCxaxdU3F0TShjUaOp4hce86dNVcxeOmX3IJ4RlY9LzTiK8+J
	 R4HEhIhas41NSvx09qjQI847JUifHIj6x9opvEbw9jxHpNAhjzwVbjQM8Sy9kTIMHg
	 Y4JALPQy3ZXLQ==
Date: Thu, 19 Nov 2026 19:14:26 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, Andrew Lunn
 <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Simon Horman
 <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Ralph
 Siemsen <ralph.siemsen@linaro.org>, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org, Prabhakar
 <prabhakar.csengg+renesas@gmail.com>, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v5 00/24] Add ETHSW support for Renesas RZ/T2H
 and RZ/N2H SoCs
Message-ID: <20261119191426.54709f08@kernel.org>
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Nov 2026 00:25:10 +0000 Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The max series size in netdev is 15 patches:

Quoting documentation:

  tl;dr
  -----
  
   - designate your patch to a tree - ``[PATCH net]`` or ``[PATCH net-next]``
   - for fixes the ``Fixes:`` tag is required, regardless of the tree
   - don't post large series (> 15 patches), break them up
   - don't repost your patches within one 24h period
   - reverse xmas tree
  
See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#tl-dr

Looks like CI has already wasted time processing this, so we'll let it
finish, but if you break this rule again you will get banned from the
list for 3 months.
