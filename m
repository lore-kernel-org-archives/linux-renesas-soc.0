Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F59377EC3
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Aug 2026 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109309; cv=none; b=FYzOcBfIN2+q4kX9eSD5seLYBblDnpcGwzMmjXPmhQXISVzLhu2HzfgACh0r6qeZtcivCIIhi8Wb2lEhz5l2Gy7D77fdf4w0Y4Vro+kAhfgNMPqZpIaMDDLjLL0lFK9Qm3oYAoncekUXAxfbBDqjGIBI+FfclsIkcYr5IQadvqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109309; c=relaxed/simple;
	bh=iGEucwuv0cDETFySrvCtSDoMSdRLS4yfZWG/9BrZsOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5lZQkPvostSupop+fhj8KMZHT+Y2nJ1U5NJ70Y4TTFYJiaPuqNlC2a7/k4bqf4dcvWBnRCDaL247hOHRN+W2JeudRIwJzRzInqTpID2sNSY2iXImH6YtE7kS7LU2ceN/3rEEVuWWf219kNFLNYN/SKPukCxaCi0+19FMIsUilA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-527e352a167so22587241cf.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 06:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786109302; x=1786714102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihkRYHxMD45hBtXtL0ryyoy4S8BR0bYvAoTcaodyV1g=;
        b=qPm1Pd7aEJSwAszWaNCbl5ccOFpmhgNAU/ZRdkhX4gglHYWIsOzzqOZyu9N2W48RQW
         15VAcJAm6b3KmGwyEVFww4kg+i17JGWTRK7vmHu8UXLmW54oJkQ1eiSg8exsTrfCpssn
         rh+hosK4nh44n9lcVtH94B6+qu+8UvKJ33fXDeDKWLmRfNMGcB7EbTVqBpMjJb2cSv7o
         s7NGZstdR2CcwsvzJ702MuWyI3aHTUV+qjvJqaDA/VE2ByIvftFgwA5FHpnFBLkqE3AK
         /eDcR5YdTwhMtNIxrU9PAnTyC9r+i7ov5VW5y9Ydy2nunF1CWuxj7h9cqhNapYC2UqDo
         bnvA==
X-Forwarded-Encrypted: i=1; AHgh+RqCJKZIY4HJRWboBXG0jhFnQi2yAD2NBGQruGBAhGf9TMCgneZTD/nV5+93XVH6+GObj9GdkJHB+d24PNi8+L3vWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy48FfqmL+BLvKg4Qjd3l8qD5Zy4x7I0wdvwFh4rfwrt+/lP29T
	l2ZIe1DEIrkTb7X252dpuFW6ZS1Z+P/YYSmb9qOXVQgAqs2qrql05pxN+T/+Btfn
X-Gm-Gg: AR+sD12XepdqiydghsesaNvjSwQyEKwt/irqj9yiMMCSg27OCTZ9zMDjLsThoxMShoz
	Yy7pXUGfaSmWoFo20VqjnQEnMFnX7QZz5mKhvmbvdJ6k3RcewO6HZM3e+fGcxQgghPnNf9khGs5
	vJPYQpqCsOfxw1KL5JxgRsC9p2nUXlhNaACYy/0PEmtxWnElKpEsqRKzbGbRUWGaRUnzUDPtSTo
	hKNO17aissKslfdw+QHuUgiD7H7RJMRy43Efv2oYngNdcMYHu0bhEwCuSshFlsi/SmbSeP9Y5ZD
	8M3NrwlLldcynx2+Aam23sHVjt+KFO38GM4XBsVMaXbdp9W/35zeUo9ec2W1QB4SX9W0TJufeih
	0vB0AE3/3FONqmfFmocdvDCZ9ykUUTbBkwtnmp5A74ipHrFS5gbTJT3Tx1syFf/MmdK92HPt3pm
	k6zP30JgcfG6L6ZxWaHcxW2R76F1Vg9MRkAkkHUIi0KwkQnlR8kQU0gf0nXnP90zkgujvXRkKqS
	X/+UbDgK4pz4e/7Ja2fue45Fw==
X-Received: by 2002:a05:622a:4cd:b0:528:15e:d1cc with SMTP id d75a77b69052e-52ce5fc293amr207737431cf.13.1786109301685;
        Fri, 07 Aug 2026 06:28:21 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d165e9353sm11760071cf.23.2026.08.07.06.28.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 06:28:20 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9773c6ea885so959221241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 06:28:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrwnYnYy0LJ4BLOPH/e24DeZ6mMFYgTteZMhxFjXrbL7YuHmRg5bJ8+NWmpDpItTZ5t6QKxLTQQgI+UC4NUjzDZhQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4bc2:b0:738:84c:6b3 with SMTP id
 ada2fe7eead31-760e6ed510fmr5729903137.3.1786109299935; Fri, 07 Aug 2026
 06:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730113200.36456-1-biju.das.jz@bp.renesas.com> <20260730113200.36456-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260730113200.36456-11-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Aug 2026 15:28:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVd-PQBPvoof650UjXfSZqg2kGN=9kOnVUDgZvnGUOLcQ@mail.gmail.com>
X-Gm-Features: AUfX_mzIOXg0IiwN3D9gDKa8uwjJk9QQ4Yu2cWICJeqOqyAGpD8yG0bvdP7SOQ0
Message-ID: <CAMuHMdVd-PQBPvoof650UjXfSZqg2kGN=9kOnVUDgZvnGUOLcQ@mail.gmail.com>
Subject: Re: [PATCH v23 10/14] mmc: renesas_sdhi: Add RZ/G3L SDHI support
To: Biju <biju.das.au@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, 30 Jul 2026 at 13:32, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> RZ/G3L (r9a08g046) has an SDHI controller that differs from existing
> platforms in clock divider width, a second HW adjustment register,
> and an extra tuning register.
>
> Add TMIO_MMC_HWADJ to mark controllers with a second HWADJ2 register
> (offset 0x010), programmed by renesas_sdhi_set_hw_adjustment_delay()
> alongside TMPPORT2 (0x3FFF at 3.3V, 0xFF at 1.8V). Clear the new
> HWADJ4 register (0x022) at tuning start when TMIO_MMC_INTERNAL_DIVIDER
> is set.
>
> Update renesas_sdhi_set_clock() to write the clock control register
> with a 32-bit access when max_divider isn't the default, moving bits
> [9:8] of the clock value into bits [17:16] of the register =E2=80=94 need=
ed
> to drive RZ/G3L's wider 11-bit divider field via the max_divider/
> clk_div_mask support added earlier in this series.
>
> Add SDHI_VER_RZ_G3L_SDMMC (0xce10) and handle it in
> renesas_sdhi_sdbuf_width(). Add of_data_rzg3l with RZ/G3L's wider
> clk_mask, an 11-bit max_divider of 2048, a dedicated tap table, and
> the relevant flags including TMIO_MMC_INTERNAL_DIVIDER and
> TMIO_MMC_HWADJ. Wire it up via of_rzg3l_compatible (fixed_addr_mode
> quirk) and register the "renesas,sdhi-r9a08g046" compatible string.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v22->v23:
>  * Updated tmio_mmc_reset() to handle 32 bit divider register in RZ/G3L.
> v21->v22:
>  * Updated commit description.
>  * Added `clock &=3D ~GENMASK(9, 8)` to clear the divider mask bits in
>    the register value.

Thanks for the update!

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c

> @@ -253,7 +256,17 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_h=
ost *host,
>         if (clock !=3D CLK_CTL_DIV_MASK)
>                 host->mmc->actual_clock /=3D (1 << (ffs(clock) + 1));
>
> -       sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock);
> +       if (host->pdata->max_divider !=3D SDHI_MAX_DIVIDER_DEFAULT) {
> +               u64 tmp;
> +
> +               tmp =3D FIELD_GET(GENMASK(9, 8), clk);
> +               clock |=3D FIELD_PREP(GENMASK(17, 16), tmp);
> +               clock &=3D ~GENMASK(9, 8);

Add #defines for the magic bits?
We already have CLK_CTL_SCLKEN for BIT(8).

> +               sd_ctrl_write32(host, CTL_SD_CARD_CLK_CTL, clock);
> +       } else {
> +               sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock);
> +       }
> +
>         if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
>                 usleep_range(10000, 11000);
>

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
