Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C1E383C86
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976847; cv=pass; b=eWhCKrmjNaufvD/0XU3Vs9ZuMuy8GP7ZrWib44ypbpOhUpnA1p7sIcRacidVrY+9Ws5mBpvmjGmYSeNKZ+Ohg0+0z1q0WOxlmiVJEbW0X+TlOMMhql6BvtS93mUTKspaGdl9EsRKdugrCldNB+6vvRZs82U2gq5J0UdRi1McPws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976847; c=relaxed/simple;
	bh=Dm1smR04ZivAMkU8QgbMvCQPxO0lGpCaWtgIm5vurN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Osb3UzNWgEDYs7BARuDVoBBYcuitlInIL4Z0t+JOMs8yHtGviU/UKZ/hMhInijGfLUCTA4cTIl8gsnHZS8O4vGDAD2ePeTGCLHvwS4LaIdQjg4gfXrYKyjEHobVOVogRn3n/AVvJPXm5jpnBTwAJeaEnaHzat096cFA+n40aCCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCp4paHr; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCp4paHr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so31484395e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 04:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791976844; cv=none;
        d=google.com; s=arc-20260327;
        b=Bo4pDxH1ExzjYeV2jpBpIWeOrkCEO5xBH0Qa3R7g9u3ULayj69D6KieK8yPD4KMUyC
         brRXsenusZI2gjiXshg39x635ISA/+Io07l5y3ulOmswVDYk69oE0dZi18/cyNrhf26z
         +OQqDbJr8YgskzUW8mxPfBZ4NSsF4pzVrWlSBfVrbvYdXsxoRjYOYx1Y4Vj+4zkXp0lu
         xWilXI/rBmmgahbQbwiJ6fYCNwXBalbcO4lXRbhCIRgN9rsQzjV6v6iwp82syXYdovlE
         8RYQ3t0WerzHeY90AAiULRCXt4+Q7BkPedNswcpbHA0R9Qi7DlZo1sI6ybxDTxyFOmS3
         XdJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bO5/h39EF/Oj8X3PFjOOqCZcmmbplUnPDUCoN8XUO3Q=;
        fh=KWheBPgPa2Y19tRT6uZJpmvFwmD/XyFuKNsgCn7hOsA=;
        b=WSoqUtA+vhQzRODywg+U1JIKIt4ManLE2wFHZwv/C2jFNIuUr2mfJt+eiLFRC9CI+P
         zbdkWVDRtkB2AFoB1vUXtdzYGwOiqNmZB7nPQnEt6lQXLinvDqy2aH4sjD6+GVHBvZ1i
         GxOCvHZJ7MlvsWzZUojvfr+EtBRJUrpocqriSybmQ/DtWUXiYOCeVgp9AfWnazDLgTQd
         OzIBumQPf9ZxYGu4mTIVLyWAUkXzYG+VdMl7nTJu7v+m2kNQuQCafodXoaVg1YLe1B5U
         6vsnXh4sX+6ySoW/6G0W0rBSq0KF+rNaDIoaxovnFQdHJt+DfRaX2IfQb+mOFT6uvRPI
         0GZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791976844; x=1792581644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bO5/h39EF/Oj8X3PFjOOqCZcmmbplUnPDUCoN8XUO3Q=;
        b=iCp4paHrczB97BfRM2s9Ejtsf1TkEplvFt/4up8zH8BGspsqNcbsc8Gs/mLEhTgYj1
         sGm9CCM/komsQ9lr4+99Re+Ecjnzvps5UpmidI7SVbnMi3dATbEfhxdcftQg+UqM7Y+n
         m+tZ+c49dRFnc7yGaR08maSAmdg3qlMfZmXGRL8El4Zqo4AynX5J6oOxh7Y0IjW0bPu2
         62/B8Iaa5vOSBlTmTeGLZ/NJquY7xWH9OSIRywvO8skLVM4lrYrr+LDfZW153CABGMsj
         nqado3o3DM4ldUL4D6VxAOSTzOSl2GCjXxKzXnuVYbSGyAr/SAPxJw7uXbBt7utwCSst
         mhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976844; x=1792581644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bO5/h39EF/Oj8X3PFjOOqCZcmmbplUnPDUCoN8XUO3Q=;
        b=VxegoJdaHZL+jvQ9E4z1g5rdbViHLAIKeCmEWoNel7JaHUyiTdNYjigu3dPX/wEg0R
         Z+ykPLT/EhrKIvSxc1A1RR1TR4F8I/34Hpz0S004Q3PYvPG4CP5b5PmaSb624rpd+GNV
         b7tmO0DaQQoHH3RGcWHCh3w095MDnv604IiWhkLWPe3bVaMV2W7Reiekk06oI/1YBN6Y
         EqZGoKrqxOcmzSnKPKGyBxZ1rKBSCpUusAholg1iSMTXgtsNesVEpedQ74PO3iLZUAA7
         14lfxUe3lNx4pmawz880cmcHS1U9tdfRoiTnK7Uy7lfHhD8k5juNLUgNpcldcc8O64qR
         LQSw==
X-Forwarded-Encrypted: i=1; AKwUvByrDG3dUBaFtd8huK7ejb+e+EpL8UvtTk38mLJY2v0duHj43HRmZ7WYlST7LFLWn8lHirfKRR72ELlHmsLJXs/jmA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKPyhOg3A4dpnGhyvaG/icqRoZTuOm3L7JtxAGLVXwIyuTNs5d4
	ESsqhcF2N2CvBQsxPYsIMare+qD1qFJGf3v9GCMcdxxeUwxJ6sHD7PazBR1Jd7I2iDhcXzjeQj9
	k41eM/7xH2rRq4XfVQB9CNwHKP2BIEMw=
X-Gm-Gg: AYBFou26fBv3PjzTIzggeUEGdYL8xdoDUR1aQni90pomkerU4TC9KULksjGy/nE4k5X
	YlEGC4T5k7uHhJNnQs+rdKqnkZ2kTLtzNSmMEmC7ruuxwXcgASU9W7N/igUIXcPb/JRfyNa0/Gx
	SYuMqNQliUkedLzqO2/9U4eLAdsrshQQFdCXbrEfb0N+yALAb9UcIK2nvyLCRu6flI66uTvOx13
	m9zY4sphm00st7XqPEeqnE9NmMRKuTlmGo7Tlm86XBEzbomTCzuNPQxTwTtARJ9sLeaW0vwSWlO
	wth9pKHuZia8A4EKP6Xszq2URQ+6to/cwDxWkKwnazzOho0+47ehvi8nn0F5MdkWhk11+f/xmii
	O6j5mlKP8T7apw2TNUTp90T+wl5d35NqcD/Uhsj90jo6CdTED/2iqaz7eQsDbCYR2+I+wdkwXaF
	Y6x1HTWbCNnQ==
X-Received: by 2002:a05:600c:6384:b0:4a1:7741:ec43 with SMTP id
 5b1f17b1804b1-4a18e4b8966mr285168845e9.26.1791976844095; Wed, 14 Oct 2026
 04:20:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-miic-validate-dtb-v3-v3-0-68617b3dca5c@reliablecontrols.com>
 <20261006-miic-validate-dtb-v3-v3-2-68617b3dca5c@reliablecontrols.com>
In-Reply-To: <20261006-miic-validate-dtb-v3-v3-2-68617b3dca5c@reliablecontrols.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 14 Oct 2026 12:20:17 +0100
X-Gm-Features: AclHuK9lTkcKfev6iJ1zocn1hec2LLI_EBu29VRkVnV_MFGRgCWPxR3baUck-N0
Message-ID: <CA+V-a8vZmCia0aRyx_KU+_3Wz4JJNOMG=-GC-QXcEL8RaE3-qg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] net: pcs: rzn1-miic: Validate dtb
 configuration values
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 5:48=E2=80=AFPM Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
>
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> Bad configuration values from the dtb could result in out of bounds array
> access. Verify parsed values are within range for the SoC and fail the
> probe if invalid.
>
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index 31716241b58f..10622eb654d2 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -693,16 +693,40 @@ static int miic_parse_dt(struct miic *miic, u32 *mo=
de_cfg)
>         memset(dt_val, MIIC_MODCTRL_CONF_NONE,
>                sizeof(*dt_val) * miic->of_data->conf_conv_count);
>
> -       if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf)=
 =3D=3D 0)
> -               dt_val[0] =3D conf;
> +       if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf)=
 =3D=3D 0) {
> +               if (conf >=3D miic->of_data->conf_to_string_count) {
> +                       dev_err(miic->dev, "Port input configuration out =
of range: %d\n",
> +                               conf);
> +                       ret =3D -EINVAL;
> +                       goto err;
> +               } else {
> +                       dt_val[0] =3D conf;
> +               }
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
> @@ -712,6 +736,7 @@ static int miic_parse_dt(struct miic *miic, u32 *mode=
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
