Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956A0D50;
	Thu, 30 Nov 2023 02:59:17 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-db49aa82c89so745665276.1;
        Thu, 30 Nov 2023 02:59:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701341956; x=1701946756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5e5pButv/GNRKf0pwfcJuwzofE23cLgi792/N6uJGVc=;
        b=KfTvSujtHuvwapBq1CsAs+NsuUR0xhXwtbuvKuSuyaFi+4Ia/dVSSsDnB/3rGslC7U
         CXFg0ip1XJUji1i4pjj5lavZRNo7hh1SoMxW2nfCibt4ly9i7uWUIE3eaUpuWcKCP9TS
         rPoQFtZ+xPaeoxtXz8iEm1bLMbAccRs3pDxflO1yllxK+bSsSbY64wzirlhuCxH2YXuV
         g0a7hwmlD4n9RHgpqahf5l8pzWLMQI0AcCq3dFstmXQMdsTwij2rqZPHvlN6nusGvqkG
         88Sy0JiBUmMUGbE1B2C4ePsB+cfIJKRoiAu6EqlAIZ/3fq+0pvcVwhVeOVeAQERsoF6g
         HVFA==
X-Gm-Message-State: AOJu0YyxBfT1TAgcVL6UVYUachs9h5IMmQfG8yu8rcCBwBSXk+1Rau4d
	qnRFwQefEnj0eYEMFuQ6GtQZfpP3HkrzqQ==
X-Google-Smtp-Source: AGHT+IHR3Ch5z8xAL+LXg63IVW8V5/Hqx59ag3oRrc/vH6beKdJe+oNErxFp7SOH9SHiL4ADH4Qklw==
X-Received: by 2002:a25:d28f:0:b0:db5:44b4:ee65 with SMTP id j137-20020a25d28f000000b00db544b4ee65mr168606ybg.45.1701341956585;
        Thu, 30 Nov 2023 02:59:16 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id n71-20020a25d64a000000b00dafa5f86dc2sm179705ybg.16.2023.11.30.02.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 02:59:15 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-db538b07865so518957276.2;
        Thu, 30 Nov 2023 02:59:15 -0800 (PST)
X-Received: by 2002:a25:6f46:0:b0:da0:cb88:b890 with SMTP id
 k67-20020a256f46000000b00da0cb88b890mr20914448ybc.60.1701341955554; Thu, 30
 Nov 2023 02:59:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129143431.34459-1-liuhaoran14@163.com>
In-Reply-To: <20231129143431.34459-1-liuhaoran14@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Nov 2023 11:59:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUrd+LT3FnR255OWKQP-U2EXSpZ=7Q4k+pUZdy4es_vRQ@mail.gmail.com>
Message-ID: <CAMuHMdUrd+LT3FnR255OWKQP-U2EXSpZ=7Q4k+pUZdy4es_vRQ@mail.gmail.com>
Subject: Re: [PATCH] [soc/renesas] renesas-soc: Add error handling in renesas_soc_init
To: Haoran Liu <liuhaoran14@163.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Haoran,

Thanks for your patch!

On Wed, Nov 29, 2023 at 3:34=E2=80=AFPM Haoran Liu <liuhaoran14@163.com> wr=
ote:
> This patch enhances the renesas_soc_init function in
> drivers/soc/renesas/renesas-soc.c by adding error handling for the
> of_property_read_string call. Previously, the function did not check
> for failure cases of of_property_read_string, which could lead to
> improper behavior if the required device tree properties were missing

Which improper behavior did you encounter? All of the
soc_device_attribute fields are optional, and drivers/base/soc.c
considers that when handling the machine field (sysfs_emit() handles
NULL pointer strings fine).

> or incorrect.

FTR, "model" is a required property of the root node.

> Although the error addressed by this patch may not occur in the current
> environment, I still suggest implementing these error handling routines
> if the function is not highly time-sensitive. As the environment evolves
> or the code gets reused in different contexts, there's a possibility that
> these errors might occur. Addressing them now can prevent potential
> debugging efforts in the future, which could be quite resource-intensive.
>
> Signed-off-by: Haoran Liu <liuhaoran14@163.com>

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -487,7 +487,13 @@ static int __init renesas_soc_init(void)
>         }
>
>         np =3D of_find_node_by_path("/");
> -       of_property_read_string(np, "model", &soc_dev_attr->machine);
> +       ret =3D of_property_read_string(np, "model", &soc_dev_attr->machi=
ne);
> +       if (ret) {
> +               dev_err(dev, "Failed to read model property: %d\n", ret);

As reported by the kernel test robot:

    error: use of undeclared identifier 'dev'

Please do not submit completely untested patches.

> +               kfree(soc_dev_attr);
> +               return ret;

As the machine field is optional, there is no need for this check,
let alone to make this a fatal error condition.

> +       }
> +
>         of_node_put(np);
>
>         soc_dev_attr->family =3D kstrdup_const(family->name, GFP_KERNEL);

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
