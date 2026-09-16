Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A692D2495
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560868; cv=pass; b=JlQ37h4EEG80v5OEaAxo6eC9HvBpu3w39K5+Q0d3qVUYHIljFe8QKg0PlJGfHWtDYN5qgCzBbPECDr/bkwtkZExhy42QU/CBDvFS/Bhj1k4mYIBjBb7FFwnl85USa5jdiV24gONEw3a+1B7+6bJIHf7wdKbxSs9OPS7EjkylC2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560868; c=relaxed/simple;
	bh=6OhSXpLL6yyCsnTcd/u+qyxR41s6OtTwu5yFPz09Fdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCW5JpnRiBSP3wDIBfNTLGSlGDLyq5O+VG8/lxJ+oVk+pOK526VLLI2spAqjBhU6BCcKydaBpN7anD+ZI/D0Sk8mOgAu8rVMNeGz7UhJ/wJtvEvu1Zyy5D2tZVCQQHPRKNrlGbCSlvUDcN6mZQrVRuX97KXiNNKJFAZjizZ2clE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMvzOKYs; arc=pass smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMvzOKYs"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so410160f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 05:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789560864; cv=none;
        d=google.com; s=arc-20260327;
        b=YaVPbR184Klherim4NtTNoF2e6bw47OrInlI0f9JrH2fe8vt2JuwyZxigFCYcgmGel
         /MQzFVLiEdPrrudOw1u0Obujy5mGxaFyFt7BMnO/NduZcwZePPZ6ugChT6N5kOOtQa8k
         852YmlC5bjx4M04tYM1lZno82hO+WBF++Vg+Ye8wZFMsVZABV7mIFK+Rs70sAgs2Slbq
         BdQT1BCyzeWRK8Q6b1tTRQ472c1JFrdwxbtcRgE9vET+lS5L0IfhxXOWMuoJtQPnjgcC
         m+ge8mJ5O1V38+Xjz2REbiODOFkjVo4H1OjCjKgp3aUIg/cuqfWuTEuO5YlJSEj/TzTk
         bALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W8tnBP32THpsSvPeT4SZBZeDx4xVbPtQq5N7CZKdDSE=;
        fh=5NhBa0771Ik7rI8ySERx/7S8siOGvPpLYfMkuayorw4=;
        b=qlgtzI8N30MrSn3OUauZhiuwCWCDye+VMycAQ/O/+FieZHUjR9vujx3cdCiv6ZfVrB
         zK6CCH5KeDBtn4hgrbqYxm9PrMEckIQ7wzeFbRmry+tpZ91TMN5BugClyYNMR2qcZbP2
         I5EKI72Jbn+7pmsdTK4bTt1FnAG0DnoP1bth4lgXhWGDcV2UW/wXWn8XWDFcduoUyIQL
         14gEBjHyT0NQS6Nbiv14a0xTVajnBS6ERbt4bK1SIYJVWJHqIcUgp3e7Eh0800B4EMrx
         nNScp0/E/84JQ4gI5Se4fhO79uBKP1azMnyaKcx3QLKcHWzneYokC4pThuQP78feCWFL
         ST2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789560864; x=1790165664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W8tnBP32THpsSvPeT4SZBZeDx4xVbPtQq5N7CZKdDSE=;
        b=YMvzOKYsg9wM5p6c3O41r3I33IFH0fjAtZlxtZdvKulG56+iaCCWLoh9AMKOLSIdYF
         em8d2uJ+aEB4Cy7pVzy+IIbQJHkCYfQmY87syE2EEPkDrG8x1f60+Hwv23IISDZirSyb
         0EJAQs2lK7sGQW6l8CUZivpIUSeV6FOgNkZrvjI/rMQjDXUPby23HcVWzkucccoGS+0B
         Ohg6G2vBPsqgAqBFaAIPZzy/PW1Mp/mVrMdHxzy3lSawtswzqd2w+T+uXCwgk7cZdr51
         iS5A7mizim7YPUWU7IQH1xpsHw1QblEcKicczmYCQt7axCtz2eEhAxb1v8/Y3HC2mJy6
         emRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789560864; x=1790165664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8tnBP32THpsSvPeT4SZBZeDx4xVbPtQq5N7CZKdDSE=;
        b=GP0/lUImKcQP/7lWZMLwMXlDAB/MwKqlNbIRMk/GzQNXGAp8kvL7gp1aTUleGq1ol2
         CY/Pu9RAWSk/UY0ZZYUlvX7D2jze2pEjSny0z2Do9UT+dOeVIfk9KqfkEdQRadS6UVDf
         4HchaGn9GR2UqR/68plxonFLVTEKsHpZ9RZ+wHMGP19oOEgc6Kowc7SgpERE9erS+WsY
         ZoLNk5vdqGC9Xv/7QrbL2L+xB9BSR4Mjx93zmBo2ocmUYTxBjqTnpUEBefAeNUEcGTx+
         Gmb9cRJoQM0X+IUd6BNly3qKkm9H+jdCrs+20LzbIOwq/C7u7GoscbYQLjRWmAa7knpy
         k3uA==
X-Gm-Message-State: AFuF++lnWKBH9eMxoWK3gg2+XpTdAR+rAdynL+IgAS2Mr6cibyHKiexT
	mcWsUCh1+D+6j03TchZorpkWpNaewGDAEjz3pOFc35mFmsv9eNfR40oZJxnWgyZBpmWRXJsueR7
	zWZPIZIrWdTiiXVXXqQjd1FXmhDQCP6M=
X-Gm-Gg: AYBFou1bmMk7xecH9M0rCy6gDKMPDFO+GcN+ZSejPHXjMEC1oicjjCHisnsw7q/htqD
	y5fe85oNypLCSpJ9ChR2AAayx8/GZWDNAjQHaGwd3XtNALyNEm7UorKp+Htjl/2Wf5wPv7GyR9P
	wrosDLJPL2CnLM45+Ud0WkmBWMblgQahH8NpZYgfHFivwc8iV+qYjk6NcSFAQSPR5bs8c94KJtp
	5B1tlzVGGNs1oa5rOq7TZfges2j7M7p7COEv1bmW0pRSZT8GYswzqOLN/TxLKViWFWzUXdzVkrT
	ukdfcfDQoZi3zDTYe2rg6b3OCgD0srgpXe/zMtyPrnH6TrVIRBDexenCcNFTY3UxwnUpSwso4YL
	OAPlzsstuyqUaDjpRg2Xd+sWPPVkhJSf27ET8pkb7
X-Received: by 2002:a05:6000:4681:b0:487:fa6:7335 with SMTP id
 ffacd0b85a97d-4870fa6741cmr1533422f8f.36.1789560863947; Wed, 16 Sep 2026
 05:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916102520.24288-1-wsa+renesas@sang-engineering.com> <20260916102520.24288-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260916102520.24288-4-wsa+renesas@sang-engineering.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 16 Sep 2026 13:13:56 +0100
X-Gm-Features: AcwNN1Vmfjvs1Y6IvhLzPsYLsvLUYulxTJnuWGWVyBNab4QaFnHHBImQf8BVKrw
Message-ID: <CA+V-a8sRiKX6SRsMdkDFoRMmUCYZHYfGkX5_P_j3xuV1u73xjA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: rtc: rzn1: add R-Car Gen5 support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:25=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> In general, the RTC on R-Car Gen5 is identical to RZ/T2H. X5H is an
> exception, though, because interrupts are not wired. X5H2 will have them
> wired again.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../bindings/rtc/renesas,rzn1-rtc.yaml        | 22 +++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml =
b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> index 7ea77cd0bee1..186d0076590c 100644
> --- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> @@ -23,6 +23,11 @@ properties:
>            - const: renesas,r9a09g087-rtc  # RZ/N2H
>            - const: renesas,r9a09g077-rtc  # RZ/T2H
>
> +      - items:
> +          - enum:
> +              - renesas,r8a78000-rtc      # R-Car X5H
> +          - const: renesas,rcar-gen5-rtc  # R-Car Gen5
> +
>    reg:
>      maxItems: 1
>
> @@ -52,8 +57,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts
> -  - interrupt-names
>    - clocks
>    - clock-names
>    - power-domains
> @@ -68,6 +71,7 @@ allOf:
>              enum:
>                - renesas,r9a09g077-rtc
>                - renesas,r9a09g087-rtc
> +              - renesas,rcar-gen5-rtc
>      then:
>        properties:
>          clocks:
> @@ -75,6 +79,20 @@ allOf:
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
