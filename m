Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700010;
	b=srarwkI3k3sOWHUxVXF7FMxRogXDTsgCICF5K6RU/ZKmDDjbxD3ByzdPdpupwgz6JVMo
	 MewKShOBMjMcZzzMpGkOtMto6CgrCQHIQiOxTj6G1ONDVm8X2JHNG7i5zLXD8d/J3xfSm
	 jl7gTe4Scx1txxrgeQHtsFp3azYW/Oa5C/6RjYGuF+9f8egNaE+dWtPkaGFXCtunGaCJN
	 vkNzEql3skQ6qMbFKjLo0FGyTFCOZZnzGjZfk/IZnlFTXAThMVPhkNlU/FLofzP6pHQyG
	 vX6zNi/ID40CegQEY7MBMFJcvPqGQyi9nA6/H0BqAHWavWSoN6p3+AS9IULiNluHx5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700010;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HcwFZv9BM0w57FN62L5UyDAXYgvPAV25zeOmEc/ACiU=;
	b=SxqomkvDvwqIj3L50pysiFR3SmZLyk8nufHYYT9wJuPaMk1/Zvcz87lqt5Ih5Nibfe2N
	 Cb3mZKbLcuI5GZicaeA60ev6z7phkuyaM65ZEqiIwHF3kmSRBi5yHiCsLIORRB3WjZGm2
	 gn1+9klilqqB2+Udj+9pCWZ4EV4zDhRC8fPYQYcRBSSbC/UB1ljAl0t8wuw8ACFC0vzbo
	 oeDppea7vNEe8qahoO99fo2weSxao3oWKpeEs2Ycbi7BF9+i3k4MhyrChPHUH4O8g5bRj
	 jWp1Wa28DlxOXPNzWLWKZkmoXP6I7PiFkzImSuhKxHgaCOmoNcnbLn7PYr5JLAlloPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CA4606A327
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 13:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61CA4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-99c042cee7dso3694013241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 05:33:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700009; x=1796304809;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcwFZv9BM0w57FN62L5UyDAXYgvPAV25zeOmEc/ACiU=;
        b=xMld0zScRbjCVsPX5udUhxT5IgDbhMiUlrZ14SpqwIiM3Xuy+3R03AhUCk9x5mzwaO
         s9q23KOyKd1GsKrBjFWdRbkcgoDL3kayCZSNXxhZizKwIKzvivGMiVG0HHVMfOQQqVdh
         aJ3AxQvTFDoudp6g0r3AG/u9LMGoiCYJRX3cOSk/KIEtRMCIlxq6BKcM3WlXvMqz6gNk
         XrBJSZq9Hjq9Jxf75wtZ4Em/Tq4gFFLgW9ak+lvizUnN3T6V96Nwudftzg3TnTxyhb7t
         gEJiPOOq/0qiDEDSQQdIA06Yd86jXhAClLYmTTsQnDqlcvKlRW205lTAqZ4sZqY61w6J
         WP8w==
X-Forwarded-Encrypted: i=1; AL+hErHyd6/OLkUSPgTtUXkn0Pygvo3Rm4Z2LR1zaesE3J0mCapRXKospoPlmUlDKCsv9/wNXVUkR5i1Ts7EZqXbtCbE8w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9vg3curDym2MSmhQ5lr0iZShvo06Jspom8BogS5cATePE8efiM
	nPJ4yhDwb7O7tBORvWC8oBIMuJyIqewcyUHipq8r1ZHvn0EarEbe7I966OdAMve6
X-Gm-Gg: AZFdTZe6i68952JTsxeuIWhZEm0u9t+7i8PRDkTV0imsANu7DXES/S8+22tR1OjCfzm
	NK/2n0P6ZT8q3/35uSo4wZBt+YFL6+w8zQnEkzAsEHncG2PrxKshWUXz3pp86idApDbdYIuQnvy
	XPNEZEP/t4VCvUNsoh/Uy45F7ysK8K3yDUJLYpkzXSk8D3rX+uiBe7rtWaV059cf44kNFp7jR5K
	j7cfH6zF3ypTid1d9Up0jm8sjEln2Q5Pe5fJ+ZZl7GeF18OXJTXwUvYsXD0QG6FHwog75Cpc/T+
	Nf3Q8xeEVV66zL7QhN+9NxpW6yo3eTGq9dHe4tngkHvPffnwbYX4PTXGqr7j3ED16NNDzo2Cp8f
	laBANkfl7R3Cel3w4xA4gW3UeR1NyaPKJ/5J4j1PJGKQwmaG5FfDMSsaRlkW641OcrY2XJdWGDU
	Mfi5Tv/gVa5chbShmYLNF3LGS6OyUcKyZ2WRZlBGebkpu3tfR6edRmtepp2SBvfiz9qGABGhbHg
	8fmDjqJSmw2SaXrtxUB3GZUpdEsxsfXO/Tf/txY1wCJvWFSTe3JSebn6ytxZliebYwJkK1yqqKs
	uEU2cDviqO33fbYWC82lBGeb03QmfNHxb0y3IMrPH/3JgkfuodFufFCbD/iHGdlmH8w=
X-Received: by 2002:a05:6102:a53:b0:7c1:ce61:19b3 with SMTP id ada2fe7eead31-7d73967e59dmr12309568137.33.1795700009217;
        Thu, 26 Nov 2026 05:33:29 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e08a02asm21443367241.11.2026.11.26.05.33.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:33:28 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-74ab99038afso4574160137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 05:33:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEF90KwUnMS8y9FMhnZQODy1uyZEZK2ronZgNCcNc+77iar4AtVSHpTa8XoC1kMv3LSuBv0Qm0IMtbeBnlow0XibA==@vger.kernel.org
X-Received: by 2002:a05:6102:3f94:b0:7cc:2674:b78c with SMTP id
 ada2fe7eead31-7d739391bf3mr11259967137.7.1795700008033; Thu, 26 Nov 2026
 05:33:28 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110080727.2377040-1-niklas.soderlund+renesas@ragnatech.se> <20261110080727.2377040-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20261110080727.2377040-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 14:33:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWpZfsaJOcTEBCugyDgKDXNRje68n59OrGFx-0hJXG+4Q@mail.gmail.com>
X-Gm-Features: Aa3M54q5_iVD09yTxiCPbutEOoqFTTuL8Qbh52NAGvGv6cSg6_A-6RxSK9Zhqcw
Message-ID: <CAMuHMdWpZfsaJOcTEBCugyDgKDXNRje68n59OrGFx-0hJXG+4Q@mail.gmail.com>
Subject: Re: [PATCH net-next v8 3/3] arm64: dts: renesas: r8a779g0: Add gPTP node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "DavidS. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Sergey Shtylyov <sergei.shtylyov@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, 10 Nov 2026 at 09:10, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The gPTP module is shared between the RAVB and RTSN Ethernet devices on
> the SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -606,6 +606,15 @@ mfis: system-controller@e6260000 {
>                         status =3D "disabled";
>                 };
>
> +               gptp: ptp@e6449000 {
> +                       compatible =3D "renesas,r8a779g0-gptp", "renesas,=
rcar-gen4-gptp";
> +                       reg =3D <0 0xe6449000 0 0x500>;

Can you please remind me again where I can find this base address in
the documentation?
The size looks too small to me, though, as there are registers at offsets
0x500 - 0x788.

> +                       clocks =3D <&cpg CPG_MOD 2723>;
> +                       power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 2723>;
> +                       status =3D "disabled";
> +               };
> +
>                 tsn0: ethernet@e6460000 {
>                         compatible =3D "renesas,r8a779g0-ethertsn", "rene=
sas,rcar-gen4-ethertsn";
>                         reg =3D <0 0xe6460000 0 0x7000>,

The rest LGTM, the bindings don't descripe the two gPTP interrupts,
so they cannot be added to the DTS yet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
