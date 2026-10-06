Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7753DB658
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Oct 2026 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284904; cv=pass; b=PvtsQH9e6+CGt7KZH6H9W1b4nDEOPrKk+G76N1xoD4AITUpJEA/CBoVL2zowk9aR/bP9K7ZVbpdNQMFUaxCWIImUD56/Vgv6gOWwO2zoIFAKYLtGXyaioqGpRg9DVeE+0e+g6qou77FnsySjEk/8Cg1oIpB3jUpMVbHSwB5Q/yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284904; c=relaxed/simple;
	bh=mu/t0nX9SJf6wo8N8jq58J5MNpmsuozgdWxvH8xSVO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPFB9vRlEOUkVPSdXtuSEE+jcOvMxd+0u4rIN57z8X6J+BWfUEG8YH1SfneRPcw6pjEVKQDYdnZ94M3DribyY9HU1nd5G7Kx+NWx6IRI1c9Vhmlib0LpNioCsFdXEiIxHCYT6xdLYKeSLJjrPFpRcSxR/GXJ+fnyBWZsnYXo/Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KT1hCJ8A; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KT1hCJ8A"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so5699395e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Oct 2026 04:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791284901; cv=none;
        d=google.com; s=arc-20260327;
        b=QGFCgCfmoaOraUSrkzl0y1LB2PIXL7d1TVU4UN60bgf7GQixsGDUS5ZWuPtphLklar
         ja7zfZLu+u2+SGsfgQJDhBvEijxiScUJzX5F8jtShEmz17Rp6xBY100RxqKo4mVZW7gB
         RbRrlQB8z1hoSI8fdat3Hd/5oKNoGMYc+jUgHNfGRceCQOr5cVv5ONS7LWaQ+83L43Dz
         EpJLMFvZUTO4aA6AuGum9hC8H4M4y3x74VOl5P06mbgRwsthwzzsT3G6zN3Nb3FKGcEd
         n/YeNA4bsfvp0EHlte2XExjEtw0sH+xIPaHxRnfZPKoDmfoGa+34vqn6/ratLOjrO6KH
         13ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yJ8PE6Uy4bwH6wDfLl1X3RI3sdy7oVAtm672ES1XxF4=;
        fh=Unikq8tTjhRyV+YHkBiq7v9Ezxk54i1H2FxgUJiur+A=;
        b=fqEd8T/5U5p584WCXMh3nLFNNVAgcKJrSYn2SpvYw6Oy8+OinC6R51pzfWwWfCJZ0z
         eFjFDDqQVyDA1RCFFFNeAvWFyzLdKxA+gU9n0/x8ge4gi3fg8e7V86BenTWHQGZRz+jq
         jcSf35o+FDou8K0aCOq5MobqhyrhL4q5hwb4esaHvcMdG0fdNlESMy++S50W2OeQgnTI
         QBIt/Nyl39qyW9l7niEzu+fNzCPm9Ph3rHsc+Q1PSPPEYAj3Iznz0ZQG6THBk/eXq3IT
         peZ+Grr13Jqe0Gy3X+yq9Hdf9epLN3fQ0f9xVCA/gs8rL2NWLBhxXKGlGkppziB0WFs3
         GLag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791284901; x=1791889701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yJ8PE6Uy4bwH6wDfLl1X3RI3sdy7oVAtm672ES1XxF4=;
        b=KT1hCJ8A7oqKyx/HwsCOpG/k8CUyOUxNqnqhANXA3v/D501wdyMQD/7fxto87CZA23
         b3H+9lTW9z58X+AKuT14XbGFYQSc1xd1lqqLdXpVWoFNwSUYUxqZQ0hqqzLjjMSk5GtP
         apdhWwTQ25paigoxcYFhy9CfgjlHYl1WPntyi0sQEXRbnMTOb70P0a3JPwAXpuqw1ABG
         oprA+Ble1uL+FudlWSAqhEngp0vooE9sZMMOS44hSUzextuaQPfpjx20CHbxdBGCyJps
         EWUTG/dqKLOhd/vvkRkl5FdwdCEklePWrRzo2hlVlzEBzwEUv8OxLdv3+ycau8Xwhmjc
         KJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284901; x=1791889701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJ8PE6Uy4bwH6wDfLl1X3RI3sdy7oVAtm672ES1XxF4=;
        b=FNjN9bj4ij4CvzDXfC1NH3kOR73ipBf5z0woshMVYvpAjaGSb4lLDqylGR8F33JyEp
         Dzyuhvufbj7sb8/4PYU9GvuGnimu9PXETjBFZnAvodD6VbFcfbNeDb+4Hi5oqA+KCplg
         eQt0IEIMObxyJtqGlk6E1Sk7RTBc229rhVZYDC372PEoqNgaJDtluXLSAVkp9G8xgZqk
         Nyfo7iV8fr6Aqw6PBgWH+awtL+6twa45VTqxZfm0ZeP+JrrRuvuO1kKZm72WlaH290VT
         RCOSqpDxZjl/ZRA4MKMTj/Aycp9PaJEd7YSXisZSLY/6bcXDzx725yaBSDhOHp8V3gHN
         BgQQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5C3NlDuJ+jXzzO/ItYDQc3wiZSqq2vhY4hItsrWvOAZGGzPXcD+R9mSJx10OQ0/DQBr9Aqkb/oFE9EFNLwTgpGw==@vger.kernel.org
X-Gm-Message-State: AFuF++lBeG2serFu0negXrtUnA4kNXAUFWjhFVLE8eMWjHHaBrf0vUwG
	XQXLLHARWQorvTt3bDAYgIqnidvn3pPdTNc+EVKf8IMWhf1BszjsdZGGCyFZ7fzM46VPJiryO0m
	5IafEYqXdlL/IJQkN/m4QLlgvl+3K77k=
X-Gm-Gg: AYBFou1wW+KElvic+MXaEYR7cG7fAogR8DtYQMXsJ5h0t8TS/uAmQHVrS6EpUnCUEhE
	Y7BH1urHle8P7S4ey8Q+BsT0+rr36u5cE2lAhYRdDparT8y2s0G/6jWrHkEW4F4yfBLdr0yDUyL
	Jwllz1HzlSO6ORwmfctXM0CnnDeeYNV8SIX3qan5j5R+cEcgPFPU0yGU8wqbmwIqlgyaLLIz/l+
	OkELJenIfzQxdZOYlBc5aBn6Wx6ho+mdozgUGc4TtRsrQhons51whVeTVyOE4EptjJr4PMlWrxy
	eZxmbJTQHXRU5e05E5Q9egNNC7OJmwd/n2Ip6EBTtwNNLVHytB0UPF5U93Hxu6E71Cjd1wAxWfZ
	g6KswbsA2u2jbV7hvusVzN4MXXkIrc/DTQC5qfpw2tcBlYx7KFvDqxintDUBwdBF3s0eqezPQ
X-Received: by 2002:a05:600c:8b55:b0:4a0:13ea:2ec3 with SMTP id
 5b1f17b1804b1-4a17b55f8d4mr16436125e9.35.1791284900622; Tue, 06 Oct 2026
 04:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org> <20260928-mali-c55-renesas-dts-v3-1-2cf7eb746ebb@kernel.org>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-1-2cf7eb746ebb@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Oct 2026 12:07:53 +0100
X-Gm-Features: AclHuK93-zqsTFDUIXHtLL21RUOx75gjaGfM2OXZX3yb6vwYcEZ12igB1pL2UyA
Message-ID: <CA+V-a8t_WZpq+n_z8zk7M+OpWExRZydZaS3W1uxi6dH7SukXtg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: media: renesas,r9a09g057-ivc:
 Describe additional interrupts
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thank you for the patch.

On Mon, Sep 28, 2026 at 1:32=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> The RZ/V2H IVC provides input frame-start and frame-stop completion
> interrupts alongside its input frame-end interrupt.
>
> Describe these optional interrupts, keeping frame end first and requiring
> only that entry to preserve support for existing device trees. Extend the
> example to show all three interrupts using mock interrupt numbers.
>
> Assisted-by: LLM
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../devicetree/bindings/media/renesas,r9a09g057-ivc.yaml      | 11 +++++=
++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/renesas,r9a09g057-iv=
c.yaml b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> index c09cbd8c9e35..3eeb1a92c9cf 100644
> --- a/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> @@ -21,7 +21,11 @@ properties:
>      maxItems: 1
>
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Image input frame-end interrupt
> +      - description: Image input frame-start interrupt
> +      - description: Frame-stop processing completion interrupt
>
>    clocks:
>      items:
> @@ -92,7 +96,10 @@ examples:
>                 <&cpg 0xd3>;
>        reset-names =3D "reg", "axi", "isp";
>
> -      interrupts =3D <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
> +      /* Example interrupt numbers. */
> +      interrupts =3D <GIC_SPI 103 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 104 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
>
I think it would be better to use the actual interrupt numbers used on
the RZ/V2H(P) SoC. Most of the Renesas bindings use the actual
interrupt numbers.

Rest LGTM,
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>        port {
>          ivc_out: endpoint {
>
> --
> 2.55.0
>
>
