Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793962310;
	b=1nPRJNezEywSJFycBF3+C7E9IVFZZrQ72+9CYvltKlbudcVRgvS9zXrWM58/LOIiPBOJ
	 F3AJm1xm3LnrsEzRInT6bkMLrePnQx6ErVevcV3d2KpReRnZgXm6RtOKS49gp2ocVfLus
	 rhTHpx2ESf71sFgiydZlywpiTOc9UsB4+3+xmwHbZ9ZT709VVoJj3psRAAF27FPulSxDw
	 XmlxX3FaG/XRS3nR8et7PJSsS270U30F5gg+39E8oceGfCHvANp/L3lmR8ZSCpzv0gwXt
	 qvOMIXh3j9V0I/BD45BOhDbNwve2/Nz7KooTJ1f5EvTRmX/LhH3PxFJ9DkX7y8At3AA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MluEivsf91TYw2r3OQP4EHau8Z9PM71ojSNq7ZMtRTw=;
	b=swa13cT/68lHc4Q3OAekJkUJj9E0WzQCYqG+p2LMCWF0gfWi75NpvwwiEgRUyudRj9vD
	 QdJ4PTPD9RZAMGtHhB9GOCQcqCnUlFSb7Bhv+tvlh5ik5pShUstLqYR5RnjIxiGTqqhTy
	 wiHy4Kfddrc0dU3rr0gFurnGpZt45oid4y83HST4JHlTKaxRLvwc8Kf/13sjdgFIrcjnF
	 C8d3nMzSqUKxn9q0EksWAHHMX1a26V7SaVtuIo2gFUOhTTUt1bTBaCjDUwqvE2Ui40QDl
	 i42erI7avy9QB18sXG9oeowgyfC+6WBl467hdUKd7kXws0m0eApR/mZI/79woSClfOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NJCrz4N2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEADB606A32C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Nov 2026 10:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEADB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NJCrz4N2
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so2758145e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Nov 2026 02:51:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793962308; cv=none;
        d=google.com; s=arc-20260327;
        b=liEyfV9U4F1UrKEBhF79fJQTPzQdEDWVuvxMqXvbH0IMT4yRfjo+FnCppylRmWjoCn
         MmpIPc5wNFrDBEk+B6nz4SMfa9Jjp7EirVU+GnUcXMQFP+xDjqE4TRcM9rl4sqssPp82
         5jXpCkW2wOF+5WKMyxN+wTWmG4z2hqoO0F4Tc67UxpiSYejuZe+c+CDzRZFLVu5Adgym
         +D49zJ+zecAnxRRGrX0Oz9CGPk0FhNZNvMkiD1sHFjZxZ+JhdBbLGZoYzIVNW5uTrdbn
         L8Sh7tsNx3AIN1PXktWt+43rk37MeoirDncr/uVTaqPg0r28q+kWvCH9SyHQYoAfzNmQ
         4gxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MluEivsf91TYw2r3OQP4EHau8Z9PM71ojSNq7ZMtRTw=;
        fh=GRLYDIzxao17FeURkI834eorWUAIysgUhRHxkgpkOUI=;
        b=WJ8ZiroqqymLHmpxkp+Y1LB8uhrieVPG1wHkvq4VMhukWG+yd4fk5HgHKKh4va5EA+
         bUNJpcL4lybTeY4CVfoa6FtREgxEd9fldO+Iry5kNp6Ya5EUEsfDMGftYTw5wm01kpt0
         yBPH7zlwu1l88FSWPTeHZ+A2KFgS/9HB9DogbBohHUGPrO+xGpv9Xg9F/gw1ug9yMa+Z
         gLCvFwxOQpDNsE7xyM+ST7/N5GZ6SyrbkWPpFrSHuOpc82sX9pOeaC8va2ZzvuWtCSDO
         WBcae61MaR8j9SqN1nO+DkOT87roSKXvEx/Nlzq2SyJs1pk4sUVu/+oEeqRsyViJ0DgH
         /L8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793962308; x=1794567108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MluEivsf91TYw2r3OQP4EHau8Z9PM71ojSNq7ZMtRTw=;
        b=NJCrz4N2jhgRr6RUniKh7Aoz452iMWE20KsKuojzX34ruoxn3t3gclq/ivC9Hl+fkr
         Lf9e64JQBT0tdJwr3MM+yRSdgfMAvUeDnEISoHczEtjBe2focESdMfk6xo+8esrH2fS2
         +KvZG4fNk3Opof4DTZ16HIdPPEme7lKjikMSz7fhg5S0OpCvTDCPaPfCvykDBLotm9Dq
         XW6Y9ovX7U4pvygphjLTKoskUbYgdrhHyr8T9PYOP5RwkSzOp7dSuAqWgZ0r25jaHaPO
         9QxT3YR8DEo6376PsXCoVPNAg4lmmXghV464GjrFmQ65tL8Zx1RZrBjo52IZ5UuxV/LR
         p/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962308; x=1794567108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MluEivsf91TYw2r3OQP4EHau8Z9PM71ojSNq7ZMtRTw=;
        b=KQXEZrdYDzszVifNB9JKWDQyGsmFsa7BASX6kROGC80/9oFP6LFKJQfgIa3RAL0D8q
         PVmFjfY7MVC51x6sTAD6hipNvFPQat7ye+EMYHP6F7hpch/xzrhsgB7szwxwjS9YBrlx
         X/H61CEDuAt6VVFHW2oEW/+2Fwh5gQ4H+0QghfMhJzM0tkuYEwDFcjzyCl2Lk7Lkz/1/
         sd+LnTd16+kQccTpXgqbCKMnDfHN4WcwYjhUr3S5yNCrXFHEQ9pF/LQcbWOnpYdjL/5R
         HEs5RkkgkHq40666R5UZ0YnzkBRmIdxyC+JQyXfi4/UgvozBYJ5krnfp6jvi2MLuGO0k
         HUBA==
X-Forwarded-Encrypted: i=1; AKwUvByIzKd5j1LLriIhB+FeST4yVxC/v43tlCLRlEsG1740Xx/p5zAoumC5rPV5Gl0TnoMI4h33aXHeJOqzsqbam6RZ8g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8i12Mz1ah1YBA35MDwqprqQPr+GwrooEtw8UkWyOBqojQCtRb9
	OrF7+U/Ud5Npgc2s2z06dQLvW9K8/hka2OYEAJX/STCIRvfbI8V/BDBaTS0k6qb+1bNF0kgd04H
	Z7W8KIzHY/dAqRfNSJmie0rIf0FzGU6k=
X-Gm-Gg: AYBFou3eqEh47x7wa7sXLtdI455VWOVMyJaj73BjA9A4miAEcusCT9+2hkua4v/xWpd
	u+FIrLlI38ES8ALjLiJLT6JC6I3UVqKXjxmi23QTeLIHqKVGuSLEVKQ2morNi99dgl68xgtKgnb
	z5dbzBrgznouR7OAdLA3GEz3wiFECqGnmKnlNWptgVcXsl4Y7m5hBQIkFeO1LYuamT1B07fBi/l
	nAz0hJjoU7Ouln3T8WOoGxr44frywXsJ+L5+k9Ulo6jLg8SwiADKVdai9sE5BKbO/bLVkDVixBW
	kYJomZJZEQPqNGM7meQOXVrovgu0EgKFqK8bMyZOAu7roH/lAjt/zjNqdLgW7Na6w2sMxeo00bL
	zLgLuxIuKTLlzRgDowu/vDiZ8mqnwLtSGfxOTVCJAy468N+iNkDe2Pk171KggIylWJNMmokCrWA
	oSdaql8TPDqtKvNIN/UyoLiFhi9us7fh5dcjeVNmqxdFnwQc01NOiywstYsQ==
X-Received: by 2002:a05:600c:8b23:b0:4a1:6517:ccf1 with SMTP id
 5b1f17b1804b1-4b6dea6984emr35455975e9.9.1793962307992; Fri, 06 Nov 2026
 02:51:47 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org> <20261105-mali-c55-renesas-dts-v6-5-7dff41bf7107@kernel.org>
In-Reply-To: <20261105-mali-c55-renesas-dts-v6-5-7dff41bf7107@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 6 Nov 2026 10:51:21 +0000
X-Gm-Features: AclHuK-lci7FM0aGPKnhIKbKDIhrZWyf9SZlLziUPBVQ7lIewQrF1BBqVXI7RG8
Message-ID: <CA+V-a8vAKqJJmMw+FGrCyDPEh2jpOuwVJbJX=FyVzKkq=B9eZw@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 ISP and IVC nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:18=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> From: Daniel Scally <dan.scally@ideasonboard.com>
>
> Add nodes to devicetree enabling the ISP and IVC that are found on
> the RZ/V2H(P) SoC.
>
> [Rebase onto v7.4-rc1 and sort the board overrides by label.
>  - Linus Walleij]
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arc=
h/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> index 0926ab891fa5..0b3106b45074 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -305,6 +305,14 @@ versa3: clock-generator@69 {
>         };
>  };
>
> +&isp {
> +       status =3D "okay";
> +};
> +
> +&ivc {
> +       status =3D "okay";
> +};
> +
>  &mdio0 {
>         phy0: ethernet-phy@0 {
>                 compatible =3D "ethernet-phy-id0022.1640";
>
> --
> 2.56.0
>
>
