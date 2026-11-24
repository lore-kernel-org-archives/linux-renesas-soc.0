Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487184;
	b=gZIWw5oItU1AqK3MXA66E49FlbEyt+ndHk+GuiKdB/MDLxZJdlzApnFHrvvaAgX5HmJs
	 0iFi7Bt7JttFPPIL+PMKapYPLxGNJw+DOZyxVcW3mddg9PQhwyNRdQzcHNPZhUVHn6ksN
	 FiS+V/tGUQuLDscc+vWjzhGKpdhyKNRLn50XOmBZUkiEhiJlNiClsYhJoo5NvRyBrnNZp
	 dnFxcU5HvDV3SmaF3uXqcyE4RDiQeETO7QyMCumkgs3Mk8q2f9h6sBUoHxeqg1Ut6NW+P
	 o+N1poICQk07LCi460fuQc650OteKBC4x4e85+NL1VDTQyRElVO0V7VKpy2uxe1kKpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487184;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=dkKUxZiILvLL+d+t8iprkOu9f16cw3LDGzCnoisw70w=;
	b=x4wS2O1EdI7xv/oL9UpbYe25+cSgWWhbwJjxS3h2CBm8Y7xP+sSczasPwG85cKA2WdhS
	 jig3RnGIh2qWLv9VrrvdNAp45NF8jwONJBJ24EZCcLr1oj4sZwVRSrhXh61/+gr84h+Kp
	 vLlyAbXO2q54EmBjaCkXO6l6macM/OTEYe9Pb+orDkUA2xcrZ4LQYtYr0tOYmdETJP1Cp
	 ZTbR7TCJa71OZ4hhchu3qeBJvoWqr0yFwXBVbwpn3PS941etLAihyI3eIfdRXEMLGtak/
	 3O076g4HzIWuGuUd+AZ4y2RfM0b64hosTkRd5gFbNl6VhBoyF+Ce1RNP3KztLyPGJ1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P+iuh2KX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4522606A32C;
	Tue, 24 Nov 2026 02:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P+iuh2KX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D67F1F000C6;
	Tue, 24 Nov 2026 02:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795487184;
	bh=dkKUxZiILvLL+d+t8iprkOu9f16cw3LDGzCnoisw70w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=P+iuh2KX6oubpuQ8lzvmYXA4cSD/7bQTyZ8p/G9CfUnxoH54jSogQTt/s/rJvT3Xb
	 9G821UakFqLms36i5B01g/fkIS2Kv3unI6HQth8k2zUX6DZin9eDSxYnHphhApwyCX
	 MG80MqxgnDgn79AYBz9aTh++IwhrYSSGE7s+ZQjeq31OXCHRIpGS7L3Am0I3A+AEDj
	 ZZ4x0G2B2pEQ6Mip8brEvhqBe7BYhDcAsbMRofrg5OoVtpY/BNFcMKsqNrigcZufS+
	 TKctFCypSzAW+uUY27lOwU0lF398hpkvDY9rnyZhJuKnkkBskHjKsT6Vn8vukb0W4x
	 23AvTo4fOAAQA==
Subject: Re: [PATCH net-next v5 07/24] dt-bindings: net: dsa:
 renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW support
From: netdev-bot+sashiko@kernel.org
To: prabhakar.csengg@gmail.com
Cc: clement.leger@linux.dev, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hkallweit1@gmail.com, linux@armlinux.org.uk, horms@kernel.org,
 p.zabel@pengutronix.de, geert+renesas@glider.be, magnus.damm@gmail.com,
 f.fainelli@gmail.com, ralph.siemsen@linaro.org,
 linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, prabhakar.csengg+renesas@gmail.com,
 biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com
Date: Tue, 24 Nov 2026 02:26:22 +0000
Message-ID: <179548718283.3135.16421455472482043498@kernel.org>
In-Reply-To: <20261120002549.1908299-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This patch adds `interrupts` and `interrupt-names` to the top-
  level `required:` list in…

--

dt-bindings: net: dsa: renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW support

This patch extends the A5PSW DSA binding to cover the ETHSW variant found
on the Renesas RZ/T2H and RZ/N2H SoCs. It adds dedicated compatible
strings, with RZ/T2H used as the fallback for RZ/N2H, plus per-variant
constraints on interrupts, clocks, resets and port numbers. It also adds
a co-maintainer.

> diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> index 30f25b06d62c4..c087291361760 100644
> --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml

[ ... ]

> @@ -86,6 +158,46 @@ required:
>    - clock-names
>    - power-domains
>    - ethernet-ports
> +  - interrupts
> +  - interrupt-names

[Severity: Low]
Should this change to RZ/N1 be mentioned in the commit message?

interrupts and interrupt-names are added to the top-level required list,
not to the RZ/T2H then: block. That makes them mandatory for the existing
renesas,r9a06g032-a5psw / renesas,rzn1-a5psw compatibles too.

The commit message only talks about adding the ETHSW compatibles, the
RZ/N2H fallback and the co-maintainer entry. It does not say that the
RZ/N1 schema gets stricter.

drivers/net/dsa/rzn1_a5psw.c does not request any IRQ, so no driver
depends on this. The in-tree r9a06g032.dtsi already has all five
interrupts and their names, so in-tree dtbs_check still passes. An RZ/N1
DT without these properties used to validate, but it would fail now.

Could these two entries go into the RZ/T2H then: required: list next to
resets? Or, if requiring them on RZ/N1 is intended, could the commit
message say so, or could it be split into its own patch?

> +
> +allOf:
> +  - $ref: dsa.yaml#/$defs/ethernet-ports
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-ethsw
> +    then:

[ ... ]

> +      required:
> +        - resets

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120002549.1908299-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
