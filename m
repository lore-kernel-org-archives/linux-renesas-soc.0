Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793962279;
	b=h56U/qSolwJcyQagEi6gL3AX5RyJBuG6f0MarJATWeMO769f5fp1HiKH5+UUx00YOgM3
	 3hVsHgykATayV3wjPrPwbtCoBzbz5dTt/UkV2/UUYn/7CFj3WeXDBxIIqL9AeBZdpBqO5
	 YbQw9dGI0gn2J98mp1vUITMjomhf07QFRUtpiSg8UEBdG+ZdHx3JHeT9pzGAEH3rrIDaG
	 cl7FUWpuAIDbbHZhpZftCUwO2Qbj9ms4UeEo/mzQjNfZxqeMTC5xGlBxSaavFXvC5eJF6
	 b1H0vJT+6jmOAT6nMqAHH2jqOnyqSRdy2pZIgRD+pxx1OqNmB7m3zTFKs4Yfc3P2DYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F7cZJhjMigMK3SyfW4mjHv4UpuzgfCewD2MzacTp3SA=;
	b=abP8wdnyuKo17A5JW/NDB3RZOV9w6684jhUUzOcjZfmNkDO48plxAAtwyazVcfbNMzF+
	 LrIZSpAcqYV9t1rOTwEe/HeNB2HHdfeXsWIAyED45r/E4EJwUOlmCIsFufC3JAX8sBi+a
	 ykNVELj0ABM/SDUM9XCW1tQKWrCHYWDgkWMIkha2LFctA6/xvq1T3qUxaa9ZdZPPsrRkm
	 iI/Fvh+dWaeuY5LjxxmyCN/OG9x0+WtyrzjpB3YSL2l9iFWyVOWM5YBA7NrhAtjVXC+Mo
	 enuV6t7gBWCuetHROZSMy4+DLM12LSzdaWo8FXHYQQExYn+Qm2ESNlKZcOlhHdb+4mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qavf9uQh;
	arc=fail smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D31606A32E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Nov 2026 10:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15D31606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qavf9uQh
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e10a70540so323182f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Nov 2026 02:51:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793962277; cv=none;
        d=google.com; s=arc-20260327;
        b=RtwQW3AriS2ERxNAeTXVZqAOGVqa/+mwaCXSpOGgj3BRdlr2ZewMEpbozntffP4QGc
         p6ek+1CbxuICbIxcUo5GoubiKnKb6h/kD8U9JDqsxDWcddV9IIIeGBHCr63v8bztoe6u
         8x9HQV4GtizIa5e0OyC8Mpq2nlnpXZhJ5z7zv7b3u1e5qcphbUNB6yStwGImy1PjXxCy
         PwT47AOQ+R3/mnUU9UgLKSbnMMO+f8kDaR+TiUAJhju0twcyspjkn6afBu+PLdZ814g8
         Hlbm/BKJn4GQ+upmrDslmcXAmHDe4Njt/OnpPZUkQkZRmhCjihpBe0RB2QvCE08EfqsD
         iNXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F7cZJhjMigMK3SyfW4mjHv4UpuzgfCewD2MzacTp3SA=;
        fh=L0vhS4UdksQdz9/0hwKIX6lY/voCYZMejczb6CJ39Lk=;
        b=AU6vu4fU5n3igUr5EqA1pSdUKJLFdS0vYMG+mEiPLKic1C0/X0aT+spl2VNr2+oZtM
         6a7So3H5eOqA/RoET+yBuOjq0RTa6SenzjY++sz1vEWIDZezkoGyEAx/uHveaDeunFmm
         1/issKpLwqAxkhdATL7oi8qM/GeBhzNXPD81ZV2IoIEO/PF8Bo1xdL2xA9UJjSJPrgou
         D3yV6K8AYCjSKBmuqHVzt7tov7S0ZS19bD7x3rb+xiSp9y6GITKDrcF/Ru2iHS9ySgXz
         YeAxjSbrQVwQS7e+adydp6AV31NXqSDvL1rCMG6xN6VmASHHlHJ5GBJmU3ZsBOwHJ4hY
         wQbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793962277; x=1794567077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F7cZJhjMigMK3SyfW4mjHv4UpuzgfCewD2MzacTp3SA=;
        b=qavf9uQhhEstBSLlU5BG5brVMdHumR/aLgNXeFGpb5Jl771lB8oKGm/ZFzl/OJMN/T
         Pj9PB5hRDpNq8Gb6Piw2Nw1MB7y0lwEzM/dF8BZdXzUaONxb3aCxzyue/+c81NEcrcmZ
         jGMStvejbbmV7RBw8w6FDvMsB02ACYw2dM7zqBTZNMWR9tqm/lVkZl8ARqdT3GKrEA9A
         gLYn/qBUwBBGeJ0MH85YGu6UnEzAZRblQlpZxDDhaGboJV7jpboX+w0oc61TKSPl0511
         Ff+Lo2LyfE85TXniLxLMT5zDkPfTYzKnGjHLygB8R+9lLJJyx0MUQMfzBEG97vyD5QFP
         dzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962277; x=1794567077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7cZJhjMigMK3SyfW4mjHv4UpuzgfCewD2MzacTp3SA=;
        b=KO8B9uRJyVkpV33xyZh3iuAByvrd+jduffaJgViTzv2wIcNNkxUry0wloa67GFSO7x
         OEML8LCntAJ0+/YCS/zroJ0oLpKSvAcxoTCw709Ibm8epWkqpX4T8o5HNJPNl+v4APWy
         779bC2Ve88lmkaH3B5zsg2JnuJNFoU52dNpU3E3TsX7mMVVPsszKqMfOW4cxrbvos5b4
         fktCKRoMpuqJy7f+zGaayH3RFA9D9iubUB0CgVnxHr6VV/UDYNBerRmcGfaOSy58PI03
         hJXboAO6ISXTzxs3FycozKGSJepP9iWG5TYCu3e+tEvttUixXqdEXIjacADQr9kbmNid
         hGsg==
X-Forwarded-Encrypted: i=1; AL+hErErVarKWBNA7KLYAEabNwTIzn1gSeJ2sDpHQRuPsq4rX3gy6APkUFikSEEb0/Mm0zRuMjXg+cWs/pppTpgj8s7DEw==@vger.kernel.org
X-Gm-Message-State: APuU4Z98QZ4HkGM+bDLliIXtCWC+eFDWPho1RNPG9am+CX+7JON6ws8O
	00hQQkrbtX/zJnEXWYNQZjdvlGIfiLimDUp7bNT4bVtXb2hc1UabmoI3F3HHhKOkzfLmdMlgjAz
	Q3DAt6XUJHFfz9iqgVEcfhlW0hULy8HQ=
X-Gm-Gg: AYBFou0wxnsTe3QbS6+01hBSAvC9Cc9MqIF3AYfi0sWW0C4lxfiWpYvltftvELfeHQa
	W9nhbYgKepgIpGUEWTbksLE0hXOuK/NE8jEbYF4x2LMRA9V/dEia9KxcSk5BgK1smqfffjvUF1m
	7kHrusvvJ6A9IBvjFt1eNwSQ5L60RWRMzFtNhJzyZSh8jwoMfFq8/S210a+E18A3fv4CnT0J7vY
	Gfu6qfiQxJ5ReE9bPxKWCs8l2BjZOVwjO0APgaSJa7aSriuVwgWzHEwrvTrzFOOzezDSKKwfrzu
	VeaIEOivS05KGisq6a0grCcojDb4XsFoi7hIsiZ7vJkWo6cWN+7+lADG8ATvRukw6wGIST/9fpk
	fc5AvuzkTTNBarJrwQELLhhClIqJxRin1FyXdfocTxwUkKTNKsr7fJ9iQ1Bi1XgiKjZhAGGMgPZ
	JKisidUCcOmIv9G2i0iVYoTg==
X-Received: by 2002:adf:e84c:0:b0:48d:e5c9:39a4 with SMTP id
 ffacd0b85a97d-492775eef16mr3368306f8f.33.1793962277232; Fri, 06 Nov 2026
 02:51:17 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org> <20261105-mali-c55-renesas-dts-v6-4-7dff41bf7107@kernel.org>
In-Reply-To: <20261105-mali-c55-renesas-dts-v6-4-7dff41bf7107@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 6 Nov 2026 10:50:51 +0000
X-Gm-Features: AclHuK8e9Ukwsf61t80TfL34Hr9SEzBPVRwsLBuotfmtVU3xNlxjqp0s36ik-9E
Message-ID: <CA+V-a8u8WS4Ut0f1ELWPciY1wvtWtBS7UwOSaDg-q5wVFt8bpg@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:17=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> From: Daniel Scally <dan.scally@ideasonboard.com>
>
> Add the Input Video Control Block and Arm Mali-C55 ISP to the device
> tree file for the RZ/V2H(P) SoC.
>
> [Rebase onto v7.4-rc1, place the nodes in address order, add the missing
>  interrupts in binding order and name them. - Linus Walleij]
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 47 ++++++++++++++++++++++++=
++++++
>  1 file changed, 47 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g057.dtsi
> index bbaab75681c2..10e3434d0997 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -1849,6 +1849,53 @@ queue3 {
>                         };
>                 };
>
> +               ivc: isp-input@16040000 {
> +                       compatible =3D "renesas,r9a09g057-ivc";
> +                       reg =3D <0 0x16040000 0 0x10000>;
> +                       clocks =3D <&cpg CPG_MOD 0xe3>, <&cpg CPG_MOD 0xe=
4>,
> +                                <&cpg CPG_MOD 0xe5>;
> +                       clock-names =3D "reg", "axi", "isp";
> +                       interrupts =3D <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>=
,
> +                                    <GIC_SPI 860 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "isp_vvalid_ifp", "isp_vvalid=
_irp",
> +                                         "isp_int_fstop";
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg 0xd4>, <&cpg 0xd1>, <&cpg 0xd3>;
> +                       reset-names =3D "reg", "axi", "isp";
> +                       status =3D "disabled";
> +
> +                       port {
> +                               ivc_out: endpoint {
> +                                       remote-endpoint =3D <&isp_in>;
> +                               };
> +                       };
> +               };
> +
> +               isp: isp@16080000 {
> +                       compatible =3D "arm,mali-c55";
> +                       reg =3D <0 0x16080000 0 0x80000>;
> +                       clocks =3D <&cpg CPG_MOD 0xe5>, <&cpg CPG_MOD 0xe=
4>,
> +                                <&cpg CPG_MOD 0xe2>;
> +                       clock-names =3D "vclk", "aclk", "hclk";
> +                       interrupts =3D <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 865 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 866 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names =3D "combined_interrupt",
> +                                         "fr_dma_writer_linetick_out",
> +                                         "fr_uv_dma_writer_linetick_out"=
;
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg 0xd3>, <&cpg 0xd1>, <&cpg 0xd2>;
> +                       reset-names =3D "vresetn", "aresetn", "hresetn";
> +                       status =3D "disabled";
> +
> +                       port {
> +                               isp_in: endpoint {
> +                                       remote-endpoint =3D <&ivc_out>;
> +                               };
> +                       };
> +               };
> +
>                 dsi: dsi@16430000 {
>                         compatible =3D "renesas,r9a09g057-mipi-dsi";
>                         reg =3D <0 0x16430000 0 0x20000>;
>
> --
> 2.56.0
>
>
