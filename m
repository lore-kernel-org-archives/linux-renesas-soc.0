Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359106;
	b=Q8yeGHhvDSGl+D+nmKwNPLe8VwrxlWWsHxcowmRCQdLrvRD37IXlebez6YLFVC9NBg8l
	 sApnPtHLbokeALJjshi+cxu0df6BcnsOY5Lf59ekXX8MOtGyAqMomwz6yxsYomD8QTbwP
	 EsHSPADrW1+Ox4E0SYB272hppaEIltHLArxhEVoY1AcFh+wEtaP/Avfb3ozgeCPRj3rdu
	 IwDGJMk/B1GQO0Bq+xPfPtjraP1umi1EEj450jzfjmEn+KAvL1IMV5CgNQkAvWoAVh0A8
	 I73QXTO/4rpeoB1CW+AKkaH6otSFesEECm1/yenWLJQsCH8BbKnZmKzbhNjtpVkTYwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359106;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pP1Eg7j0fEyC/wpQ+r82L7kkFTb9gJSOerVN41GQVUQ=;
	b=dzrogdHi5PgGNqSApdm3PHWgV0quXWhNwHesT6NGMwNjf1zEU+yKb4Hvt5RTioGM3n/+
	 vWdL6E5uSnAsBpvq338qdWgyBAOKqYlEcW+/gmABapC2kqejsA/7zYJUdIbMI90mF/t9f
	 jSiIN/bMem4XL4HD2FiWJVNiKxBa6rOOXZzxTWaGxikpkzgEUXu5sNLCNEn1Q3f8n04qd
	 YNXT4WBiiF4MHlFOXj17yBMAHNzw13SW1bfEsdLNR9pccujGWqo34whZwq74YTO/XRLrW
	 w6wupvjLYmkPYGtZfXcyzryjm1c54BhVByNpfn4IZ08RRI6/aU+kqmINq8Y4fYFrMpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PJnGbZJn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94B2606A320;
	Sun, 22 Nov 2026 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PJnGbZJn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20B81F000C0;
	Sun, 22 Nov 2026 14:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795359105;
	bh=pP1Eg7j0fEyC/wpQ+r82L7kkFTb9gJSOerVN41GQVUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PJnGbZJnz7BCoxtc8LVNsEWA+vw7UkZIG1UYvRus3e6zyDQUdNwU3TYCB/3y0GrWp
	 97PNWkw5YG1g0Hid3jasu7S37JR7ohbB+3J0zAkMWt8vPSm79Fl+/dwJMBN03AwPV3
	 ApmO5o415Ep14oTLaXTXsKAwCE1EfGltPOxUt8A6TWe+dmjEuN9ex4dAsAKX1DwWu9
	 Pla2zp6F/JiJKV2xBwJBqHJpbksMNMTxMxtcCyoDchkzWJa9omPU5nCVJATYqC92xl
	 g6eesqt6KHlIZW5KS1KzDQAanoo27/WXgawCgVZf/E8dV+nkGSgNgJ7JUC2CQrFaUR
	 etLzzqtfEJ8sQ==
Date: Sun, 22 Nov 2026 15:51:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v5 06/24] dt-bindings: net: dsa:
 renesas,rzn1-a5psw: Limit port reg values
Message-ID: <20261122-nifty-unnatural-caracal-1b3e4e@quoll>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
In-Reply-To: <20261120002549.1908299-7-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Fri, Nov 20, 2026 at 12:25:16AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The A5PSW has four external ports and a CPU management port, using
> port numbers from 0 to 4.
> 
> Previously, the patternProperties expression only matched port nodes
> with unit addresses from 0 to 4. This allowed port nodes with other
> unit addresses to bypass the port-specific schema constraints.
> 
> Update the pattern to match all port nodes and limit their reg values
> to a maximum of 4. This ensures the constraint is applied regardless
> of the unit address.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4->v5:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

