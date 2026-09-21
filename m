Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD16459AF4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 08:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981022; cv=pass; b=YIGgsRosEDKi6btRIQZu5hZOHiGiLNQ7Nf1pUyD/oG0I3h7a0fDmDZtf4nOdL3LV0yjkk3msgr6XPUnX+tTGjnO+dKKzZ413Yhl99IQ9JIG/lQOmcXONAJvEZeXn8lxPzFa3ObyqvNJM82PpOr3Ez87825AKkXs3SiSbQtB6mk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981022; c=relaxed/simple;
	bh=LIMisOFGt0qIn1CPMIveMR4IC+rDqNbpmZfUtuIDlQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g38ApbAgNSqcscbmkb31womYdsv6N4nrBPHg0gclfIekIzwwF/kRP29d00g007tIn+5HVPZtXLPyjc+SOhKMVNXRGu+id+5mwNEiCT0DeRF9WEuYMYS8cTqTXSuu0JV6QU2MinbkBrAo2fcCXKbMIb/M4qWUfbpAPpdciONq4Fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9SmA2aW; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9SmA2aW"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so1583704f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 01:57:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789981018; cv=none;
        d=google.com; s=arc-20260327;
        b=LiNTNP3EiYJWAWw4yG11O75YnkgNhTtdHcL5KbvGgPfQkrafpZExFXAXgOIkP3kpk0
         /uDQpWoEjf+X+yOfpRRCXTmyvfNfB8hRnySGcVLkmaJ1KjZ+IUW/j+rdn++OQvH8uQgQ
         IeLlKhb08qKsg/8M03/3irZrb7cwm0Z0PorIUdPxEyArYbJNA8HyOTjKwiffc8i8t4aw
         5a9q681FWu8ri+SueUH9t70S3vQnwGQpnkVPMM+5MgSjDvcwsb28wPXoNEtR/XLlKnuX
         hKMvVTz6d9yB7WNFBaob9zpUXAzyP+kdcD35XCnckO1LvwCcHkTa0A/tMc3t8R0yiBUR
         w3FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qON0nZ3j82CiOmvFqun6r6qqh5dkAemGnmHmfUfUMgI=;
        fh=1Vs2ow87PoD0LqVltgA+nrlhzf/8Owp9KLeRoyh/UGg=;
        b=bK6G375tsZJPY2UpEixWQRVM+nZeFhh+sT+fgDufMGifz6QdeiZRmAbjB3ylPde7mW
         6sKrEOiZmWz2WOJF+gzL0ngg6YG1kaCa1IQp80tVLo3bQsKdNU6PWhfWxdYh5rRkwvJc
         kjFnybkpGeIiSOZGuQ0jusRvkJtTh+v8mVcBqsqkcLborRwcbffMkzRXJFC25rDuqe5u
         k4Xc3BFrxBmm8aj/Iztk1IoAUk3vfzkJa0n3wTIjbqQbJpMnAw/MJbZHUe/O7s2boy1y
         XnzNB/JonWRwGHNkgry9/w8x+vTn7oc0nxK4afDyX7H5dphBY8g8fwtsvaTmQxc4Si4t
         gV+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789981018; x=1790585818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qON0nZ3j82CiOmvFqun6r6qqh5dkAemGnmHmfUfUMgI=;
        b=r9SmA2aWbdtQDOK50ymPvhTVeRUUSayv17P+1q+tWz8l7VTadUph4aJiemMhWNyVHn
         o9CDznKLNQ3j/hmc977Rg404wDglH1zk9pPC8R7Gyp5q+xq2R8g31HYyXDZkNwGDhiF5
         ixhHx4puuB9dHflPVvnuIu6Hw1fJKAPrL3fwXKSbBusz06/3GpZYYNCFzo5ginUlyahJ
         ua/VQW6RaxcBgynx3xaLd5Z+34VZ8Fl7anAK9ziZlugRJFseCBJEj9a6gWDeSgfGLK7q
         j1FKgDkq/KskJHhoOSwFcVf0GN7iwgdTtmJ6V5GMHu66khVnaHPf5wLL12ZIoCCSDczS
         XFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981018; x=1790585818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qON0nZ3j82CiOmvFqun6r6qqh5dkAemGnmHmfUfUMgI=;
        b=HZOMfANZhPzcwnaktgRHYVZXtc1x7RxDvtZyp/w8PKcT4ZaZyh7ye9Y+W+AH716dWG
         2jUGYMxEYUgtTFwme4uEkHPu2k01j8KB9ODXFZZJ0RovDBeu0n7CWeJLQh2rI8SAZxOh
         4k/ECxDBe1aLSJSqNgxGLxHBY7YgMq8J9xCzTTMPOpe4FM2i0FAHzrZ9hfXG762kWbcJ
         R//oK81aTYeNBgB3RFxUZEZFKNIlgg+ygHqVC1qs+naVSFoBI/Qs7gEaE8InuA3DA7xw
         qMvt6srZ6ei9hbBSUcNR8xM1vV6ZYtQaM7017TRYs2irP/VjY+Mc/D6KOfca8+Oh1vpN
         JTWQ==
X-Gm-Message-State: AFuF++m30VMi8j1o5fJ787+QuK6Tn0M+TjG/XBxwx2J8nkCWT6BnxVXJ
	1CksO5KKOzyUClNwGDuDrobFbWuqpQGyJTCBD7l9zpC+oGVlTsNBo0Obs9u4ZiloaSniOVbkSfI
	JVe5xlR4VTtfaU2Mt9491T03HQtKP0Wg=
X-Gm-Gg: AYBFou3ApHwyC5S+PjmJ0nOQySPkTCsS1FpEjWqHYcHxfucFBOMgQcjU5muyXgbIiN+
	p0a1/+s4JziT1gFotNeLESVqHcYUrS2qAWkjZXVaXWJbKJvmtSSVvWjnjnylSTHB88JAMy423DL
	CijGM+j1WtyfUtFlATbX8UM3L4n8TY5KTpWaZih8p+1D+2gWgiPDw88HAOcj9LOvNup+lFNFmrb
	Qhx+nGYfFsu0qON/Q1lNHzwfq1ELssQETr+GkC+waXafGvRV2In6ip5oH/CgFaoT1HeF3h5dOnl
	uTPOoiKGNBcFqAPuJ7e7g3eAUYud7eMj9mRZRPNPvrZydLcwWHwMZXuxu11eSwK1LdrQmSh71T4
	e3xkOtB8x+nf7yPoIe0fUoa5mP6GHlDLXxwRvgIiDnYG1854YQwqv6VUaYgDvEP/0ENDaJ+OG
X-Received: by 2002:adf:e001:0:20b0:487:21a4:f617 with SMTP id
 ffacd0b85a97d-48721a4f785mr12067196f8f.19.1789981018022; Mon, 21 Sep 2026
 01:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917185903.61253-6-wsa+renesas@sang-engineering.com> <20260917185903.61253-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260917185903.61253-9-wsa+renesas@sang-engineering.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 21 Sep 2026 09:56:31 +0100
X-Gm-Features: AcwNN1UuhHZT5-lbDJzHKCaC457x5CxrktdfiOsZEU2bG1XndBnc3Ogxq0Q1bIE
Message-ID: <CA+V-a8vdkeOP3uh-jObET1oCEOaEsyW4LJ9mxE0tOTqe81Rg_Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: rtc: rzn1: add R-Car X5H support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 7:59=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The RTC on R-Car X5H is a bit special because interrupts are not wired.
> Future R-Car Gen5 SoCs will have them wired again. So, create a
> dedicated entry for X5H without interrupts.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>
> Changes since v3: tag added
>
>  .../bindings/rtc/renesas,rzn1-rtc.yaml        | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml =
b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> index 7ea77cd0bee1..b448725671ec 100644
> --- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> @@ -23,6 +23,8 @@ properties:
>            - const: renesas,r9a09g087-rtc  # RZ/N2H
>            - const: renesas,r9a09g077-rtc  # RZ/T2H
>
> +      - const: renesas,r8a78000-rtc   # R-Car X5H
> +
>    reg:
>      maxItems: 1
>
> @@ -52,8 +54,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts
> -  - interrupt-names
>    - clocks
>    - clock-names
>    - power-domains
> @@ -66,6 +66,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - renesas,r8a78000-rtc
>                - renesas,r9a09g077-rtc
>                - renesas,r9a09g087-rtc
>      then:
> @@ -75,6 +76,20 @@ allOf:
>          clock-names:
>            minItems: 2
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r8a78000-rtc
> +    then:
> +      properties:
> +        interrupts: false
> +        interrupt-names: false
> +    else:
> +      required:
> +        - interrupts
> +        - interrupt-names
> +
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.53.0
>
