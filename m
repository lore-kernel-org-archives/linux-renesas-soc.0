Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480D255D88D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996245; cv=pass; b=h2NBZCEmjXVXy0PELm0ED2E9CvL82ArLky+I4Hmh9RuX7BXbPdGp+jK6LR9Kj06mv86MM4dfkmewGSjq8qf9LSqhx80lh91/nAqoFtFRHdyI6Q8RB54D+4SyE1/Yz9zIbIxJiiZQq2ifVzjb3FSAaMhOrr8GS6WI3ojrKC3xw1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996245; c=relaxed/simple;
	bh=MMVXINMr7JZIMgeHG/AqGaqfPCjKzr4ZpfV8KNupDrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oW+ds8uAEFz1IrqrMp4QWs4cJdmNJSTuzp5hVXiFlRoFQ+U2h8SqXfuPO1BaU/BLFPuJUXK2KD9WDFYbMPGnUn3G4UiviE/4DRRo3lwCn+NRebuJMZog38WYia5r9dRqh1ycXDpITOxVqAq71zM3oXu9EMmtP68AQJXi7x18bhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITh5ZqJA; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITh5ZqJA"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c411d6615so3193782f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 09:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996242; cv=none;
        d=google.com; s=arc-20260327;
        b=UChtBpmWzhj7KrWipzvfztSEB34OAD7+YmL93gDQ4p1ygxDTgFyyxR4Sy9vjFyYU0H
         +IGKhjkHI5IgMJiP/nrRpz+rXuXUdKwaXceoR7tGj/Z/tVHhw/ZnUxhzwrYyN/IcQUXx
         +OISgDDb680RrDGbpU8BLcDKHSDDTXutLJEdDyD7JX2KOswo4NNReyKhOkxC3HxCzH40
         0EUj/0WuYSCJKxlZRUTKlxalMX55JaHi8oRIHjtsBXK7tmmMIBtEf/xP/DX82KRoADAh
         PwZG7foiUhMYuBAVVslVr3SzbtXg9KVOuozRA6sO/LLVb+gTqbsG5XhFDYoD/PNLwI/L
         kGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9q0DwdLIhqOGN7zNyyRQRC7CNxZQsLpoJL1VH7y7f/Y=;
        fh=5xLDLsJOkVK8nNx1Gac47LKtsg39YYi5LVqB5JYmXrA=;
        b=IGPAEjT5sjP0xrT6JGOCo0WGrzCs9mY/mUbgqzRdmXx6ZDfB8k5+AF9q1v+R1SQEMR
         mEWhaiqpBGMzFyCxl+A0IeUMEeG2gmSDWsqX7uC1qGTmgsV+P1Zx0R3cU3bs4j/qnjuM
         1/uHSUCG2pAAmFm3vQI6ZhaytkTAmzlPQId0ImeeKspyKWQDlDZMYHXO6ODmQ+0sXeuM
         eocLY42+9NIp/lPBDjxgrmGIdaWco7xfaEVq5JX0EatWURAL5mvk2w1h373sOhY4Mk7Z
         bPrZzpVn7hxTFvHch0BrgpOq5zjxxzvZRLEGGek7Ri4it/wqD+761PkVavJjBGa1vDzu
         uIMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996242; x=1792601042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9q0DwdLIhqOGN7zNyyRQRC7CNxZQsLpoJL1VH7y7f/Y=;
        b=ITh5ZqJAGwUOL+qfGJ5aTDDRPWjr/F2s5ihb2gm7iLg1wULunz/3uz8Tld7bXRQepF
         LRwChIWZxumyb7DM/dsI/5+hm6Ks0TkoTKm70QllgZPgwsD3TNGriXksOxbwCWKd0Rs5
         cVQk3vVlHCKQkaQRXhQJMgcV6wVOAE49kcKVxsEA/k4FJIx6RWAsfQAXgmWkRfRkwQWY
         NSLMpbLWNbS5eS2B5m5NKZv+zb9XCIP4E+qpnxN0IVTbPSNy7h/XpID9J3dqlqMx3A0E
         Q318TeIJISdhqZo8fqJOhM0QkuBViOyaT+RxQ2Pihf/QSPHxxqzAdbVaYSNceYD3TL/H
         6hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996242; x=1792601042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9q0DwdLIhqOGN7zNyyRQRC7CNxZQsLpoJL1VH7y7f/Y=;
        b=bwFX6ZTYjPVrh9yPAPT5VC+E77VrkgyKlopqP5tkfhQR7p54w9m0IIZRYadfX53eP+
         JgPC8EecjQCjinjCAiRKMvaOYgSzcEV1rs2Do+3pt+OSbaz/6s39nmtdqO9DoGx2xGvv
         Nvaz2ySZ2SI2mhOP+1LT9xR/yR1hzFivEMTPLue0/cTlumPRJKT6ptjlUlxXd3UgltUL
         D8EtT/U8F5060qdCtcZ7613ZG2H5rK0VnfhczlrR6RNyYY/wC814qNc278fqmxh9JXSs
         f92MXSZUdhv24YplW0fiNjfHh3ZDoxnE8s+G4mKK6OdLW6fgP0TazJM48rCTkDhkzMKu
         LJmQ==
X-Forwarded-Encrypted: i=1; AKwUvByECz+7b5oElLJ0PZuBkkJTt6fzxu3CUQmGkMKUqw7v4Eblr2oqq9JzJZ3AQVHExfzkiMu3BudWXaWFhLw+WSKjjg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJZq3se9Qn6sh2MahELBWqmcBx+uhDfBvib+0bdiPm71yowxPdp
	cJuNMRJefFiDslEg6ALzQq6C/QbmCC9JLA430HtPnu6FklyD9VLAohQDufngOd5pYJCrFRmEi14
	46m6p0G2Dg7yg7A9qqxy5gIJIRyKZUvA=
X-Gm-Gg: AYBFou2kie+csp0p/pq4q7q13nQqwKi8fyGMQrNXmbNTiUTvGpAg1163paVE6HXjnte
	RmwZ0/hvE/9G5zvJirL3Z68yNVxB1HNkLzu4kFxXnt4uMDrSLTkLrGI39vBq7OT6gQQs0cIDHLp
	wGSVSo1uMVkx7zCo7SzI54GjMMWZGgsRawo1v6t3xjeoUdVFM09rjjLtlZZdNgqAdJY2c/4zXgh
	q2SXtsrhxpjQ77rW45IyyGeVhTmz9sFKHH8lvhOKjR0Y9hOom83KXqk6qlGEh2KHcIqJJuV6YOv
	kvVYJO/WXvpzmqW+8XR0UEtIANCvEZ6xwH6SlMHo54JYD3zB7sb6JPe5YDvdi56+6SHNvq8v6yB
	GkFmW54XBHJpmMXvysNJl5c6upog58FYH7dd57wAIz29KQWONR4PWZ/21RzpgU6+k6G2h92Nbzg
	==
X-Received: by 2002:a05:6000:987:b0:488:7787:469d with SMTP id
 ffacd0b85a97d-48df14ed887mr2129597f8f.25.1791996242209; Wed, 14 Oct 2026
 09:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014-miic-validate-dtb-v3-v4-0-b7da71b3a106@reliablecontrols.com>
 <20261014-miic-validate-dtb-v3-v4-2-b7da71b3a106@reliablecontrols.com>
In-Reply-To: <20261014-miic-validate-dtb-v3-v4-2-b7da71b3a106@reliablecontrols.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 14 Oct 2026 17:43:34 +0100
X-Gm-Features: AclHuK9L-1D3Yt6ZN3HGXxulOCvvWz_eF-6S1YFQfIBvUb-SHdPO_MInoJxTrNw
Message-ID: <CA+V-a8v-YXma2NbeWP0Fhz+Fa5gmmq3oSPEZuKrDZhy6MHWcMw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/2] net: pcs: rzn1-miic: Validate dtb
 configuration values
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 4:37=E2=80=AFPM Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
>
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> Bad configuration values from the dtb could result in out of bounds array
> access. Verify parsed values are within range for the SoC and fail the
> probe if invalid.
>
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index 31716241b58f..f8bafce26bf1 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -693,16 +693,39 @@ static int miic_parse_dt(struct miic *miic, u32 *mo=
de_cfg)
>         memset(dt_val, MIIC_MODCTRL_CONF_NONE,
>                sizeof(*dt_val) * miic->of_data->conf_conv_count);
>
> -       if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf)=
 =3D=3D 0)
> +       if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf)=
 =3D=3D 0) {
> +               if (conf >=3D miic->of_data->conf_to_string_count) {
> +                       dev_err(miic->dev, "Port input configuration out =
of range: %d\n",
> +                               conf);
> +                       ret =3D -EINVAL;
> +                       goto err;
> +               }
>                 dt_val[0] =3D conf;
> +       }
>
>         for_each_available_child_of_node(np, conv) {
>                 if (of_property_read_u32(conv, "reg", &port))
>                         continue;
>
> +               if (port < miic->of_data->miic_port_start ||
> +                   port > miic->of_data->miic_port_last) {
> +                       dev_err(miic->dev, "Port number out of range: %d\=
n", port);
> +                       of_node_put(conv);
> +                       ret =3D -EINVAL;
> +                       goto err;
> +               }
> +
>                 if (of_property_read_u32(conv, "renesas,miic-input", &con=
f))
>                         continue;
>
> +               if (conf >=3D miic->of_data->conf_to_string_count) {
> +                       dev_err(miic->dev, "Port %d configuration out of =
range: %d\n",
> +                               port, conf);
> +                       of_node_put(conv);
> +                       ret =3D -EINVAL;
> +                       goto err;
> +               }
> +
>                 /* Adjust for 0 based index */
>                 dt_val[port + !miic->of_data->miic_port_start] =3D conf;
>
> @@ -712,6 +735,7 @@ static int miic_parse_dt(struct miic *miic, u32 *mode=
_cfg)
>         }
>
>         ret =3D miic_match_dt_conf(miic, dt_val, mode_cfg);
> +err:
>         kfree(dt_val);
>
>         return ret;
>
> --
> 2.43.0
>
>
>
