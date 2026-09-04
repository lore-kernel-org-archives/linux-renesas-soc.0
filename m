Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ABA38B7B0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 13:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530138; cv=pass; b=qIN6b4NU5NZLfl3Kxe+XP2H4qOFqFngdd4kA2igyttuVeGq/H0Zz6QOAEAFHmCPOKGi6ts4+qb2ZPUMzjhYKSH2S4X1aNJZ+wdFFe3XLTYcDiX3pS0vxLobC/roKBqnHzrfCwyS2S+NYqjzFb5G7bhGqAX6BpzaWSehKPTkEJkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530138; c=relaxed/simple;
	bh=aYGTw43PGiruYrbCRK8lrDyOCcUgVMqsAo0cR/fDfeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mfw0ljRzhjqfTFEpT+fNIpsqFJb1nAK/+fCXSRYoyUeOGnhJh/ZEOlTUheyzzzaBrrQPAPgRGgk6wdG0HtdAvf3ADnOoyY4rJmWF0saKQ5p06pDqAPWOqzDUI/YVgmo9CCMKpDQo++dYrU+A+G+GOquKw3p3fxRSnN72W6ZMCZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCxxW9q4; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCxxW9q4"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so1486655a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 06:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788530134; cv=none;
        d=google.com; s=arc-20260327;
        b=XBeizUxE1D1VtHuAK+hddd29VbKV7r+G5eQcsKEfB3D+DFwo2tDbDvrc/S6QtCj1D/
         PSPAcGgjwsEz+J8RiB3RymCWlEgIBgysdrq6LvCBj/9C6TXENdcGvZsUzRWf3m2Ab6KY
         x6kpsbcoVhnC7tMFLaorKgKhIKmuA24WtGmsh6FwnOYchq5ng6mgXsobEystxeBblhDg
         Yll38FcYG5r8So5r8uRNYdi0rvSsAAp0iiBcOKlv0F6xst1OFb3zJfzsETDZyPn+PgSi
         ANQAvf4bIsvS+J5EGKGlPlb8DAOdWz0Qifl66f2ExWY9ZVBfbtRliN+JnJ8GR4An60r2
         Tjdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=;
        fh=DemAHcAa2mXCf48ikak20/bBu4ZuvKq0ExY7vSy+fNI=;
        b=gBiTKUGr+H+S8RyWmTBHhgO8uEYt7lX1vQZxqdubnd5GR9OC8rNxpMUHI+FCRidEUS
         YFtKwO7B1kzClCCuLnNIQbDgyUNF9rZsEaUYsa97x86TulnspScIgb52FIiLxWQ04n7b
         TY9klkObkg/95bIHvl2Bq/2WOqop0JRlE77uMOyCD1vDhjJdm7kckaCimTZExXmL7au+
         qmXUYbUPHPpfdvIocVxKvgIRd90PZdkmOrjGVIZQr8vD3DHsHQt9GZkiS3Z3vcI/ZDtj
         KMdmoceqEl83yi/HDf9yr7nqX7IQeU3GrVuNMu8LaChiYNOb9Xz1ejo0xgrFp3dvTtvE
         tvjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788530134; x=1789134934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=;
        b=kCxxW9q41x6acDRBBZDVjfyTyqKRt/evee3/RMJ64zlf6SHrFgHtykPwYzwvAi3wVJ
         ZRIv7vOTkQh2Lr2n+smSk6EZDeGERL2XnUVdkdmbijX3sIq8nHQIT4bwdKQG9VlBvxBC
         8naCTVcUFcfSQHMrBLpJQGzu74JQ2aIQws7AXtvIxc14zHervNOo4KbpAp1FFOqd1BDh
         8sOIjGi6BVaoHydFmTO+nYefEIeAAEsXLvyc/0L2/jipTutRInYXfOINnr0YZQVJnXHl
         C2LFuM/tqHwSMwJQDQ8c+FIBz7PMpJ9MUu/9P80i1Y2oORNVkVuubgrLsPndLlRYakJI
         4DdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530134; x=1789134934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=;
        b=MXKd/eS/TcEPLhdYrGlNJjTLC1XKG5BvQudMzF/w7k6/65M1K30MlGWiJsXa816ZWa
         Xyo5sdR5r1gbKXg0QPiw8hChLrdkMfbj1z2yOK5l0QqDozf+Yj1yJoV51IPimjielREb
         /q1kvEXUKxhPbgJJ7ZaCoq0PpxWpCkSrOpkQ5fIZfERxSHSlwB8Bm6fomnblFJaVF6D/
         d0jCcgbD/EiE2/X5eYNIJ6iaxuH9AMyHDxD+0sl/JWvKYtMW7/livobYT6Ac8Vnj6D4U
         9kcpYxrAHUGnrjP4geB1dUx23bi+zM2Di+DxVWQ7IUCvHseiBIievI8ZN3o3TO5gtXK/
         e4Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxHsef55Ros+2+B10bNnery+C71p4Dobx7fojmkD8KteWthKnp7KhiEgFjBRI6CnQGNPf7v81R7u/+DVdAC1ltmQw==@vger.kernel.org
X-Gm-Message-State: AFuF++k6B+px1yufwM5O2ot3pItYHYW8cr4NEhif2jn+qtX1W6KCvJnD
	DKbjJMQml3Jk6ZG1T16ZU0ZIpW7NVHgwoQqIMsi0bQq9KF0XvdveWl0biXerJ4oNE27HHEYuOYf
	gD4KfZvBnMK9ZjtASZGLd0LL5wRFIx7Q=
X-Gm-Gg: AYBFou0W3b8Z3UwVfPqFGDJFXFUMe85WmC+wVYJUu0xwzFGdOd4ZWxLgRaqO23GdWUt
	metnvQmMdiFkaIPa+LbET4YDGRwne9GFPLy5OHAsZyBVW5gK0IzIK1jeqtkoF7KOcNnvMRGxc+p
	E90Cri4LnFe+SYql4gILk2XhfADrXFdDwEjqXeFXcZChadpqHQCpEIcUOK3i0VH3cFNPuT42rz2
	fyQP3/9skW0WXYjYnlGteNxvBaPtHJV93npmOuDLOhAHwAK6hspoGBcTKmwCKxQe0aRMLbxLU0f
	s3TpgREIi37s8D8uQMGWf/NKH4Oz95s32yYqlGRU5Wd2hNzD3ygao47vahBR
X-Received: by 2002:a17:907:720f:b0:c25:5d2:acf0 with SMTP id
 a640c23a62f3a-c260c8c21d3mr311924666b.8.1788530134042; Fri, 04 Sep 2026
 06:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-21-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-21-s-vadapalli@ti.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 4 Sep 2026 10:55:19 -0300
X-Gm-Features: AcwNN1WkMLBcSKjjx-549nVRZ1ZETkJHm5sDyQYa7o61EdbIDExabOintEMeFfo
Message-ID: <CAJq09z44PfcEKsoH9eP+c5rxmzQ52hQO33k8sO-e6po1bpE6rQ@mail.gmail.com>
Subject: Re: [PATCH net-next 20/33] net: dsa: realtek: rtl8365mb: Remove comma
 after sentinel-entry in match-table
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: dario.binacchi@amarulasolutions.com, mkl@pengutronix.de, 
	mailhol@kernel.org, msp@baylibre.com, florian.fainelli@broadcom.com, 
	jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	kurt@linutronix.de, hauke@hauke-m.de, chester.a.unal@arinc9.com, 
	daniel@makrotopia.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, 
	linusw@kernel.org, alvin.sipraga@analog.com, clement.leger@bootlin.com, 
	justin.chen@broadcom.com, dlan@kernel.org, rogerq@kernel.org, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, rjui@broadcom.com, 
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	opendmb@gmail.com, andrei.botila@oss.nxp.com, wangruikang@iscas.ac.cn, 
	amadeus@jmu.edu.cn, kees@kernel.org, tmshlvck@gmail.com, c-vankar@ti.com, 
	horms@kernel.org, vadim.fedorenko@linux.dev, daniel.zahka@gmail.com, 
	nora.schiffer@ew.tq-group.com, v-singh1@ti.com, oss@vassilevski.com, 
	haokexin@gmail.com, alex@sverdlin.org, aleksandr.loktionov@intel.com, 
	lgs201920130244@gmail.com, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 4 de set. de 2026 =C3=A0s 01:39, Siddharth Vadapalli
<s-vadapalli@ti.com> escreveu:
>
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  drivers/net/dsa/realtek/rtl8365mb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/r=
ealtek/rtl8365mb_main.c
> index 4c305756116c..f8220d832e46 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
> @@ -3352,7 +3352,7 @@ const struct realtek_variant rtl8365mb_variant =3D =
{
>
>  static const struct of_device_id rtl8365mb_of_match[] =3D {
>         { .compatible =3D "realtek,rtl8365mb", .data =3D &rtl8365mb_varia=
nt, },
> -       { /* sentinel */ },
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, rtl8365mb_of_match);
>
> --
> 2.51.1
>

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
