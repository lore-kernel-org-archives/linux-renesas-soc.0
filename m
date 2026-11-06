Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793935347;
	b=DO7R7mAx++tP4BElGs1+uO3mthp0DUgsubAqRMxD8pthBIHZPF5iqKRucgH5IPeS1kQx
	 sDgWWJN//t8YwA5of7wwt/kDKfpp3tOPHc7bEiqqs/RxIZZbfLY/szsW1fcNcdaU4u/gh
	 ikUk+4E28TN04e5W9uF9zY3Wf37kLcYOy52DCHX4qu1jUw7LUzUoY2i1RS70nhRdCJG6n
	 DHk1l++CoTrYXcwbFchsbyKl/KCr7VGTVbLH+zIiKOCgrIuhPFK3ZUuwuCrYDTs4Oxyk3
	 CPba9NeWNp0sJiGsWx/ceMOnJUJbfjEP9NTQf2yfhEYww2X5Gk7xsPPy7DWFpc2MV7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793935347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
	b=KqwobDOlO2xll2tM5dOcIVtPIaaLlc4ivNOdHfK7Sm2yneIMDbM9NL36dFUW6jbWyste
	 39dcfVPX201pAF8srA4vl5GglttZRyTRrQl96Y882/ycikfCq54JHsD+p6v2irHzFtHGk
	 CUbmo81wmfWJU0C+RYnrV/HBkA5hHyJ+CwmU9R5ZlCmC8mtRGb2Vupq52MoreAZypX+DP
	 R1lDfkSo3NxLI4izUxQF+giUTbLXShxlk0S/NY/2E+g6wfakaYok3QIZVFKzldCOJ0WAx
	 1KHzpprnknE9afZ8FipnsoU8C9zXbUPyoxMDfVwIn46pGQN+KrvwQj8TFoAp+dsBEQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItRx1OjO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EA8606A32C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Nov 2026 03:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9EA8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItRx1OjO
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so121821a91.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Nov 2026 19:22:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793935346; cv=none;
        d=google.com; s=arc-20260327;
        b=ElIsmNDmqu/xNv1DlR00PqAZ9C46RDj+IluKtjZAln/q+pyYvn09FkKKTk2KM0pSxA
         keEb/SQX6nela/9uCsrL8ETTUPClAonJnVqcgDy3y84J+OtAWG2zuL0zkDeT8i2WSRlf
         8PaNw5Cil+w5LA16rDfsWYFSuwTNZBaCS5HLqJwryITAtJwLQRfZH/syfdq3221HPxpM
         VUolUDTnNpY2eSV+gFF9H1oEWCVeRrxsh7n8MM9qJPgJ4++i5wY+MOTaAe0qEPDJfyf9
         D+ZSHNoTx+e7Wd+5M5c2gLO7mXw/1ysEEmWpZ+4SemG55KKHU0S8INRzatsxPoFPHVNt
         xoHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
        fh=OmIF1issvd3rHxA/kO008Azpm4bas1G25K0bLuFWEL8=;
        b=jKPsFCCjBqZlv/7Vri+Mr62SRjFakEoNHGAg58ADXt57KwIV08BSg2TcOwoIQl18qm
         XLsoVsf2VktLdVYLelrdjrWLrMbAqY+K0bMBR9LOKhXxopRRftKcxnjf7Ps7qQ3gWn6o
         dR7hpxbdia6cNTQojO6gkTE943PvJ+OjLnhkfFyKIs3Z6eHs9EdEl7VoqymCisjk6tKM
         XIXY1q01JuyR6S+z8IEILrAemUMXF7e9ko5ZwjvmGehAdRwarIOS0vTp+seJ6H/taJne
         SvwOv0/170D2HO6h2mRGog0K7if8F18qv9QZghH5oQiQowN2XMTFdjgD0gGBhh5zbiR/
         l35g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793935346; x=1794540146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
        b=ItRx1OjO5a1X44Iy7oo4XW8ssPwFufOtqbhIHs2am8aILhL7zKI92TPb8iOw6SxnPo
         yzUSINQd60f/+uVQus2eX4+bUjUu6bofU9KvJpfsurOlxmVu8au5LHaHqSot2OjTGLyA
         FisTbK0zIAK1+dUzMtez2Jp6vr9S43rWeiO24vE0aQcZtDUZoKqD3C/YSX+6uNdxIIDa
         gZ0ankMf/MaHSmy4xLV3XRiC/QdZ6zXNwlmZx4jqHVb8WGa9cWgMizYd3R+uCWnGUtcP
         OGgCh/sk388QOwHAhQVkqlxhsFcYl6Fd7a56LLn0NQy4fXsQ8LLE2Leh0Yk8xC7B6YYV
         FeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793935346; x=1794540146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
        b=L5xqkwsc1Rutsv1lJ1sEP4dikZbYeWmbq2IzZ4SyxfYqXh8ySViyLa1o/MqRzq0h9e
         eWNUgLJiYKgiU94s3vIP8Fndc1T0Llu6VpxGge8xY1v31SPoFmfqtvy5xcuhQEZQ5IuX
         usYL2qqOS9SfmcNPMYmTpV0mrN3aPS/BsNmlBASnmU61KSTKaJlze3RBY36YZa9S1F58
         p9io2EYVYH0F4XHVzPDSa15h6widXX6uvqG5jQnVWTJvRxJevj3lWtZZ4D7YIcTsbmkR
         gfoy8M/P4WK1xQby7xNf4WhKi6gWshiBAAsuTnVONfUVa16MAdQR8MfntOnTL4tnl6ek
         HNWA==
X-Forwarded-Encrypted: i=1; AL+hErFlHa4/ZmxAjRH33dXDklHLpjdAW2FW7Ho6at+UVVXAHstxJ0RUKzg1PeTwIUt/IDQmZzH4XfrexxiqNfCf9hcsMg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+myHTKSxvYh1gevGn4R2GTtK1SR1YUC7fh+mezRBLaP+VQb4l3
	6n222U2xHym+hjLE3iVLT8EkcZ4NuYQ2ka/yXnvxcvsyIq85KE/p+36MMR9/ri2zWp3jswEbwiG
	ydXE8bqq6vuK8jneP6KcAy7b074Uz07BTNp1+
X-Gm-Gg: AYBFou1WeyU8XpZCI9jUS4SzUsMRm0hq0ucuKSA6l1GpZylPQTqtWgzy834sSf6KUDE
	sVW6/HT7Anadd/OTiUVtIE5ZQ2I6CpTz2eXBLpBAbln2+ovr5l+/DCTVDB36MNR1mKle1ryNm9/
	NIubiWUISx46LVgcSZyOTNUdSKwVz0y79bhNxA2B7j5OaxifPhG+AyzW8GVsQnK0VnR7k4aUw4L
	jP3xpBh1rFyk6dE/dykgh5P5oJvKosbNqxPlm7Z0n/GsPO2dIorPnLPSV+MBLefI/+V0yGrXdh6
	I7scofijuOewvRS+lqlZKxPhROZ7FfP7bfV6O5iLsTxeHfqFKWf+5EzgAT53XeBIrqZiFujRdK4
	N+60RDsTlZwr2/Dz7ZURqAhN6Y+XZRQZckz+Q
X-Received: by 2002:a17:90b:4983:b0:3ac:9d26:551d with SMTP id
 98e67ed59e1d1-3b0db6f11f7mr1320600a91.50.1793935346215; Thu, 05 Nov 2026
 19:22:26 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102180915.3981805-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102180915.3981805-1-Frank.Li@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 6 Nov 2026 11:21:57 +0800
X-Gm-Features: AclHuK-h3hDpTZTCQrDXlURnXU4dNiye78ZL33OWRSh0a0w-nnzOWFYn2sw0Q-0
Message-ID: <CAA+D8ANwEqFJYQ39h+1A3zXhcUfpFGzSvVjEzx2htoYxB4sLGg@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC/sound: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Kexin Sun <kexinsun@smail.nju.edu.cn>, 
	Frank Li <Frank.Li@nxp.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Tianchu Chen <flynnnchen@tencent.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	bui duc phuc <phucduc.bui@gmail.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	"open list:SOUND" <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:RENESAS R-CAR & FSI AUDIO (ASoC) DRIVERS" <linux-renesas-soc@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, imx@lists.linux.dev, 
	vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 2:09=E2=80=AFAM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across sound drivers.
>
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

For fsl part
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/core/pcm_dmaengine.c         | 3 +--
>  sound/soc/fsl/fsl_asrc_dma.c       | 3 +--
>  sound/soc/fsl/fsl_asrc_m2m.c       | 3 +--
>  sound/soc/renesas/fsi.c            | 3 +--
>  sound/soc/renesas/siu_pcm.c        | 6 ++----
>  sound/soc/sprd/sprd-pcm-compress.c | 5 +++--
>  sound/soc/sprd/sprd-pcm-dma.c      | 5 +++--
>  sound/soc/stm/stm32_spdifrx.c      | 3 +--
>  8 files changed, 13 insertions(+), 18 deletions(-)
>
> diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> index 1306b04be171a..41feb5312ffec 100644
> --- a/sound/core/pcm_dmaengine.c
> +++ b/sound/core/pcm_dmaengine.c
> @@ -169,8 +169,7 @@ static int dmaengine_pcm_prepare_and_submit(struct sn=
d_pcm_substream *substream)
>         if (!desc)
>                 return -ENOMEM;
>
> -       desc->callback =3D dmaengine_pcm_dma_complete;
> -       desc->callback_param =3D substream;
> +       dmaengine_desc_set_callback(desc, dmaengine_pcm_dma_complete, NUL=
L, substream);
>         prtd->cookie =3D dmaengine_submit(desc);
>
>         return 0;
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index b417de6abebe4..cd3bf6340b650 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -76,8 +76,7 @@ static int fsl_asrc_dma_prepare_and_submit(struct snd_p=
cm_substream *substream,
>                 return -ENOMEM;
>         }
>
> -       pair->desc[!dir]->callback =3D fsl_asrc_dma_complete;
> -       pair->desc[!dir]->callback_param =3D substream;
> +       dmaengine_desc_set_callback(pair->desc[!dir], fsl_asrc_dma_comple=
te, NULL, substream);
>
>         dmaengine_submit(pair->desc[!dir]);
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index 58101ce07c9f9..c6970a7e88f3f 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -176,8 +176,7 @@ static int asrc_dmaconfig(struct fsl_asrc_pair *pair,
>                 return -EINVAL;
>         }
>
> -       pair->desc[dir]->callback =3D ASRC_xPUT_DMA_CALLBACK(dir);
> -       pair->desc[dir]->callback_param =3D pair;
> +       dmaengine_desc_set_callback(pair->desc[dir], ASRC_xPUT_DMA_CALLBA=
CK(dir), NULL, pair);
>
>         return 0;
>  }
> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 74e2ea002fbb1..fa21cf47befff 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1375,8 +1375,7 @@ static int fsi_dma_transfer(struct fsi_priv *fsi, s=
truct fsi_stream *io)
>                 goto fsi_dma_transfer_err;
>         }
>
> -       desc->callback          =3D fsi_dma_complete;
> -       desc->callback_param    =3D io;
> +       dmaengine_desc_set_callback(desc, fsi_dma_complete, NULL, io);
>
>         if (dmaengine_submit(desc) < 0) {
>                 dev_err(dai->dev, "tx_submit() fail\n");
> diff --git a/sound/soc/renesas/siu_pcm.c b/sound/soc/renesas/siu_pcm.c
> index fd5b20b469a4a..7208514e16a43 100644
> --- a/sound/soc/renesas/siu_pcm.c
> +++ b/sound/soc/renesas/siu_pcm.c
> @@ -125,8 +125,7 @@ static int siu_pcm_wr_set(struct siu_port *port_info,
>                 return -ENOMEM;
>         }
>
> -       desc->callback =3D siu_dma_tx_complete;
> -       desc->callback_param =3D siu_stream;
> +       dmaengine_desc_set_callback(desc, siu_dma_tx_complete, NULL, siu_=
stream);
>         cookie =3D dmaengine_submit(desc);
>         if (cookie < 0) {
>                 dev_err(dev, "Failed to submit a dma transfer\n");
> @@ -175,8 +174,7 @@ static int siu_pcm_rd_set(struct siu_port *port_info,
>                 return -ENOMEM;
>         }
>
> -       desc->callback =3D siu_dma_tx_complete;
> -       desc->callback_param =3D siu_stream;
> +       dmaengine_desc_set_callback(desc, siu_dma_tx_complete, NULL, siu_=
stream);
>         cookie =3D dmaengine_submit(desc);
>         if (cookie < 0) {
>                 dev_err(dev, "Failed to submit dma descriptor\n");
> diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm=
-compress.c
> index f790b959cd4e4..a810c9c8a0b5b 100644
> --- a/sound/soc/sprd/sprd-pcm-compress.c
> +++ b/sound/soc/sprd/sprd-pcm-compress.c
> @@ -247,8 +247,9 @@ static int sprd_platform_compr_dma_config(struct snd_=
soc_component *component,
>
>         /* Only channel 1 transfer can wake up the AP system. */
>         if (!params->no_wake_mode && channel =3D=3D 1) {
> -               dma->desc->callback =3D sprd_platform_compr_dma_complete;
> -               dma->desc->callback_param =3D cstream;
> +               dmaengine_desc_set_callback(dma->desc,
> +                                           sprd_platform_compr_dma_compl=
ete,
> +                                           NULL, cstream);
>         }
>
>         kfree(sg);
> diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.=
c
> index bbd7516f81954..968901ae4c335 100644
> --- a/sound/soc/sprd/sprd-pcm-dma.c
> +++ b/sound/soc/sprd/sprd-pcm-dma.c
> @@ -287,8 +287,9 @@ static int sprd_pcm_hw_params(struct snd_soc_componen=
t *component,
>                 }
>
>                 if (!runtime->no_period_wakeup) {
> -                       data->desc->callback =3D sprd_pcm_dma_complete;
> -                       data->desc->callback_param =3D dma_private;
> +                       dmaengine_desc_set_callback(data->desc,
> +                                                   sprd_pcm_dma_complete=
,
> +                                                   NULL, dma_private);
>                 }
>         }
>
> diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.=
c
> index 88863dbd05d9b..44467a25fb69a 100644
> --- a/sound/soc/stm/stm32_spdifrx.c
> +++ b/sound/soc/stm/stm32_spdifrx.c
> @@ -302,8 +302,7 @@ static int stm32_spdifrx_dma_ctrl_start(struct stm32_=
spdifrx_data *spdifrx)
>         if (!spdifrx->desc)
>                 return -EINVAL;
>
> -       spdifrx->desc->callback =3D stm32_spdifrx_dma_complete;
> -       spdifrx->desc->callback_param =3D spdifrx;
> +       dmaengine_desc_set_callback(spdifrx->desc, stm32_spdifrx_dma_comp=
lete, NULL, spdifrx);
>         cookie =3D dmaengine_submit(spdifrx->desc);
>         err =3D dma_submit_error(cookie);
>         if (err)
> --
> 2.43.0
>
