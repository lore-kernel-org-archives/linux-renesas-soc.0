Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795695229;
	b=MqZtdDgeGtL2G3WeOWXB6chxshsw/A57STla1I8/yP80393wzoyIh6B6RgdkEzpIDPEG
	 D6ry2GW9l5BXLqW3HK0oHNf+qERnyBM2Iw7zrEsiARp4Ntfw+ExTaBmdZsAz7Hivobt6P
	 rUSYKHwz7B4dg7UZegDq/+tv7VzjsRYPbHRjUzittfPnWvCdQMqSNmFH63GAS8QVl9Zgq
	 QGrfn0JbTTpyd1z5EnVV8dyMEkA76p+R0GrsH0/UE9cWM6YnWKTpn/H7YHETe7sc4YOP0
	 S+mxO+RYseoANKjM+V813NMdD2Ho+acz5aDhqim+AGnhLsH2B97fmj2gFTEseD9AA4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8oQPuCvkPSk5AvgWx1uVWwUGY4FHBPq4s1ADy1aw6U4=;
	b=K8AtVPe+LdoPq8i32XnNpJju/nxE5wy/zhK1+5+eqqFkOG/xjxgUS4lxeEWwSUx7G3yB
	 BceIp7rIYjUUXv0mhCfVCOZU3w4ngrSv+VL1eA1K3T/t9NNyX+mCv3pgBLcEe6zPNW2R7
	 jUjIsif3sDEWqaU54+fLghSyBj4reRcXBKSuDae1SoH55Rj1xLLgzJyFRuZDgqU4xbech
	 +KEvlV58fJe8HattlD5fWDRgankwGWBEXggFO9jQzAhA0ZN5lHvse/S5fWcpfgM3gNy3Q
	 leM7oniGorBrv0wiVOyWbBuia03F+dwToEGTRPpRbmkxzroaLjNC71H/W6f/IsYC0tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OnTrh62B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6D1606A69F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 12:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA6D1606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OnTrh62B
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-497614c95f0so3956169f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 04:13:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795695227; cv=none;
        d=google.com; s=arc-20260327;
        b=i06MhHCyBa0C3ZZVVKNjHu1MFBlrGdAJ9yXO8mmq/cUxRS1XBMSlQD326HQ+g7MUbE
         PHt2IlSATJpHTZoVoBhN2B+IYmzDEB0fVC77JrDtvoqRTJPaxBj+YMcYFlyqTEkV5XrA
         XjIiUeUixC+/Zf5qhXapo47K74yxlH4fMdUkkfEbJIWfce02+/iZUbje+l39SFfxNFSh
         5pMI/N7IbY/SDBeMfSMtaG0MNg0DuOZAbzfGlDaEdkQPXLCvJVCvhbpFBvU64RaQIdKY
         WM5jK3wuEez2AJDuraFbt9g+Q6gvmFJxLuSZClMoir0KI4+M80N9PA5Wfp2/EO2KThP/
         2/vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8oQPuCvkPSk5AvgWx1uVWwUGY4FHBPq4s1ADy1aw6U4=;
        fh=1YDq27P+KDEY/qZJcQDeYhm0NR8viM6LpDW9ahSTSVM=;
        b=YVc4HNr0FOzv1lp3TLOxNSjTpPialoOcXhrhzoA/A46HAYTUEu8fNSta+GbAlzZX4I
         bwfIPfEu9+JBeqcxxDbHlYOuXnNUI/klMSOiwCOl6jQ5FUGyAuF52i05o0FxpAkS/hSI
         8fjNuwmGPipAaDE43xkgRzaL4S9riREIZKD2AF+C+nEhQI8fPtJEka4eVOSX7k7/K6Iv
         TCETqfGg93dfiNSomd+y3EfhWVQTWyyKM3qK7KzLFyiHWwGJZNsbBlh1nzm3vxOsIe6g
         aT0JTEGGC9Yieh19Ftn1RfDrrl6AMSlYNmwZF9oaRTOGQbUBjZUPosm5pg3Nnds0XBmo
         CwRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695227; x=1796300027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8oQPuCvkPSk5AvgWx1uVWwUGY4FHBPq4s1ADy1aw6U4=;
        b=OnTrh62BErmlljhlpukUz7dfRdVPWlz9elGN1Cpqbny/F6/cIHqS6TRRPLJU36UtI0
         2lAneuhQjEImukoH/gIvi5std14Hg8LcaMmAIEQ2BaVDynDM93tIkxaRxRrBHZ/qVWXD
         GWuRs0rik2RSvxn0XidRhyLV/Tv1g7CT/XZEMiDvt1QfssEYdjd9mw9HEiNzQz6urGx9
         ItTNFxmqQwDux8YDHHcj4nD8qO3pGUU3ifos8fFtPn580DyTaVVxoJngQO8sBD+472+J
         YlShpSQZvDoTlUcDK4sy06iW9YigluSeMQFBpFH5FFASXTAKQIgBjZT60G3rPyK1d8KD
         oEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695227; x=1796300027;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oQPuCvkPSk5AvgWx1uVWwUGY4FHBPq4s1ADy1aw6U4=;
        b=DvtH0MwFCT+8jCa224cxHXhpHjebXNvMb1tFKuJfhNWp0T5WG05fXDrUiiHdEDhRRU
         e4KyBIryuL6WeZzR1N1SsVYKk1RRHGm5jYoeAX51ZQpXHNNgscEwPFewB1MRcNrgX0O2
         pCtA+I5W8y6cSbtajhjDOSPXth9J6zmuXX7NB8G6ZLtQCGP6oSBVgmXCoazs4aDA1Nae
         xRFLqgRWrWrs5qiK8y6+/SbEuym9se2lAx9KtD52YbHJpxlN0LjY4laXVhS1purFi4qi
         JIUuLjw6V9y0hGXufQpm2/4+sS3iRfwUXZFhBNguQ/rEdTyi5cbWkUQ5bffmHdPRKCW/
         WckA==
X-Forwarded-Encrypted: i=1; AL+hErHKIl7CANPwEeA45j1mUFX5BIWMGRbVRAc5wf9YmotYvgaQdwL3o6dkiiPCgsECEuO6ANfXbUpQl73h4OSn2LqoXw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8tSODSSnTPkCSWoeHcR4K20dIospc66l15MdW+9FHXEcnKRSrk
	MGQmeuiSiEiTMNww8n/gDmadAop3pvw0KVIrhz/mt+JJBuA1RZLAk2zQibRzydQ6n4xXQUYmtcw
	rn+BjBNytBIgahQltlJkDnNjxf3Tzix4=
X-Gm-Gg: AZFdTZf4Z0WlzBBlIZEeRJB2ehJMj1BUS02BJunTDA5Fhov9wm4ivgtNksrEFbQg4cx
	LIjhQ7QD7XElZqr/Jn14c97OJExyLu7Fbjbu27bwZO+dvlzty53Ei+95eYCkXuOFhNkSqaldxea
	m18EH2TxhavIfUFUrQQg+0No202981JUF311bNdx+65MFc4RVD20DeIZgGmG9P1uJaOt3r4QjQp
	1FnGuywsS+YdA3ciBMyqdYffSSuxNZZc3CC1WVxgp78dJbN+4kwyYA52fDTVkxJCaiPSbLMkxUo
	q7b9vj3LaZNmiMJ3vucItym/gTaBmPQI5fTkbxxaeQ4AYXaq1OZ1UUGgA+Kz7Xc+5yGVVpPuuh2
	BXWHKvWxDhOJu6OLYgY4z16ABUxXowSHXyIBOF4pirdqXA9P/UgHTVPhk7u4SgT0nn417n1Ro9H
	35ZTnlK3onN0pn0MHrxXP9PLpFvgJZDP1R2Q3wJRdnA4wdxf2jORPEmeAkrg==
X-Received: by 2002:a05:600c:6219:b0:4bb:60b1:4409 with SMTP id
 5b1f17b1804b1-4bb88816525mr406462305e9.19.1795695226899; Thu, 26 Nov 2026
 04:13:46 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102104907.16007-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261102104907.16007-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 26 Nov 2026 12:13:20 +0000
X-Gm-Features: Aa3M54o554CBQDS46Q5cL_QVod_O_1ZDWVlLVSBjQ9SBzaVxWUHV8HeeuRLzrP0
Message-ID: <CA+V-a8s-GdrW_d1OY42awLqBapVY1LpKbpq_u8ZvGmij_Mnzug@mail.gmail.com>
Subject: Re: [PATCH v3] phy: renesas: rcar-gen3-usb2: Keep OTG VBUS disabled
 until role is known
To: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Manivannan Sadhasivam <mani@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 10:49=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On OTG channels of SoCs without ADP control, the VBUS regulator is
> acquired with devm_regulator_get_exclusive() and its output is switched
> by rcar_gen3_enable_vbus_ctrl() using regulator_hardware_enable() once
> the port role is known.
>
> The helper acquiring the regulator has the following problems:
>
> - The internal regulator is unconditionally enabled at probe, so VBUS
>   is driven before the port role is known. If the port is connected to
>   an external host this can back-power it.
>
> - regulator_get_exclusive() hands the consumer an enable reference if
>   the regulator is already enabled, for example by the bootloader. The
>   unconditional regulator_enable() then takes a second reference while
>   only one is released on unbind, leaving the regulator enabled and
>   triggering the WARN_ON() in _regulator_put().
>
> Fix this by making sure the driver always holds exactly one reference
> to the regulator: reuse the reference handed over by the exclusive get
> if the regulator is already enabled, and call regulator_enable()
> otherwise. Register the disable action in both cases, then turn off the
> physical VBUS output with regulator_hardware_enable() until the port
> role is established. Enabling a disabled regulator to take the
> reference may briefly drive VBUS during probe; this cannot be avoided
> with the regulator API.
>
> Rename the regulator helper to reflect that it acquires the regulator
> without directly enabling its physical VBUS output.
>
> Fixes: b6d7dd157763 ("phy: renesas: rcar-gen3-usb2: Add regulator for OTG=
 VBUS control")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.co=
m>
> ---
> v2->v3:
> - Added Fixes tag
> - Added Reviewed-by and Tested-by tags
>
> v1->v2:
> - regulator_enable() is only called if the regulator is not already enabl=
ed,
>   ensuring exactly one reference is held.
> - Dropped enable parameter from the function
> - Renamed function rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable=
()
>   to rcar_gen3_phy_usb2_vbus_regulator_get_exclusive()
> - Updated commit message
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 35 +++++++++++++++++-------
>  1 file changed, 25 insertions(+), 10 deletions(-)
>
Gentle ping.

Cheers,
Prabhakar

> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index b5ba751805aa..3481505dea2e 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -1114,8 +1114,7 @@ static void rcar_gen3_phy_usb2_vbus_disable_action(=
void *data)
>         regulator_disable(vbus);
>  }
>
> -static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct=
 rcar_gen3_chan *channel,
> -                                                                 bool en=
able)
> +static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive(struct rcar_g=
en3_chan *channel)
>  {
>         struct device *dev =3D channel->dev;
>         int ret;
> @@ -1133,17 +1132,35 @@ static int rcar_gen3_phy_usb2_vbus_regulator_get_=
exclusive_enable(struct rcar_ge
>                 return 0;
>         }
>
> -       if (enable) {
> +       ret =3D regulator_is_enabled(channel->vbus);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (!ret) {
>                 ret =3D regulator_enable(channel->vbus);
>                 if (ret)
>                         return ret;
>         }
>
> -       if (regulator_is_enabled(channel->vbus))
> -               return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_v=
bus_disable_action,
> -                                               channel->vbus);
> +       /*
> +        * An exclusive get of an enabled regulator already holds a refer=
ence, so
> +        * add a cleanup action to disable it when the device is released=
.
> +        */
> +       ret =3D devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_dis=
able_action,
> +                                      channel->vbus);
> +       if (ret)
> +               return ret;
>
> -       return 0;
> +       /*
> +        * The regulator is enabled only so that the regulator core holds=
 a
> +        * reference to it. Do not drive VBUS until the port's role is kn=
own;
> +        * rcar_gen3_enable_vbus_ctrl() switches it from then on.
> +        *
> +        * The VBUS regulator used on these SoCs implement the .enable/.d=
isable
> +        * ops, so regulator_hardware_enable() cannot fail with -EOPNOTSU=
PP here
> +        * and no special handling for it is needed.
> +        */
> +       return regulator_hardware_enable(channel->vbus, false);
>  }
>
>  static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_c=
han *channel)
> @@ -1151,7 +1168,6 @@ static int rcar_gen3_phy_usb2_vbus_regulator_regist=
er(struct rcar_gen3_chan *cha
>         struct device *dev =3D channel->dev;
>         struct regulator_config rcfg =3D { .dev =3D dev, };
>         struct regulator_dev *rdev;
> -       bool enable =3D false;
>
>         rcfg.of_node =3D of_get_available_child_by_name(dev->of_node,
>                                                       "vbus-regulator");
> @@ -1165,10 +1181,9 @@ static int rcar_gen3_phy_usb2_vbus_regulator_regis=
ter(struct rcar_gen3_chan *cha
>                                              "Failed to create vbus-regul=
ator\n");
>
>                 channel->otg_internal_reg =3D true;
> -               enable =3D true;
>         }
>
> -       return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(cha=
nnel, enable);
> +       return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive(channel);
>  }
>
>  static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
> --
> 2.56.0
>
