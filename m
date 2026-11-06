Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793962345;
	b=BkyjVeeaEqdwxBI6gv8hc4dZq41Crq6ZeY1zDcgwCNzCJTa/UqOU+iYnVF0MO3/zoIKv
	 PuSWJOys+vI+EbgieXKnCva+s84YT/L1N+diLGqLnl/ngjOBoH2pIfgmFm7kUEYSJPKXR
	 AbJgmRqzZv95+AGJdS6/sE17QAt1TR2QzbQsaixt1hIeUnuVxd5akbCynTiIm2okeh/xl
	 rEGNJqHii8BB1l4WNZnYlRlgqlqZg2Ep42QsGY4xm18oro5iJ9BPFXjX9UiXe8bN5s4my
	 TBfZ6cHgCoz1xHxrtkIWUWF2knSVD/j4bj1F1D5r12ljE3r383jGEpDJdSJepu/7dUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kaiSXMdHY6dt/gJdfV7T6qu30oh9hfVCJo7KmSZyiNY=;
	b=vNkoZe+7vh8F2EEBwa4ttOux788TxeTp+eoRJ+WiegKDGCUPWxUupBPsCN0zvINUBqXz
	 3UIfLG+CUhAm63gefhG+IYYXcY7u+fHEnvzTMfxKFkheJlefIgtPohKsEequAkOOwWx5a
	 g+einycITGTezrWKd9m6DyyE/tinrVzWCXGpfNQY0iHGDX+ddaXHwWejyGIa616kI5WAc
	 rS8Ga7ZJlzzYRTkOe3kj1lJce8c33yembBIx0hkGhxQyX0+NA/SZPb79XVqpSGQyEy9/h
	 tSTanbR0oADXerHb9pL9J/euye+pw9GtEFlIheq/U5fvHuhLWcAjsiJ9E1J5KkVoFvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lvN3tpWT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8D2606EE9D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Nov 2026 10:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC8D2606EE9D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lvN3tpWT
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so3762275e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Nov 2026 02:52:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793962343; cv=none;
        d=google.com; s=arc-20260327;
        b=G0JBBXEUErZbL/QMYWn6XwYeWOXWqbGb2y6HQpok5MR0hxTofPZAIK2eTV/pbJ2DS5
         UsPwJ6aTFPUt/FKarb1OpXY3buCWG7jNDE4R25ui52ukO9ZFIVcWch2jxtmhb4oSrmFh
         Hrw6qoqC+LBnaOgS60dbp+pD03abFY4YYQTMb/bc+zu9cqdR3hnqLUswXxfKPUK7g+Sh
         tdhbb9JFdpwrGkXvl1HguIEDATLPTtIX+HT7XaatNuTma2UWLGpKD5i7jA5Yq6CxNVon
         HcQ2iZwhULAedtyfKVu6e/VZ6SLBpOBvLa6O6EPcQJPA0tbhDQ7XN+DDHHG2/jPK/6Zq
         PTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kaiSXMdHY6dt/gJdfV7T6qu30oh9hfVCJo7KmSZyiNY=;
        fh=Y+FUTwoApyDno3cfBcqoyyiGMDKMMaRe9CBCpH2FdYc=;
        b=PK0H+8pe1QUuv+cxK5x3hgMRsrsYqMqGbbLdlMQAbQAuZwDSHrT9zZIOB8jOgqogoq
         7Z9f0NbOk4ZERzcuwCd8SHBkahwsVcPeXKkiy61gkzh82lrz5u6pWG3Wz7WUUJYDJRHs
         5Ckpa+uD0/lLb+I2OfIFtdcx0TJeUGvbT13XFaMZZzSbTVFffRRQTaMr1pDzeXZsucBc
         JoJAhddzyIBNLyFub2r48JpLj+Og6AW/kRT2ZdGS8ynAGE+rwKmmgtJLdA6evrjS3ctC
         eIODEIJ4NTygaXEnzZjCMP4WUEMoiVeaCI6oYIqYgRy5MqhJlFuI+wlYUiv3iuyLYJUL
         1FzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793962343; x=1794567143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kaiSXMdHY6dt/gJdfV7T6qu30oh9hfVCJo7KmSZyiNY=;
        b=lvN3tpWTeQpNWoDkbs3yHEwVfqoGP1Ll9s/HrfhG8tEDDv3PUO1hwT15EkduXS+rWm
         aKWxHsXRIUr2QeleSRc+K0NgYrShBjliU8NjORCRwkrNoin3iunoivkUiQVSnOVPn3Rx
         3bw9l9mkskwPFOKzC57OGkiAtMteSYznGOZSX7n89i8iGMDsWXZApoeXQWBtfBEuFZpy
         KcN8x+453vC/bhc1y32uowH4Ej1eJXdn8Ad0zClYJTCUv5BGywALZQmlFJ5fvNLFRNKj
         DMkqNrtPcHnNDWbKKAFD0WvieXZcGyKH6qqVqbR80niPzNimQRLquSkHFkxdOBQvYL9E
         L88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962343; x=1794567143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaiSXMdHY6dt/gJdfV7T6qu30oh9hfVCJo7KmSZyiNY=;
        b=KFqxxHQcLS5PcfBERsFexiaT9pR9gQkU2MiDW+1Q8BhGYSIZYt6G8by1929fP/E3mX
         dMb/9kkg659qBgmerdgjnPWSwx7Xw2jn3bBEw1XD7V+fc42yh/xW/0V5uOdGqxJW+ZQu
         7te69lpEH8Ce/Ux39ooKrHKiuL+r0njobQUQT84EQSbr7u2bIR1qjgjEF31EZimJN/k3
         CiEOMV6DbpVNBUuwDLqTGM6Dc1iScJ1raQ0ChW41KiVdnOefnE1eXiC0U9gLZkHqT6as
         eDBSxbS8ktXGIx1Hxqt5epSnWU+mUZsZ5YHkJMxeCniKuM8nvS9m37d++o0bx6OY2z+G
         YRYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMsCYxkfZ/bUYfUjenaxrtd1wEXoLenyhjC0cJGZzn40+BQ71E/JYc62Joczj+aRScUy0FWBo1aA1GHxIQJzYsrQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+IkJDAtF5A96M7ccaFnP3w+7B4UOxhQK1/Juf7M0kP6iO1u1UM
	sPW6+sw3oaFTYL4jwygVW8jIB32IBPWH8c1+ORsmcnU62Ksdls2rXEfeSaq7lGSNP08NJfzZ5q/
	oCxSPygnek8yUa5xqYmaGW9C9JoSi0yw=
X-Gm-Gg: AYBFou0+n9jvjwZdMrGbgqCARdLxgp6ljYeAjruaT4xs2ELIMNkN4S8xLgaoQ9ucgsE
	DB+1w3PyR8Mw5Gdruq1WtJalinj0jp2LiHH3VALDOxsXvPV9F40uoLEx36rc/KfZVBxJp86JHX3
	3E2HAVYNVpTQxgUkb9hW44obuvNU7MXDEqmJWQXOsb4l4i8yqPkM4dqWVVvyfKkuLraSYW0rbcI
	J5kcn2L5DdMZvz22VthOq58+VbZj1EuC3k7bqK07xr0yS7sx/QSJsXTIZR63feTVn/Y/WwPVeXL
	LcWr3CdRW5pF7UgxiEOue0U8J+V9eRn8ZfruJwAGgaUHwov6RmqtvNZ1ym+9X5x6Wn0LYG6tSXJ
	FaMRc5X18eXt5pyDgHUy2LbwPxZ1rxWATBSxMgtb2E9uOa+uERBg7WlqFXwzEFvbsQu3ksXUpen
	xkGZccLzq+b9P8b+Nd+QcjG6fcCxQ6B7oHW8/GqadKrVrXWb6dL0aVvw/5mg==
X-Received: by 2002:a05:600c:4e43:b0:49f:f099:6fb1 with SMTP id
 5b1f17b1804b1-4b6de0cd91dmr32855205e9.15.1793962343270; Fri, 06 Nov 2026
 02:52:23 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org> <20261105-mali-c55-renesas-dts-v6-6-7dff41bf7107@kernel.org>
In-Reply-To: <20261105-mali-c55-renesas-dts-v6-6-7dff41bf7107@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 6 Nov 2026 10:51:57 +0000
X-Gm-Features: AclHuK84X0AV3nOTm5UaYtDdNo8XHTBLk32hG-FVymrE-EyctstaEQaOUyISrDM
Message-ID: <CA+V-a8t5BeTXN--GZUMWsoKkJ7PK8f-iFeFp+XXuKO9x2cc2fQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] media: mali-c55: Assert the ISP core reset last
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:02=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> Asserting the ISP core reset before the register and AXI interface resets
> can leave the RZ/V2H ISP in a state where the first register access after
> the next power-on stalls the bus.
>
> Keep the bulk reset API and reorder the reset names so that hresetn and
> aresetn are asserted before vresetn. The bulk API asserts resets in array
> order and deasserts them in reverse order, so this also releases vresetn,
> aresetn and hresetn in that order.
>
> Suggested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/driver=
s/media/platform/arm/mali-c55/mali-c55-core.c
> index 241a625f7284..e37f87e36eab 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -70,10 +70,17 @@ static const char * const mali_c55_clk_names[MALI_C55=
_NUM_CLKS] =3D {
>         "hclk",
>  };
>
> +/*
> + * The reset bulk API asserts the resets in array order and deasserts th=
em in
> + * reverse order. The video core reset (vresetn) must be asserted last, =
after
> + * the register (hresetn) and AXI (aresetn) interface resets. Otherwise =
the
> + * ISP can be left in a state where the first register access after the =
next
> + * power-on stalls the bus.
> + */
>  static const char * const mali_c55_reset_names[MALI_C55_NUM_RESETS] =3D =
{
> -       "vresetn",
> -       "aresetn",
>         "hresetn",
> +       "aresetn",
> +       "vresetn",
>  };
>
>  /*
>
> --
> 2.56.0
>
>
