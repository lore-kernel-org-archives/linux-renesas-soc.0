Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630FA37F313
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 06:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786342966; cv=pass; b=Eh3aHjtfUCcRutluVhwWdWFKP00D7cstaSA6iDWOOUc69Xzfhk2Fo4G+5lZ49oaJpMjPFLOAoe+jmHDopToIdOkP+8KGH9hBDLFXo4ogaEa/doypj4yvIT7hOEY/js1XSWCzEYbInk4+SmrenCGdeOjwBwOSrwk2seBq5zl5gLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786342966; c=relaxed/simple;
	bh=MUobYcbQly6mopnF21QUxNVxVjihkFRst1rGeXeYpHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+9cGR1+mOwfGRjFzJENbrDo9JsDKlFMPqIUST1rjab1b+hth+743Hzz7N+1o/L3mEbeX0Vy4Gtv49OYtDfzmqTsAQU/i2x6aSmskxTFac7fMeLl03AHJvUjGyZbr89fH36f/sLNNj5X5cLTDgExB2YLRrSBOngLfW8kVY5t+g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaBZotDr; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaBZotDr"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fecbb7000so666256f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 09 Aug 2026 23:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786342962; cv=none;
        d=google.com; s=arc-20260327;
        b=sXs1gT1GZQZuMVPTiBje4LBNeN1idUhWZxAopBQyn8Bd2e9MmJ+E7CMkrK42ubshDn
         lSJt5bcO0lET0n6eWvQ4MREY6La+1i8SPyyIZnK0LBk/+IBp10WmfuL3p6E+1Lp/jCYI
         6+83fL5gDOGkapZ4SenB+7NKU3th8hEkeLwQjnzaIFurZcaSeDbH7iScmgcBuKGCw1rf
         36pcMkhVv+eJ4q5Ui1X5/AmWycdpS+MkSIqslSUOZYmqI6wK/jXGLyzZuw2JCHyZQdeJ
         YyNIvNre1OUqx/+hM3cX4EueIfUiRozc7OvKpU8K6hJP59u68dCPSZ4yTxEgJpKLXi1Q
         iTwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2nCaqUvlzQuEmT1eloU+mJpWPGgkn9RpO4cKrG5dYAU=;
        fh=N3OLuNXPm9MwcX3ghG4MZ+4WUWExSjCnAhNP4yCgLGs=;
        b=MQnQH+B16K8vHfIb3nfEPwqOhqMiHvOfpTPJlZLlMA4AHQOlaYsJ80kfmF2JiJguxa
         V3OHsWD1tOrEZWgT/Qt91FI5Lz/3uQz8Xag5iJMEEtvt1KE+7vKZbVXMZziHLWbJ30sF
         JLw/94z5UqBNb08H2/pmsotm01Fp1XK70wytqwT3FgOsrryjWuiXNKe7/OzcSC+PE/la
         CENkr92NmkYhaxNpNl61RFJgPe55Em1eKbYXKr/wn85djb8B1+ZMLeQCRx2AvDqai/OI
         ycKZFHkBdjmhua87yAEfj3KSoFc3Zz4IQt9Q5gmlTHgW5JSovYXcRkYMgOhzlqjbrzlU
         mKaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786342962; x=1786947762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2nCaqUvlzQuEmT1eloU+mJpWPGgkn9RpO4cKrG5dYAU=;
        b=DaBZotDremJkJQLdkxrT6PqyUcad6Dxg/fM4I+QsoMy4nlZBc37sBYqP0WDJA37y6B
         gKX9jx8dU3ACz/Qp/bCdJepChO7EOR8zTb+Q2S/kXGm6wpwacZRDBa8oAjJoCcijTMJv
         rvmQs0dYUOoQULZoea2LRYiZgddo4KD2ejg+SEHeDDC1B3IwZ/IECYslOXRPFll2/uDW
         zKRS7opngUdIFkdVtyw+/M9JjQgXZdl7f9QX1VQWfmVqym/tJBMlF7KWg3i9pc3YfnD6
         HhRKotN2jqQxYfntQ6OfeXbi73DbWBsX5baqwvFSJeEbKuTGS6kVVuNplybau9dF5ueN
         fEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786342962; x=1786947762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nCaqUvlzQuEmT1eloU+mJpWPGgkn9RpO4cKrG5dYAU=;
        b=llUX2s8jeDOFgL/g05qShamzyyQcdn05Khe7N3Moz5RW8/+rWZOMfQm30gWXPcTc/W
         f9eZ0rmmxhy00x75sqJLBTN4LV8Xx7y6fpEM5vKOICv/OR03rA0J+DTmnNuqg909wa/u
         ArUAv1ZA4Hqsp/gFxEf+y37dsBbIKJOKda9f0rqpzvSpdkTXyLqdM2usNLcAIta7er/R
         MQGiAtjzQD4385jvUxqpvfu6Sbxs5oeRIrvm2aqmmkrmXF5U/t19ZFLZ1sRe/KDoOa5d
         mzUjXkG8bQDuWz89/kZlcV2xtwB4TLsRANT/rEaqv+JcEO3QOtLFZN6TQXZpQeZFShsJ
         bmoQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZ6x4/us8IjvxIpgyh2kDCKQzcQCGWSYX0UcieriHTJA131+4QFjMoIRfnySfv26wQBtzfOshCnH9qWhJoCmzLfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz44D/M/hgrWnov0NCWBXgnJWZuJsKWnKL8ndhpbjoPH5L8mim1
	SIcOS4Y54c6pkqEMqx8tobmZM5U8qbgfnrIsLlbWym5a/taCMJEEfMSUwYB88Dgjto/KGaheo3I
	+vsmmIqEgz/D9Vh/T/QWUeXMdCsTJpkg=
X-Gm-Gg: AR+sD12KtPp/21d7/2f8g1zizJS6z1+rlG03t3UiUrEwz+fqIQn0kXj8vrer+Bf5Hul
	0kbTStvkr9t2pKxFcCUSRQ/auBi/a6vhyn7s5oqSTj9j5ChKTr/87jDxV7KZ1kzP94uVTA4hx2L
	Kny34iO/QYpGR5Uin5rfmjBpTfHPXsKTb83zVMh38Ox1cf0QQwxPk/ivnXLEGsoqyPSxisoMJQL
	jJUoFnan+WKXaxCa5dRe4xZzH2+MleM8B3X2BHkBJu1m5mqesyynw6pqQ3u3xYsnKYft/fEC2kM
	MKwDYpRKQgxQ6odr5LnfsAIznt42p4FS6tf/0NmjdtZkVn+jHuFrRvzdA7E3J+2/7wjNVNh26To
	jI1d+Kx77/1K/jf2+nH8xSWEWhEcyAv8FtSDtQd9fvEbN9QY6vR13/Px3d3IfDK3/
X-Received: by 2002:a05:6000:46d8:b0:47f:776f:3838 with SMTP id
 ffacd0b85a97d-48130e7e741mr17424077f8f.6.1786342962462; Sun, 09 Aug 2026
 23:22:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702125855.3157253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702125855.3157253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 10 Aug 2026 07:22:14 +0100
X-Gm-Features: AUfX_mw6Z0PAxG9axT9YlVKos6xjgmhuOdB1JydRIr01ODIxx6ZgWLrLZdvGGNo
Message-ID: <CA+V-a8sG6uT2an8R0T6Jy4ytwGeNTfMCp_CMGdQtUyU0JKetdw@mail.gmail.com>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Ignore missing VBUS regulator
To: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 1:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Commit b6d7dd157763 ("phy: renesas: rcar-gen3-usb2: Add regulator for
> OTG VBUS control") introduced support for controlling OTG VBUS through
> the regulator framework.
>
> As part of this change, the driver started requesting an exclusive "vbus"
> regulator for OTG-capable PHYs with no_adp_ctrl set. The lookup failure
> was propagated unconditionally, causing probe to fail on platforms where
> no VBUS regulator is described.
>
> On RZ/V2H and RZ/V2N, which do not use a VBUS regulator, this results
> in the following error:
>
>     phy_rcar_gen3_usb2 15800200.usb-phy:
>     dummy supplies not allowed for exclusive requests (id=3Dvbus)
>
> This failure completely prevents the USB 2.0 interface from initializing.
>
> Fix this by allowing the probe to continue if an external VBUS regulator
> is missing. Only propagate the error if the internal vbus-regulator node
> is explicitly present, or if the lookup returns -EPROBE_DEFER. For all
> other missing regulator errors, gracefully assume no external VBUS
> regulator is available and return 0.
>
> Fixes: b6d7dd157763 ("phy: renesas: rcar-gen3-usb2: Add regulator for OTG=
 VBUS control")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
Gentle ping.

Cheers,
Prabhakar

> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index ef38c3b365d4..9ae9975d3255 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -902,8 +902,17 @@ static int rcar_gen3_phy_usb2_vbus_regulator_get_exc=
lusive_enable(struct rcar_ge
>         int ret;
>
>         channel->vbus =3D devm_regulator_get_exclusive(dev, "vbus");
> -       if (IS_ERR(channel->vbus))
> -               return PTR_ERR(channel->vbus);
> +       if (IS_ERR(channel->vbus)) {
> +               ret =3D PTR_ERR(channel->vbus);
> +               /* If vbus-regulator node was present vbus regulator shou=
ld be available */
> +               if (channel->otg_internal_reg)
> +                       return ret;
> +
> +               if (ret =3D=3D -EPROBE_DEFER)
> +                       return ret;
> +
> +               return 0;
> +       }
>
>         if (enable) {
>                 ret =3D regulator_enable(channel->vbus);
> --
> 2.54.0
>
