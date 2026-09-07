Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A52A46C4BE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Sep 2026 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809210; cv=pass; b=ZkTEmXk5GkJHSe+7OkQy2eQk6eLRO4TVkOmjsql/CX5h1DW+oUq72EvSnUavhsb0t5xv1DbpJFTWTbZvTMDg8kjRODfE0lIWI4/9yFzFdAUYolYY2/NCwaI9tlF2K0SIuyOtkXvBci1gd+ArdqgDw57jOwOnMoyK6Q41/6TJbBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809210; c=relaxed/simple;
	bh=DmILtzqZDzEUGV1I4V8TMYjsJF/IY1peGYXwFN9ey4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ug0APCMxouG3Q0/5ES2qIVdPV0O0HV18h06QLjkmJNQy5RkNht9iuedOi+qE9+PGyzGkrt9duk0pMdJ/gJTfLh55RT+AhzlfbuyQtXc6Ppdibswbj0/HUvJnhlk6jlNIAZTCddn5s6W4WY9pQuAe7guomnK2ov/OdOS1eRjOnhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fq18f210; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fq18f210"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-485888b3c3dso3984855f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Sep 2026 12:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788809205; cv=none;
        d=google.com; s=arc-20260327;
        b=rmEyIkStDxIGFYaHypJiNitaUN5+ES8rRxtFHcaIv+odUktj3DzspzTNkxJ4h83wXr
         WK+FzvDEHSp8JNioexxU56mj8+wY6I3yzbvsTOrsQJgcEf2XHB7cE3LQgjl/7WIbHM5N
         6ND2UAhDgyNxxk//DJFQcF5TSyneUBaDYjY2GXdqjQUjTBWVX+gXMPCe4jUTa/0/SmeK
         F4YuS/oHs/F/2opF8DGMy0Egn88meMX+rBJsOgDH14wQye1IZXKso5cxFkVOKUB58Oj5
         zyNGO+ItdjIHvmmiMrjsJAF7P0HqO+5f5OP2c3XH91GzuNvLBcAJT/RuBWT7w4XIWmpd
         MBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kBhKUAdBctYk4OBLe+242bptFLWaOmD7/1s701If7kU=;
        fh=xvX3oQHNfwQaBj8rXPXx4ROlNI/av05kIYjJteyxw7o=;
        b=JhxRpt2rXBNdVB1oir99R4BjFO4eZywV++andtcyiiFYUl/Uf7wqxES2m/GvTFeTZf
         f3kAksAnrxZsH5R35kjQGSL5FRsVZmKp+uAElaWUA1aOu1NzZJjJIrfrgvcnYM68BwFh
         2I5d+6bs3NX8SRqu6/OT+SJ2Y2fkPSoZc8+n9S6s1AxsP1fxxq7/bJSwguj1Kg1US4CZ
         a1pWaBl1IF6E0Rzf4fbLOqNBj6CMt1e6SQpM6ZZTqGyMCNUt5PNURBkiMzO4GKM7Xe1q
         iife3QS9JmS3ZvKSWg03kws5KJzxaUkqwK68SUa1SHt7dm62T+yxV1v8h5hhEq2J+8oe
         vbiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788809205; x=1789414005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kBhKUAdBctYk4OBLe+242bptFLWaOmD7/1s701If7kU=;
        b=fq18f210MM3m80kQ2Uea52OvkX+yulhV+P5OEhS7K4mi8w7ZGBtOLUMGkLknSrA5os
         eJT1JBZ4bGLPhzuoZGRcOmWuYczYzVUfTo8hD2vqbjcJOSiCZJO6BV6q2dI0hUE/xBjA
         QvZMqncGlOfVhpoF0SwiUdarZeRwvjoCZKKhs0PgjZx8dV/3dfOymoHUmtDb8YC6ucAv
         VJiEZR0G7gWK89vgBZTkAMhcB8xCVyLC0iqc7tHNs4VNUGCnwDn6Ybus4tRAJ5QHVsgO
         S11Pf9zpRxtM1k5y9AQQMwUvAGIxX67xQF2OmwpOwzVMtPRUZ/rp160LEIiXdtL0Ylqr
         xLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788809205; x=1789414005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBhKUAdBctYk4OBLe+242bptFLWaOmD7/1s701If7kU=;
        b=Udzu1aNWEfwSzogS+pqdtbTSciTJr8DDKehI2dEA/T2vQ6FSWc3IgzcAk1NPmyBU9d
         Z3zL0VPa1kd5EZFUXSi8lB7JEJrGDI180wrARdAddLl9/F3Wp8ksuX2UvZRtS/LIuHXC
         62pLnZe2f1UZlzNpZg0gGirQahoADGFzR4bO08jYgIaKzHlqfK6NZsMe4Ew6Y0+eyRN7
         liUtOlR5bVYjEMQp5iECcB0peK5PEd6MP8OVSccHVU9q2NHr40EEkvrbeJQ2Libj7wUS
         8bamqMiDvMzhy34DTA5AyPWwyQU4ZdgjptbmTdIRWsdIjbvqibMpIYoRgpzE/MbvjQsM
         K1ag==
X-Forwarded-Encrypted: i=1; AKwUvBwcpPpS3dEj17ytb0g1lZcEUh/sXJKAnDpJY4y6cOdm2gjiunCVopGBu7mDIRN22eMZqYP947NWMCzQwuprNXiTzQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kovZGfPGGZOeMIk7PG3Tj4pHNnN6fkjzwQtiePsGKwAfBpA6s4
	S0WCOQxsDliwuHPoVkWbY2pquKi9WvhkXbNgpP/zcwwvMhohTAmnR/9/mGBX/0WQ7z8U5hK69JZ
	vjC90JsGkxCLkw0WJ0YBgJzGoMA82Euo=
X-Gm-Gg: AYBFou2gcdXY4ZaQeZfqtF1rw24UWPP/YE/ngDNyFnS9RRswfUeWN6KX1dSK63f7eBF
	Wlk5sBotd+78cTHmdHKoCzNabnjTwcac6H8XTsCLRO1C/2A3QMZ5ksCOyBwtJQoezVp4x/HPiVy
	41pEWWkbDSFz1GWjA9n3it1tNaGZGmMm8LRp1mNPZq3hVKkVhDxVvbEjLdT9TrZG65XMIb/q+x9
	awLBw99X3l1NCEGcuiUnfodNp3T2/5eInLXRo5q8atd9Ex6hQkLgloi5TukQL/MbdHh+mKn+yD3
	hw0OEsjN0yh/uco5nH0yiqx7tWPcLUMvMqVlDjlOMzzf7NfUSEu5DErS8KWwbnG+FTqIhUOIw9q
	62ZDLxYT+gde2CDcZphBerphBTeqOhqIX
X-Received: by 2002:a05:6000:704:b0:485:8c16:5eea with SMTP id
 ffacd0b85a97d-4858c166202mr24838505f8f.36.1788809205349; Mon, 07 Sep 2026
 12:26:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzn1-miic-fix-array-v3-0-3f7dccffaf5a@reliablecontrols.com>
 <20260902-rzn1-miic-fix-array-v3-1-3f7dccffaf5a@reliablecontrols.com>
In-Reply-To: <20260902-rzn1-miic-fix-array-v3-1-3f7dccffaf5a@reliablecontrols.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Sep 2026 20:26:19 +0100
X-Gm-Features: AcwNN1VUA3S6ZAAGYKSTEqV8ikrWj4M6EW9VSx8IWuQuy8lbnm_o-FkNlvIGfjI
Message-ID: <CA+V-a8tqFCB=c0_74=pdOT1ujz6w+SUVLmNVy98qyzd5FrusiA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] net: pcs: rzn1-miic: Fix config array initialization
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 7:55=E2=80=AFPM Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
>
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> Fix memset parameters to initialize the entire DT value array
>
> Fixes: f39e968dc168a7bd ("net: pcs: rzn1-miic: Move configuration data to=
 SoC-specific struct")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index 2b72fa98ddf1..c50b65d064fa 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -683,7 +683,7 @@ static int miic_parse_dt(struct miic *miic, u32 *mode=
_cfg)
>         if (!dt_val)
>                 return -ENOMEM;
>
> -       memset(dt_val, MIIC_MODCTRL_CONF_NONE, sizeof(*dt_val));
> +       memset(dt_val, MIIC_MODCTRL_CONF_NONE, sizeof(*dt_val) * miic->of=
_data->conf_conv_count);
>
>         if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf)=
 =3D=3D 0)
>                 dt_val[0] =3D conf;
>
> --
> 2.43.0
>
>
>
