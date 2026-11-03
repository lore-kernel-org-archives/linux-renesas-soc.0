Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793714625;
	b=HqM4+nFGR24IjTYJ8yZ5LMcAFfA0YB8e+HhqRxyEQh8C12UC8KFGjcRzEsbS5NrIiUiM
	 7uKIDzu4REghpF575Sl6IdFNq+cut6bNe0YzIRoPIpaH1VJ2Z2yCrU0onzjzrmBGy1mUI
	 LPnhrdbR8c0PBcG5mVtP1FG3uORU0Tr/ZAMNlWEbm6A8ZhKaTPYLTS9wfmJd4YZecVtei
	 FADm7+yjOtcEhaoN76ICZe0RjBq+1mzLoCOZ/TtoWEkjT0zrWsxINDqWtWE0K4KP0dgoG
	 tEALwD+iX6/o8o48AdrGyj2u4yW7GfswDTyLA5EW0GLnllMeZrAhpJ2Zdnv5aFphlaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0mpQqPcx/wO2M/JeyOkuY7Hd6GV1/TOLmZZItrx8K9I=;
	b=NYsOIM0wtgqxeDqj5DVUhQ0YZfpjCPgtP0InQiVw2eTzdJKuHUbQagzlBBBpu4lZEwaN
	 VM4QzNA+OeQVZc/8bObW1qmKQj/tTmAE+WVnvAm4F7Q9Yyq7oF/bGeTzhGsESaBHHKYzu
	 rwfcST+04F+miBOyefXeYt0S09BjF84SxMbBYDT937GcACEtu2LMApgA+UuqLTUUrgwL4
	 Gcso+MyQqQxmTh3jJ3OPEL76XODbsaz80IHCQZkK2SJCdXFmlJ2w+c1AoI2Uhimd85Ew/
	 oagBqJy6axwrC6lRJ38Fy76SfAZIPgHyHsGanNGLeDg9D3KV7nRsY5x3OHT/8/ypykg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=re4roQiG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33EC6071BD2
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2026 14:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B33EC6071BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=re4roQiG
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso30242765e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Nov 2026 06:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793714623; cv=none;
        d=google.com; s=arc-20260327;
        b=p5iKd/1ZKu9e31xCM3E/APeRDCTIbv1gDWTQsFDjLm4/ugELG8KeslvpzjDGFzLbwG
         PXIxZ99mLEXylEWQyWFucJuFY5tn9PMRbGxkSzwcWN/t7EOOl+LoAk45fDHUEcYQypiA
         G6tT+P22Hc2UGaHoCVJDMmS2tU0Wu8QkuNr7BT7Ni9e5gMHjspQPJX/aaGVW8t9c+THh
         StsP3vmd0R1V4//vUuFpUeaPEM3ZYniMeVuya8Trg7EeT91/xxGd5LHYTn1BglRixmtO
         ucsDVJm/kh69oj8WPIyDp2IEniWdMMu57Uc+C39FQiZnWfCYOkoFwKUcG7YHEPawSB9X
         rCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0mpQqPcx/wO2M/JeyOkuY7Hd6GV1/TOLmZZItrx8K9I=;
        fh=CCJYSobYQybXC9uvJPJwDENfaRG3tNdyzLb1meAbsLI=;
        b=hFg3yNIDeohjoFzAe0S8RnTWO1EVvaeLZ3fg3fL8WI2hKd4Iy3z3qIKLwrP5v5qby5
         JBGACH6E3uM54jotyyIzlafG6FnxKMPSWWnVCt2GTxp1ved1xYGT6SIzjwZYodHlj9ty
         siPzSbOAiNvLDlQ24g6x1440LcZHPG+4UYKaY9V6ibVXAuQwPgRlv718/uBrL5jHOysJ
         08URyjuCnxj8TAV91ndlPzdTUcxhQ0Jf6f7M37mvkHKxVVH9Oq2+omHeulF2bDWUptBo
         YO1KQ+hzXZUkmtCPBVTgM8y+PgE/BvFBK66JZ9itAxYN1cvhRz+ppADlS5h36sFDfNI+
         1FMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793714623; x=1794319423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0mpQqPcx/wO2M/JeyOkuY7Hd6GV1/TOLmZZItrx8K9I=;
        b=re4roQiGcIOZUOxeSIUk13f6hFgq35N2BFn/TGdsSeJqrLYI9Z4m2veFBynY5CqJAZ
         zjHkmGHKXBI0giMk+YB11PczLQpOwakV4NnHnKwLIpk/VvtpzZRplMw5A+j0rPZo2M6K
         BiobOwVXJNUGgeyJhxYvRYVf8Rnpz0nYDP8z66R/UoKfL+QdA+eFKUW/WrGMQjfwrjhR
         utsU5IbH78qri9akiLmCdD0lcd2pSloJ5JvM5+PfnI7Hk9vzGDK/WrNOkvIbGzUVoSHB
         cOvIWCZ4RPp/wHS8o7W95EO7UgkTzMEG0uouNQni523u0Bh6eIXD/VfgC3+2oZUshjZh
         S8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714623; x=1794319423;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mpQqPcx/wO2M/JeyOkuY7Hd6GV1/TOLmZZItrx8K9I=;
        b=Y7ekfhjW6oS5hkfOV4E+TlqOjs4uMoVVSyi4Az02I8Wpq7WwvDQqeB5rSN0b05HulL
         vGQ+UQCc1Rd7HswBPxb2jdiRHDTh9PCpsK+a7D8+Td9wA6XFiaLMygEqSH6j5NaKAmR5
         hQ280O+QlmLdr6xYdudfU0STT1MFg24pabE8c7ASjIGcgh1dRlsw4/lw4OwDt2azGmhD
         qdRiqBt1dyRrHsMCTLfb3334aDdEY4Fekgz+mMjNtidYluBE0AFgqBI2O/Bzg73ZN7lF
         cbhakup6QKtQyXuDvj4LXWCRNoS/EHGFUvMETsANpEyfxX8lvuspZDX0V//OIKO7S0yb
         csUQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7zM1caeBr2Z6Han6PfKOpoguurQbKwb6Z/s8SehWbx0bbk/ez2NDkJNGoCNvkmM8LwZ3khe67ZyE+eMqcH6fV0A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/jmSbMubc/0z47+WG4JK7Lc36JX3IxtpN4kn5ZDWElJ/yOWcEp
	nyb+6KG7XZkOPm6X2VCs5Fbt4es8burFuAMBv92lS52d1++pjzOVv/90caMRm9wSU+vku3W9Huw
	QUX2wMupcliS+GI/KQT5FTG/de9skqaM=
X-Gm-Gg: AYBFou1D8cWbltvYraeSdYrqq8DTvh67YzP73+MXHNONFO6QVVrdR8OXJJ4KB78wZX0
	k3Kn95XNo2v/6BNBdOyyTvw4mcaa2jCZ+3zRk9kD2FgjzymZT9PeJaVldLuC+JvKNCAMcu+fo2w
	yyso+vvJ0cvxFB7hkAvULKn3CkafkBiNx1Ni4nmE8yLI+94vTLx/hICmjU5X9jkn9AI7aJdOAB0
	t/sO7l6cntrf0i8b3V3GSI/PABJX2XiMdscOC87ueVE+xK0nhc74NhdN62wVQv7/JMd/1/oyDc0
	PEgjXa7M71VpgKmStFIRFGFj31AX7yWU1vArGSw2y9TmQp9jLs2fc6k0gkY0suPu6nSiwZLwQe2
	yaih7IKTBXYLerXLP6ikM6lkT3VMynqvruoUyJScuL2mSoaYJAs2M8S3h9nbZz6TKLyt+N0zd0a
	cgtm5OQz/lReK4V/qoG68UW9LqGF7cxibB8aGj5rjRcNyI/f+UQNUieCL6
X-Received: by 2002:a05:600c:848c:b0:4a1:efd3:9862 with SMTP id
 5b1f17b1804b1-4ac1765d977mr282488195e9.21.1793714622717; Tue, 03 Nov 2026
 06:03:42 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102170911.3867389-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102170911.3867389-1-Frank.Li@oss.nxp.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 3 Nov 2026 14:03:15 +0000
X-Gm-Features: AclHuK9lTBNUFEhnmVUe-0bw9b56qg4kVZy5zFZ6xKayAE9tcP58fndIr_XiG0M
Message-ID: <CA+V-a8t0bf_8hc1vd7c+OXBQfgBjp6EJjDALm8+myVYRNzy-Xw@mail.gmail.com>
Subject: Re: [PATCH 1/1] iio: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Eugen Hristev <ehristev@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Stepan Ionichev <sozdayvek@gmail.com>, 
	Felix Gu <ustc.gu@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Shuvam Pandey <shuvampandey1@gmail.com>, Piyush Patle <piyushpatle228@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Cheick Traore <cheick.traore-ext@st.com>, 
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Shi Hao <i.shihao.999@gmail.com>, 
	Kees Cook <kees+treewide@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	"open list:MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER" <linux-iio@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:RENESAS RZ/T2H / RZ/N2H A/D DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:55=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/iio/adc/at91-sama5d2_adc.c                 | 3 +--
>  drivers/iio/adc/nxp-sar-adc.c                      | 3 +--
>  drivers/iio/adc/rzt2h_adc.c                        | 3 +--
For the T2H changes,

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>  drivers/iio/adc/stm32-adc.c                        | 3 +--
>  drivers/iio/adc/stm32-dfsdm-adc.c                  | 3 +--
>  drivers/iio/adc/ti_am335x_adc.c                    | 3 +--
>  drivers/iio/buffer/industrialio-buffer-dmaengine.c | 3 +--
>  7 files changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sa=
ma5d2_adc.c
> index 78081cbfde5e8..d479c9bc9b3e8 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -1240,8 +1240,7 @@ static int at91_adc_dma_start(struct iio_dev *indio=
_dev)
>                 return -EBUSY;
>         }
>
> -       desc->callback =3D at91_dma_buffer_done;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, at91_dma_buffer_done, NULL, ind=
io_dev);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/iio/adc/nxp-sar-adc.c b/drivers/iio/adc/nxp-sar-adc.=
c
> index 2f716a2f97b80..82d8d921b0293 100644
> --- a/drivers/iio/adc/nxp-sar-adc.c
> +++ b/drivers/iio/adc/nxp-sar-adc.c
> @@ -696,8 +696,7 @@ static int nxp_sar_adc_start_cyclic_dma(struct iio_de=
v *indio_dev)
>         if (!desc)
>                 return -EINVAL;
>
> -       desc->callback =3D nxp_sar_adc_dma_cb;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, nxp_sar_adc_dma_cb, NULL, indio=
_dev);
>         info->cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(info->cookie);
>         if (ret) {
> diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> index 8ba7b0fde8a19..3e52b7d660dd3 100644
> --- a/drivers/iio/adc/rzt2h_adc.c
> +++ b/drivers/iio/adc/rzt2h_adc.c
> @@ -394,8 +394,7 @@ static int rzt2h_adc_start_dma(struct iio_dev *indio_=
dev)
>         if (!desc)
>                 return -EBUSY;
>
> -       desc->callback =3D rzt2h_adc_dma_callback;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, rzt2h_adc_dma_callback, NULL, i=
ndio_dev);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 600f975f1d7b5..fa2a781e37777 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -1901,8 +1901,7 @@ static int stm32_adc_dma_start(struct iio_dev *indi=
o_dev)
>         if (!desc)
>                 return -EBUSY;
>
> -       desc->callback =3D stm32_adc_dma_buffer_done;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, stm32_adc_dma_buffer_done, NULL=
, indio_dev);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-df=
sdm-adc.c
> index 674767da3ac37..f0239f5f30afe 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -1006,8 +1006,7 @@ static int stm32_dfsdm_adc_dma_start(struct iio_dev=
 *indio_dev)
>         if (!desc)
>                 return -EBUSY;
>
> -       desc->callback =3D stm32_dfsdm_dma_buffer_done;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, stm32_dfsdm_dma_buffer_done, NU=
LL, indio_dev);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/iio/adc/ti_am335x_adc.c b/drivers/iio/adc/ti_am335x_=
adc.c
> index e53c839e87ef3..230f1c990317a 100644
> --- a/drivers/iio/adc/ti_am335x_adc.c
> +++ b/drivers/iio/adc/ti_am335x_adc.c
> @@ -259,8 +259,7 @@ static int tiadc_start_dma(struct iio_dev *indio_dev)
>         if (!desc)
>                 return -EBUSY;
>
> -       desc->callback =3D tiadc_dma_rx_complete;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, tiadc_dma_rx_complete, NULL, in=
dio_dev);
>
>         dma->cookie =3D dmaengine_submit(desc);
>
> diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers=
/iio/buffer/industrialio-buffer-dmaengine.c
> index b9f8b5b3aa6b6..7ecb9d875b8e8 100644
> --- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> +++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> @@ -160,8 +160,7 @@ static int iio_dmaengine_buffer_submit_block(struct i=
io_dma_buffer_queue *queue,
>                 return -ENOMEM;
>
>         if (!block->cyclic) {
> -               desc->callback_result =3D iio_dmaengine_buffer_block_done=
;
> -               desc->callback_param =3D block;
> +               dmaengine_desc_set_callback(desc, NULL, iio_dmaengine_buf=
fer_block_done, block);
>         }
>
>         cookie =3D dmaengine_submit(desc);
> --
> 2.43.0
>
>
