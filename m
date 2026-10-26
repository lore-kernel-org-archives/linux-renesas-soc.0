Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793048705;
	b=KKLSxuSIeVQTbd4e5jE6g+ZGlpa5F+ZKwbhV0C9EA9HNNJUbGseMrzaWrmd934iNX60j
	 Vw727TR3DMDs3ZAtdyo7oN5R7Tp0RD2fVJq5luv3UMtvvAg6wjJb9Vdi3NakcCk6UdGwe
	 rykLBINNJ8YLqvmWRRGnvur7by2UG5LWKiiPsear4Vhd+JkLFOKJsJ+ef0EE4jE2knq8h
	 aUzeWkJwGBvQFLH8/WdPi7Fd1ubdQna92b9Cs4fOMmX4dgZVpz5FYQNY4R6TzciGswxCW
	 R6/sqQre9PXw8MkkyIV4PMeDPT6k3ZIAbPR/4Dyb4oJJueqQJNvu/iJlT8w1lyJXO/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tux21EfDtTpBbBq1R3ksg3nQktcfpPRSG5HUXyWHhJw=;
	b=xQ5wfjzJOOYO9fdPfjhqDluK0/q11KNTaCu2alxQ1zDGENIxVXBEXSloHotfj/7OCtPG
	 c00a8TCRsxYd7KnG2aNTQRrrFvVRodhOhA0yRF7rg0dlsWnuEF2KJg8KLBIexNS7DdUT6
	 FU+sIvmmXBtppb2Mw9HZ06VcyJxLTPePfq6W30e24eFJruEaO9uOnx6vSPmOlagXnsP5e
	 zDgswoHP6dmPFEW9dwWrQ1zVVQWRKBMdsRHHYiL45ClNnKHI+sCFdUZEUMq5mcL05qJoq
	 uyD+GjLqXs07Tp5r0u6T6P3FSjH/0RKQvYLcz4ac4LjDqXmRYMta7kxFkKMI7JuR7vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4171606A31B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 21:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4171606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso17929815e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 14:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793048693; cv=none;
        d=google.com; s=arc-20260327;
        b=ap4wvDJsqoZTsHA927I6yt1u2pehMJby+n54XJlMsqNW9xN7bQs0Zdp+5gbTiosEap
         w1PdzqW6s38n3+Ztcdcw/lF3UoEPNqc/eqHiR8rIEUG8AKTudHjIjd+vlO/G7vWdN46i
         RwXCXQ5UdYK7wQYfyUmFeoinL+RYxa/4gacdJ4xf4vbyV0rkDouOalS6aZ7ED1ea3ASr
         8mLfJD15qyR0lNede30VvoF9x1Snmqaox4qIDh3+ddapCptlIjz6sNDWza5iOyXZWpt9
         Bb3rk2GF3m9IpKgaPnedh9XuCJkP+upTNKVrhVpWF9cN0+1ttkDcIbUvwPOMBphukTCr
         +hiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tux21EfDtTpBbBq1R3ksg3nQktcfpPRSG5HUXyWHhJw=;
        fh=+ZHNLVi6ol680rCIzrzOFJryR9RgtCzuMaiKsJzkz5s=;
        b=AFXnvqGSAyLHNnKCIieiA7ED4l51NoPoxGiMqn44+UxT85qETzaNghpqDt6q8SY0HG
         TdNwVatY1tP8k9tof0A2D71QkDTsaQ9Is3yla/vOIRFllnWx779D2bUc9/ISe+g0runh
         oSnVq5hDREM+TOR9w2Wya2AMNWwvLDiUtSQeJgYe8mLwDjjYOqX8hVKYCOsx8WmfxB7C
         UWb92yAFKhs8rgxM4TN1zXMcEZ+h0u+LCUoYwPbdpRUB2WhVSQoGAHclvsMwVAZ1OACG
         HPjT3AanLfzqVaGN2StmtSdTC/rlomouaCaOclmpYRlAL+oY4WZd8uj7GgqXCGXbcxd4
         NnNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048693; x=1793653493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tux21EfDtTpBbBq1R3ksg3nQktcfpPRSG5HUXyWHhJw=;
        b=REzh/iK8/mR9cU2vVYp1mtiiXemFRDWkRiF4g+U+E9FeH9kEHfpk8xm+cEY7SIc7o8
         VW7PKfpYVJ2L1W6cUDxzIrqW81kWWt3AcYPTjWB3wMTvOuTuv7YwHI8/fLOu98Rs6zKP
         iOdyQzX++/3k+4HhBOiQnd7mtfO+Gwt2SldmFEzEHfB6gZYxXicHlowbS4zTZxiHZlRd
         xmj/0p7A1SCa1n0NEUjKp7fm0YXmMEZvN3WXFYPvV9x4BdoIxb8thryjuUhjzw7cNcYT
         3bIw91POCvvsyzwGg/ukMJLQYA9hX3jrFUTCnaThLfm03jm1fjillXWuKZ0YPE+Jw2Yb
         BSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048693; x=1793653493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tux21EfDtTpBbBq1R3ksg3nQktcfpPRSG5HUXyWHhJw=;
        b=okCVeBr2/EMIOwKHz2odyz4U+UXFTnpzn9FO7QADmB6lVL2Ttz59n3h4Xj/zIo4Kd5
         WSjqakw446aLTZ6Iby52DRyeAW19rL8W4lTOoqLitZ6zhQHk9iCUypIZTv/PeGMuBf1O
         yyiSQe2xVOmke4AdWHVNL8/EC/e1CCY8tmWJHHrPWmkli1KvGpMm5uE1BeApMLFPWmmx
         JlTyyJ2z5tEaumzRG6voSYzP1ApQ/rwBVo6PGIhqofiYMAP5x7EqQueWQxTkLCdWYWQB
         mXEp+CFU8js7wjAh6hy6T6FRya2glumZNiN1Ku6Uzlbc1GTLBvLmtqaeZ/ZcmjIR39Z2
         +ttA==
X-Forwarded-Encrypted: i=1; AKwUvBx7kp2KcgM7eT6SvOmKtogSLZ8wjAXVHPXy3V7p3eIN47V50Wzw/3gShUUxX03B79LXc5tILPizGPeC/NKhfdieJA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIOclFZXqZbqge6HRJ2alrbeULX3Maq1nu5MtRQabcpcr+TvaIU
	5Wy8yMJ42kS68Ur5I2NY3arGO3uBOOefbOaP9M3UBAZ9yUeO/akwHJtY1ap7VVKj1lL99UIj+hH
	ZaD6BmbUO2BkZNca9WqPZpAu0Or+pdV4=
X-Gm-Gg: AYBFou1qWkhdLt0jN5DnCU6Fm3mrGuE4AesJhuk6ghxqL2hlR01YJbgVaCcJnd5AqX3
	YwEVguEdZI/iQcGCp/EPyJHp+vGTy0ik/yIKXYZwsXuDC+ceZfusAxTpnPF9CHy4OEdFUqKcoyL
	zv2Lc+09XFkrB0WvA5Nd4r4XcWNNP2T8n1pXScuQP9rG83gFh7zIWegKRYbgKH6F4DtksioO682
	vs5lqmIj0joT24ODIQAzeLSx74/GFCsHAQuMwFtj3MuZ6cDWWrT5T9T9INXrf2HuVZbRvsRbkon
	phtfuHPB7eQUv/EdFzLQ0pIjq7hgvvOA41hEc2cYny6NcmUs8yXl75O2FyEyy2cr2gzlRBdzNRV
	ek1Epf89DVBd0exNnomqM9Mv0m0XKzcpd3oyYQzKAC75i0Mbrk1YLF1TqzShMAW6yJj0m7dXEfR
	qcfj3DglkdTJW6MDj4P7DS+TPocIiLDRxkXp6hW71Ie5Rt8kuR1z9/Fs7f
X-Received: by 2002:a05:600c:6098:b0:49f:ce78:356d with SMTP id
 5b1f17b1804b1-4a35acc431dmr140143975e9.30.1793048693009; Mon, 26 Oct 2026
 14:04:53 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261023214917.157d0c89@jic23-hlaptop>
In-Reply-To: <20261023214917.157d0c89@jic23-hlaptop>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 26 Oct 2026 21:04:26 +0000
X-Gm-Features: AclHuK8JBvSW5tWtnhuC7bZYHXlymQW5Rkl37e-ZQt82_GXFIHsS0rUkBFiPL4g
Message-ID: <CA+V-a8siO75k0ZKDoQ3zpyzzAX8KwWT9qHUGP1OZCXCU9sumFg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add ADC driver support for RZ/V2H(P) and RZ/V2N SoCs
To: Jonathan Cameron <jic23@kernel.org>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Andy Shevchenko <andy@kernel.org>, David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

On Fri, Oct 23, 2026 at 9:49=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Fri, 23 Oct 2026 18:59:11 +0100
> Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi all,
> >
> > This patch series aims to add ADC support for the RZ/V2H(P) and RZ/V2N
> > SoCs. The ADC IP on these SoCs is similar to the one found on the RZ/T2=
H
> > SoC but varies slightly in terms of available channels and configuratio=
n
> > options.
> >
> Applied to the testing branch of iio.git.
Thank you.

> Note I'll be rebasing that on rc1 once it is available.
> In the meantime, additional feedback is still welcome.
> (It's welcome after that but preferred as patches on top!)
>
Noted.

Cheers,
Prabhakar
