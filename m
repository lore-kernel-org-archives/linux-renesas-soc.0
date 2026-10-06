Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48783E5EDB
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Oct 2026 11:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285112; cv=pass; b=R5joQYmK8PLkxER1c+Xx2pkRwL8W0X1aD6pifXuowPtS6mR+W8nMXhUC92FVzyIYgFMayrtjltcBVMJ/C89IIw/0CMY7AO27C6rcvs50gkO8+K3fY8X3e6t5CkM2V6QctGor2QbHWcoBJFt2NVWNh2SyEzC/pwDWM8uDULnbyIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285112; c=relaxed/simple;
	bh=mUNeY0u+Irh6yo+HzKbKNtxDudPGVOMhORN9dinV7FA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C17euEaGQyHv2L4Nn9WOcNdDVwx5X3OdcqoP9Q/amzyD+gjcoLwoOvXc1zwRCYVbP0GrC5I4hrs+t+Qvo+AoaZMK/N3ahGVKZFgTJgWoo65uuoTpMTaG872ThDJ3yPU0KsfOZ8OtvSYafe3ML/eX9o8q9XLzID3oYHQZM6YFHRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zc82NDTs; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zc82NDTs"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1418278f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Oct 2026 04:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791285109; cv=none;
        d=google.com; s=arc-20260327;
        b=F6HNDN5JDKBQO3uLdVmQSV/XboykRpSw2cHDTB3cwCRDjthhRo4iAUXc1r3Dswujul
         hWSs638jErqCFArtXnemyRmzZ+lRBuXloQw4vjP6vyb5+4p2AA3oDQCsHvpB4YlwwdbH
         n9oi8IBYZDq3ZuNjxt3un7jW3oTTCgmvFSTLvMpw0XJi7m1pjMYphEfsneRZGuXm8Kke
         TfhwJJ6rS5hz1y3ua7OW9KPHuEFAndMZa8U3MwACIMnlEuhGSzS5uwUPv20DaZ5gjCST
         dXM96LctdSJRa+fScWbgoZx6Z541K2jlroMK0Z6dRuYzLhJliyyuhbnm1q9tXuQAw21+
         jJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hGa1JZEofQkImbdUcr0R+0KXG2WfE9qw2GmFzyG0ca0=;
        fh=/KVVQ/Eo27EdXLVB18ctmVJaSn1H9ZqF1Hd8vRivbFM=;
        b=QBRugGggeBJzKN7MrQ/NtFI6bRV7ghhEx2JjLKtDfsYopMq5+0P8BHUz5aSojbbJ+C
         aEpglrSq3E4MkoP+5AJxu4JNAXnHEwz6S6QWTXIq8EZ6d1SmpMCvCLTV40k3rw866VK5
         cYknBjCKPYPrJ7hlFEOFhG2RTujxnaTAZtMidsu9j3AQKCvWRcwsOioJf31jM606y0W4
         ZGtzam7P80LRbxIs/9uZTD/AmI72LXu5h2GyVlZ4D+OMP8nltzA8dxfIJ3kf3v2cqBBo
         U2rbhVHkvT4YTwZDMOGnf/oIUXpF4FQgXRv0gfRkdVWnQe0RIwva7crFz4HpzTj9DB7l
         rPKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285109; x=1791889909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hGa1JZEofQkImbdUcr0R+0KXG2WfE9qw2GmFzyG0ca0=;
        b=Zc82NDTsUNurJDINr8R7WoGBO1Kglvdz4OFjt+dUjGIdn813cYGuiuG00CFAGsjqoh
         wSwv3mSWym9yl24y6vzSfdyHXzr1NKe7CIqqY5FADf2b1v6rYmSdZ7tyd2k5vFTdncKA
         +eWTJAkb8wZyBBrExkd5ITvtFfr4MyuFhQNNqaMUABl/ab+TfU/AbWmu3MCMXYVSuz/2
         fGDbH5FGMDXARijapoefRsbIb7XRQeA/sZ2Mvbme7MVpc/E59tSlsyl76gFdYP0bmpaa
         pYTKTkKhAOY22HC4Ps/fDPLer7YfP2NeNKUaKpiSSGvjHRUqJAkIDvNn4Kav7aPOsTDH
         xcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285109; x=1791889909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGa1JZEofQkImbdUcr0R+0KXG2WfE9qw2GmFzyG0ca0=;
        b=iolttAB76368oG/3GiKhQs+4uznHfsAcqpmSPdE9QFAqUNnDZNi/06uAlNDepfqWKi
         44MeClMxYPUkKJZpJGoQ0oB4o+/tLom5Nok5yyqZj7YaJXRmyaeSf1WOCETfCKq4JYrM
         aumNRc85gIuRoIFvpISB9woJd5SnR8oqIMmG8Nlq6kQgZeCwPudln6sCJnzM0WKAW4hG
         H69XsjXV7tagRuIMYwTFjgC/fs4SipOpZq/V4RB1pArgPL9VlwJ2JNBX/gtRhKTpcxVc
         QaW0nFjYNozLh903L03MH4F9us5PBOwleQ2J+7ZPH4FIHw9qzl/D7juP5NJyyYQfi0bW
         SNIA==
X-Forwarded-Encrypted: i=1; AKwUvBwMdVCOrCj5WuU4Mf5Z66Eh9O2KYzIunai+oZvkV5GLKpuF5n3HEQBI+FrD1gz0c/FDdp8Ifaf9umSPWL1nHNn2Gg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJJy6gDmRhL20hO0ro7h4rZjWnctM0ncd905SiRFplC5/PHKs4n
	JzmPGMNqDFDPen8cfrZjfhSN+wyfQJiXmWCPgqPsIisZ+CLFxvPJuWA6+WMZ8RlbjL2L+0HEy1u
	NKSHthGfmsx8ElBCBbFp9xGBzJ7NsCGA=
X-Gm-Gg: AYBFou3S8ajqdNa7v9cD7XvyZHYPk5aHmkllZpZ8wP0zyJqkIigkRc6En5Z7wCigOJj
	VHbQQK2QgJbfBSaGo8J2I53woInxzpfLCvAHYpq0AYn9LI9jZMG4WmWHd9VQDFGVIW0v71A+Oo1
	8LhNBYLsQcahy82++Mv+C5dIoA/fLwBeChx6exbvbBmHssU3Blh5S5JOUJsk+3sd2lRdQJwsqJQ
	l/m9LCRz+B24WZRObC17CXROM0wnpg0+QnySb7Ml9sLPsHdUA+nITEr1IQyCyWpo+Qb+LV/TCZY
	hhFobkG+JnAu+1fVg4gWa6fMLndzat0fA4RtoJzsBoYgGZL3fAzfBToMrdS3XCCEY/h/0sWNbgo
	1QNK7JEMZqnKV/PzwGePkRC2jTx02RlSAEsFCbhhbFzDBds2SUT5HnW1W4DHneFB2vYEWIdyYKp
	/OyCUjMFM=
X-Received: by 2002:a05:6000:4a04:b0:48c:4707:1b6f with SMTP id
 ffacd0b85a97d-48c480272dcmr16516413f8f.53.1791285108694; Tue, 06 Oct 2026
 04:11:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org> <20260928-mali-c55-renesas-dts-v3-2-2cf7eb746ebb@kernel.org>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-2-2cf7eb746ebb@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Oct 2026 12:11:21 +0100
X-Gm-Features: AclHuK8IOd_scDCDMasik1_SzcAsKOlMt2yLWcF2qQVhREPX9v8HScGEMDKtzlU
Message-ID: <CA+V-a8t5NaVRnh60eTD50rbnHGmYpZ_O-bQJtwF9=yU2jo_5jA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: media: arm,mali-c55: Describe DMA
 line-tick interrupts
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thank you for the patch.

On Mon, Sep 28, 2026 at 1:42=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Mali-C55 exposes separate full-resolution and UV DMA writer line-tick
> interrupts in addition to its combined core interrupt.
>
> Describe these optional interrupts, keeping the core interrupt first and
> requiring only that entry to preserve support for existing device trees.
> Extend the example to show all three interrupts using mock interrupt
> numbers.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/media/arm,mali-c55.yaml | 11 +++++++++=
--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/=
Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> index fc4fcd19922a..8fcc46660b75 100644
> --- a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -18,7 +18,11 @@ properties:
>      maxItems: 1
>
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Combined ISP core interrupt
> +      - description: Full-resolution DMA writer line-tick interrupt
> +      - description: Full-resolution UV DMA writer line-tick interrupt
>
>    clocks:
>      items:
> @@ -75,7 +79,10 @@ examples:
>        clock-names =3D "vclk", "aclk", "hclk";
>        resets =3D <&resets 0>, <&resets 1>, <&resets 2>;
>        reset-names =3D "vresetn", "aresetn", "hresetn";
> -      interrupts =3D <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
> +      /* Example interrupt numbers. */
> +      interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 101 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
>
Same comment as patch 1/4.

Rest LGTM,
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>        port {
>          isp_in: endpoint {
>
> --
> 2.55.0
>
>
