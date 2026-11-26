Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795693986;
	b=OnQ2DNU/sNnBsPYoc0IoWgCDHKIdvonusiknCYeVjnztogAcmhqGwjVSNhVvVp2Diavc
	 neBadRpvMAc3bztUSxIE9cB+4jZdeXm1fFWmf2AsoQI7exjVuLbuyE4dz6zkIbVq0JFHA
	 hE6JkJKUr9zEJ60K7nFKOpJnTCM5UzFccU/k6ZmIV3GieySHBg53SR5KO++hYy/At5Vad
	 bjsLYeK7FJbhgBVWJMiYoj5RnutFvjJ5e7Oj2HH8JMCMvqqMEIzSyUUwpyx1ffE4RnXbx
	 E4R3No5GXINAHFdYDiu5A1t0eQzlfrJ5Djiq3Gd5UGMQajodYV8nOW3nYmw7ezZpiCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=H9aEGpaBgrUqyjrZLFv+rrixVdKutJ5TaTpfNSMOxho=;
	b=t0P8S00kxA9SCi+wRQtSsDtQvj+FoGg9XctRrStv26c2v4HJlefMA5SFBSm1+c/NV7Fw
	 FkUlNqvJxL5SpaDOE7RFdm7++jdNP3qpYnNOxHpvy7Fidi8BKCPOEyiqnfkid3WOV/uQ9
	 WnUPcAlUXfBk/yZJrwt/pJ8ss9feDkCt0RCDrQ1P+1i/8/O2GUm2d9vvP9cXAq/qW+1ll
	 p4Uyn1qJp71bH9Zsa54QS/j4NLIoLOpKoQfKE8S+etyFo719PhAYFOP73jXUkwWUkwNOF
	 /KK5tJkF91dHT09A/9Z3nZt4dW17usBY2JL6gnk9CRNesjRdltGJZaWWrCDCH/RgoMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S0aeFzXs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC7B606A323
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 11:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFC7B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S0aeFzXs
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dee593f18so6444821f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 03:53:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795693984; cv=none;
        d=google.com; s=arc-20260327;
        b=CWbEyDvRmThc2+uPbKkKFtaYbMwMh2T75BARa5Pr58IUEbhMoNGRuRic+pPZ1EAyrL
         4jWMCXna65330D+fyT+n11uX3u293AYPTaVmljrSeJi1WBO+YOLkMOq4ibKQVhoqYOrw
         4CBsFtlrgta4hzM4mtTV+aSZjIjPUVWT40NFvWnHEmqYRqbKClX+92sEVcJNm73gFFia
         Rd0iIuSDDqEqYGUFNzVrglWo3ProeuiNxiJiDEv4NJJajW4XYQzK4cS/Zu2qSGiUrACP
         v7O9tMTCDWKdHCUniG5PcyKrY4wAzqJ6/c9dZ7GHdJZLZrbnWb1kpR6ip+/WmWXjJA/n
         RgGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H9aEGpaBgrUqyjrZLFv+rrixVdKutJ5TaTpfNSMOxho=;
        fh=MmvZxsbbvkR4PTK3CiKwr8a8oF8hUNvvuRbfNaBStrI=;
        b=KeY2H1WlZyz4nTbwmaaSejlEXBsDqnY38jC/9YMCWM/Wx8UOwRGM16rUN7dt3NGSN1
         fzhA2/Ky+wLY7T2iKIR49RhEDVMt1gtgDI/hy0LZxBLPBTiprGZZD1kPqGZt/xHwcMD6
         xNg1Uzh8puDvY7EKVBUgzMRVwlC2sIvd3rGqiEYxVrcU1fTc7KdWNozeFpqgt8z0Qk/R
         vcBdn43g95z8sBGZtircxmWseY4hYJpG7KkBANXluPpU/T0tU7bBWMfUIouZbQMcSZAZ
         cx1GpSAUPw9N85anXQA78hxrHhbH3mleP8b7Xyggf/wdYhs+KBTgWWVS9+ZnZPgEMlu1
         zArw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693984; x=1796298784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H9aEGpaBgrUqyjrZLFv+rrixVdKutJ5TaTpfNSMOxho=;
        b=S0aeFzXs8Ydxkd9skMwIIs7vYu438WzLCdSH1AhQRK2t/3eQ/tH2INCrLxs8Ige2ym
         dTV3cW9r6JBOKuLokz/ZTzKF4wvh4/KHKWyioIo/roQe4ctBB8SLklKMOecXePLfDIbs
         ApUHSe49kqHosp9KeFS1skNO4y1Z1DUe1SvAgCMaJna0mJR43cBrFhUk2JzU2tNxGYoX
         TSyQ6m3GFNMU5Fh8vHr3ok+H1I/EzZoiZHBKeiIkYS+iTMnJ6hrBOULC6e1xzngCo+us
         Xo20s1nzuZcB5h0jY1X3ptrNvDZqzTYKZ7qh84y+6IfidobrggRjMpMFb2OPpOQkr2N+
         yWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693984; x=1796298784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9aEGpaBgrUqyjrZLFv+rrixVdKutJ5TaTpfNSMOxho=;
        b=u1tzBdlv0KCRV/yU7gxlfG3P88Qo9wWFDr0nN7ESXuwPGdFi4LNZoJznqO3iN1MN/8
         jk4MAzkHI1XKrXA6G8vcdFm/0G+vs9p44WOFDY769nxyAMnhyVDr/H+JKOoIYZy8hEQe
         4MvXciAxNm3HJxPSNA9pl/N/g15LX1ZOJH4F3qNTMQ55iYeeYCmVD76ElVacuUK4yws2
         Es+BdwUES5d8NgFqdPmXTUhpDcsSYXr+4f7SmZpZ+40GM2ClQwRdMl9ETI5mj/UceH/3
         AtLlY+gc8LBTvpCnmdRT29y5X9b9JaxVcwm96C5MIoQLM9pK+HmKfw7SplmLy3Lsx7aG
         NwcA==
X-Forwarded-Encrypted: i=1; AL+hErEEJO6FmobVJrplnq7FQWx6GyONrgwwho0fKlTHtSu/Ml0/iJSnbMv7CH8qvUelrBm36rKn14oli7LjAQbmBW9WLg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/3f2xmcmIfumTvbyHVvGfLM7920o3uXXFHy0Wj+EIRpit++Wu/
	I46BEl7uQ2xvWmENbiTfkQTBxgn+MRtpbVlzGTdusmBEyhU1dgYqb5WBcCIlD8ZIHkvDHiVEDlh
	L4IbAx6MtAFoAnyx/Cc1j6ghngC+lCtM=
X-Gm-Gg: AZFdTZcW9vovq0JaRVfmRdT4lgyyaa+j3WGBfKVwHh0Nm7rLHNqDX8aRV4/deidhdEd
	7aD8svRuWI7zT1JX5scwkXUsm6Dv9ZAwpFr5fnV7g16zG1xIumIi/0YyJ/UDaZ6pwC7NkFRuuxi
	O0MF73we1l/xdOlaCGYnd/sk6Ie0sC/lerjFqCAeStFSZoymHsdgQ4WKtLmIG7GAqlNmvA++qxF
	kEckBxGdTz8fVicTlNw23zkQxNcC+p6P7N02MbrtAU5SRZzr7YGCmOuEDGYUXt+G7lEXTqrnsC7
	dh2EhNnrtQjpYIWrMj9xEi2xsAK+cv66gZUimlmtmQCamIfkDsAz3ECQ2uFtWLZsxY8C3+mr+Hr
	HWFuxvN+o9j9ipMg3jB70O/cwdrreF0KfD2jGpFvyB3NFWu7BaOq6eZ+16HxxQma/kxK4pbrEtX
	oODh/2k3Ca41jnNRlv0MdqutPH11NZpne5YmFPPsAdzPffvt3l0zB6hZIc9zo=
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id
 ffacd0b85a97d-4abb47b2043mr29738022f8f.47.1795693983751; Thu, 26 Nov 2026
 03:53:03 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126081155.501493-1-wenst@chromium.org> <20261126081155.501493-3-wenst@chromium.org>
In-Reply-To: <20261126081155.501493-3-wenst@chromium.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 26 Nov 2026 11:52:36 +0000
X-Gm-Features: Aa3M54q70A5WmDyjKjXpU3fpfqljo9KNpnEhQvgxjBv6crELfdOj0n7b-mbXhxE
Message-ID: <CA+V-a8vgFBmQ-ih35f6GrXg-JBekovdF4jOuXcvteGkBwDEGUQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: rzt2h: depend on POWER_SEQUENCING
 instead of selecting it
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 8:12=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Commit bdfc454e8567 ("iio: adc: rzt2h: Add support for RZ/V2H(P) SoC")
> recently added usage of the power sequencing API to the rzt2h_adc
> driver, and directly selects POWER_SEQUENCING.
>
> This new Kconfig select causes a recursive dependency when combined with
> the in-flight power sequencing integration into the USB core:
>
>         error: recursive dependency detected!
>                 symbol USB depends on POWER_SEQUENCING
>                 symbol POWER_SEQUENCING is selected by RZT2H_ADC
>                 symbol RZT2H_ADC depends on IIO
>                 symbol IIO is implied by HID_MCP2221
>                 symbol HID_MCP2221 depends on USB_HID
>                 symbol USB_HID depends on USB
>
> Power sequencing is not needed for RZ/T2H and RZ/N2H, whereas RZ/V2H(P)
> and RZ/V2N do need it. But it is not a strict build time requirement
> for the driver. Change it to an optional depends on.
>
> This also requires a change to the pwrseq stub functions so that the
> pwrseq_{enable,disable}() calls in the driver still work without a
> power sequencing descriptor with POWER_SEQUENCING=3Dn.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/iio/adc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 1d6ed49041ab..7874d0e78e9e 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -1631,7 +1631,7 @@ config RZT2H_ADC
>         select IIO_ADC_HELPER
>         select IIO_BUFFER
>         select IIO_KFIFO_BUF
> -       select POWER_SEQUENCING
> +       depends on POWER_SEQUENCING if POWER_SEQUENCING
>         help
>           Say yes here to build support for the ADC found in Renesas SoCs=
:
>           - RZ/N2H
> --
> 2.56.1.839.g22a8290db9-goog
>
>
