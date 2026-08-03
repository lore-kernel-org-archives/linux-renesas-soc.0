Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41BB40861B
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Aug 2026 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761302; cv=pass; b=f9w8OisbARYwC61S+AQa5YMphAaWZy0/rP8lfQGwkj9H/ZAmP5eg3pcpjRocxBSUctDX31xiu0rrCtviZUs1TlCoNv+wzlK1YldzWi21vTlleAjp8P9W0f13nosj6pPHJeuGqks9Nk8RnNGv21DEpT9/j8cAo7PQEBA4ZrDAA64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761302; c=relaxed/simple;
	bh=FqG7OmGKUyU4sbv1V0oLUSK9uJRSuOp1aPGEqAPuBwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/9l0BET0pSV2gH0iK4sZH4y7Bn4ENxJSnIpDAO+yzTmaJ2HOhxlKTeDsPCTBiC0RCMNT6DbaRaIZIGOVV5hj+iJ613UMPJyYG0EmtDQquTqeJz3rNyfNtM9PZ+ZgpJ3zp6tx4Xw9hG8j+KekQ45cymeYPIxbMKsn90DmXlwNeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muX0k9Av; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muX0k9Av"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47de008b020so2215292f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Aug 2026 05:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785761299; cv=none;
        d=google.com; s=arc-20260327;
        b=Erpmex1mZPF+tGzc2qEy68tw8zQblUUk0KIm7GU4YgWMd3g8rVKmQl4iBfhB+tZa0P
         ry0xnzEc6OCmqQqjS9hz6osZi9+guvnLJnhbh+WqEo0vrA+W7q/EpfrEsAd5FugyJHzn
         qGti24kW8cqO79yDdUSb8KlbGGka7Ep0A91P6YDOf+lw7D8sWXd9R7A4EPR0gop865Gm
         /+km9VJ1nWtmfwfRrZcAmWBen0sJXBZWaUB0E+QjZ4oaCfhfcwCgnhgRjMZrV5F8JIJN
         PyWshGcuLWdxE3owKhf2A/xeNADau53NHVYnvD8c92qiFllGpiMzx+AUeFWNSIDgPgA4
         Hjeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5fax5mU2nzN+Aiq0QARQ+H5w0Gibs6bj0/RcHVBZ+sM=;
        fh=VnG4EGqNxramuTZz+S7bOMaqW3tItzumZYDi4Uo7Ltk=;
        b=UEiP7d2BMgiE1/1l1UyQFIFx+CZnHcl2cmD73TsuB3OTakVBUmyMhfvZbEHiuA7ycL
         raPjeE/Mf0tIAWepIp5gw8OTrxlo+4KKDHq7+Bv1u3slImsEGP0+JuPIIb9Sp+MqEvqp
         BrG9YKvn2n8X8sfa/cHRpd+JpiPV6tFKu6E3IN1Ms2F69pb6MJOtChS5a5awf6y6KQHU
         ShBf183EIq7Dj6cBnxsmTkRz/NxfhkDEtqSpsey5qPrQM50sjl57OISAQzFqQ1JxQAgN
         vjRt4Du7JRwtcDIJdEL2BERT4r8Jui/RLVlC6vK31ANlxZOnJIeGEl7510VkxhoEkbXA
         WmrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785761299; x=1786366099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5fax5mU2nzN+Aiq0QARQ+H5w0Gibs6bj0/RcHVBZ+sM=;
        b=muX0k9AvrH7b+PBR7pwMnntSIKbMKrMW7Lkzi46y36VJR4SapVqccU5iXzMcjJ3rlu
         mS9T4ZuWf5LlPkgZu6QLkjFj7EfGC7Yx/uNdN3sr9oZLdI3fnfnNXk8WVxq21Fe4bJWx
         pxnpIrhZwywwjpH8AS3UxlsH3rmGBJDpLwMzpMcaM/EzqSVIdZH2prrnddIg4hZ9LyYj
         x+8jgFin9wTAfoHzqWe/GJ+rP9fKLe9/7tuwbx7gOko1sNgZuvl5asD90b4jlQYJfp/Y
         HX+6mJ7cTOcR36q6VoTr2lWIiGXd3sEjdAXx8ZGA2qjzdYxJTqtdg0MmYJ2sdCzliC07
         r6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761299; x=1786366099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fax5mU2nzN+Aiq0QARQ+H5w0Gibs6bj0/RcHVBZ+sM=;
        b=CbOAnwpAMwutfStkjri5pDZGbmfbsMOg6Pa83iVaOKdz3zpLkDflRH7GeYeA9ZB28T
         bI6vBVA9iegAoaOwx/XkzwXs0Ytgz6jpoBAjUERaOsmP34mc3ShW+ijYhsDg5CZaBrmv
         hk9z8oLwVvb8Z5ilRYTnGPg3wFzyEhaG+4NUy16i5VifwaPNNJaJRCIsj5y5gR9d0f8H
         YNDt3ISr3p+FZLovsCOpJKefxnhqvK4CGrGzZODAQrjvjz107Ac/yE7kmse4vKlZIdJT
         xy9Mb0ahUIBhq7r12/9644SYthl76iOpJywesf3IqUVRZuMH7dTsIJ0wznAHx5sa2AM/
         6Q3w==
X-Forwarded-Encrypted: i=1; AHgh+RpyPfd4HraNG3luSEFEGaswcQNMBxFq/RLmm4Fa8D4QEFvISGGFbverfpjJtLt7i9TcNRvoFz8Z6Gcfuaqg2CAD6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxckRn0Ltnz9iDolb26xhphYBh/DZOrPbeUJeUYlQeeZiqbf5x
	oHwMiF9NCv9IHLdTO4hFQV/vvG3EGJQiBOU28+hU8hGcT2E3cShX+MKf/BQHPBFpMYZq9WZRIIM
	uVFf6PJKuDV9neGykzcqR/M92f3B7jSo=
X-Gm-Gg: AR+sD13UKDs7gOhLNv/pEtcd25ypqxhsHbl7AZd2Z4jrRjaa5yL1lIIqtlsihB3PMzv
	CSFRCeD77nRHePNR4PFb/at8Xpcj1cUmdcKgHDO/XVdrKtooMK8rv6QQODZ+qAvk4iTePIGXO0E
	B0nbXEIxvf7ZQeje3EEeH5abdE7Iw1JG/zEs/xgClkVjakCFf2XAGT9HHlGGTuOrtKfW5pnirRW
	APYS08RoHzBDhgNOov0N2WwmppU1MPi+/SfrLLQ1EugbmFyNPISVfagfl5oRnKMxcPpEo2iiAS6
	MzEUy5rmFWEPYF9BwLbX8T7TKBLb9W27xlf17N4B6R63JCqek5P8wZ5ouvLOxPqR/vyFHjrLBlG
	BAYX4FUJdb6QXa1ImOlKscQSr6bHYMNOf+mGa8JnuTPFhnG/VOteo7r7zrusajBk=
X-Received: by 2002:a5d:6f0b:0:b0:47f:95cf:26a3 with SMTP id
 ffacd0b85a97d-47fd32e1f41mr28059514f8f.14.1785761298926; Mon, 03 Aug 2026
 05:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Aug 2026 13:47:52 +0100
X-Gm-Features: AUfX_mz8pwuAO_YEZl6wI79Yl2xndxoZy1e642I1E-oM4Ny4k409h84jPMs-axQ
Message-ID: <CA+V-a8vohu9Sswp9jrmUkZ3SUVhVJzf0=9MdU_1S7h6aMShT0g@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] Add RTC support for Renesas RZ/T2H and RZ/N2H SoCs
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 6:51=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi all,
>
> This series adds support for the RTC IP found on the Renesas RZ/T2H and
> RZ/N2H SoCs.
>
> The RTC block is closely related to the RZ/N1 implementation and can
> reuse the existing driver infrastructure when operating in SCMP mode,
> which is required on these SoCs due to their 195.3 kHz RTC input clock.
>
> While the RZ/T2H and RZ/N2H variants do not implement the RTCA0SUBU
> register present on RZ/N1, this register is not accessed by the driver
> in SCMP mode, allowing support to be added with minimal changes.
>
> The RZ/T2H RTC variant also supports a 1 Hz output signal on the
> RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
> marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
> distinct RTC variant despite its overall compatibility with the RZ/N1
> implementation.
>
> Patches have been rebased on top of next-20260706.
>
> v2->v3:
> - Added new patch to fix weekday underflow when alarm crosses month
>   boundary.
> - Make use of devm_add_action_or_reset() to simplify driver teardown
>   and remove the .remove() callback.
>
> v1->v2:
> - Dropped wakeup capability support patch.
> - Dropped header sort patch as it was already fixed upstream.
> - Updated commit message to drop reference about RTCA0TCR register.
> - Added Acked-by and Reviewed-by tags.
> - Updated Kconfig help text to keep it generic and not specific to
>   RZ/N1 SoCs.
> - Initialized rate variable to 32768 to avoid timeout_us of 0.
> - Made use of RZN1_RTC_SUBU_RTCA0FX mask for SUBU register access
>   instead of 0x3F.
>
> v1: https://lore.kernel.org/all/20260615154805.1619693-1-prabhakar.mahade=
v-lad.rj@bp.renesas.com/
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (12):
>   dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support
>   rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
>   rtc: rzn1: fix weekday underflow when alarm crosses month boundary
>   rtc: rzn1: Fix malformed MODULE_AUTHOR string
>   rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
>   rtc: rzn1: Fix alarm range check truncation on 32-bit systems
>   rtc: rzn1: Replace remove callback with devm_add_action_or_reset()
>   rtc: rzn1: Dynamically calculate synchronization delay based on clock
>     rate
>   rtc: rzn1: Use temporary variable for struct device
>   rtc: rzn1: Consistently use dev_err_probe()
>   rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for register access
>   rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs
>
Gentle ping.

Cheers,
Prabhakar

>  .../bindings/rtc/renesas,rzn1-rtc.yaml        |  35 +++-
>  drivers/rtc/Kconfig                           |   5 +-
>  drivers/rtc/rtc-rzn1.c                        | 159 ++++++++++--------
>  3 files changed, 116 insertions(+), 83 deletions(-)
>
> --
> 2.54.0
>
