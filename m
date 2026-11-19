Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073640;
	b=fdkbGW94HAhK4DSp0vxkWJq2WgXK9F1R0yrxzAMIuM2kLSZOhPVha5iR1NPTk4KS69yT
	 AM53nBWZ3CPVmoII4tFEAg1C9Hx1/ktII+QIdhqkJZSUWVj2ByVHEZwbJfuP3g4uUsgyT
	 +/UEFExdxCcrz5Z/tAcQuQ0xUrYlixQiaDpejouLgdRj4SbGg514nbgWVAAdI/yy/4qC8
	 gy0x319/nuCW1kcqnOLVIj1Af/OoeGEUrwIUnTV1Jl3+xPERZguJwtSDI+cdoW+8ojRSm
	 WF7uqzg+nIo5huml0wSWv2LdvJnASMIB3c8oyksC3rGa6e14TGSLuOac7PZEzcgR8Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073640;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=48uBQbOIW5SOxGa36ux7wu9e7/2VqH2xuOnahPVaDpg=;
	b=Jn7HpsWtvHtObQ+hvTHO/zS58odykJ3R57PEaw3G4XgGyTpfeOpbnVFDg6cxMaiPUhKF
	 jRlJsWUsPa0LxyC/NHE1Dm9orLUsUKJZSp9D/qmmbWJqjkRelAI5QDam3it1G8yqrwB77
	 sX+AJ6If6Cf6tqnd4lqfR5sr7f6qesH1MAuDgSbCGB83fXEAqPJFQZqwHlDQxPAn0+8lr
	 aiV3xOfN6wCf33cJCPLVriYtlGpplefJZUKOys5NvH33pIUQ6jkzD2mU6OQNu6NR7bane
	 +Lsdhj58MAVanga1/XCRLDOyCN+RTBMD3Xq1ZCLz260vCwZPIEcRiOSBiBolvHpsgyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05A7606A324
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 07:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F05A7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eafaeb8684so646213e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2026 23:33:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073639; x=1795678439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48uBQbOIW5SOxGa36ux7wu9e7/2VqH2xuOnahPVaDpg=;
        b=pP+sRL6qE3SHuIK6/sVOcI24WNdRgU64Cpf9AIKzpJrfJqqf+7VcFZyeC7pG1qvAx8
         p3nqbYWYGM9P0oD2UTf9hK/mmtBpOL70frKMKWyeXpgfSObCRmZeL498UIC4VzTIViYq
         RpS7b2jToGIGY4tnClBn4fQlD7IJlqhrxkbS3pZHUKi7ZawdS9PuSQU6MVhNAcK/xBuv
         xausq9WTvJ34zqgEt4N/9H/t6sqGWvqF3+nvDQvZlw4HlmjM1T/x5QnbXflxJmAST6gy
         FDM+qg6ov7Sx/lJeb6wwmdjKVHAqNhteoulsG6hUkn00O/zsxoWwIS+AHs6co9fdDt/o
         RpQQ==
X-Forwarded-Encrypted: i=1; AL+hErFvthiesPhEh0IZxYYYh+bOaMe2ZzzPzQ99YAmg4IfnA3Y5wJ+JKv+/Zi7V5Y/tuqCAwF+zhJjxFDMCfcPZz1qGjw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/GJKlKh8klrLaiEbJHMqQBtaJu4zppfUo3HbYLjYB2vxO2pYXj
	iBaRUiBO5RdC6j+LX7clV6KiOmSewN0LAz6DwqBbkDy0fkZ/KaEyNEnu5sYQb02K
X-Gm-Gg: AYBFou0vPZ1w2Kv84TNhMtTFY/iEIzPyjx+fRG291LSxVRY/vobupPQjyKVbVPwMCka
	HPDnQHUQhuYljA5xpujJv9nHkt4F5rArRH+HQpohCAg8E661nLKcjg1H0g65YgHNa+/PkQs9ZqQ
	ZaJmTBFQOH0bSFyOu+ZXesmMf19tGeilBHKSfYYjlI1kRDQfSZkp1xcOoER04uuTENDNV5GfpAb
	qST4AGSVNcxsji2IkAdQ3s+3aQWZjLkHKNqaAMuswicQPs+qpQRIws728iDgY3YuMJcIS1qPWgH
	GduIWKjh45c12CVTQFwSO3s80iE68e0rHCIrllThA3Dc+HotJzEQQY6SV2vlnxrit20JWnwz9GU
	wNUwNxmmvkABPUbBgb6GDhg6qeElhw5EOrN0nklfvj3gHrOAJbvN8kttLtwGSNIsXiYd0ajT8qq
	qesmYXPxM/YZ31kDBdNvkhDXR0SjGopArzL/U6XWe6m054dNR67v6gafi/Bm8X9/MbfR0BSCtDH
	crMCniHqFT+PwuvYEiQ+nHFru43IQlrTtyIU4GZNWmmPxctqlONLsAttaWFxd6mm9Mr61j15/w5
	B5In7Q/JYi9KDvhGXi02btEb9Iy7E1dr+/0hM0DMMdgf7p3hK8iW82t0pSmSQK58rtS1GWXumDJ
	tLSxwouEjZkVtWA==
X-Received: by 2002:a05:6122:8b03:b0:5ea:c084:6f19 with SMTP id 71dfb90a1353d-5ee64c6d8e1mr2083583e0c.12.1795073638851;
        Wed, 18 Nov 2026 23:33:58 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee64e4d867sm3546077e0c.3.2026.11.18.23.33.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:33:58 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-98301b325c4so632989241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2026 23:33:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFxSWU72X06HwCjl+Ld69AxRxXCh80lSqpTwawEw3iy0Bxfc0OAV19CI4+N5C2acoKlEmxU33cnVbTC6LQS/myZ1Q==@vger.kernel.org
X-Received: by 2002:a05:6102:c50:b0:7d0:5688:f4f3 with SMTP id
 ada2fe7eead31-7d6ba190840mr1767507137.1.1795073638117; Wed, 18 Nov 2026
 23:33:58 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118214518.29317-1-ville.syrjala@linux.intel.com> <20261118214518.29317-21-ville.syrjala@linux.intel.com>
In-Reply-To: <20261118214518.29317-21-ville.syrjala@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2026 08:33:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXALVCBk5D9UqWLed6eMgOFYLv8HJNaNLvfuv9YaZ_mcA@mail.gmail.com>
X-Gm-Features: Aa3M54pJIRGM8tExrNH7BQLmQBPW2tJFU5szZzp83frb40V080lFIDwtqcIbTTc
Message-ID: <CAMuHMdXALVCBk5D9UqWLed6eMgOFYLv8HJNaNLvfuv9YaZ_mcA@mail.gmail.com>
Subject: Re: [PATCH v4 20/20] drm/rcar-du: Allow VSP and writeback build with COMPILE_TEST=y
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ville,

On Wed, 18 Nov 2026 at 22:47, Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Make DRM_RCAR_VSP selectable with COMPILE_TEST=3Dy, and enable the hidden
> DRM_RCAR_WRITEBACK option by default, so the VSP and writeback code gets
> built for greater coverage. Builds fine on x86, x86_64, arm and arm64 at
> least.

> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig

> @@ -85,5 +85,5 @@ config DRM_RCAR_VSP
>
>  config DRM_RCAR_WRITEBACK
>         bool
> -       default y if ARM64
> +       default y if ARM64 || COMPILE_TEST
>         depends on DRM_RCAR_DU

Merely enabling COMPILE_TEST should not enable extra functionality.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
